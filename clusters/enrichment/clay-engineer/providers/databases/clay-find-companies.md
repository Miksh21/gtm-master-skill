# Clay Native — Find Companies

Clay's built-in company database. **Always the first database to use for any list build** — free, already inside Clay (no export/import needed), 50k row limit covers most targeted builds.

Use Clay Find Companies first for any list build. If results are short, supplement with a CSV import from another database — see `phases/02-list-building.md`.

---

## Available Filters

- Industries (dropdown tag selector — must use exact strings from Clay industry taxonomy)
- Sub-industries
- Employee count range
- Location (HQ country, city)
- Technology stack (via HG Insights)
- Funding raised ← use carefully — see Filter Intensity Strategy below
- Business types ← **never use** (unreliable)
- Revenue streams ← **never use** (unreliable)
- Keywords / Description
- AI Filters → Products & services description (AI-powered matching)

**Output columns:** Company name, domain, LinkedIn URL, employee count, industry, location

---

## Filter Intensity Strategy

The most important decision before running any search: **how many results will this industry + size + location combo return?**

**Large result set expected (>500 companies) — broad industries like Software Development, Financial Services:**
- Strip Funding raised — inaccurate at scale, produces thousands of irrelevant results
- Strip Business types — unreliable, never use
- Strip Revenue streams — unreliable, never use
- Keep lean: Industries + Employee count + Location + AI Filters only
- Run all qualifying industries together in one search

**Small result set expected (<500 companies) — niche industries like IT Services, Legal Technology, Construction Tech:**
- Run as a **separate, individual search** — never bundle niche industries with broad ones
- Add Funding raised — with <500 results, inaccuracy is acceptable
- Add more filters to tighten: Description keywords, Subindustries, AI Filters Products & services
- Fewer results expected → more filters justified

**Decision process before every search:**
1. Estimate result count for the industry + size + location combo
2. If expected < ~500: use more filters, add Funding, run individually
3. If expected > ~500: strip Funding/Business types/Revenue streams, keep broad
4. Always spot-check 20 companies after the pull before running full Clay enrichment

---

## Industry Filter — Key Rules

Always use exact strings — Clay's industry filter is a dropdown/tag selector. Wrong strings return nothing.

**Common vertical → industry mapping:**

| Vertical | Industry strings to use |
|---|---|
| B2B SaaS | `Software Development`, `IT Services and IT Consulting`, `Technology, Information and Internet` |
| GTM / Sales tech | `Software Development` + `Technology, Information and Internet` + AI Filters Products & Services |
| Marketing agencies | `Advertising Services`, `Marketing Services` |
| Fintech | `Financial Services`, `Banking`, `Investment Banking` |
| Healthcare tech | `Hospitals and Health Care`, `Biotechnology`, `Medical Devices` |
| HR tech | `Human Resources`, `Human Resources Services` |
| Cybersecurity | `Computer and Network Security`, `Data Security Software Products` |
| E-commerce brands | `Retail`, `Online and Mail Order Retail`, `Consumer Goods` |
| When in doubt | Use AI Filters → Products & services description instead |

**Broad industry tags that always produce noise — always flag before searching:**
- Financial Services — includes banks, insurance, accounting, hedge funds. Fintech is a small subset.
- Software Development — includes all software companies, not just SaaS
- Advertising Services / Marketing Services — includes all agencies
- Technology, Information and Internet — extremely broad

For any of these tags, design separate searches or add AI Filters to narrow intent. Never search these alone without additional constraints.

---

## AI Filters — Products & Services Description

Clay's AI-powered matching field. Enter a plain-language description of what the target company does — Clay's AI matches against company descriptions, not just industry tags.

**When to use:**
- Target segment doesn't map cleanly to a single industry tag
- Industry tag is too broad and returns unrelated companies
- Layer intent/product specificity on top of standard filters
- When in doubt — AI Filters does the matching work

---

## After Import

Since Clay Find Companies is a native table source, no CSV import is needed. The search runs directly as the table source.

After pull:
1. Run Claygent Web Research ICP qualification on Domain — always first gate
2. Never run enrichments before qualification — waste credits on unqualified rows
3. Spot-check 20 companies before running full enrichment
