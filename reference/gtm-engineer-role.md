# The GTM Engineer Role

**The fastest-growing role in B2B tech sales.** A single GTM Engineer can own the entire data lifecycle from signal detection to pipeline creation — replacing the work of **5 traditional hires** (data analyst + SDR + RevOps + marketing ops + the manager coordinating them).

This file describes the role: what they do, why it's exploded, the tool stack, and how to hire one.

## When to load

- "Should we hire 5 SDRs or 1 GTM Engineer?"
- "What is a 'GTM Engineer' actually responsible for?"
- "How do we structure our GTM team in 2026?"
- "Why is our 8-person SDR team being outperformed by a founder with a Clay workflow?"

## What a GTM Engineer does (3 pillars)

The role sits at the intersection of sales, data, and automation. **NOT a fancy title for an SDR. NOT a RevOps manager.** It's a builder who creates the systems that generate pipeline.

### Pillar 1 — Data Aggregation
Pulling signals from CRMs, intent data platforms, enrichment databases, and 5+ sources into a single working environment. Decides which signals matter, connects sources, builds the infrastructure to keep everything flowing in real time.

**Tools:** Clay, Common Room, PredictLeads, Trigify, Common Room.

### Pillar 2 — Data Enrichment
Raw data is useless without filtering, scoring, qualification. Builds waterfall enrichments (multiple providers for email + phone), runs AI agents to qualify leads, creates scoring models that separate high-intent prospects from noise.

**Tools:** Clay (Claygent), Relevance AI, Apify, Findymail, BetterContact.

### Pillar 3 — Data Activation
Enriched data → pipeline. Pushes qualified contacts into cold email sequences, sets up LinkedIn outreach, builds content workflows, connects everything to advertising platforms for retargeting. **Data does not sit in a spreadsheet. It moves.**

**Tools:** Instantly, lemlist, Expandi, HeyReach.

---

## Why ONE Engineer replaces FIVE hires

### Traditional B2B sales org
1. Data analyst pulls lists
2. SDR writes emails
3. RevOps manages CRM
4. Marketing ops handles automation
5. Manager coordinates everyone

**Cost:** 5 salaries + 5 onboarding processes + 5 people needing constant communication.

### With a GTM Engineer
- One seat owns: sourcing data → enriching → outreach sequences → automated follow-ups → measurement
- **Feedback loop is instant** — same person built the list reads the replies
- **Catch problems faster, iterate quicker, build compounding systems**

### The economics
- Senior GTM Engineer costs less than 2 junior SDRs
- **Output isn't even comparable.** The engineer builds workflows that run 24/7. SDRs are limited to hours at desk.
- Real-world ColdIQ data: 70+ clients delivered with the best results coming from operators who own the full workflow end-to-end.

---

## The tool stack a GTM Engineer should master

### Workflow orchestration
- **Clay** — the core. Where data gets pulled in, enriched, scored, pushed out.
- **n8n** — automation layer connecting APIs, triggering workflows on events.
- **Relevance AI** — AI agent layer for tasks requiring reasoning (lead qualification, research) not just data lookups.
- **Trigger.dev** — async task orchestration with auto-retries (long-running enrichment + signal detection + multi-step sequencing).

### Data sourcing
- **Apify** — scraping structured data from websites and directories
- **PredictLeads** — intent signals (job postings, funding events, product adoption)
- **Common Room** — multi-source signal aggregation
- **Attio** — modern CRM (organizing everything)

### Outreach execution
- **Instantly** — cold email at scale, domain rotation, deliverability monitoring
- **lemlist** — multi-channel sequences
- **Expandi** — automated LinkedIn outreach safely

### Code + custom tooling (the multiplier)
- **Claude Code** — build custom scripts, scrapers, integrations in plain English
- **Cursor** — same but with IDE
- **Codex** — coding-heavy work
- **Obsidian** — memory layer (local markdown for fast file-system access)
- **Supabase** — operational data storage (PostgreSQL)

**The reason this role exists NOW and not 5 years ago:** the tool ecosystem stitches together platforms that didn't exist or weren't mature until recently.

---

## Why hiring a GTM Engineer is HARD

### Reason 1 — The role is new
No traditional career path produces them. They come from:
- Sales (and learned to build)
- Marketing ops (and learned to sell)
- Data engineering (and learned go-to-market)
- Self-taught builders who figured out Clay + Instantly on their own

