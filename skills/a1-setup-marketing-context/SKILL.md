---
name: a1-setup-marketing-context
description: Create or update the shared marketing context for a repository. Use when the user wants to set up marketing context, describe a product for future marketing work, remember audience or tone, save brand voice, update positioning, or maintain reusable marketing facts for other skills.
metadata:
  version: "0.1.0"
---

# Marketing Context

Create and maintain the repository's shared marketing context.

The canonical file is `.agents/marketing-context.md`. Other marketing skills read it when present, but it is not required for them to work.

## Workflow

### 1. Check Existing Context

Look for context files in this order:

1. `.agents/marketing-context.md`
2. `.claude/marketing-context.md`
3. `marketing-context.md`

If `.agents/marketing-context.md` exists, read it and summarize what is already captured. Ask what the user wants to update.

If only a fallback file exists, offer to use it as the source for the canonical `.agents/marketing-context.md`.

### 2. Choose Setup Mode

If no context exists, offer two setup paths:

- **Auto-draft**: inspect the repository, README, docs, landing copy, package metadata, and visible marketing text, then draft a first version for review.
- **Interview**: ask focused questions and build the context section by section.

Prefer auto-draft when the repository has enough product or marketing material.

### 3. Capture Core Sections

Build one context file for the whole repository. Do not create multiple contexts in v1.

Capture:

- Product: what it is, category, business model, pricing if known
- Audience: target segments, roles, sophistication, use cases
- Positioning: category, promise, differentiation, alternatives
- Market and alternatives: competitors, substitute behaviors, current solutions
- Jobs, pains, and motivations: what people are trying to accomplish and why it matters
- Brand voice: tone, level of formality, personality, style boundaries
- Messaging rules: recurring claims, angles, promises, caveats
- Claims and proof: approved facts, metrics, testimonials, customer examples
- Words to use: customer language, product vocabulary, preferred terms
- Words to avoid: banned claims, weak language, off-brand words
- Examples: good and bad copy examples if available
- Business goals: primary conversion actions and current priorities

Ask questions only for missing sections that matter for the user's stated goal. Do not force a full research interview when a lightweight context is enough.

### 4. Write the File

Create `.agents/marketing-context.md` with this structure:

```markdown
# Marketing Context

Last updated: YYYY-MM-DD

## Product

## Audience

## Positioning

## Market and Alternatives

## Jobs, Pains, and Motivations

## Brand Voice

## Messaging Rules

## Claims and Proof

## Words to Use

## Words to Avoid

## Examples

## Business Goals
```

Create `.agents/` if it does not exist.

### 5. Confirm

After writing, tell the user that future marketing skills will read `.agents/marketing-context.md` when present.

Do not put editorial canon or rewrite methodology in this file. This context describes the product, market, audience, and brand; editing rules belong in editor skills.
