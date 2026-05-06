# Task: Validate a Company Against ICP

Recipe for scoring a single company (or batch) against ICP criteria — return a fit verdict + tier recommendation.

## When to use this

User asks to validate a company, check if a prospect fits, score ICP fit, or decide if a company is worth targeting.

## Inputs required

- Company name or website URL
- ICP definition (reference the ICP file or paste inline). If no ICP defined, route to `tasks/build-icp.md` first.

## Process

1. Pull the company's website. Scan for: team size indicators, tech stack signals, product type, industry, growth stage.
2. Cross-reference LinkedIn (via MCP if available) for: headcount, recent hires, open roles, leadership profile.
3. Score fit on 4 dimensions (1-3 each, max 12):
   - **Segment fit** — does the company match the target segment / vertical?
   - **Size fit** — does headcount/revenue match the ICP range?
   - **Signal fit** — is there an active reason they'd respond NOW?
   - **Role fit** — is the target persona present and reachable?
4. Cross-check against negative ICP — if any disqualifier matches → automatic skip regardless of score
5. Return one-line verdict + tier recommendation

## Output format

```
Company: [Name] | [Domain]
Fit score: [X/12]
Verdict: [Strong fit / Marginal fit / Not a fit]

Segment: [score/3] — [one line reason]
Size:    [score/3] — [one line reason]
Signal:  [score/3] — [one line reason]
Role:    [score/3] — [one line reason]

Negative ICP check: [PASS / FAIL — disqualifier matched: [which]]

Recommended action: [Tier 1 — priority sequence / Tier 2 — standard sequence / Skip]
```

## Pass criteria

- Strong fit: 10-12, no negative ICP triggers
- Marginal fit: 7-9 (worth Tier 2, not Tier 1)
- Not a fit: ≤6 OR any negative ICP trigger

## Common failures

- **Skipping LinkedIn check** when MCP available — public website often understates team size
- **Treating marginal as skip** — Tier 2 has lower-touch sequences specifically for marginal fits, don't burn them
- **Ignoring negative ICP** — a 10/12 fit with a disqualifier is still a skip
- **Validating without ICP defined** — output is meaningless. Route to `tasks/build-icp.md` first.

## What to do after

- Strong fit + signal present → push to `clusters/signals/tasks/score-multi-signal.md`
- Strong fit no signal → Tier 2 standard sequence via `clusters/cold-email/tasks/write-first-email.md`
- For batch validation (>10 companies) → use this task per row in a Clay table; see `clusters/enrichment/knowledge/workflow-patterns.md`

## Deeper knowledge

- Multi-dimensional ICP scoring matrix → `clusters/list-building/knowledge/templates/qualification-workflow.md`
- ABM account selection logic → `clusters/list-building/knowledge/abm/account-selection-framework.md`
