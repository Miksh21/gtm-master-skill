# External takes — holding area (ColdIQ + Swan radars)

Auto-filed by the `coldiq-radar-collect` and `swan-radar-collect` weekly tasks. Everything here is
**UNREVIEWED external provenance** — takes extracted from third-party GTM skills on coldiq.com/skills
or in github.com/swan-gtm/gtm-skills that overlap a gtm-master cluster. The `swan-*.md` files were
seeded by the 2026-07-28 full import of the swan repo (69 entries), then maintained by the weekly task.

## Rules
- **NOT canonical.** Nothing here is an endorsed gtm-master position.
- **Referenced, never auto-loaded.** As of 2026-08-04 each of the 11 clusters that has takes ends its
  section in `SKILL.md` with an **External takes** pointer (file paths + counts). That makes these
  readable at routing time; it does NOT put them in the routing table and they still never fire as
  skill knowledge on their own. `SKILL.md` "How to use this skill" step 5 states the load conditions:
  only on a request for alternatives, a pushback on a canonical position, or a deliberate second-opinion
  check — and always attributed, always kept visibly separate from the gtm-master position.
  **If you add, split, or empty a `<radar>-<cluster>.md` file, update that cluster's pointer count in
  `SKILL.md`.** The counts are the only thing telling Jan a holding area exists.
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
Review: contradicts | additive | corroboration | drift
Status: holding
```

## The `Review:` verdict — DERIVED, never judged

Added 2026-08-04 so the Monday review can be **partitioned instead of walked**. It is a pure function of
the markers already in the block. The collector writes it; nobody decides it:

| Block contains | Verdict | What the review does with it |
|---|---|---|
| heading starts `## DRIFT:` | `drift` | apply / keep / reject against the distilled file |
| any `⚠️ contradicts` | `contradicts` | **the only per-block decision queue** — Jan picks supersede / keep-both / reject |
| no ⚠️, any `🆕 new-angle` | `additive` | batch-merged into the cluster's `## Unvalidated` section on ONE bulk approval per cluster |
| only `✅ supports` | `corroboration` | auto-closed, zero canonical edits (independent agreement is weak evidence, not new knowledge) |

Precedence is top-down: one ⚠️ anywhere makes the whole block `contradicts`. Recompute the verdict if you
ever edit a block's bullets. Backfilled across all 94 existing blocks on 2026-08-04
(50 additive / 40 contradicts / 4 corroboration).

Conventions the tooling relies on:
- `⚠️ contradicts` is the exact marker the audit greps for (divergent-take flag).
- One `##` block per source skill. Every block carries exactly one `Review:` and one `Status:` line.
- `Status:` = `holding` | `promoted` | `promoted-unvalidated` | `closed-corroborated` | `rejected`
  (DRIFT blocks: `holding` | `applied` | `rejected`).
- Provenance (`Source:` + `filed`) is mandatory on every block.
- Swan files may also contain `## DRIFT:` blocks = upstream edits to skills already distilled into
  canonical cluster files (the swan collector files these; the distilled targets are listed in the
  block). Accepted drift is applied to the distilled file at review, never automatically; `Status:`
  there = `holding` | `applied` | `rejected`.
