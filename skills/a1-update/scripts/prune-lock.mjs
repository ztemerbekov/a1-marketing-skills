#!/usr/bin/env node

import { readFile, rename, rm, stat, writeFile } from "node:fs/promises";
import { basename, dirname, join } from "node:path";

const canonicalSource = "ztemerbekov/marketing-skills";

function usage(message) {
  if (message) console.error(message);
  console.error(
    "Usage: node scripts/prune-lock.mjs --lock PATH --skill NAME [--skill NAME ...]",
  );
  process.exit(2);
}

function parseArgs(argv) {
  let lockPath;
  const skills = [];

  for (let index = 0; index < argv.length; index += 1) {
    const arg = argv[index];
    if (arg === "--lock") {
      lockPath = argv[index + 1];
      index += 1;
    } else if (arg === "--skill") {
      skills.push(argv[index + 1]);
      index += 1;
    } else {
      usage(`Unknown argument: ${arg}`);
    }
  }

  if (!lockPath || skills.length === 0 || skills.some((name) => !name)) {
    usage("Both --lock and at least one --skill are required.");
  }

  return { lockPath, skills: [...new Set(skills)] };
}

function normalizedGitHubSource(value) {
  if (typeof value !== "string") return null;

  const trimmed = value.trim();
  if (trimmed === canonicalSource || trimmed === `github:${canonicalSource}`) {
    return canonicalSource;
  }

  const sshMatch = trimmed.match(
    /^git@github\.com:ztemerbekov\/marketing-skills(?:\.git)?$/i,
  );
  if (sshMatch) return canonicalSource;

  try {
    const url = new URL(trimmed.replace(/^git\+/, ""));
    if (url.hostname.toLowerCase() !== "github.com") return null;
    const parts = url.pathname
      .replace(/^\//, "")
      .replace(/\.git$/, "")
      .split("/");
    if (
      parts[0]?.toLowerCase() === "ztemerbekov" &&
      parts[1]?.toLowerCase() === "marketing-skills" &&
      (parts.length === 2 || parts[2] === "tree")
    ) {
      return canonicalSource;
    }
  } catch {
    return null;
  }

  return null;
}

function ownsEntry(entry) {
  if (!entry || typeof entry !== "object" || Array.isArray(entry)) return false;
  return [entry.source, entry.sourceUrl].some(
    (value) => normalizedGitHubSource(value) === canonicalSource,
  );
}

function sortSkillEntries(skills) {
  return Object.fromEntries(
    Object.entries(skills).sort(([left], [right]) => left.localeCompare(right)),
  );
}

const { lockPath, skills } = parseArgs(process.argv.slice(2));
const lockName = basename(lockPath);
if (lockName !== ".skill-lock.json" && lockName !== "skills-lock.json") {
  usage(`Unsupported lock filename: ${lockName}`);
}

let lock;
try {
  lock = JSON.parse(await readFile(lockPath, "utf8"));
} catch (error) {
  console.error(`Cannot read valid JSON from ${lockPath}: ${error.message}`);
  process.exit(1);
}

if (!lock || typeof lock !== "object" || Array.isArray(lock)) {
  console.error("Lock file must contain a JSON object.");
  process.exit(1);
}
if (!lock.skills || typeof lock.skills !== "object" || Array.isArray(lock.skills)) {
  console.error("Lock file must contain a skills object.");
  process.exit(1);
}

const present = skills.filter((name) => Object.hasOwn(lock.skills, name));
const rejected = present.filter((name) => !ownsEntry(lock.skills[name]));
if (rejected.length > 0) {
  console.error(
    `Refusing to remove entries not owned by ${canonicalSource}: ${rejected.join(", ")}`,
  );
  process.exit(1);
}

for (const name of present) {
  delete lock.skills[name];
}

if (lockName === "skills-lock.json") {
  lock.skills = sortSkillEntries(lock.skills);
}

if (present.length > 0) {
  const lockStat = await stat(lockPath);
  const tempPath = join(
    dirname(lockPath),
    `.${lockName}.a1-update-${process.pid}.tmp`,
  );
  try {
    await writeFile(tempPath, `${JSON.stringify(lock, null, 2)}\n`, {
      mode: lockStat.mode,
    });
    await rename(tempPath, lockPath);
  } catch (error) {
    await rm(tempPath, { force: true }).catch(() => {});
    console.error(`Cannot update ${lockPath}: ${error.message}`);
    process.exit(1);
  }
}

console.log(
  JSON.stringify({
    source: canonicalSource,
    removed: present,
    alreadyAbsent: skills.filter((name) => !present.includes(name)),
  }),
);
