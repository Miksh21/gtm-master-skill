# Phase 1 — Discovery

Before writing a single enrichment step, run discovery. The right questions upfront prevent building the wrong workflow entirely.

---

## The Core Principle

**Never assume. Always ask or check first.**

Understand the full picture before building:
- What does the destination require? (CRM properties, sequencer variable names, what fields actually get used)
- What does the source give you? (what columns the list provider returns, how clean the data is)
- What is the output goal? (sequencer only, CRM only, or both)

**Build only what is needed for the destination.** Every column you build that nothing uses is wasted effort.

---

## The Three Inputs Required to Start

The skill expects three things before building:

1. **List source** — a CSV of company domains, or a Clay Find Companies pull spec (industry, headcount, geography, etc.)
2. **ICP definition** — what qualifies, what disqualifies, with concrete examples (real disqualifying types, not vague categories)
3. **Target output** — Instantly campaign, HubSpot accounts, Salesforce records, Google Sheet, or a combination

If any of the three is missing, ask for it before building.

---

## Discovery Questions

Once you have the three inputs above, ask whichever of these are still unclear:

### List & Segments
1. **What are the segments in this campaign?** Sub-industry, headcount, geography, or a combination?
2. **For each segment: does the difference change WHO you're targeting (different buyer persona, different titles), or just WHAT you're saying (same buyer, different copy angle)?**
3. **What are the target job titles per segment?**
4. **How many contacts per company?** (typically 1–5 for outbound; uncapped for full TAM mapping)
5. **What is the total contact target per segment?** (needed for export sizing math; skip for full TAM mapping)
6. **Is this a one-time list build or an evergreen automated campaign?** (affects contact finding approach, table settings, scheduling)

### Provider Stack
7. **What API keys do you have connected in Clay?** (FindyEmail, Icypeas, BuiltWith, Crunchbase, SEMrush, etc.)

### Sequencer
8. **What sequencer will you use?** (Instantly / HeyReach / Smartlead / Lemlist / other)
9. **What are the exact `{{variable_names}}` in the copy?** (without these, you don't know what to enrich)
10. **Any specific personalisation points or signals you'd like to add in the copy?** (e.g. recent funding, hiring signals, tech stack mentions)

### CRM
11. **Are contacts pushed to a CRM?** If yes — which CRM?
12. **What are the exact internal field names for contact and company properties?** (not display labels — internal API names). Which properties already exist vs need to be created?

---

## After Running Discovery

Once you have the answers:

1. **Map the destination requirements** — list every field the CRM/sequencer needs
2. **Map what the source gives you** — list what columns the source data provides
3. **Identify the gap** — what enrichments are needed to fill the delta
4. **Plan the workflow** — in order from Free gates → cheap enrichment → expensive enrichment → export

**The goal is precision and efficiency — not completeness.** A workflow that does exactly what is needed, nothing more, is better than a workflow that enriches everything just in case.

---

## Key Rules for Discovery Phase

- **Always know the three inputs before building** — list source, ICP, output destination
- **Ask about copy variables before any spec** — without variable names, you don't know what to enrich
- **Don't guess CRM structure** — field names and available properties vary
- **Check the data first** — before adding normalisation steps, check whether names/companies are already clean
- **Broad industry tags always need a flag** — Financial Services, Software Development, etc. always require keyword narrowing or separate searches. Flag upfront before building
- **If you don't know whether a specific tool exists in this skill** — grep the skill before saying "nothing specific"
