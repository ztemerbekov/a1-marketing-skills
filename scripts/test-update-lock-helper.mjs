#!/usr/bin/env node

import assert from "node:assert/strict";
import { mkdtemp, readFile, rm, writeFile } from "node:fs/promises";
import { tmpdir } from "node:os";
import { join, resolve } from "node:path";
import { spawnSync } from "node:child_process";

const helper = resolve(
  "skills/a1-update-marketing-skills/scripts/prune-lock.mjs",
);
const fixtureRoot = await mkdtemp(join(tmpdir(), "a1-update-lock-test-"));

function run(lockPath, ...skills) {
  return spawnSync(
    process.execPath,
    [helper, "--lock", lockPath, ...skills.flatMap((name) => ["--skill", name])],
    { encoding: "utf8", shell: false },
  );
}

try {
  const projectLock = join(fixtureRoot, "skills-lock.json");
  const projectFixture = {
    version: 1,
    skills: {
      "z-last": { source: "another/repo", sourceType: "github" },
      "a1-editor-in-chief": {
        source: "ztemerbekov/marketing-skills",
        sourceType: "github",
      },
      "a-first": { source: "another/repo", sourceType: "github" },
    },
    custom: "preserve",
  };
  await writeFile(projectLock, `${JSON.stringify(projectFixture, null, 2)}\n`);

  const success = run(projectLock, "a1-editor-in-chief", "already-absent");
  assert.equal(success.status, 0, success.stderr);
  assert.deepEqual(JSON.parse(success.stdout), {
    source: "ztemerbekov/marketing-skills",
    removed: ["a1-editor-in-chief"],
    alreadyAbsent: ["already-absent"],
  });

  const updated = JSON.parse(await readFile(projectLock, "utf8"));
  assert.equal(updated.custom, "preserve");
  assert.deepEqual(Object.keys(updated.skills), ["a-first", "z-last"]);

  const rejectedLock = join(fixtureRoot, ".skill-lock.json");
  const rejectedFixture = {
    version: 3,
    skills: {
      "a1-editor-in-chief": {
        source: "another/repo",
        sourceType: "github",
      },
    },
    dismissed: { findSkillsPrompt: true },
  };
  const rejectedText = `${JSON.stringify(rejectedFixture, null, 2)}\n`;
  await writeFile(rejectedLock, rejectedText);

  const rejected = run(rejectedLock, "a1-editor-in-chief");
  assert.equal(rejected.status, 1);
  assert.match(rejected.stderr, /not owned by ztemerbekov\/marketing-skills/);
  assert.equal(await readFile(rejectedLock, "utf8"), rejectedText);

  console.log("PASS updater lock helper fixtures");
} finally {
  await rm(fixtureRoot, { recursive: true, force: true });
}
