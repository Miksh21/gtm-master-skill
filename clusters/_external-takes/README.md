# External takes — holding area (ColdIQ + Swan radars)

Auto-filed by the `coldiq-radar-collect` and `swan-radar-collect` weekly tasks. Everything here is
**UNREVIEWED external provenance** — takes extracted from third-party GTM skills on coldiq.com/skills
or in github.com/swan-gtm/gtm-skills that overlap a gtm-master cluster. The `swan-*.md` files were
seeded by the 2026-07-28 full import of the swan repo (69 entries), then maintained by the weekly task.

## Rules
- **NOT canonical.** Nothing here is an endorsed gtm-master position.
- **NOT in the routing table.** gtm-master's `SKILL.md` never loads this directory, so these takes
  never fire as skill knowledge on their own. They are readable/greppable, not active.
- **Promoted or rejected at `/creator-radar-review`** (Monday). Promotion moves a take into the real
  `clusters/<cluster>/knowledge/coldiq-<cluster>.md` (or `swan-<cluster>.md`); rejection deletes it here.
- **⚠️ contradictions are never auto-resolved.** They are filed here on purpose so Jan knows the
  competing take exists. The daily `/audit-skills` also flags them.

## File format (`coldiq-<cluster>.md`, `swan-<cluster>.md`)
```
# External takes — <cluster> (ColdIQ radar, UNREVIEWED)

## <source-skill-name> — <install-slug>  ·  filed <YYYY-MM-DD>
Source: <repo url> · cluster: <cluster>
- ✅ supports [<gtm-master claim/file>]: <the new/operationalizing point>
- ⚠️ contradicts [<gtm-master stance>]: <counter-claim>. Both sides — gtm-master: <X>; <source>: <Y>.
- 🆕 new-angle: <point not yet in gtm-master>
Status: holding
```

Conventions the tooling relies on:
- `⚠️ contradicts` is the exact marker the audit greps for (divergent-take flag).
- One `##` block per source skill. `Status:` line = `holding` | `promoted` | `rejected`.
- Provenance (`Source:` + `filed`) is mandatory on every block.
- Swan files may also contain `## DRIFT:` blocks = upstream edits to skills already distilled into
  canonical cluster files (the swan collector files these; the distilled targets are listed in the
  block). Accepted drift is applied to the distilled file at review, never automatically; `Status:`
  there = `holding` | `applied` | `rejected`.
