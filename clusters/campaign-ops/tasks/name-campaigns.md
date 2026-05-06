# Task: Name Campaigns Consistently

Generate consistent, hypothesis-readable campaign names from a hypothesis matrix — so 40 campaigns are scannable in 5 seconds.

## When to use this

User asks to name campaigns, set up a naming convention, organize a hypothesis matrix into platform-ready names, or rename existing campaigns that have generic labels.

## Inputs required

- Hypothesis matrix (from `tasks/build-hypothesis-matrix.md`) OR list of campaign parameters
- Platform character limits (PlusVibe, Instantly, Smartlead each differ)

## Naming convention

**Format:** `[Signal]-[Persona]-[Angle]-[Channel]`

Examples:
- `SDRHire-VPSales-Pipeline-Email`
- `NewCRO-Founder-90Days-LinkedIn`
- `FundingRound-HeadOfSales-Scale-Multi`
- `TechStackChange-RevOps-Migration-Email`

**Optional date prefix** for recurring waves: `2026Q2-SDRHire-VPSales-Pipeline-Email`

## Rules

- No spaces — use CamelCase or hyphens
- BANNED: "Q2 Campaign", "Test 1", "Outbound April", "Email Campaign 3" — these tell you nothing
- Max 5 components — if you need more, the hypothesis is too complex (split it)
- Channel suffix recommended for multi-channel runs
- If platform has char limits, abbreviate signal + angle but keep persona readable

## Process

1. Take hypothesis matrix or parameter list
2. Extract: signal / persona / angle for each
3. Generate name in convention format
4. Check duplicates — if two campaigns share the same name, the hypotheses are too similar (collapse them)
5. Return full named list

## Output format

```
Campaign names: [ICP / vertical]
Total: [n]

[Original hypothesis description] → [Campaign name]
[example: "Hit founders at companies hiring 3+ SDRs" → SDRHire-Founder-Pipeline-Email]
...

Naming conflicts: [list duplicate names + recommendation to collapse hypotheses]
```

## Pass criteria

- Every name follows `[Signal]-[Persona]-[Angle]-[Channel]` format
- Zero generic names (no "Campaign 1", no dates without context)
- Zero duplicates
- Each name readable in < 2 seconds and tells you who/why/what/where

## Common failures

- **Generic labels** — "Q2 Outbound" tells you nothing in a list of 40
- **Too many components** — > 5 = complex hypothesis, split it
- **Duplicate names from too-similar hypotheses** — sign you should consolidate, not rename
- **Forgetting channel suffix on multi-channel** — confuses tier-tracking

## What to do after

- Use names in: `tasks/setup-campaign-platform.md`, CRM contact records (as first tag — fastest way to trace lead origin), `tasks/weekly-report.md`
- Rename any existing campaigns that don't follow convention BEFORE next review
