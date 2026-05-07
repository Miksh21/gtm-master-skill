# Phase 2 — List Building

Building company lists in Clay using **Clay Find Companies** as the source. Always starts with the cheapest/free source and works up.

---

## The FETE Framework

Every Clay workflow: **Find → Enrich → Transform → Export**

List building is the Find phase — getting the right company universe into Clay before any enrichment runs.

---

## Clay Find Companies — The Default Source

**Clay Find Companies (native) is the default for digital-native businesses.**

- Free, no import needed
- 50,000 row limit per pull
- LinkedIn-indexed companies — works well for SaaS, tech, fintech, software agencies, marketing agencies, consultancies, startups, professional services firms, digital-first businesses

For traditional / non-LinkedIn-native businesses (manufacturing, restaurants, retail, healthcare clinics, local SMBs), Clay Find Companies returns near-zero results. In those cases the user should bring an external list as a CSV. This skill handles the list once it's in Clay — it does not source non-LinkedIn lists.

---

## CSV Import — When User Brings Their Own List

If the user has a list from another source (Apollo, Sales Navigator export, ZoomInfo, an event attendee list, a Google Sheet, etc.), they can import as CSV.

Required column: **Company Domain** (or LinkedIn URL — but Domain is preferred for downstream qualification and matching).

Other columns the user provides will become available for filtering and personalisation but should never be trusted for ICP qualification on their own — always re-qualify with Claygent Web Research.

---

## Export Sizing — Two Modes

### Mode 1 — Targeted Outbound (contact quota applies)
Calculate required company count before exporting. Never over-export.

**Sizing formula:**
- Target contacts per segment ÷ email hit rate (~75%) = contacts needed before validation
- ÷ contacts per company (1 for 11–50 headcount, 2 for 51–200) = companies needed
- × 1.25 buffer for qualification drop-off = final export target

**Example:**
- Target: 1,500 contacts, 11–50 band, 1 contact per company
- 1,500 ÷ 0.75 = 2,000 contacts needed before validation
- 2,000 ÷ 1 = 2,000 companies needed
- × 1.25 = ~2,500 companies to export

---

### Mode 2 — Full TAM Mapping (no cap)
Used for ABM programs and RevOps data builds where the goal is to capture the complete addressable universe for CRM enrichment.

**Rule: export everything that passes the ICP filters — do not artificially cap the export.**

- No sizing formula applies
- No contact quota — source all available contacts per company matching the approved persona
- The output is the complete TAM: all qualifying companies + all matching contacts pushed to CRM

---

## Filter Reliability — The 95% Accuracy Standard

Only add a filter if a data tool can return it with 95%+ accuracy, consistently and stably over time.

### Always Reliable
- Employee headcount (LinkedIn via Clay Enrich Company — 1 credit/row, always gate behind ICP qualification first)
- HQ Country, HQ City (LinkedIn)
- Industry (LinkedIn) — reliable, always use exact names
- Founded year (LinkedIn / Crunchbase)
- Company type (public / private / non-profit)
- Technology stack — BuiltWith for website-facing tools only
- Total funding raised (Crunchbase) — stable, doesn't decrease
- Is VC-backed / PE-backed (Crunchbase)
- Monthly website traffic volume (SEMrush) — stable characteristic

### Never Use
- **Revenue** — unreliable for private companies. Never use as qualification filter.
- **Business types** (Clay dropdown) — not accurate
- **Revenue streams** (Clay dropdown) — not accurate
- **Department headcount** — not accurate at scale
- **Growth rate** — estimated, never factual
- **Funding raised** — strip this from broad searches (>500 expected results), use only for niche searches (<500 results)

---

## Broad Industry Tags — Always Flag Before Building

**Flag broad tags BEFORE the user starts building in Clay:**

Tags that always produce noise and require keyword narrowing or separate searches:
- **Financial Services** — includes banks, insurance, accounting, hedge funds. Fintech is a small subset.
- **Software Development** — includes all software companies
- **Advertising Services / Marketing Services** — includes all agencies
- **Technology, Information and Internet** — extremely broad

**Action:** Design separate searches with AI Filters or keyword constraints for each relevant sub-segment. Never search these alone without additional constraints.

---

## Headcount — Verify on Clay Find Companies Tables

Clay Find Companies returns headcount as a range (e.g. 51-200) and is often wrong. Always verify with a Claygent Web Research step on the LinkedIn URL to get the exact count, then apply a table filter to exclude rows outside the target range. This runs before ICP qualification — see `phases/05-enrichment.md` and `clay/table-mechanics.md` → Table Filters.

---

## Contact Sourcing Priority

| Source | Notes |
|---|---|
| **Clay native Find People** | Free, the default starting point |
| **Apify scrape of Sales Nav** | When LinkedIn Sales Nav export is needed and direct CSV export isn't possible |

For specific contact-finding logic and the full email/phone waterfall, see `phases/05-enrichment.md` and `providers/contact-finding/email-waterfall.md`.
