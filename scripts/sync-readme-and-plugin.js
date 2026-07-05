#!/usr/bin/env node

const fs = require("fs");
const path = require("path");

const skillsDir = "skills";
const readmeFile = "README.md";
const pluginFile = ".claude-plugin/plugin.json";
const marketplaceFile = ".claude-plugin/marketplace.json";

function parseFrontmatter(content) {
  const match = content.match(/^---\n([\s\S]*?)\n---/);
  if (!match) return {};

  const result = {};
  for (const line of match[1].split("\n")) {
    const index = line.indexOf(":");
    if (index === -1) continue;
    if (/^\s/.test(line)) continue;
    const key = line.slice(0, index).trim();
    let value = line.slice(index + 1).trim();
    if (
      (value.startsWith('"') && value.endsWith('"')) ||
      (value.startsWith("'") && value.endsWith("'"))
    ) {
      value = value.slice(1, -1);
    }
    result[key] = value;
  }
  return result;
}

function getSkills() {
  if (!fs.existsSync(skillsDir)) return [];

  return fs
    .readdirSync(skillsDir, { withFileTypes: true })
    .filter((entry) => entry.isDirectory())
    .filter((entry) => fs.existsSync(path.join(skillsDir, entry.name, "SKILL.md")))
    .map((entry) => {
      const skillFile = path.join(skillsDir, entry.name, "SKILL.md");
      const frontmatter = parseFrontmatter(fs.readFileSync(skillFile, "utf8"));
      return {
        dir: entry.name,
        name: frontmatter.name || entry.name,
        description: frontmatter.description || "",
      };
    })
    .sort((a, b) => a.name.localeCompare(b.name));
}

function truncate(text, max = 120) {
  if (text.length <= max) return text;
  const sliced = text.slice(0, max);
  const lastSpace = sliced.lastIndexOf(" ");
  return `${sliced.slice(0, lastSpace > 0 ? lastSpace : max)}...`;
}

function syncReadme(skills) {
  const content = fs.readFileSync(readmeFile, "utf8");
  const table = [
    "| Skill | Description |",
    "|-------|-------------|",
    ...skills.map(
      (skill) =>
        `| [${skill.name}](skills/${skill.dir}/) | ${truncate(skill.description)} |`,
    ),
  ].join("\n");

  const next = content.replace(
    /(<!-- SKILLS:START -->\n)[\s\S]*?(\n<!-- SKILLS:END -->)/,
    `$1${table}$2`,
  );

  if (next !== content) {
    fs.writeFileSync(readmeFile, next);
    return true;
  }
  return false;
}

function syncPlugin(skills) {
  let updated = false;

  if (fs.existsSync(pluginFile) && fs.existsSync(marketplaceFile)) {
    const plugin = JSON.parse(fs.readFileSync(pluginFile, "utf8"));
    const marketplace = JSON.parse(fs.readFileSync(marketplaceFile, "utf8"));
    const version = marketplace.metadata && marketplace.metadata.version;

    if (version && plugin.version !== version) {
      plugin.version = version;
      fs.writeFileSync(pluginFile, `${JSON.stringify(plugin, null, 2)}\n`);
      updated = true;
    }

    const marketplacePlugin = marketplace.plugins && marketplace.plugins[0];
    if (marketplacePlugin) {
      const nextDescription = marketplacePlugin.description.replace(
        /^\d+ marketing skills/,
        `${skills.length} marketing skills`,
      );
      if (marketplacePlugin.description !== nextDescription) {
        marketplacePlugin.description = nextDescription;
        fs.writeFileSync(marketplaceFile, `${JSON.stringify(marketplace, null, 2)}\n`);
        updated = true;
      }
    }
  }

  return updated;
}

const skills = getSkills();
const readmeUpdated = syncReadme(skills);
const pluginUpdated = syncPlugin(skills);

if (!readmeUpdated && !pluginUpdated) {
  console.log("Everything is already in sync");
} else {
  if (readmeUpdated) console.log("Updated README.md skills table");
  if (pluginUpdated) console.log("Updated Claude plugin metadata");
}
