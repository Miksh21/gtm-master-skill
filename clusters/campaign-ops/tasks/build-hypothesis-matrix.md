# Task: Build a Hypothesis Matrix

Generate a full testing matrix of campaign hypotheses from ICP × Personas × Signals × Angles.

## When to use this

User asks to generate campaign hypotheses, build a testing matrix, create a list of ideas to run, or move from "we have an ICP" to "what should we test first".

## Inputs required

- ICP definition
- Target personas (2-5 roles)
- Buyer signals available (from `clusters/signals/tasks/map-signals-to-icp.md`)
- Angles available (problem-based, time-based, social proof, competitive, etc.)

## Process

1. Map every combination of: persona × signal × angle
2. Remove logically incoherent combinations (e.g., "new CRO" signal sent to an SDR — wrong audience)
3. Group into clusters by similarity — don't list near-duplicates as separate hypotheses
4. Assign priority (1-3) based on: signal specificity, persona authority, angle strength
5. Return matrix sorted by priority with one-line description each

## Output format

```
Hypothesis matrix: [ICP name]
Generated: [date]
Total hypotheses: [n]

PRIORITY 1 — Highest expected performance
H01 | [Persona] | [Signal] | [Angle] | [One-line description]
H02 | ...

PRIORITY 2 — Worth testing
H03 | ...

PRIORITY 3 — Low conviction, test last
H08 | ...

Recommended starting set: [H01, H02, H04] — run these first
```

## Pass criteria

- 20-50 hypotheses generated (too few = under-testing; too many = no focus)
- Priority 1 hypotheses ALL have: specific recent signal + senior decision-maker persona
- No duplicates after similarity grouping
- Recommended starting set has ≤ 5 hypotheses (you can't run 30 well in parallel)

## Common failures

- **Generating 100+ hypotheses** — looks impressive, impossible to run; cap at 50
- **Priority 1 with no signal** — without a signal, it's a Priority 2 at best
- **Listing variants as separate hypotheses** — "VP Sales + funding" and "Head of Sales + funding" are the same hypothesis
- **No incoherence filter** — sending CRO-targeted angle to SDR persona = noise

## What to do after

- Pick top 3-5 from recommended starting set
- For each: name via `tasks/name-campaigns.md`, build sequence via `clusters/sequences/tasks/design-multi-channel.md`, set up platform via `tasks/setup-campaign-platform.md`
- Log results back into the matrix to refine priority weights for future waves
