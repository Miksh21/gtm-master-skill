# Task: Write & Rank Subject Lines

Recipe for generating 12 subject line options across 6 patterns, scoring each, and returning a ranked top-3 for A/B testing.

## When to use this

User asks for subject lines, wants to improve open rates, or wants A/B test options for an email.

## Inputs required

- **Email body** (Step 1 at minimum — subject must match what's inside)
- **ICP and persona context** (CEO vs IC changes everything)
- **Signal** the email is built around
- **Channel** — cold email or LinkedIn InMail (LinkedIn allows slightly longer)

## Principles (non-negotiable)

- **Under 6 words wins** in cold outbound. Penalize over 6 words by 1 point.
- **Never use the company name** in the subject — it reads as a template
- **Curiosity beats clarity** in cold subject lines (the inverse is true for warm/transactional)
- **Specific questions beat statements** — "is your outbound tied to one channel?" beats "outbound strategy"
- **Personalization tokens only when signal-derived** — `[First Name]` alone is a tell. `[CompetitorName] just churned` is signal.
- **Banned phrases**: "quick question", "following up", "[First Name]" as opener, "checking in", "touching base"

## The 6 patterns — generate 2 from each

| # | Pattern | What it does | Example |
|---|---|---|---|
| 1 | **Signal reference** | Names what just happened at their company | "new SDR team, new pipeline problem" |
| 2 | **Problem statement** | Names the specific pain, no solution | "pipeline that depends on one channel" |
| 3 | **Reframe** | Challenges an assumption they hold | "outbound isn't broken — the playbook is" |
| 4 | **Direct question** | Asks the exact question the email answers | "is your outbound tied to one channel?" |
| 5 | **Unexpected angle** | Something they wouldn't expect from sales | "your new CRO's first 90 days" |
| 6 | **Ultra short** | 1-3 words, pattern interrupt | "quick thought" — but NOT banned phrases; try "SDR question" |

## Process

1. Read the email body — identify the core argument and the most specific signal reference
2. Generate 2 subject lines from each of the 6 patterns (12 total)
3. Score each on this rubric:
   - **Curiosity** (0-2): does it make me want to open?
   - **Specificity** (0-2): does it feel written for THIS company, not anyone?
   - **Length penalty**: -1 if over 6 words
   - Max score: 4
4. Rank by score, descending. Break ties by giving preference to "signal reference" or "direct question" patterns (highest historical reply rate).
5. Flag top 3 for A/B testing
6. Recommend a default winner with a one-line reason

## Output format

```
Subject lines for: [hypothesis / email step]
Email summary: [one-line on what the email argues]

ALL 12 RANKED
Score | Subject line                        | Pattern             | Words
4     | [subject]                            | Direct question     | 5
4     | [subject]                            | Signal reference    | 4
3     | [subject]                            | Reframe             | 6
...

TOP 3 FOR A/B TESTING
A: [subject]
B: [subject]
C: [subject]

Recommended default: [A/B/C] — [one-line reason]
```

## Pass criteria

- 12 subject lines generated, 2 per pattern
- Top 3 each score ≥ 3/4
- None of the top 3 contain banned phrases
- None of the top 3 contain the company name verbatim
- All top 3 are 6 words or fewer

## Common failures

- **All 12 subject lines feel similar** — broaden across patterns; if you can't, the email body is too generic
- **Top scorer is over 6 words** — apply the -1 penalty rigidly
- **Curiosity-only options dominate** — at least one of the top 3 should be a Direct Question pattern (highest reply rate when specific)
- **Personalization that's not actually personal** — if the only personalization is `[First Name]`, drop it

## What to do after

- Run **spintax** across the top 3 (`clusters/cold-email/tasks/add-spintax.md`) so the same variant doesn't fire repeatedly
- Track open rate per subject variant (not campaign overall)
- If open rate < 40% after launch, the subject is the first thing to swap — don't touch the body yet

## Deeper knowledge (load only when needed)

- Full subject-line theory + extended templates → `clusters/cold-email/knowledge/writing-frameworks.md`
- ColdIQ-specific subject patterns for different value-prop styles → `clusters/cold-email/knowledge/coldiq-playbook.md`
- ATL vs BTL subject-line tone shifts → `clusters/cold-email/knowledge/atl-btl-messaging.md`