**University programs do not teach this.** Recruiting agencies do not specialize in it. **The talent pool is scattered.**

### Reason 2 — The skill set is rare
Need fluency in 4 domains simultaneously:
1. Sales strategy
2. Data architecture
3. Automation tooling
4. Basic coding (AI-assisted is fine, but reading + debugging is required)

Finding someone strong across all 4 is genuinely difficult. You either get:
- Great data person who doesn't understand sales psychology
- Great salesperson who can't build a workflow

### Reason 3 — The best ones are already employed
GTM Engineers who can deliver pipeline at scale are not sitting on job boards. They're embedded in high-growth companies or running consulting practices. **Reaching them requires a network, not a job listing.**

---

## What to look for when hiring

Indicators of a real GTM Engineer (vs a "growth hacker" with a LinkedIn bio):

### Hard skills
- **Clay fluency:** can describe a multi-step Clay workflow with conditional logic + AI columns + waterfall enrichment from memory
- **Outreach platform fluency:** has run sequences on Instantly OR lemlist with sender-rotation + warmup understanding
- **API understanding:** can describe what an SDK is, can read API docs, has connected at least 2 APIs together via webhook or code
- **Data architecture:** understands what a primary key is, can dedupe a messy list, can explain a join

### Soft signals
- **Has a portfolio** of workflows / Clay tables / sequence templates they've built
- **Talks numerically** about past campaign results (reply rates, cost per meeting, pipeline created, not "we ran some great campaigns")
- **Reads about new tools** weekly (Clay, Trigify, Common Room, etc. — knows the changes)
- **Has opinions on tradeoffs** (Clay vs Cargo, Instantly vs Lemlist, HubSpot vs Attio — can defend a choice)

### Red flags
- Calls themselves a "GTM Engineer" but can't describe a real workflow they built
- Treats AI as magic ("we used ChatGPT for personalization") without describing the prompts, the model, the cost optimization
- Has only worked at one company / one motion — limited pattern recognition across segments

---

## How the role evolves

### Junior GTM Engineer (year 1)
- Operates pre-built workflows others designed
- Adds new signals / data sources to existing Clay tables
- Runs the day-to-day campaign operations
- Output: improved efficiency on existing motions

### Mid-level GTM Engineer (years 1-3)
- Designs workflows from scratch
- Builds custom skills + integrations
- Makes tool selection decisions
- Output: new motions / campaigns / signal sources operationalized

### Senior GTM Engineer (years 3+)
- Architects the full operating model (4-layer Claude Code system, Company OS)
- Trains junior engineers
- Owns measurement + attribution
- **Can be the entire GTM team for a < $5M ARR company**

---

## When you should NOT hire a GTM Engineer

- **You don't have an ICP defined.** A GTM Engineer can OPERATIONALIZE an ICP but can't replace ICP definition work.
- **You don't have product-market fit.** Wrong stage — GTM Engineering is for compounding what works, not finding what works.
- **You can't afford the right one.** A mid-level GTM Engineer costs $120K-$180K USD. If your budget is $60K, you're getting a generalist who'll learn on your dime.
- **You're a solo founder under $500K ARR.** At this stage, the founder IS the GTM Engineer (and should be).

---

## Hiring channels

Where the talent actually lives:
- **ColdIQ talent marketplace** (pre-vetted operators trained on the same tools/frameworks used for 70+ clients)
- **Clay community + Slack** (operators publish their best workflows)
- **Workflows.io network** (their Company OS Starter Kit alumni)
- **LinkedIn search:** "GTM Engineer", "RevOps Engineer", "Growth Engineer" + technographic signals (uses Clay, lemlist, Instantly in their profile)
- **Substack / X creators** who publish their own Clay workflows publicly

---

## Cross-references

- The architecture they operate inside: `reference/claude-code-gtm-architecture.md`
- The tool stack they use: `reference/2026-tool-stack-and-mcps.md`
- The skill library they pull from: `reference/coldiq-skills-directory.md`
- Specific campaign types they run: `clusters/campaign-ops/knowledge/outbound-master-system.md` + `abm-operating-system-2026.md`

## Source

ColdIQ blog "Why Companies Are Replacing SDR Teams With GTM Engineers" (Michel Lieben, March 2026). Cross-referenced with their internal training claims (100+ GTM Engineers trained and ramped at ColdIQ) and the Earleads + Trigify + Workflows.io patterns. 2026-05-13 crawl.
