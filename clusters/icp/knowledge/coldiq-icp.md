# ColdIQ takes: icp

Source: ColdIQ radar (third-party GTM skills listed on coldiq.com/skills). Promoted from `_external-takes/coldiq-icp.md` at /creator-radar-review 2026-10-11.

## Unvalidated — external, not yet run by Jan
> Filed by the ColdIQ radar from third-party skills. Attributed; NOT gtm-master doctrine.
> A bullet moves into the body above only after it has been run in a real campaign and worked.

### Sizing and ranking ICP hypotheses
- Buildability test: a usable ICP resolves to roughly 500-5,000 contacts in LinkedIn/Apollo; millions = too broad, dozens = over-narrowed. Gives build-icp a stop condition in contacts, not just "3 verticals/signals". [l3mpire/icp-definer]
- Rank 3-5 ICP hypotheses on pain intensity, budget authority, reachability, timing/urgency (1-5 each, max 20); build full cards for the top 2 only. [l3mpire/icp-definer]

### Deriving ICP from customer evidence
- Run a review-mining pass before ICP/persona work: case studies, G2/Capterra/TrustRadius, own site. Source rank: verbatim customer quotes > customer-reported metrics > company website claims > competitor mentions in reviews; on conflict, customer voice beats company marketing. [l3mpire/deep-company-analyser]
- Pain ladder in 4 layers (surface -> business -> personal -> career), each scored with severity X/10 AND frequency % (share of reviews/case studies naming it); lead with high-frequency pains, not the loudest one. [l3mpire/deep-company-analyser]
- Capture the "last straw" moment (what ended the status quo) as a quote bank alongside verbatim pain/outcome phrasing; the last-straw set is the trigger list for signals and the language set feeds personalization inputs. [l3mpire/deep-company-analyser]
- Build a failed-alternatives table (what they tried, why it failed, quote) and an honest weaknesses list from review cons, each flagged deal-breaker vs minor; feeds competitive positioning and objection pre-handling. [l3mpire/deep-company-analyser]

### Account research briefs
- Anchor each company brief on a stated purpose and let it pick the data bundle: always firmographics, hierarchy, funding, workforce trend, LinkedIn posts, 90-day events; then competitive eval -> technographics/landscape, renewal/QBR -> ratings/challenges, cold outbound -> website changes + offer keywords, M&A -> financials. Print skipped or null fields as a one-line note so absent data is distinguishable from absent investigation. [explorium/account-research]
- Shell-entity check on company match: a major brand resolving to 1-50 employees and a "managing offices" category has matched a holding shell; retry on alternate domain/name and surface ambiguity instead of guessing. [explorium/account-research]
- Tag every news event "named in headline" / "inferred from body" / "industry-wide: excluded" and report the excluded count; when events show a newer round than the funding record, events win and the enrichment lag is flagged. [explorium/account-research]
- Peer cohorts: derive sub-category from the brief's purpose, not the industry label; force-include any competitor the user named (labelled); under 5 confident matches suppress the table and give a recommendation line instead. [explorium/account-research]
- Freshness by source class: filings-derived "challenges/strategic insights" are null for private and 12-18 months stale for public companies; current state comes from events, funding, workforce trend and posts. [explorium/account-research]
