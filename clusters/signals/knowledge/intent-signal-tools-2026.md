# Intent Signal Tools — 2026 Vendor Catalog

Comprehensive tool catalog organized by signal type. Use when picking the right vendor for a specific signal category, comparing approaches, or building the signal capture layer of a GTM motion.

**Source:** Synthesized from ColdIQ's "Best Intent Signal Tools in 2026" + Workflows.io tool stack + cross-referenced gtm-master existing knowledge. 2026-05-13.

**See also:**
- Architecture (capture → enrich → score → activate loop): `clusters/signals/knowledge/signal-activation-architecture.md`
- Score weights + heat tiers: `clusters/signals/knowledge/signal-scoring.md`
- 137-trigger taxonomy: `clusters/signals/knowledge/signal-taxonomy.md`
- Engagement-on-external-content sub-class: `clusters/signals/knowledge/engagement-on-external-content.md`

---

## The 18 signal categories (organized by 1st / 2nd / 3rd party)

### 1st-PARTY SIGNALS — your own ecosystem (highest-conversion)

**Why first:** prospect already knows your brand. Reply rates 3-5× cold for these signals.

#### A. LinkedIn engagement on your content
- **Clay** — extract LinkedIn engagement, route through enrichment workflows
- **Expandi** — monitor social signals + trigger automated sequences (e.g., 3 profile views in a week → different response than 1 like)
- **Trigify.io** — ICP-relevant social engagement patterns across LinkedIn
- **Jungler** — LinkedIn-specific signal extraction (focused on engagement from target accounts)

#### B. Website visitors (deanonymized)
- **Warmly** — company + contact deanon, intent layering, Slack alerts
- **RB2B** — US-focused contact-level deanon (vs company-only)
- **Albacross** — alternative deanon platform
- **Midbound** — **person-level** deanon (not just company) — gives sales teams a specific contact, not "someone at Acme"
- **Vector** — visitor ID + contact data connection
- **Instantly.ai** — includes visitor ID as part of the platform (sequences integrate directly)
- **Clay** — integrates website visitor data from multiple sources into enrichment workflows

#### C. Product usage signals (for PLG / freemium)
- **Common Room** — aggregates product usage + community engagement + social signals, scores users, surfaces PQLs
- **Mixpanel / PostHog** — deep product analytics: feature adoption, engagement patterns, drop-off points
- **Pocus** — sits on top of product + CRM data, surfaces accounts/users most likely to convert
- **Amplitude** — product analytics (mentioned in Workflows.io ABM playbook)

#### D. Call transcripts (sales conversations contain intent signals)
- **Sybill** — AI meeting recording + post-call summaries (Workflows.io stack)
- **Attention** — records sales calls + extracts insights + identifies key moments + competitor mentions
- **Fireflies** — transcribes meetings, makes conversations searchable across hundreds of calls
- **Claap** — recording + transcription with focus on making content actionable (tag moments, share clips)
- **Kondo** — call intelligence + deal risk scoring (Workflows.io stack)

#### E. Gated content engagement
- **Distribute** — interactive content experiences with granular engagement tracking
- **Gamma** — presentations + content tracking (which slides prospects spend time on)
- **Beehiiv** — newsletter platform (engagement = subscription signal)
- **Customer.io** — marketing automation + lifecycle email engagement

#### F. CRM activity
- **HubSpot** — emails, replies, calls, tasks, deal stage progression
- **Salesforce** — same plus Salesforce Einstein for AI scoring
- **Attio** — modern CRM alternative
- **Freckle** — in-HubSpot CRM enrichment (surface waterfall data inside CRM itself)

---

### 2nd-PARTY SIGNALS — partner + platform ecosystem

#### G. Champion tracking (job changes — STRONGEST 2nd-party signal)
- **Clay** — track job changes across customer contacts, flag champions moving to new companies + filter by ICP fit of new company
- **Common Room** — champion movement alongside other engagement signals
- **UserGems** — alerts when champions move to target accounts with full history context
- **Unify** — job change tracking + signal aggregation
- **Champify** — customer job change tracking specifically for pipeline creation
- **LoneScale** — champion + org movement + reporting line mapping

