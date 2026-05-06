# Task: Build a Buyer Persona

Recipe for profiling a specific role — what they care about, what they fear, how to write to them. Output is reusable across cold-email, linkedin-sequence, and objection-handler clusters.

## When to use this

User asks to build a persona, profile a buyer, understand a decision-maker type, or define messaging for a specific role.

## Inputs required

- Role title(s) to profile (one persona file per role — VP Sales and Head of Sales are NOT the same)
- ICP context (company type, size, industry)
- ANY of: sales call recordings, LinkedIn profiles, job descriptions for this role

## Process

1. Research the role using LinkedIn (via MCP if available): scan 5-10 profiles matching the ICP for this title
2. Read their posts and activity for language patterns — capture the words THEY use
3. Review job descriptions for this role to understand what success looks like
4. Identify these 6 fields:
   - **Primary KPI** they're measured on
   - **Biggest daily frustration**
   - **What they're trying to prove** to leadership
   - **What makes them look bad** internally (the most important field — fear drives more decisions than hope)
   - **What vendors/tools they already use**
   - **How they prefer to buy** (self-serve vs. demo vs. committee)
5. Translate into copy guidance: tone, vocabulary, what to lead with, what to avoid
6. Draft an example opener using the persona's own language

## Output format

```
Persona: [Title]
ICP context: [Company type / size]

ROLE PROFILE
Primary KPI:        [what they're measured on]
Biggest pain:       [the thing that keeps them up]
What they want to prove: [internal motivation]
What makes them look bad: [risk/fear driver — most important]
Current tools:      [typical stack for this role]
Buying style:       [how they prefer to evaluate]

MESSAGING GUIDE
Lead with:          [the angle that resonates first]
Avoid:              [what sounds like every other vendor]
Tone:               [direct and blunt / peer-to-peer / analytical]
Power phrases:      [words/phrases this persona responds to]
Red flag phrases:   [words that make them tune out]

EXAMPLE OPENER
"[A first line that would immediately resonate with this persona]"
```

## Pass criteria

- All 6 role-profile fields populated with specifics (not generic — "wants to look successful" fails; "wants to demonstrate pipeline coverage by Q-end" passes)
- Power phrases include words from actual job postings or LinkedIn activity, not invented
- Example opener uses persona vocabulary, not product vocabulary

## Common failures

- **Building VP Sales and Head of Sales as the same persona** — they often have completely different concerns (one revenue, one operational). Profile them separately.
- **Missing "what makes them look bad"** — fear of failure drives more decisions than hope of gain. Skipping this field gives you a 70% persona at best.
- **Product-vocabulary opener** — if the example opener uses YOUR words ("sales enablement"), rewrite using THEIR words ("prep for QBRs")
- **Generic stack** — "they use a CRM" → name the specific 2-3 CRMs typical for this role

## What to do after

- Persona file feeds directly into: `clusters/cold-email/tasks/write-first-email.md` (tone calibration), `clusters/sequences/tasks/write-linkedin-sequence.md` (LinkedIn voice), `clusters/objections/tasks/handle-objection.md` (objection prediction)
- Revisit after 20 cold call recordings with this persona — language drifts, refresh accordingly

## Deeper knowledge

- ATL (VP/C-Level) vs BTL (Manager/IC) distinction → `clusters/cold-email/knowledge/atl-btl-messaging.md`
- Buying committee mapping (multi-persona for ABM) → `clusters/list-building/knowledge/abm/persona-mapping-framework.md`
