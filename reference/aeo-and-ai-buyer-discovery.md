# AEO / GEO — AI-Buyer Discovery & Answer-Engine Optimization

## When to load
Getting found/cited by AI answer engines (ChatGPT, Perplexity, Claude, Google AIO) and selling to AI-assisted buyers. Triggers: "AEO", "GEO", "AI search", "llms.txt", "AI citations", "machine-readable site", "buyers use ChatGPT to shortlist".

## The shift
- Buyers shortlist vendors via ChatGPT/Perplexity **before any rep contact** → machine-readable site/docs/structured data is now table stakes, not optional. [#69]
  - Evidence (2026-10-11): 68% of B2B buyers have a front-runner vendor before formal evaluation starts, and that vendor wins ~80% of deals; visibility (content, AEO, ads) must precede outbound demand capture. [#1228]
  - Evidence (2026-10-11): Google AI Overviews grew 71% across 600K+ commercial keywords in 6 months (Semrush); the SERP now stacks AI Overview, ads and PAA above organic, so page-one rank no longer guarantees visibility: optimize for citation. [#1328]
- **GEO is the highest-demand UNMET agency service** — asked ~5×/week; at $10K/mo that's ~$50K/week of unserved revenue for a 3-person shop. First-mover service gap. [#186]
- **Answer engines retrieve differently:** ChatGPT via Bing, Google AI Overviews from its own SERP, Claude rarely cites the web. Bing indexing matters for ChatGPT; reaching Claude means shipping a connector/app, not pages. [#913]
- **4 source layers:** AI answers draw from training data, live retrieval (search/crawl), licensing deals (e.g. Reddit, publishers) and connected tools/files. Audit presence per layer, not only crawlable pages. [#1542]
- **Blogs lost the citation share:** company blogs fell from 66% to 32% of ChatGPT citations; help docs and marketplace listings filled the gap. Put structured answers in docs and listings, not only the blog. [#979]
- **Docs are a demand surface:** AI agents are ~66% of Mintlify docs traffic (15% in Jan 2026). Keep docs plain, structured, factual; give marketing review ownership. [#1644]

## Infrastructure plays
- Serve **`/llms.txt` + `.md` endpoints** so AI crawlers can read and cite your pages — direct AEO/GEO infrastructure. [#141]
  - **Counter-view (2026-10-01):** check robots.txt access for GPTBot, ChatGPT-User, ClaudeBot/anthropic-ai, PerplexityBot and GoogleOther FIRST ("if bots can't crawl, nothing else matters"); a missing llms.txt is low severity. Order: crawler access, then llms.txt. [alon-goldenberg/seo-intel]
  - Evidence (2026-10-11): check AI-crawler access at every layer, not only robots.txt: CDN, WAF and bot management first, then rendering and gating, then llms.txt-style files; some clients block the target assistant at the edge. [#1969]
- **Markdown content format** measurably improved LLM/AI-search visibility (Ramp experiment; only the markdown variant moved the needle). [#145]
- Publish **detailed LLM-visibility comparison pages** (e.g. Glean's "ChatGPT vs Claude" page) — drives organic AI citation. [#124]
  - Evidence (2026-10-11): rebuild vs/best and pricing pages as real HTML text tables and lists with real prices and short sentences (a pricing column inside an image hid it from models). AirOps data (hypotheses): 3+ tables +26% citations, 7 price points +16%, sentences of 10 words or fewer +19%. Test: the verdict is statable in one sentence. [#1816, #1927]
- Codify SEO/AEO rules as **hard build gates**: Zod schemas validate metadata at build-time (missing/bad → build fails) rather than relying on checklists. [#142]
- **Pricing-page test:** ask ChatGPT your price; if it cites a third party or is wrong, add a flat tier list under the slider. Sliders expose no extractable numbers, so stale roundups become the source of truth. [#1817]
- **GEO surfaces beyond your site:** strengthen presence on the sources engines cite (G2, Trustpilot, GitHub, LinkedIn, YouTube, Reddit) and list the product on MCP/app marketplaces (Claude, ChatGPT, Perplexity), where agent buyers discover tools. [#851]

## Foundation still holds
Google's first AI-search guidance: SEO still matters; create people-first content; ignore LLM-manipulation hacks. [#159]

## Targeting / diagnosis
- **2×2 GTM diagnosis:** buyer-awareness × category-lock → run outbound / content / both / niche-down. [#63]
- **Dream 10,000:** scale Chet Holmes' Dream 100 to 10K ABM accounts via AI — per-account messaging, contacts, trigger signals. [#85]

## Citation-earning plays (creator-radar 2026-10-11)
- **Question map:** mine buyer reviews for the fastest-rising question with no published answer, then publish a reproducible benchmark on it to own the citation; content roadmap and positioning call in one pass. [#1707]
- **Gap prioritisation:** rank content gaps by question frequency x asset coverage, favour cascading assets (webinar + transcript), and check indexing in both GSC and Brave: Brave feeds several LLMs, so pages missing there rarely surface in AI answers. [#1810]
- **Theme-gap audit:** list the attributes AI answers attach to competitors (compliance, ease of use, service) but never to you, then publish proof content targeting those exact associations. [#1186]
- **Third-party list inclusion:** ~85% of brand mentions come from third-party pages. Three outreach routes: correct stale facts (converts best), pitch a gap segment, offer original data; verify by re-running the AI query. [#1928]
- **Refresh before you build:** only ~15% of retrieved pages get cited, so AEO is a conversion problem. Refresh pages already retrieved but not cited first (~20 min each: fix changed numbers, swap the oldest stat, split the densest paragraph into a list, update the date, resubmit) and track refreshed pages as a weekly cohort vs untouched ones. [#1814, #1815]

## Source
creator-radar 2026-06. The GTM Engineer (AEO/GEO plays); ColdIQ/Alex Vacca (#69 #63 #85). Card ids in [#].