#### H. Affinity signals (network relationships)
- **Crossbeam** — account mapping between partners — when your partner has a relationship with your target = warm intro path
- **Reveal** — similar to Crossbeam, partner mapping
- **The Swarm** — professional network + relationship graph mapping → who in your extended network can intro to target accounts
- **PartnerStack** — partner ecosystem management + which partners drive pipeline
- **Commsor** — network activation for warm introductions

#### I. Ad engagement (LinkedIn / paid)
- **Fibbler** — tracks which companies view + engage with LinkedIn ads and organic content (account-level attribution)
- **ZenABM** — engagement signals from ad campaigns
- **Factors AI** — ad engagement tracking + attribution

#### J. Software marketplace activity (review intent)
- **G2** — intent data showing which companies research your category / product. A company reading your G2 reviews is significantly further in the buying journey.
- **Capterra** — similar (software reviews → buying intent)
- **TrustRadius** — alternative review intent platform
- **ColdIQ's intent data offering** — also surfaces marketplace activity

---

### 3rd-PARTY SIGNALS — external market intelligence

#### K. Technographic data (what stack do they use?)
- **Clay** — aggregates technographics from multiple sources within one workflow
- **PredictLeads** — technology adoption + **churn** data through API (knowing when a company dropped a competitor often more valuable than just knowing they use one — signals active evaluation)
- **BuiltWith** — installed technologies (most-comprehensive tech lookup)
- **HG Insights** — technographic intelligence (enterprise-focused)
- **Similarweb** — digital traffic patterns + competitor intel
- **Sumble** — tech stack + projects + decision-makers
- **TheirStack** — tech stack mentions in job descriptions + company tech adoption

#### L. Funding announcements
- **Crunchbase** — most comprehensive for startup + growth-stage funding
- **PitchBook** — better coverage of private equity + later-stage rounds
- **Owler** — funding intelligence with mid-market focus
- **PredictLeads** — funding events alongside other signals (single API)
- **Clay** — aggregates funding data from multiple providers
- **Lemlist** — recently added funding signals to platform

#### M. Job openings (hiring intent)
- **Common Room** — tracks job postings as part of signal aggregation
- **TheirStack** — job postings with focus on technology mentions in descriptions
- **LoneScale** — specifically job posting intelligence for buying-intent monitoring
- **Mantiks** — job posting intelligence for specific product categories
- **Pads** — hiring signals with company context
- **Clay** — pulls job data from multiple sources into enrichment workflows
- **Lemlist** — includes job change signals

#### N. AI web data agents (newest category)
- **Claygent** (built into Clay) — browses web, extracts structured data from unstructured sources
- **Common Room + Unify** — AI to aggregate + interpret signals across web
- **Perplexity** — general-purpose AI research for multi-step prospecting tasks
- **Manus AI** — multi-step research with reasoning across multiple sources
- **Tavily** — web research API for enrichment workflows
- **Linkup** — web research API alternative
- **Parallel Web Systems** — research API
- **Exa** — semantic search (find news that matches criteria, not just keyword matches)

#### O. Custom scraping (when no provider covers your signal)
- **Apify** — hundreds of pre-built scrapers + infrastructure for custom ones
- **Firecrawl** — AI-powered extraction from complex sites; handles JS-heavy pages
- **Browserbase** — controls a real browser remotely for interaction-required scraping
- **Instant Data Scraper** — zero-setup browser extension for tabular data
- **Serper** — Google scraping via API
- **BlitzAPI** — data extraction APIs for bespoke sources
- **Octoparse** — visual web scraper

#### P. News monitoring (acquisitions, leadership changes, expansions)
- **PredictLeads** — monitors company news through API
- **Exa** — semantic search for news matching specific criteria
- **Google News** — broad coverage (free, less precise)

#### Q. Ad activity (their ad spend = growth signal)
- **Apify** — actors that track advertising activity across platforms
- **Adyntel** — monitors ad spend + creative changes
- **Ahrefs** — paid search + organic + competitive analysis

#### R. Firmographic + lookalike data
- **Apollo** — firmographic baseline
- **Prospeo** — firmographics + contacts
- **Wiza** — firmographics + contacts (alternative to Apollo)
- **PredictLeads** — lookalike company discovery based on multiple attributes
- **DiscoLike** — finds companies similar to your input list (lookalike-focused)
- **Ocean.io** — lookalike expansion + behavioral matching
- **AI Ark** — newer contact database with strong non-US coverage
- **Store Leads** — ecommerce-specific account sourcing

