# Task: Analyze Inbox Replies

Read inbox via MCP, categorize every reply, surface patterns, return ONE actionable recommendation.

## When to use this

User asks "what came in this week?", "review my replies", "summarize inbox activity", or "what's the response pattern?".

## Inputs required

- Inbox access via LinkedIn MCP and/or email MCP
- Timeframe (default: last 7 days)
- Campaign name or hypothesis to filter (optional — if blank, covers all)

## Reply categories

| Category | Definition |
|---|---|
| **Interested** | Any positive signal — question, meeting request, "tell me more", "send it over" |
| **Not interested** | Explicit rejection or unsubscribe |
| **Out of office** | Auto-reply, vacation message, equivalent |
| **No reply needed** | Spam, wrong person, bounce |
| **Needs follow-up** | Ambiguous reply requiring a human response |

## Process

1. Pull replies from inbox via MCP for the timeframe
2. Read each + assign one category
3. For "Interested" replies: flag the company, note what they responded to, suggest next step
4. Scan ALL replies for patterns: which signal/angle/step got the most engagement?
5. Identify ONE specific copy or targeting change the data supports

## Output format

```
Reply analysis: [date range]
Total replies: [n]

INTERESTED ([n])
- [Name] @ [Company] | replied to: [step + subject] | signal: [what they responded to]
  → Next step: [route to clusters/campaign-ops/tasks/score-meeting-intent.md OR direct AE handoff]

NOT INTERESTED ([n])
- [summary; only list individually if pattern is notable, e.g. all from same vertical]

OUT OF OFFICE ([n])
- [list names — queue for re-contact when their auto-reply ends]

NEEDS FOLLOW-UP ([n])
- [Name] @ [Company] | [what they said] | suggested reply: [one option]

PATTERNS
[2-3 observations: which step got most replies, which angle resonated, which segment responded]

ONE CHANGE TO MAKE THIS WEEK
[Specific recommendation — a subject line, an opener, a targeting filter — based on the data above]
```

## Pass criteria

- Every "Interested" reply has a NAMED next step (never just a count)
- Patterns section has at least 2 observations
- ONE specific change recommended, not a vague "improve copy"
- Out-of-office replies queued, not closed

## Common failures

- **Counting Interested without listing them** — they need named next steps NOW, not later
- **Vague pattern observation** ("emails got replies") — be specific: "Step 2 with hiring-signal hook drove 3 of 4 replies"
- **No actionable change recommendation** — defeats the purpose of analysis
- **Closing OOO replies** — they're warm leads on a delay; queue, don't drop

## What to do after

- Interested → `tasks/score-meeting-intent.md` per reply
- Patterns → feed into `tasks/tier-campaigns.md` and `tasks/weekly-report.md`
- One change → execute via the relevant cluster (subject → `clusters/cold-email/tasks/write-subject-lines.md`, etc.)
