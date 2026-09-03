# External takes — list-building (Patrick Spychalski video, UNREVIEWED)

## GTM Engineering in 2026 — A Complete Walkthrough — youtu.be/3jIhI-joTMc · filed 2026-09-03
Source: https://youtu.be/3jIhI-joTMc (Patrick Spychalski, co-founder The Kiln; ex-Clay early employee) · cluster: list-building
Shelf-life (stated by author): "only alpha for the next 4-8 months past September 2026" → re-verify by 2027-03.
- ✅ supports [list-building/knowledge — 62+ underused data sources + lead sources guide]: for public-record / regulated industries, many government databases are publicly available and legal to scrape — have Claude write a Python scraper (or Octoparse) rather than pay ~$50k for a data provider doing the same thing. General heuristic when no provider fits: find a scrapeable public DB, seed the list with Exa/Parallel web search, then Python-scrape + validate.
- 🆕 new-angle: **route the sourcing stack by AUDIENCE TYPE, not by one default tool.** Four explicit lanes:
  - *Lives on LinkedIn* → Blitz API / Clay native scrapers / Deepline (same underlying dataset; depth differs). Names+basic firmo: Blitz API. Tech stack / 10-K / deep enrichment: Clay or Deepline (chain them: Blitz → Clay/Deepline).
  - *Local / physical (dentists, HVAC, auto-body — not on LinkedIn)* → Serper or Clay Google Maps for the base list; Exa/Parallel to narrow by specialty; Deepline email/phone waterfall, or scrape the site / Better Business Bureau for a contact email + validate with ZeroBounce.
  - *E-commerce* → **Store Leads** (the DB behind Clay's ecom source): avg product price, estimated monthly sales, top products, even site speed. (Worked play: site-speed × sales-estimate → "+500ms load = +7% conversion = +$X/mo, we cost $5k" no-brainer email.)
  - *Public-record / regulated* → the scraping lane above.
- 🆕 new-angle: **data is a race to the bottom on price** — datasets that were $50k/yr are now a few hundred $/mo unlimited (cites Adam Robinson's ~$30/mo unlimited). Operational consequence: **Blitz API at ~$500/mo unlimited LinkedIn data** replaces bloated 5-6-figure SaaS data plans at "the same data quality" for most ICP-on-LinkedIn list building — stop over-paying for the seed layer, spend enrichment budget on depth instead.
Review: additive
Status: holding
