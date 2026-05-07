# Task: Build a Clay Workflow End-to-End

Recipe for building a complete Clay workflow from a domain list / CSV / Find Companies pull → qualified, enriched, personalized contacts pushed into Instantly, HeyReach, HubSpot, Salesforce, or Google Sheets. Orchestrates the 6 phases.

## When to use this

User asks to "build a Clay workflow", "spec an outbound campaign in Clay", "set up a Clay table", "design an ABM enrichment flow", or hands you a list + ICP + destination and wants the table wired up.

## Inputs required

Run **discovery first** (see deeper knowledge → phase 01) — the workflow cannot start without all three:

1. **List source** — CSV of domains, or a Clay Find Companies pull spec (filters, target row count)
2. **ICP definition** — qualifying criteria + disqualifying criteria + concrete examples
3. **Target destination** — Instantly campaign(s), HeyReach campaign, HubSpot/Salesforce object + match keys, or a Google Sheet

Plus: which providers the client has API keys for (Findymail, Icypeas, Apollo, ZeroBounce, OpenAI, etc.) and which CRM they're on.

## Process

Read the phase docs in order — each one has the operational detail. The orchestration is:

1. **Discovery** (`clay-engineer/phases/01-discovery.md`) — ask the missing questions before building anything. Never guess segment structure, CRM properties, or copy variables.

2. **List building** (`clay-engineer/phases/02-list-building.md`) — Clay Find Companies filters, sizing, AI Filters, headcount range reliability. CSV import path if list already exists.

3. **Qualification** (`clay-engineer/phases/03-qualification.md`) — Claygent Web Research on company domain (GPT-4.1 Mini) is the first paid step. Free formula columns gate it. LinkedIn headcount verification first if Clay Find Companies was the source.

4. **Table architecture** (`clay-engineer/phases/04-table-architecture.md`) — decide Table A (companies) vs Table B (contacts), whether to split segments into separate tables, how to wire data unification formulas, auto-dedupe settings.

5. **Enrichment** (`clay-engineer/phases/05-enrichment.md`) — contact finding → name normalization → email waterfall → email validation → personalization enrichments → data unification.

6. **Export** (`clay-engineer/phases/06-export.md`) — Sending Gate formula column → CRM lookup/create → Instantly/HeyReach push gated on Ready to Send = TRUE.

## Global rules — apply at every step

From `clay-engineer/clay-engineer-master.md`:

1. **Gates before credits** — never spend a credit on a row you'll discard. Free formula columns first, then cheap enrichments, then expensive enrichments, then export.
2. **Sending Gate formula column** before any irreversible export — see `tasks/design-sending-gate.md`.
3. **Data unification** — merge multi-source fields into one formula column before downstream steps reference them.
4. **ICP qualification runs first** — Claygent Web Research, gated only on Domain not empty.
5. **Free before paid** — if a formula column can do the job, use it instead of Claygent.
6. **Never assume — ask first** about destination requirements, source data shape, output goal.
7. **Clay-managed vs own API key** — own key for high-volume tools; **Sumble is always native, never own key**.
8. **Multiple sending steps per table are supported** — each needs its own matched personalization enrichment with the same conditional run.

## Output format

Deliver a workflow spec the user can build column-by-column in Clay:

```
WORKFLOW: [name]
Source: [CSV / Clay Find Companies / CRM import]
ICP: [one-line definition]
Destination: [Instantly campaign / HubSpot / etc.]

TABLE A (Companies)
1. Source step — [details]
1b. (if CFC source) LinkedIn headcount verification — Claygent ChatGPT 4.1 Nano
1c. (if CFC source) Table filter on LinkedIn headcount
2. ICP qualification — Claygent Web Research GPT-4.1 Mini, gated on Domain not empty
3. Company-level enrichments — [list, each with conditional run]

TABLE B (Contacts) — built off Table A qualified rows
1. Find contacts — [provider, conditional run: Run if ICP Qualified = "Yes"]
2. Name normalization — Claygent ChatGPT 4.1 Nano
3. Company name normalization — Claygent ChatGPT 4.1 Nano
4. Email waterfall — gated on name + domain present
5. Email validation
6. LinkedIn URL finding (only if HeyReach or CRM needs it)
7. Personalization enrichments — gated on qualified + email found
8. Data unification formula columns
9. Sending Gate formula column ("Ready to Send" — TRUE/FALSE)
10. CRM Company Lookup → Create/Update
11. CRM Contact Lookup → Create/Update
12. Instantly push — gated on Ready to Send = TRUE
13. HeyReach push — gated on Ready to Send = TRUE AND LinkedIn URL not empty

VARIABLES MAPPED INTO COPY
{{first_name}}, {{company_name}}, {{[personalisation_var]}}, ...

OUTSTANDING QUESTIONS (from discovery)
- [if any unresolved]
```

## Pass criteria

- ICP qualification runs before any company-level paid enrichment (rule 4)
- Every paid step has a conditional run that gates on something other than "input field not empty" (Clay handles that natively for Claygent — see `knowledge/prompts/claygent-guide.md` → Conditional Runs)
- Sending Gate formula column exists; the sending step's only condition is `Ready to Send = TRUE`
- Multi-source fields (e.g. job title from Apollo + Enrich Person) are unified into one formula column before any downstream step references them
- Variable names in Custom Variables match the `{{placeholder}}` in the Instantly/HeyReach copy exactly (case-sensitive)
- For Clay Find Companies tables: LinkedIn headcount verification + table filter is in place before ICP qualification

## Common failures

- **Skipping discovery** — building before knowing the destination's match keys or required custom variables. Always run phase 01.
- **Putting conditional logic in the sending step** — if Instantly's conditional run has 4 ANDs, you can't inspect which row will/won't go. Use a Sending Gate formula column.
- **Trusting Clay Find Companies headcount ranges** — they're often wrong. Verify with LinkedIn (Claygent ChatGPT 4.1 Nano) → table filter.
- **Two enrichments writing the same field, one referenced downstream** — unify into a formula column first.
- **Multiple Instantly campaigns from one table without matching personalization enrichments** — each campaign needs its own personalization step carrying the same conditional run.

## What to do after

- For Table A/B architecture decisions → `tasks/build-table-architecture.md`
- For the Sending Gate column → `tasks/design-sending-gate.md`
- For the Instantly / HeyReach push → `tasks/push-to-sequencer.md`
- For the email waterfall step (one piece of phase 05) → `tasks/run-email-waterfall.md`

## Deeper knowledge

- All 6 phases (operational detail) → `clay-engineer/phases/01-discovery.md` through `06-export.md`
- Master doc with all 8 global rules + FETE framework + Standard Workflow Order → `clay-engineer/clay-engineer-master.md`
- Provider specifics (13 files) → `clay-engineer/providers/`
- Formula columns + conditional run syntax → `clay-engineer/platform/formula-syntax.md`
- Auto-dedupe / auto-update / keep-existing-results / scheduling → `clay-engineer/platform/table-mechanics.md`
- Claygent prompt-writing process + JSON schema setup → `knowledge/prompts/claygent-guide.md`
- Email waterfall provider order + costs → `knowledge/waterfall-enrichment.md`
