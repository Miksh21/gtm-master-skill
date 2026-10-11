# Creator-Radar List-Building — 2026 Sourcing Tactics

## When to load
Sourcing lists outside standard DBs (registries, Google Maps, no-LinkedIn verticals), AI-era TAM mapping order, CRM primary-key hygiene. Triggers: "national register list", "Google Maps scraper list", "businesses not on LinkedIn", "TAM mapping steps", "primary key dedup", "DiscoLike".

## Source outside standard databases
- **Pull from national registers, not classic DBs.** Prospects in niche/government registries get far fewer cold emails → less attention competition → higher reply rates. Enrich the raw register list in Clay to make it actionable at scale. [#24]
  - Evidence (2026-10-11): start from the legal root: licensing registries return named people, not businesses (NPI registry + active DEA license = every named US dentist, free), instead of Google Maps. [#1961]
- **Google Maps scraper (RapidAPI, ~$500/mo) + AI** builds hyper-niche lists of offline SMBs not on LinkedIn; then Codex scrapes contact emails from website sitemaps. Solves list-building AND contact-finding in one pipeline outside standard data sources. [#74]
  **Counter-view (2026-10-11):** the RapidAPI "Maps Data" endpoint scrapes Google Maps by zip + category for ~$19 per category and ~$100 for a full US vertical, far below a lead-database seat; plan the run before assuming ~$500/mo. [#603]
- **Full national Maps coverage:** loop all 42,734 US zip codes against the Maps endpoint per category, capped at 20 results per zip, so dense metros and rural gaps are both covered at controlled cost. [#316]
- **Collect every alias category:** businesses self-pick Maps categories, so one keyword captures about a third of a vertical. Spot-check 10 known businesses in OpenMaps, collect every alias (funeral home + memorial park), query all. [#760]
- **Category pollution filter:** HTML2Text the homepage and let a local LLM confirm the business matches the vertical ("memorial park" returning real parks); on-device, zero API cost. [#761]
- **Local owner finder, cheapest-fidelity first:** Blitz/Prospeo for LinkedIn-confirmed owners, then a free HTML2Text website scrape read by a local model (Gemma), then OpenWebNinja Google AI-overview parse. Won a 6-approach bake-off. [#601]
- **DiscoLike** scrapes & indexes every business with a website + lightweight AI lookalike search — fills the gap for niche verticals (assisted living, CNC shops, life-science orgs) underrepresented in Apollo/ZoomInfo; pairs with Clay/Claude Code for qualification. [#31]

## AI-era TAM mapping (centralized, not rep-built)
- **9-step TAM map:** CRM closed-won → ICP model → diversified scraping → cleanup → AI qualification → **enrichment with disqualifiers FIRST** → tiering → stakeholder mapping → CRM push. Reps should never build their own lists; the disqualify-first ordering saves enrichment cost at scale. [#32]
  - Evidence (2026-10-11): (single-case: 35K-record CRM overhaul) purge first: an AI agent checks which legacy accounts still exist and deletes dead or duplicate records before any enrichment or segmentation spends credits. [#1524]

## CRM hygiene as the foundation
- **Enforce primary keys from day one:** LinkedIn URL = contact primary key; domain + LinkedIn company URL = account key. Prevents 5-10% dedup decay at scale (at Rippling's 30M records that's 1.5-3M bad records). Clean keys enable always-on enrichment syncs and stop rep trust erosion. [#190]

## Source
creator-radar 2026-06; card ids in [#24 #74 #31 #32 #190].

## Creator-radar 2026-10-11
- **Headcount-growth gate** (single-case: Nowoslawski agency data): limit campaign-1 lists to accounts with 1%+ employee growth over 12 months; reported 30-50% lift in positive reply rate, since growing orgs carry fresh operational pain. [#313]
- **Free base universe:** People Data Labs offers a free downloadable company dataset (Data Lab portal) covering LinkedIn companies; start there before paid filtering and signals. [#989]
- **Stack 6+ Prospeo company filters:** homepage keywords, tech integrations, what they sell, who they sell to; a single industry filter like "retail" returns a noisy list. [#611]
- **Prospeo MCP:** Claude searches, filters and returns verified leads (up to 200 per prompt) in one chat, collapsing find, enrich, verify and dedupe tabs, and can push to CRM in the same flow. [#973]
- **Clay Audiences:** builds a filtered company list from one sentence (e.g. US B2B companies with 3-100 salespeople), replacing a Prospeo pull plus headcount-filter workbook chain. [#993]
- **Ecom list cleaning:** require an "Add to Cart" button on the homepage of Shopify/ecom tech-stack hits; drops agencies, media and political sites that run Shopify but sell nothing. [#988]
- **Post-filter list building:** a large model writes a person-and-situation fit description, a cheap small model scores the whole market against it (author: ~$1-10 per full pass), replacing the guessed title/filter slice. [#1688]
- **Score titles, not keywords:** score every distinct job title in the target accounts with a decision model; 23,369 titles cost $0.37 and turned 60 names into 467 callable people. [#1914]
- **Blind audit before costly sends** (single-case: one direct-mail list): a second agent found only 39 of 150 accounts safe to mail and wrong addresses for 16 of 60 multi-location firms. [#1987]
- **Licensed fallback:** Proxycurl shut down and other scraped-LinkedIn vendors face litigation; never build a list or enrichment motion whose only source is scraped LinkedIn data. [#1235]

Source: creator-radar review 2026-10-11, cards from Supabase insight_cards.
