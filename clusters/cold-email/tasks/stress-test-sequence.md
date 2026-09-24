# Task: Stress-Test a Sequence (Pre-Launch QA)

Score every email in a sequence on a 5-dimension rubric. Iterate until every step hits 8.1+ out of 10. Do not launch below the threshold.

## When to use this

User asks to score an email, evaluate copy quality, run QA on a sequence, or check if a campaign is ready to launch. Run this as the LAST step before any cold campaign goes live.

## Inputs required

- **Full sequence** — every step (Step 1, Step 2, Step 3+, including subject lines and PS lines if present)
- **ICP context**
- **Signal and hypothesis** the sequence was written for

## The 5-dimension rubric — score each step 0-10

Each dimension scores 0, 1, or 2. Sum across 5 dimensions = step score (max 10).

| Dimension | What you're checking | Score 2 (strong) | Score 0 (bad) |
|---|---|---|---|
| **Catchy** | Does the subject/opening make them want to continue? Stand out from 50 other inbox emails? | Subject + first line both create curiosity | Generic subject + bland opener |
| **Engaging** | Natural human voice. Could a real person have written this? | Reads like a peer wrote it | Sounds like a template or chatbot |
| **Logical** | Does the argument flow signal → problem → offer cleanly and credibly? | Each sentence earns the next | Logical jump or non-sequitur |
| **Easy to read** | Scannable in 15 seconds. No walls of text. One idea per email. | One pass and you get it | Re-read needed to understand |
| **Points to the problem** | Speaks to a real, specific problem THIS person has — not generic pain | Reader thinks "yes, that's me" | Could be sent to anyone |

**Pass threshold: 8.1/10.** This is the minimum, not the target. Tier 1 campaigns should aim for 9+.

## Process

1. Score each step on all 5 dimensions (0/1/2). Sum per step.
2. For any step below 8.1, identify the LOWEST-scoring dimension and rewrite ONLY that part.
3. Re-score. Repeat until every step is 8.1+.
4. Once all steps pass, run a final whole-sequence read — make sure value props rotate (don't repeat across steps), tone is consistent, and CTAs escalate (Step 1 soft, Step 3 direct).
5. Score the PS line separately if present — apply the same rubric to the PS only.
6. Run the pre-send check in `clusters/cold-email/knowledge/human-voice.md` on every step, and for a live or cloned sequence the editing checks in `clusters/campaign-ops/knowledge/sequence-and-system-hygiene.md` (all sibling copies, populated conditionals, sender integrity).

## Output format

```
Stress test: [hypothesis name]
Date: [date]
Pass threshold: 8.1

STEP 1
Catchy:           [0/1/2] — [one-line note]
Engaging:         [0/1/2] — [one-line note]
Logical:          [0/1/2] — [one-line note]
Easy to read:     [0/1/2] — [one-line note]
Points to problem:[0/1/2] — [one-line note]
Score: [X/10] | [PASS / NEEDS WORK]

[Repeat for each step]

PS LINE (if present)
[Same scoring]

OVERALL
All steps passed: [Yes / No]
Weakest dimension across sequence: [dimension]
Recommended fix (if any step < 8.1): [one specific change with which step + which dimension]
Tier rating: [Tier 1 (9.0+) / Tier 2 (8.5-8.9) / Tier 3 (8.1-8.4) / DO NOT LAUNCH (<8.1)]
```

## Pass criteria

- Every step ≥ 8.1
- PS line (if present) ≥ 8.1
- No single dimension below 1 on any step (a 0 anywhere = blocker)
- Value props rotate across steps (no repeated angle)
- Tone is consistent across the sequence

## Diagnosis cheat sheet

If a step keeps failing on the same dimension after rewrites:

| Failing dimension | Root cause | Fix |
|---|---|---|
| **Catchy** | Subject line is the issue, not the body | Run `clusters/cold-email/tasks/write-subject-lines.md` for fresh options |
| **Engaging** | Passive voice, fake personalization, or template tells | Rewrite in active voice, strip `[First Name]` openers |
| **Logical** | Signal → problem → offer has a jump | Add or rewrite the bridge sentence |
| **Easy to read** | Too many ideas, too long, jargon | Cut to one idea, drop to 60-90 words BTL or 40-70 ATL |
| **Points to problem** | The signal isn't specific enough | Go back to `clusters/cold-email/tasks/write-first-email.md` with a sharper signal — copy can't fix bad targeting |

## Common failures

- **Stress-testing without the signal context** — you can't score "points to problem" without knowing who's reading
- **Iterating the wrong dimension** — always rewrite the LOWEST-scoring dimension, not whichever feels easiest
- **Launching at exactly 8.1** — that's the floor. Push for 9+ on Tier 1 campaigns.
- **Skipping PS line scoring** — PS is the highest-read part; score it separately

## What to do after

- All steps PASS → ready for spintax (`clusters/cold-email/tasks/add-spintax.md`) before launch
- Any step FAIL → rewrite, re-score, re-stress-test. Don't launch a sequence with a known weak step — the weak step drags the whole reply rate.
