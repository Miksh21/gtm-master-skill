# 2026 GTM Tool Stack + Claude Code MCPs

The opinionated tool list + MCP-based execution layer Workflows.io ships with in 2026. Snapshot of a working AI-native GTM agency operating model.

## When to load

- "What tools should we use for [outbound / signals / content / etc.]?"
- "Which MCPs should we connect to Claude Code?"
- "We have 50+ tools and want to consolidate — where do we start?"
- Periodic refresh of gtm-master's tool references

---

## The filter rules (cut criteria)

Workflows.io tested 350+ tools, kept 78 across 17 categories. Three explicit cut rules:

1. **Not opened in 7 days → cut.** If the team isn't using it weekly, it's deadweight regardless of cost.
2. **Claude Code skill (via MCP) replaces it → cut the standalone.** The skill + MCP combination collapses tool-switching overhead.
3. **Doesn't contribute to client outcomes or productivity → cut.** Cost is hard to defend.

**Operating principle:** "A 30-tool stack used well outperforms a 60-tool stack used at 30 percent."

---

## The 17 working categories

(Snapshot from May 2026. Subset — full list in source extraction file. Cross-reference gtm-master's existing tool references for depth on each.)

| Category | Primary tools |
|---|---|
| **Signals** | Clay, Warmly, RB2B, Jungler, BuiltWith, Fibbler, Findymail, TheirStack, Sumble |
| **Data enrichment** | Freckle (in-HubSpot), Clay (orchestrator), Apollo (firmographic), Findymail (email), BetterContact (phone) |
| **Automated sequencers** | HeyReach (LinkedIn), Instantly (email) |
| **Sales rep sequencers (manual)** | Nooks (parallel dialer), Apollo, HubSpot built-in |
| **Scraping + search** | Serper (Google), Apify (custom scrapers), Exa (AI web search for skills), Browserbase (remote browser), Firecrawl (structured extraction), BlitzAPI |
| **Prospecting databases** | Apollo, SalesNav, BetterContact, Ocean.io (lookalike), AI Ark (non-US coverage), Store Leads (ecommerce), influencers.club |
| **Automation + agents** | n8n (non-AI + simple agents), Claude Code (AI agent interface), Trigger.dev (background jobs), Cargo (deployed agent templates) |
| **LLMs** | Llama (self-hosted), Claude (most AI tasks), Gemini (image gen), ChatGPT (powers Claygent in Clay, esp. 4o-mini for cost) |
| **Sales** | HubSpot (CRM), Qwilr (proposals), Superhuman (inbox), Kondo (LinkedIn DM inbox), Cal.com, Sybill (call recording + intelligence) |
| **Marketing** | Webflow, Beehiiv, Customer.io, Tally, Ahrefs |
| **Content** | Figma, Miro, MagicPost, Ordinal (scheduling/analytics), Riverside (recording), Favikon (creator research), Screen Studio, Adobe |
| **Operations** | Notion, Airtable, OutboundSync, GitHub (Company OS + client repos), Cursor, Cloudflare |
| **Backend** | Vercel, Supabase, Pinecone (vector DB for RAG skills), DigitalOcean |

---

## The 8 MCPs every sales team should connect to Claude Code

The flagship sales-MCP stack. Install order matters — Apollo first because it covers most ground.

### 1. Apollo MCP
- **Why first:** plain-language ICP queries return real contact data immediately.
- **Best for:** list-building ("Heads of RevOps at Series B SaaS, 100-500 employees, US"), stakeholder mapping across target accounts, performance data queries.
- **Test prompt:** "Use Apollo to find five contacts at Stripe in the engineering function."

### 2. Findymail MCP
- **Why second:** closes Apollo's email coverage gap. Email waterfall.
- **Best for:** verifying emails before any send (protects sender domain from bounces >3% threshold).
- **Pattern:** Apollo fails → Claude tries Findymail → verifies before sequence.

### 3. Firecrawl MCP
- **Why critical (often skipped):** Apollo + Findymail only return what's in structured databases. Firecrawl unlocks the open web.
- **Best for:** competitor pricing pages, careers pages (hiring signals), prospect's recent blog posts (personalized openers).

### 4. Instantly MCP
- **Why:** describe a campaign in a sentence, Claude builds it.
- **Best for:** building full sequences end-to-end ("Build a 4-step campaign for the RevOps leaders we just sourced. Step 1 references their recent funding round, step 2 shares a relevant case study, step 3 is a soft pitch, step 4 is a breakup").
- **Saves:** 45+ minutes of clicking through Instantly UI per campaign.

### 5. HeyReach MCP
- **Why:** LinkedIn version of Instantly.
- **Best for:** building LinkedIn sequences alongside email; pairing with signal tools (Trigify/Jungler) for engagement-triggered LinkedIn outreach.
- **Killer pattern:** "Someone engages with CEO's post Monday → Trigify captures → Claude routes to HeyReach sequence Tuesday → Friday connection request + first message referencing the post."

### 6. Gmail MCP
- **Why:** majority of sales conversations live in Gmail.
- **Best for:** pre-discovery prep ("find every email exchange with the contact and sum it up in a paragraph"), drafting replies in past-context, deal history queries.
- **Rep adoption:** highest — least convincing required.

### 7. Slack MCP
- **Why:** team memory + internal handoffs + signal alert routing.
- **Best for:** customer conversation history before renewal calls, drafting DM replies from terminal, routing signal alerts (RB2B/Jungler/hand-raisers) with full context.

### 8. HubSpot MCP (or Salesforce MCP)
- **Why:** closes the loop. Without it, every workflow ends with a manual update.
- **Best for:** updating contacts/companies/deals, filling CRM data from Apollo/Findymail/Firecrawl, pipeline questions without opening dashboards.

---

## How AI changed the 2026 stack (vs 2024)

Patterns that shifted:

- **Claygent category collapsed into Claude Code skills.** Was its own category; now skills via MCPs do most of the work Claygent prompts did inside Clay.
- **Standalone copywriting tools** folded into the Claude Code LinkedIn post writer + outbound copywriter skills.
- **Manual research tools shrank** — Claude Code + Firecrawl + Serper MCPs replace most one-off research.
- **Agent infrastructure grew** — n8n + Trigger.dev central; Cursor hosts most Claude Code sessions.

---

## Service-as-a-software headcount math

The 4-layer operating model (Company OS + client repos + skill library + MCP execution) enables:

- Traditional B2B services agency: **8:1 staff:revenue per $M ARR**
- AI-native: **2:1 or even 1:1**
- $10M ARR = 15-20 people; $30M ARR = 60-80 people
- "The constraint is no longer recruiting. It is finding senior operators who can translate workflow expertise into runnable Claude Code skills."

---

## The 60-minute first-agent install (companion reference)

When asked "how do we ship our first outbound AI agent?", the published install path:

1. `brew install gh && npm install -g @anthropic-ai/claude-code` (install Claude Code)
2. Clone `github.com/Workflowsio/company-os-starter-kit` (5 open-sourced skills + folder structure)
3. Connect MCPs via `claude mcp add` (Apollo + Findymail + Instantly minimum)
4. Customize `gtm-skills/outbound-copywriter.md` (4 sections: voice guide, ICP definition, CTA preference, sequence length)
5. Run on a real LinkedIn URL: "Run the outbound-copywriter skill for [URL]. Generate a three-step sequence."
6. Edit skill based on first-run corrections → re-run → sharper output (skill is versioned).

**Prompt → project → agent distinction (critical):**
- **Prompt** = one-shot input, no memory, no team reuse
- **Project** = chat with stored context, ends at draft
- **Agent** = versioned skill that pulls live data via MCPs, runs the workflow end-to-end, outputs reviewed work the team can call from terminal

---

## Cross-references

- Where MCPs fit in operating model: `philosophy.md` "On AI-Native Operating Models"
- Company OS architecture (the file system MCPs read from): `clusters/campaign-ops/knowledge/outbound-master-system.md`
- Specific signal tool integrations: `clusters/signals/knowledge/signal-activation-architecture.md`
- Existing gtm-master tool reference: `clusters/cold-email/reference/sequencing-tools.md`

## Source

Workflows.io blogs (May 2026):
- "The 2026 GTM Tool Stack: 78 Tools We Use Weekly"
- "8 MCPs Every Sales Team Should Connect to Claude Code"
- "Build an Outbound AI Agent in 60 Minutes With Claude Code"
- "Service-as-a-Software: The 2026 AI-Native Agency Playbook"
- "How to Build a Company OS on GitHub"
- "Claude Code Skill Library: 5 GTM Agents That Replace SOPs"

2026-05-13 crawl.
