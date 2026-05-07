# Task: Design the Sending Gate Formula Column

Recipe for building the "Ready to Send" formula column that gates every irreversible export step (Instantly push, HeyReach push, HubSpot Create, Salesforce Create, Slack notification). Every Clay workflow that pushes to a sequencer or CRM needs one. Non-negotiable.

## When to use this

User asks to "set up the sending gate", "gate the Instantly push", "make sure bad rows don't get sent", "add conditional run before sending", "build the Ready to Send column", or you're at phase 06 of `tasks/build-clay-workflow.md`.

## Why this exists (the rule)

**Never put complex conditional logic directly in a sending enrichment's conditional run field.** Always create a dedicated "Ready to Send" formula column. Put all conditions there. Inspect every row before committing. The sending step then uses one simple condition: `Run if Ready to Send = TRUE`.

Reason: with multi-AND logic in the sending step's conditional run, you can't tell which row passed which check. With a formula column, you can sort/filter by Ready to Send = FALSE and see exactly why each row was excluded. You can also patch issues in one place.

This rule applies to **every irreversible export**: Instantly Add Lead to Campaign, HeyReach Add Lead to Campaign, HubSpot Create Company / Create Contact, Salesforce Create Object, Slack Send Message.

## Inputs required

- The full list of conditions a row must pass before sending
- The names of the existing columns those conditions reference (ICP Qualified, Work Email, Validation Status, LinkedIn URL, etc.)
- Whether multiple sending paths exist (different campaigns per segment) — each needs its own gate column

## Process

### 1. Enumerate every condition

Common conditions (pick what applies):

- ICP Qualified is "Yes" (or specific sub-industry label)
- Work Email is not empty
- Email Validation Status is "Valid" (not "Risky", "Catch-all", "Invalid")
- Personalization variable(s) are populated (e.g. `{{recent_news}}` not empty)
- Personalization variable(s) are not the fallback value (e.g. LinkedIn topic ≠ "No recent activity")
- LinkedIn URL not empty (only if LinkedIn-channel sending)
- CRM Contact Lookup is empty (don't send to existing CRM contacts)
- Suppression list match is FALSE
- Country is in target list (if not already filtered at table level)

### 2. Write the formula column

Format (plain text, not code):

```
IF ICP Qualified is "Yes"
AND Work Email is not empty
AND Email Validation Status is "Valid"
AND CRM Contact Lookup is empty
AND LinkedIn Topic is not "No recent activity"
THEN output TRUE
OTHERWISE output FALSE
```

Use Clay's AI Formula Generator to translate the plain text into the actual formula syntax — paste the rules in plain English, let Clay generate the formula code.

**Output the column as TRUE / FALSE** — boolean values, not strings. Easier to filter and sort.

### 3. Inspect rows before turning sending on

Before enabling the sending step:

1. Sort the table by Ready to Send descending — TRUE rows on top, FALSE rows below
2. Spot-check 5-10 TRUE rows: are these actually ready? Email looks valid, copy variables make sense, no weirdness?
3. Spot-check 5-10 FALSE rows: why are they excluded? Is it expected (no email found) or a bug (validation logic flipped)?
4. Fix the formula if any false TRUEs or false FALSEs surface

### 4. Wire the sending step

In the Instantly / HeyReach / CRM Create / Slack step's Run Settings → Conditional Run:

```
Run if Ready to Send = TRUE
```

That's the only condition. Nothing else.

### 5. Multiple sending steps from the same table

If the workflow pushes to multiple campaigns (e.g. one Instantly campaign per segment), each sending step needs its **own** Ready to Send column scoped to that campaign:

- Ready to Send — Fintech Campaign = TRUE if all general gates pass AND Segment = "Fintech"
- Ready to Send — Retail Campaign = TRUE if all general gates pass AND Segment = "Retail"

Each campaign-specific personalization enrichment must carry the same conditional run as its corresponding sending step (same Ready to Send column).

## Output format

```
SENDING GATE: [campaign name or "all campaigns"]

CONDITIONS (must all pass)
1. [Condition] — references column [Column Name]
2. [Condition] — references column [Column Name]
3. ...

FORMULA COLUMN
Name: Ready to Send [/ campaign suffix if multi-campaign]
Output type: TRUE / FALSE (boolean)
Formula:
IF [condition 1]
AND [condition 2]
AND [condition 3]
...
THEN output TRUE
OTHERWISE output FALSE

SENDING STEP CONFIG
Step: [Instantly Add Lead / HeyReach Add Lead / etc.]
Conditional run: Run if Ready to Send = TRUE
(no other conditions)

PRE-LAUNCH CHECKS
- [ ] Sorted table by Ready to Send DESC, spot-checked 5 TRUE rows
- [ ] Spot-checked 5 FALSE rows — exclusion reason matches intent
- [ ] Personalization variables on TRUE rows look correct in copy
- [ ] If multi-campaign: each personalization enrichment carries the matching Ready to Send conditional run
```

## Pass criteria

- The sending step's conditional run is exactly `Run if Ready to Send = TRUE` — nothing more
- Every condition that previously lived inside the sending step's conditional run has been moved into the formula column
- Output is boolean (TRUE/FALSE), not string
- For multi-campaign workflows: one Ready to Send column per campaign; each personalization enrichment carries the same conditional run as its sending step

## Common failures

- **Logic stays in the sending step** — "I'll just add one more AND" → 5 ANDs later, no idea why rows are being skipped. Always move to formula column.
- **String output instead of boolean** — "Yes"/"No" strings work but TRUE/FALSE filters and sorts cleaner.
- **Forgetting the validation-status condition** — emails come back "Risky" or "Catch-all" from the waterfall. If you only gate on "Email is not empty" you'll send to those.
- **Multi-campaign workflows with one shared Ready to Send column** — all rows route to all campaigns; defeats the segment split.
- **Sending step turned on before spot-checking the column** — TRUE rows look fine but FALSE rows reveal a logic bug after 200 leads have already gone out.

## What to do after

- Run the Instantly / HeyReach push → `tasks/push-to-sequencer.md`
- Run the CRM Create steps → `clay-engineer/providers/crm/hubspot.md` or `salesforce.md`

## Deeper knowledge

- Full export phase doc → `clay-engineer/phases/06-export.md`
- Formula column + conditional run syntax → `clay-engineer/platform/formula-syntax.md`
- The 8 global rules (rule 2 is this rule) → `clay-engineer/clay-engineer-master.md`
