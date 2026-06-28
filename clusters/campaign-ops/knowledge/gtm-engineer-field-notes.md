# GTM Engineer — Field Notes (case studies & operator tactics)

## When to load
Real-world GTM-engineering plays from The GTM Engineer (podcast + newsletter): Claude-Code site/content builds, org-wide agent adoption, agent data infra, build discipline, case-study distribution, strategy. Complements `reference/claude-code-gtm-architecture.md` (operating model) and `clusters/campaign-ops/knowledge/agentic-gtm-patterns.md` (loop engineering) with concrete company examples.

## 1. Claude Code for owned media / site & content builds
- **Website in <6 hrs:** feed 500 call transcripts (Fireflies API) → cross-ref closed-won (HubSpot) → extract the messages that actually closed → 40+ design screenshots → CC writes design + copy skill files → builds 80% in one session. [#183]
- **No-code CMS → Next.js + Claude Code:** ~$4,500/yr saved, pages in hours, ABM landing pages without new vendors. Pull legacy content via official API (Webflow Data API) to keep editorial; full-site localization (every page/slug/field) in one CC pass — no Weglot. [#139 #143 #140]
- **CC ABM ads:** 100 personalized LinkedIn ads (account logo + competitor logo via Logo.dev API, no code) → **5-6% CTR vs 0.4% benchmark (~10x)**. Needs ≥300 targetable employees/account (mid-market+); the competitor-logo dynamic field injects FOMO. [#170 #171 #174 #175]
- **Release → content:** GitHub CLI + CC auto-summarize merged PRs weekly, classify internal/external, draft LinkedIn copy per release (context file = objective + personas/value-props + grouping rules). [#121 #122]
- **Decks:** feed a high-quality sample deck + brand guidelines into the prompt; Claude Design for visual-consistency checks. [#130]
- Real example: Ahrefs runs CC + 23 skill files in a 7-step content workflow. [#166]

## 2. Org-wide AI-agent adoption — the multiplayer lesson
- **Claude Skills failed for team rollout** — single-player/local: no shared bug visibility, no prompt sharing. For org-wide, pick a **multiplayer** platform. [#132]
- **Dust pattern:** multiplayer agent platform (50+ GTM tools, no-code builder, admin usage analytics, SSO/SCIM). Vanta let 900+ employees build agents. [#133 #137]
- **Adoption as a prioritization engine:** let reps prototype agents, watch adoption analytics, productionize winners; when multiple reps build the same agent (account research, prioritization, drafting), merge into one production-grade unified agent. [#149 #147 #153]
- **Roles/culture:** hire a post-sales "AI Product Manager" to monitor usage + drive adoption; CRO public shoutouts for reps who ship useful agents. [#151 #152]
- Ramp model: Anthropic onboards engineers to CC proficiency in **2-3 days**. [#168]

## 3. Data & tool infra for agents
- **Clean before consume:** Gong → Snowflake (clean transcripts) → LLM extract action items → then the agent layer. Build custom MCPs on Gong/Snowflake to gate rep data access + strip garbage. [#127 #150]
- **MCP from undocumented endpoints** (e.g. Gamma): give agents tool-calling without waiting for an official MCP; supply endpoint context + example payloads in prompts so agents don't hallucinate fields. [#128 #129]
- **Buy raw datasets** (S3/Snowflake/SFTP) over API access when feasible — SQL beats API calls for iteration speed/scale. [#188]
- **Semantic layer via MCP** (e.g. Omni) → BDRs plain-text query intent stacks + auto-build lists in their sales tool. [#194]

## 4. Build discipline (Claude Code reliability)
- **Map the workflow FIRST** (Miro board): visual logic gets exec/CMO sign-off faster AND cuts CC build errors vs jumping to code. CC one-shots complex automations only with a fully pre-mapped plan; iterative "no, fix this" causes cascading breaks. [#180 #123 #182]
- Always have CC **output a markdown summary** of any workflow it builds (team handoff) and **emit the finished workflow as a Python script** so repeat runs cost ~0 (CC builds once, not per-run). [#173 #172]
- Codify recurring tasks as CC **skills/runbooks** — one prompt replaces a 15-step checklist. [#138]

## 5. Case-study distribution (highest-ROI asset)
- Customer stories are the highest-ROI marketing asset: go deep, film high-quality, amplify everywhere. [#164]
- **Distribution checklist:** 10-15 ordered steps per study, a DRI per channel, every time. [#113]
- Build a **Customer Collections page** the moment you have 2+ studies (nav "Customers", grid + layered testimonials). [#119]
- Every newsletter carries 1-2 case studies as a **named section** (link + key metric + standout quote), not buried. [#120]

## 6. Strategy / positioning
- **Salesforce over modern CRMs at scale:** GTM alpha lives in offers/content/SDR tooling, not CRM differentiation; CC lowers SF maintenance (CLI updates) shifting the build/maintain calc. [#161 #165]
- **Human SDRs before AI outbound** — validate channel ROI first; AI failure conflates channel vs execution. [#162]
- Most $10M+ companies have **zero lead-routing logic** — Clay + n8n + HubSpot enrich+route is a fast agency win; map it in Miro first. [#181]
- Product launches: lead with what's newly possible, make the customer the hero, stay in one lane. [#160]
- **End-to-end CC sales agent:** Slack pre-call brief 2 hrs ahead → post-call follow-up in founder tone w/ relevant case studies → auto-creates HubSpot records. [#184]
- Benchmarks: **74% of first replies land within the first hour** of launch (16.6M sends). Meta ads crushing for B2B SaaS; LinkedIn Thought-Leader ads + Clay/Freckle dynamic audiences still outperform. [#154 #185]
- **GTME hiring signal:** engineers learning GTM AND GTM folks learning engineering (not pure hybrids day 1); unstructured Loom screen ("make me want to interview you") + unanimous 5-6 peer committee. [#169 #187]
- Git-blame referral gamification: infer social-graph distance from commit data, reward cross-team referrals. [#196]
- One Valley GTM person drives ~$1M/mo pipeline via content engine + signal-based OB + personalization + lead capture + affiliate + ads. [#167]

## Source
creator-radar 2026-06, The GTM Engineer (podcast + newsletter). Card ids in [#]; full post/episode URLs in creator-radar Supabase by id.
