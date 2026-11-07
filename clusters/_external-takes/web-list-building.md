# External takes — list-building (Web radar, UNREVIEWED)

## The Automated CRM Enrichment Playbook — workflows.io  ·  filed 2026-11-07
Source: https://www.workflows.io/workflows/the-automated-crm-enrichment-playbook (2026-08-14) · cluster: list-building
- ⚠️ contradicts [list-building/knowledge/data-validation.md:79]: refresh cadence. Both sides — gtm-master: re-verify lists older than 30 days (22-30% annual email decay); workflows.io: a record re-enters enrichment (including work email find and validation) only when the "Enriched by Clay" flag is empty or older than 1 year.
- 🆕 new-angle: CRM-triggered enrichment loop: custom property on company and contact, workflow sends a webhook to Clay, parallel company and contact tables, write-back of every final field plus the flag in one update so the record never loops.
- 🆕 new-angle: qualified-status checkpoint (employee count, country, industry) before downstream enrichment; related domains found and stored as additional domains on the company.
Review: contradicts
Status: holding

## TAM sourcing + Workflows API — workflows.io  ·  filed 2026-11-07
Source: https://www.workflows.io/workflows/the-tam-mapping-playbook (2026-07-28) + https://www.workflows.io/resources/workflows-api · cluster: list-building
- 🆕 new-angle: never rely on one database's native filters (many software companies are not tagged as software development); combine Apollo, AI Ark, Ocean.io, DiscoLike, Sales Navigator, StoreLeads with scraped lists (Apify, Octoparse, Serper, Python), then dedupe, merge columns, find missing domains and validate that every domain is live.
- 🆕 new-angle: free REST API for list hygiene: domain validator (DNS check, HTTP request, redirect capture, HTTPS→HTTP fallback, parent company via redirect) and company name normaliser (strip "The", legal suffixes, punctuation); 300 requests/minute.
Review: additive
Status: holding


## Local Business TAM from Directories (Play 40) — frontal.so  ·  filed 2026-11-07
Source: https://frontal.so/plays/local-business-tam · cluster: list-building
- 🆕 new-angle: size before paying: read the result total from one directory fetch per geography and category, pilot Google Maps at 30 places per term (all terms hitting 30 = more supply), the cap is per term, agree a hard budget and pass a max spend.
- 🆕 new-angle: Maps lists locations not companies; search a whole region and exclude cities afterwards; directories via plain fetch when server-rendered, confirm which parameter really paginates, test exact category strings, make the crawl resumable; contact data mostly only on paid listings.
- 🆕 new-angle: dedupe on domain then normalized name + street, blank directory and link-in-bio domains first, keep the richest record plus every category and geography it appeared under, count rows with a CSV parser; owner name read from the about page by an LLM; tier on locations, reviews, website quality; keep the raw scrape. Provenance: Frontal = former ColdIQ Agency (same operators as the coldiq-* holding files), so agreement with coldiq takes is NOT independent corroboration.
Review: additive
Status: holding

## Qualifying from Public Filings (Play 39) — frontal.so  ·  filed 2026-11-07
Source: https://frontal.so/plays/public-filings-qualification · cluster: list-building
- 🆕 new-angle: write the qualifying question a buyer would ask on call one and the field that answers it; check the obvious proxy against real accounts (owning buildings is not maintaining them); closed answer sets with 'unknown' allowed and blank forbidden.
- 🆕 new-angle: public filers: SEC EDGAR first, pin to one named 10-K (Item 2 Properties), 20-F for foreign filers; private companies: published totals or a shown build-up per format, never apportion by site-count ratio; enforce rules in code after the model (blank -> reject, arithmetic -> estimate flag, ratio -> keep out of CRM, no source -> hold, cache raw responses); audit a sample against the filing, report coverage per field; every unknown becomes a first-call question. Provenance: Frontal = former ColdIQ Agency (same operators as the coldiq-* holding files), so agreement with coldiq takes is NOT independent corroboration.
Review: additive
Status: holding

## Founder Connections Mining (Play 21) — frontal.so  ·  filed 2026-11-07
Source: https://frontal.so/plays/founder-connections-mining · cluster: list-building
- 🆕 new-angle: one-time play: export the founder's LinkedIn data archive connections CSV (best at 2,000+ connections), keep the connected-on date because older connections need a different opener, flag accounts already in the CRM, score by ICP fit not by how well the founder remembers them; Tier 1 AE call referencing the connection, Tier 2 email + LinkedIn opening on the existing connection, Tier 3 light nurture. Provenance: Frontal = former ColdIQ Agency (same operators as the coldiq-* holding files), so agreement with coldiq takes is NOT independent corroboration.
Review: additive
Status: holding

## Outbound Data Sources: 12 categories — frontal.so  ·  filed 2026-11-07
Source: https://frontal.so/blog/outbound-list · cluster: list-building
- ✅ supports [list-building/knowledge/lead-sources-guide.md]: go beyond Apollo, Sales Navigator and ZoomInfo, where every competitor's list is identical.
- 🆕 new-angle: 12 source categories (review sites, startup/founder discovery, events, job boards, technographics, marketplaces, freelancer platforms, creator platforms, developer/open source, funding, news, location) with time-bounded windows as the edge: Product Hunt launch day, funding day, negative-review week; GitHub repos for self-declared technical stack. Provenance: Frontal = former ColdIQ Agency (same operators as the coldiq-* holding files), so agreement with coldiq takes is NOT independent corroboration.
Review: additive
Status: holding
