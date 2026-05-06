# Task: Personalize at Scale (Clay / AI Prompts)

Recipe for generating signal-derived first-line / hook personalization across a large list — using Clay or an LLM step in the sequencing platform — without it reading as templated.

## When to use this

User wants to personalize 50+ emails in a campaign, asks about Clay first-line generation, asks how to write an AI prompt for personalization, or wants to scale an outbound campaign without manual research per lead.

## Inputs required

- **Lead data fields available** (LinkedIn URL, company website, recent news, hiring signals, tech stack, etc.)
- **The campaign's signal** (what trigger qualified the lead in the first place)
- **The persona** (role + seniority — affects what's worth referencing)
- **Sequence step the personalization will sit in** (Step 1 opener vs PS line vs follow-up reference)

## Principles (non-negotiable)

- **Personalization must be signal-derived, not vanity-derived.** "Saw you posted about X on LinkedIn" is vanity. "You're hiring 3 SDRs this quarter" is signal.
- **Specificity > volume.** One personalization point that's specific beats five that are generic.
- **AI personalization fails when the AI can't distinguish strong from weak signals** — the prompt must filter, not just generate.
- **A bad personalization line is worse than no personalization** — it triggers "this is a template trying to look personal", which is worse than honest cold.
- **Test the prompt on 20 leads manually before scaling to 500.**

## Process

1. **Define the data buckets** — what fields will the AI/Clay read? Common: company description, recent news, LinkedIn About, job postings, funding round, tech stack, recent hires.
2. **Define the signal hierarchy** — rank-order what's most worth referencing for THIS persona. For a VP Sales: hiring SDRs > funding > tech stack changes > LinkedIn posts.
3. **Write the AI prompt** with these required sections:
   - **Context** — who the lead is, what role, what company
   - **Goal** — what the line is for (Step 1 opener / PS / follow-up reference)
   - **Signal hierarchy** — explicit ranking of what to look for in priority order
   - **Constraints** — word count, tone, what NOT to mention (no LinkedIn-post references unless the post is signal-relevant)
   - **Output format** — single sentence, plain text, no quotes
   - **Fallback rule** — if no strong signal found, return a specific fallback string ("[NO_STRONG_SIGNAL]") so the row can be flagged, not sent generic
4. **Test on 20 leads manually** — eyeball outputs. If any feel templated, refine the prompt's constraints or signal hierarchy.
5. **Plug into Clay table or sequencing platform AI step** — wire the field as the lead's first-line variable.
6. **Add a manual review step** before sending: filter out any row where the output contains the fallback string OR is over the word-count limit OR contains banned phrases.

## Output format

Return BOTH the prompt and a sample of 5 generated outputs from real lead data.

```
PERSONALIZATION SETUP — [campaign name]
Persona: [role @ company type]
Sequence step: [Step 1 opener / PS / Follow-up reference]
Tool: [Clay / Instantly AI / Smartlead AI / other]

DATA BUCKETS USED
- [field 1] (source: [Clay enrichment / scraped / CRM])
- [field 2]
- ...

SIGNAL HIERARCHY (priority order for this persona)
1. [strongest signal type for this persona]
2. [next]
...

THE PROMPT
---
[Full prompt text — context, goal, signal hierarchy, constraints, output format, fallback rule]
---

SAMPLE OUTPUTS (test on 5 real leads)
Lead 1 ([Name @ Co]): [generated line]
Lead 2: [generated line]
Lead 3: [generated line]
Lead 4: [generated line]
Lead 5: [generated line]

QUALITY GATE BEFORE LAUNCH
☐ All 5 sample outputs feel signal-derived (not vanity)
☐ Word count consistent with target
☐ Fallback rule fires correctly on a lead with no strong signal
☐ No banned phrases ("hope you're well", "saw your post", generic compliments)
☐ Manual review step wired in pipeline to flag fallback rows
```

## Pass criteria

- Sample outputs are clearly signal-derived (a peer reading them would say "yeah, that's specific")
- Fallback fires for leads without strong signal (not silently generating weak generic line)
- Word count under target (typically 15-25 words for an opener)
- Tone matches the rest of the email (don't have a peer-style opener leading into a corporate body)

## Common failures

- **Vanity personalization** ("Saw you went to Stanford") — almost never moves the needle for B2B
- **Generic pattern personalization** ("Saw {company} is doing great work in {industry}") — sounds personal, isn't
- **No fallback rule** — when there's no strong signal, the AI generates something generic, you don't know it happened, you launch the campaign with 30% weak openers
- **Skipping the 20-lead manual test** — prompts that read well in isolation often produce templated-sounding outputs at scale
- **AI doing job a formula could** — if the personalization is "their hiring count from job board", that's a Clay formula, not an AI step. Save credits.

## What to do after

- Launch with manual review of first 50 sends — check that personalization quality matches the test sample
- Track reply rate by personalization-source (signal type) — over time, shift the signal hierarchy toward what actually converts
- If reply rate drops vs. manually written campaigns, the prompt's signal filter is too loose — tighten it

## Deeper knowledge (load only when needed)

- Full Clay prompt library and personalization patterns → `clusters/cold-email/knowledge/personalization-prompts.md`
- Campaign-level personalization strategy and bucketing → `clusters/cold-email/knowledge/campaign-playbooks.md`
- Why signal-based outperforms cold (benchmarks) → `clusters/cold-email/knowledge/cold-email-mastery.md`
