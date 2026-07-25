# GitHub repository link preview metadata

Issue: [#87](https://github.com/ztemerbekov/a1-marketing-skills/issues/87)
Checked: 2026-07-25

## Finding

The repeated sentence in a link card is intentional GitHub-generated Open Graph
metadata, not a duplicate `About` field or a repository configuration error.
For the public repository page, GitHub currently emits:

```html
<meta property="og:title" content="GitHub - ztemerbekov/a1-marketing-skills: Hand over the routine to AI agents—freeing marketing teams to focus on strategy, vision, and growth-driving decisions">
<meta property="og:description" content="Hand over the routine to AI agents—freeing marketing teams to focus on strategy, vision, and growth-driving decisions - ztemerbekov/a1-marketing-skills">
```

The preview client displays `og:title` as the card title and `og:description`
as the card description. GitHub therefore includes the repository description
in both fields, once with `GitHub - owner/repository:` and once with
` - owner/repository`. This exactly accounts for the screenshot.

## What can be configured

GitHub exposes the repository description as one repository field; its GraphQL
schema documents it as `Repository.description`. The public GitHub page derives
both Open Graph text fields from that field. GitHub's documented Social Preview
setting changes the *image* used in a shared repository link, not the Open Graph
title or description. GitHub does not document a repository setting for
independently overriding these text values.

## Recommendation

No repair is needed. Keep the repository description concise and readable in
both of GitHub's generated sentence forms. The repository already has a custom
social-preview image; it can make the card more distinctive, but it cannot
remove the repeated text. If exact, independent title and description are
important, share an owned web page with custom Open Graph tags instead of the
repository URL. If Telegram or another client shows an old description after a
change, that is normally its preview cache rather than a second repository
setting.

## Sources

- Live repository page, inspected on 2026-07-25 for its `og:title` and
  `og:description`: <https://github.com/ztemerbekov/a1-marketing-skills/>.
- GitHub GraphQL schema: [`Repository.description`](https://docs.github.com/en/graphql/reference/repos) and [`Repository.openGraphImageUrl`](https://docs.github.com/en/graphql/reference/repos).
- GitHub Docs: [Customizing your repository's social media preview](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/customizing-your-repositorys-social-media-preview).
