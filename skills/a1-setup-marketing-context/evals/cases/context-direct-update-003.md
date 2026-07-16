# context-direct-update-003 — Direct Update Changes Only One Field

- ID: `context-direct-update-003`
- Mode: `Auto-draft`
- Risk: A narrow explicit update regenerates the file or fills unrelated sections.
- Scope Scenario: `Completed external input`

## Setup

```text
The canonical context exists. The user supplies an approved replacement audience.
```

## User Instruction

```text
Обнови только аудиторию в маркетинговом контексте: теперь утверждённая аудитория — руководители команд маркетплейсов.
```

## Input

```markdown
# Marketing Context

Last updated: 2026-07-10

<!-- Keep this maintainer note. -->

## Product Facts

- Сервис собирает отзывы Ozon и Wildberries в один список.

## Audience Defaults

- Менеджеры маркетплейсов.

## Launch Notes

- Не менять до релиза.
```

## Must Change

- [ ] Replace only `Audience Defaults` with the approved team-lead audience and update the date.

## Must Preserve

- [ ] Preserve Product Facts, the HTML comment, Launch Notes, ordering, and formatting exactly.

## Forbidden

- [ ] Do not inspect the repository to fill positioning, voice, proof, vocabulary, or goals.
- [ ] Do not rename headings, rewrite product wording, or show a mandatory preview.

## Output Contract

`Updated` confirmation linking the canonical file and listing only `Audience Defaults`.

## Manual Run Record

- Status: `NOT RUN`
- Evidence: `<complete during manual evaluation>`

### Result

`PASS` or `FAIL`
