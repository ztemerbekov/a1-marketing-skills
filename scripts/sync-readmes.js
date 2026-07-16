#!/usr/bin/env node

const fs = require("fs");
const path = require("path");

const skillsDir = "skills";
const skillOrder = [
  "a1-editor",
  "a1-editor-in-chief",
  "a1-marketing-context",
  "a1-update",
];
const readmes = [
  {
    file: "README.md",
    columns: ["Skill", "Best for"],
    copy: {
      "a1-marketing-context": {
        title: "Marketing Context",
        summary:
          "Save product, audience, and voice information for future work.",
      },
      "a1-editor": {
        title: "Editor",
        summary:
          "Improve existing text: shorten, clarify, strengthen, or restructure it without inventing facts.",
      },
      "a1-editor-in-chief": {
        title: "Editor in Chief",
        summary:
          "Define the reader, goal, format, constraints, and message before editing the text.",
      },
      "a1-update": {
        title: "Update",
        summary:
          "Update only Marketing Skills and decide separately whether to install new skills from the collection.",
      },
    },
  },
  {
    file: "README.ru.md",
    columns: ["Навык", "Когда использовать"],
    copy: {
      "a1-marketing-context": {
        title: "Маркетинговый контекст",
        summary:
          "Сохранить сведения о продукте, аудитории и стиле общения для следующих задач.",
      },
      "a1-editor": {
        title: "Редактор",
        summary:
          "Улучшить готовый текст: сократить, прояснить, усилить или перестроить, не добавляя выдуманных фактов.",
      },
      "a1-editor-in-chief": {
        title: "Шеф-редактор",
        summary:
          "Сначала определить читателя, цель, формат, ограничения и сообщение, а затем отредактировать текст.",
      },
      "a1-update": {
        title: "Обновление",
        summary:
          "Обновить только Marketing Skills и отдельно решить, устанавливать ли новые навыки из набора.",
      },
    },
  },
];

function parseFrontmatter(content) {
  const match = content.match(/^---\n([\s\S]*?)\n---/);
  if (!match) return {};

  const result = {};
  for (const line of match[1].split("\n")) {
    const index = line.indexOf(":");
    if (index === -1 || /^\s/.test(line)) continue;
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
      };
    })
    .sort((a, b) => {
      const aIndex = skillOrder.indexOf(a.name);
      const bIndex = skillOrder.indexOf(b.name);
      if (aIndex === -1 && bIndex === -1) return a.name.localeCompare(b.name);
      if (aIndex === -1) return 1;
      if (bIndex === -1) return -1;
      return aIndex - bIndex;
    });
}

function syncReadme(skills, readme) {
  const content = fs.readFileSync(readme.file, "utf8");
  const missingCopy = skills
    .filter((skill) => !readme.copy[skill.name])
    .map((skill) => skill.name);

  if (missingCopy.length > 0) {
    throw new Error(
      `${readme.file} needs user-facing copy for: ${missingCopy.join(", ")}`,
    );
  }

  const table = [
    `| ${readme.columns[0]} | ${readme.columns[1]} |`,
    "|-------|----------|",
    ...skills.map((skill) => {
      const copy = readme.copy[skill.name];
      return `| [${copy.title}](skills/${skill.dir}/)<br>\`${skill.name}\` | ${copy.summary} |`;
    }),
  ].join("\n");

  const inventoryPattern =
    /(<!-- SKILLS:START -->\n)[\s\S]*?(\n<!-- SKILLS:END -->)/;
  if (!inventoryPattern.test(content)) {
    throw new Error(`${readme.file} is missing the generated skill inventory`);
  }

  const next = content.replace(inventoryPattern, `$1${table}$2`);

  if (next !== content) {
    fs.writeFileSync(readme.file, next);
    return true;
  }
  return false;
}

const skills = getSkills();
const updatedReadmes = readmes
  .filter((readme) => syncReadme(skills, readme))
  .map((readme) => readme.file);

if (updatedReadmes.length === 0) {
  console.log("README skill inventories are already in sync");
} else {
  for (const readme of updatedReadmes) {
    console.log(`Updated ${readme} skills table`);
  }
}
