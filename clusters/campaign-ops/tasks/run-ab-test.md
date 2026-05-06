# Task: Analyze an A/B Test

Compare two variants, determine statistical significance, declare a winner, and recommend the next test.

## When to use this

User asks to compare campaign variants, declare a test winner, analyze a split test, or decide next experiment.

## Inputs required

- Variant A metrics: sends, opens, replies, interested replies
- Variant B metrics: same
- What was different between the variants (the variable being tested)
- Minimum 50 sends per variant for analysis

## Metrics hierarchy (analyze in this order)

| Layer | Tells you | If it diverges between variants → |
|---|---|---|
| 1. Open rate | Subject line / sender name | Subject or sender is the difference |
| 2. Reply rate | Copy / targeting | Body copy or targeting is the difference |
| 3. Interest rate | Offer / angle | Offer positioning is the difference |
| 4. Meeting booked rate | CTA / qualification | CTA or qualification logic is the difference |

A test is only conclusive for the LAYER where the variants diverged. Don't attribute an interest-rate difference to subject line.

## Statistical significance

| Sends per variant | Verdict |
|---|---|
| < 50 | Inconclusive — note it, don't act |
| 50-100 | Directional — signal, not proof |
| 100+ | Statistically meaningful — act on it |

## Process

1. Calculate all 4 rates for both variants
2. Identify at which layer the variants diverged
3. Determine significance based on send volume
4. Declare winner OR "inconclusive" if under threshold
5. Recommend what to test NEXT — don't just repeat the same test

## Output format

```
A/B test: [what was tested]
Date: [date]

VARIANT A — [description]
Sends: [n] | Opens: [n] ([%]) | Replies: [n] ([%]) | Interested: [n] ([%])

VARIANT B — [description]
Sends: [n] | Opens: [n] ([%]) | Replies: [n] ([%]) | Interested: [n] ([%])

ANALYSIS
Divergence layer: [opens / replies / interest / meetings]
Delta: [A vs B difference at divergence layer]
Statistical significance: [Conclusive / Directional / Inconclusive] — [reason]

WINNER: [Variant A / Variant B / Inconclusive]
Why: [one-line explanation tied to the divergence layer]

NEXT TEST
Variable to test next: [what to change — DIFFERENT from this test]
Hypothesis: [what you expect to happen and why]
```

## Pass criteria

- Both variants have ≥ 50 sends (else mark inconclusive)
- Divergence layer correctly attributed (don't blame subject line for interest rate change)
- Winner only declared if ≥ 100 sends per variant
- Next test is a NEW variable, not a repeat

## Common failures

- **Testing 2 variables at once** — if you change subject AND copy, you can't attribute. ONE variable per test.
- **Declaring winner on open rate alone** — open rate can be gamed by subject tricks that don't convert downstream
- **Both variants in Kill territory (interest < 17%)** — the problem is the hypothesis, not the variant. Stop testing variants on a dead hypothesis.
- **Testing same variable twice** — when the first test was conclusive, move on. Variant fatigue wastes cycles.

## What to do after

- Conclusive winner → roll into production, kill the loser, log result for institutional memory
- Directional → run another 50 sends per side to reach significance
- Inconclusive → don't act; either gather more data or pick a different test
- All tests → log in `tasks/setup-second-brain.md` hypothesis log
