# Phase 3 — ICP Qualification

**ICP Qualification always runs first — before any paid enrichment, before contact finding, before anything.**

It is a free gate. The entire point is to never spend a credit on a row you are going to discard.

---

## The Rule — Depends on List Source

### Database List Builds (Clay Find Companies, CSV imports)

**Do NOT build a formula column checking industry or headcount.** Those filters were already applied in the database before export — checking them again is redundant.

The real problem is that industry tags are self-reported and unreliable. A company tagged "Financial Services" could be an accounting firm. The only accurate qualification is visiting the company's actual website.

**Always use Claygent Web Research (GPT-4.1 Mini) on the Domain as the first and only gate.**

**No conditional run needed.** The prompt references `{Domain}` directly — if Domain is empty, Claygent automatically skips the row with a "missing input" status and spends zero credits. Adding `Run if Domain is not empty` is redundant. (See `clay/claygent.md` → Conditional Runs for Claygent.)

Claygent explores the website freely and determines what the company truly does — independent of self-reported tags. Never restrict to specific pages.

---

### People-Level Workflows

Use a free formula column first — checking job title, seniority, or other fields already present in the data.

```
IF Title contains any of the following THEN TRUE otherwise FALSE:
- [title 1]
- [title 2]
- [title 3]
```

---

## Claygent ICP Qualification Prompt — Rules

1. **Be specific on both sides** — detail what qualifies AND what disqualifies. Both matter equally.
2. **Name real disqualifying examples** — not vague categories. Write "accounting firm, financial advisory, legacy bank, compliance consultancy" not just "non-tech companies."
3. **Always include a judgment instruction** — Claygent must not disqualify based on a single keyword mention: *"do not disqualify a company just because it mentions one of the above in passing — look at what the company primarily does and sells. Only disqualify if the non-qualifying activity is clearly the core business."*
4. **Use "tech-first" as the core test** — for SaaS/tech ICPs, the company's technology must be their core product, not just an internal tool they use. This rule does NOT apply for traditional B2B ICPs (manufacturing, retail, banking, etc.) where you are qualifying by industry type, not by whether they are "tech-first."
5. **Output must always return industry/sub-industry/type classification — never just Yes/No.**

   Claygent's job is to identify what the company actually is. The in/out qualification decision is never made by Claygent directly — it is always made by a downstream formula column that checks whether the Claygent output matches the approved list. This applies universally across all service types.

   - **Outbound campaigns:** the classification drives campaign routing — which campaign the contact lands in. If the segment has multiple sub-types, Claygent should identify which. Some companies operate in both — output both.
   - **ABM / Full TAM builds:** the classification drives CRM field mapping (industry/sub-industry on the account record) and feeds the tier confirmation formula. Database industry tags are self-reported and unreliable — Claygent visiting the actual website is the only accurate source.

   In all cases: Claygent returns the industry/sub-industry/type. A formula column applies the approved list filter to produce the qualified TRUE/FALSE flag.
6. **Never add operational assumptions as qualification criteria.** Do not include criteria like "manages its own network infrastructure", "has multiple physical locations", "runs on-prem systems", or similar. These are things you are trying to FIND via enrichment — not things Claygent can reliably confirm from a website visit. They will produce false negatives. Qualify by **what the company is** (industry, size, type) — not **how you assume it operates internally.**

---

## ICP Qualification Prompt Template

```
You are a web research agent. Your task is to visit a company's website and determine whether it matches a specific industry and company type, and if so, classify it accurately.

You have the following information:
- Company Domain: {Domain}

Visit {Domain} and explore the website to understand what the company truly does.

A qualifying company is one that primarily operates as:
[DESCRIBE THE TARGET INDUSTRY/TYPE IN DETAIL — include sub-categories and examples]
The company must be tech-first — meaning technology is their core product, not just a tool they use internally.

Use judgment on borderline cases. A company that is clearly tech-first and operates in the target space qualifies even if it doesn't fit neatly into one sub-category. Some companies operate across multiple sub-types — classify them accordingly.

Do NOT qualify a company if it is primarily:
[LIST SPECIFIC DISQUALIFYING TYPES WITH REAL EXAMPLES — e.g. "accounting firm, financial advisory, legacy bank, compliance consultancy, regulatory law firm"]

Important: do not disqualify a company just because it mentions one of the above in passing. Look at what the company primarily does and sells. Only disqualify if the non-qualifying activity is clearly the core business.

Return one of the following outputs only:
- "[Sub-industry A]" — if the company qualifies and is primarily [Sub-industry A]
- "[Sub-industry B]" — if the company qualifies and is primarily [Sub-industry B]
- "[Sub-industry A] & [Sub-industry B]" — if the company genuinely operates in both
- "No" — if the company does not qualify
- "No" — if the website is unavailable or too thin to make a confident decision
```

**After pasting the prompt:** scroll to Define Outputs → click **JSON schema → Generate from prompt** → review and confirm → then run.

---

## Standard Order After Import

1. Import CSV / connect source
2. **Claygent Web Research on Domain** — qualification gate
3. Find contacts (conditional on qualified = passing sub-industry value)
4. Email waterfall + validation
5. Push to sequencer

---

## ICP Formula Column (for Pre-Filtered Lists)

Only use a formula column qualification when the list is already filtered by a provider you trust AND the qualification criteria maps cleanly to available columns (industry tag + headcount range).

Example:
```
IF Industry is one of the following: "Software Development", "Technology, Information and Internet"
AND Employee Count is between 11 and 200
THEN output TRUE
OTHERWISE output FALSE
```

This is NOT sufficient as the sole gate for broad database exports — industry tags are self-reported and unreliable. Only valid when the list was already narrowly filtered upstream.