---

## Email + phone enrichment (downstream from signal capture)

- **Findymail** — email waterfall + verification (Workflows.io primary recommendation; bounces >3% triggers warmup hell so verification matters)
- **BetterContact** — phone waterfall (Workflows.io primary for Tier 1 cold calling)
- **Apollo Enrich** — coverage expansion + cross-verification
- **Cognism** — European-focused contact data
- **ZoomInfo** — enterprise contact data
- **Hunter** — email finding alternative

---

## The orchestration layer (where signals come together)

**Clay** is the dominant orchestration platform across this entire corpus. Mentioned in nearly every workflow and blog as the place where:
- Multiple signal sources aggregate
- Enrichment runs (Claygent + waterfall)
- Scoring formulas apply
- Routing logic fires (CRM updates, Slack alerts, sequencer push)

**Cargo** is mentioned as an alternative (used by Workflows.io for client-deployable agent templates).

**n8n** is used for non-AI automation + scheduled background work + ETL between systems.

---

## Quick selection guide by use case

| If you want to monitor... | Start with |
|---|---|
| Companies visiting your website | Warmly (company+contact) OR RB2B (US contact) OR Midbound (person-level globally) |
| LinkedIn engagement on YOUR posts | Trigify OR Jungler OR Teamfluence |
| LinkedIn engagement on COMPETITOR posts | Trigify OR Apify LinkedIn scrapers |
| Job changes of past champions | UserGems OR Champify OR Unify OR LoneScale OR Clay job-change column |
| Funding events | Crunchbase (startup/growth) OR PitchBook (PE/late stage) OR PredictLeads (API) |
| Tech stack of target accounts | BuiltWith OR TheirStack OR Sumble OR Clay |
| Software review intent | G2 OR Capterra OR TrustRadius |
| Job posting intelligence | TheirStack OR LoneScale OR Mantiks |
| Ad engagement (LinkedIn ads viewers) | Fibbler OR ZenABM |
| Partner overlap | Crossbeam OR Reveal |
| Network warm-intro mapping | The Swarm |
| Product usage (PLG/freemium) | Common Room OR Pocus OR Mixpanel/PostHog |
| Call transcripts → signals | Sybill OR Attention OR Fireflies OR Claap |

---

## Signal-to-action: the "turning signals into outreach" framework

(From ColdIQ's published methodology — applies across all signal types)

1. **Capture the signal** (any tool above based on category)
2. **Route to Clay** (or Cargo) as the orchestration layer
3. **Enrich the account + contact** (Clay waterfall: firmographics → technographics → contact details → email verification via Findymail → phone via BetterContact)
4. **Apply scoring logic** (Clay formula or AI qualification with Claude/ChatGPT)
5. **Reference the signal in messaging** — but go beyond surface-level

> "A cold email that says 'I noticed your company just raised a Series B' is not personalization. Everyone sends that. A message that connects the funding to a specific challenge your product solves, references a related hire they posted, and mentions a similar company you helped post-funding is the kind of multi-signal approach that earns replies."

6. **Send via Instantly (email) or HeyReach / Expandi (LinkedIn)**

Multi-signal stacking >> single-signal outreach.

---

## Reply rate calibration by signal source

(From ColdIQ + Workflows.io combined data)

| Signal type | Typical reply rate |
|---|---|
| No signal (cold list) | 0.5-2% baseline |
| Single 3rd-party signal (e.g., funding only) | 3-5% |
| Multi-signal stacked (3+ signals same account) | 5-15% |
| First-party signal (website visit + engagement) | 5-10% |
| Champion alumni at new ICP company | 3-5× cold (so 5-10%) |
| Engaged with YOUR LinkedIn content + ICP match | 10-20% |
| Founder LinkedIn connection (after 1+ year content investment) | **25.4%** (Workflows.io's own data) |

---

## What to NOT use this list for

- Don't try to deploy all 50+ tools. Pick 3-5 signal sources max to start. Build the workflow, validate it, then expand.
- Don't pick tools based on "best" rankings — pick based on **which signal category matters most for your ICP and sales motion**. Late-stage enterprise sales motion has different signals than PLG SMB motion.
- Don't conflate **monitoring** signals with **acting** on them. Most teams collect signals and never operationalize them. The orchestration layer (Clay/Cargo) is what closes the loop.
