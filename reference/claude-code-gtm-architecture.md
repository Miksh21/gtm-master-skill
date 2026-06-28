# Claude Code GTM Architecture — 2026 Operating Model

How to run GTM workflows **entirely inside Claude Code** as the single orchestration layer. Replaces the traditional 5-7 platform stack (data sourcing + enrichment + sequencing + analytics) with one terminal calling APIs through skills.

**Source:** Synthesized from ColdIQ blogs (Earleads/Othmane Khadri's setup, ColdIQ's own + Workflows.io's Company OS). 2026-05-13 crawl.

**See also:**
- Workflows.io's Company-OS pattern + 8 sales MCPs: `reference/2026-tool-stack-and-mcps.md`
- Master outbound system: `clusters/campaign-ops/knowledge/outbound-master-system.md`

---

## Why this matters

GTM teams typically run campaigns across **5-7 different platforms.** Data sourcing in one tool, enrichment in another, sequencing in a third, analytics in a fourth. Each platform has its own UI, learning curve, data store. Teams spend more time gluing tools than running campaigns.

**Claude Code changes the equation.** It acts as an orchestrator that can call any API, run any skill, hold full business context in one place. You describe what you want in plain language, the system executes.

The shift is **not about replacing Clay or any specific tool.** It's about collapsing the entire stack into a single interface where each tool becomes an **API call instead of a destination.**

> "One prompt. One terminal. Five different platforms collapse into one. Five different roles collapse into one person who can direct five agents." — Othmane Khadri, Earleads founder ($1M ARR Nov 2025, targeting $10M)

---

## The 4-layer operating system

Every Claude Code GTM setup has the same 4 layers. They are mutually dependent — skipping any one breaks the system.

```
INPUT LAYER (user types/dictates query)
        ↓
RULES LAYER (CLAUDE.md - the constitution)
        ↓
SKILLS LAYER (containers, one per action)
        ↓
MEMORY LAYER (memory.md - business context)
```

### Layer 1 — Input layer
- The user types or dictates a query
- Plain language: "Build a GTM outreach campaign. Scrape engagers from this LinkedIn post. Qualify them against Earleads ICP. Test this outreach angle: 15-minute chat about how we're rebuilding Clay open source."
- **Clearer input = better execution downstream.** The system can't read your mind.

### Layer 2 — Rules layer (`CLAUDE.md`)
- General rules Claude Code follows across **every** task
- Writing style, workflow preferences, what to always check before executing, what to never do
- **"The system's constitution."**
- Example rules: "Always use plan mode before executing destructive actions", "Never send LinkedIn messages without human approval on the first batch", "Default to British English in copy"

### Layer 3 — Skills layer
- **One skill = one action.** Containers that bundle a specific action with rules + API access
- One skill scrapes LinkedIn post engagers
- One skill qualifies leads against ICP
- One skill drafts outreach copy
- One skill sends connection requests via Unipile
- Skills **standardize** how Claude Code interacts with external systems → nothing happens randomly or unsafely

### Layer 4 — Memory layer (`memory.md`)
- **Where your business context lives**
- ICP definitions, value proposition, best clients, outreach angles that worked, midnight ideas
- Past campaign results that feed the feedback loop (see Section 3)
- When Claude Code runs a campaign, it reads all 4 layers:
  - **Input** = what to do
  - **Rules** = how
  - **Skills** = which actions are available
  - **Memory** = who you are + who you serve + what's worked before

---

## How a campaign runs end-to-end (Earleads example)

The prompt: *"Scrape the leads from this LinkedIn post. Qualify them based on Earleads ICP. Test this outreach angle."*

**Step 1 — Plan mode.** Claude Code goes into plan mode FIRST. Reads every file, every skill, every rule. Returns a full plan before executing. No surprises.

The plan it produces:
```
→ Scrape post engagers using LinkedIn skill (Unipile API)
→ Run through 7-gate qualification flow
→ Score + tag each lead 0-100
→ Draft outreach message with one variant
→ Send test message to one profile
→ Log everything to unified Notion database
→ Respect LinkedIn rate limits (account safety)
```

**Step 2 — Human approves the plan.** Hit yes.

**Step 3 — Execute.** 5-10 minutes later, full campaign has run. Leads scraped, qualified, scored. Outreach sent. Every action routed through code calling APIs via skills.

**No jumping between Clay, lemlist, Instantly. One terminal, one sequence.**

---

## The 7-gate qualification pipeline (Earleads)

Every scraped lead runs through 7 sequential gates BEFORE entering an outreach sequence. **First 3 gates are cheap filters — no enrichment spend until they pass.**

| Gate | Filter | Why first/why later |
|---|---|---|
| **1. Deduplication** | Check against existing DB → skip if already in campaign or marked customer | Cheap, eliminates noise |
| **2. Headline + title pre-qualification** | Read LinkedIn headline + current title → filter obviously wrong fits | Cheap, no enrichment cost |
| **3. Exclusion list** | Drop if on list: clients, partners, competitors, team, freelancers | Cheap, protects relationships |
| **4. Profile enrichment** | Fetch full LinkedIn profile for scoring | First step that COSTS — only for survivors |
| **5. Country + role qualification** | Geography + seniority vs ICP. Founder in target country stays. Freelancer in non-target drops. | Now know enough to apply ICP rules |
| **6. Company qualification** | Size + type + industry. Earleads = B2B SaaS / tech, 5-500 employees. **Google gets excluded** because it's outside the band. | Costlier check; need company data |
| **7. Best company from experience** | Pattern-match against past successful engagements. If most of Earleads' best clients had marketing co-founders → leads at companies with only technical founding teams get down-ranked. | The creative filter; requires memory of past wins |

**Every lead clearing all 7 gates gets: a score + a tag + a recommended action.**
- **Top tier:** flag for manual review
- **Mid tier:** automated outreach with specific message variant
- **Lower tier:** different angle OR drop entirely

---

## The feedback loop (what makes this beat Clay alone)

**After every campaign**, feed results back into the system. Ask Claude Code to refine the qualification criteria.

**The logic:**
1. Define the success KPI (connection acceptance, positive reply rate, meetings booked)
2. Compare winners vs losers
3. Ask Claude to identify hidden patterns
4. Claude **rewrites the qualification rules** for the next campaign
5. Run next campaign
6. Refine again

**Real example from Earleads:**
- Campaign targeting HR leaders across multiple titles → 30% reply rate overall
- Claude deep-dive: profiles with "people" in title → **67% reply rate**
- Profiles with "employee wellbeing" → **12% reply rate**
- Next campaign weights "people in title" heavier
- This is the loop Clay cannot do — Clay tables are static artifacts.

**The limit:** Claude doesn't have **taste**. It can spot quantitative patterns but can't tell you when an offer is wrong or a radically different angle would convert better. Human + Claude > Claude alone.

---

## The API stack that powers this

### 3 APIs do most of the heavy lifting

- **Unipile** — ALL LinkedIn actions. Scraping post engagers, connection requests, messages, comment replies. Also covers WhatsApp + email inboxes. **One provider, multi-channel.**
- **Firecrawl** — Web fetching. Company websites, news articles, funding announcements.
- **Apify** — Marketplace of specialized scrapers. Google Maps, Instagram, niche platforms that don't justify their own subscription.

### Contact enrichment APIs (one per data type)
- **Findymail** — email waterfall + verification (Workflows.io primary)
- **BetterContact** — phone waterfall (Workflows.io primary)
- **Prospeo** — firmographics + contacts
- **FullEnrich** — multi-source enrichment
- **OpenMart** — niche enrichment
- **PredictLeads** — funding + tech + news + job postings (single API)

### Workflows.io's published 8-MCP recommendation
(See `reference/2026-tool-stack-and-mcps.md` for the install-order list.)

Apollo → Findymail → Firecrawl → Instantly → HeyReach → Gmail → Slack → HubSpot.

These are MCPs (Model Context Protocol) — Anthropic's standard for connecting Claude to external tools. The Claude Code skill calls them.

---

## Building a custom skill — Othmane's 4-step process

### Step 1 — Find the SDK for the API
Every action needs an external environment. Scraping LinkedIn, sending messages, enriching contacts. Each API has an SDK that documents every available action. **Before writing the skill, Claude Code reads the SDK** so it understands how to talk to that API.

### Step 2 — Define input + output clearly
Vague skills produce vague results.
- ❌ "Get the commenters" → sometimes stops at 50
- ✅ "Get every single commenter on this post" → won't stop until it has all
- **Explicit success criteria matter.**

### Step 3 — Wire in the right environment
Credentials, endpoints, rate limits, error handling. All lives **inside the skill** (not in the prompt).

### Step 4 — Test it
Skills fail the first time. Claude tries to comment on a LinkedIn post → posts random text instead of intended reply. **The fix is inside the skill, not the prompt.** Once a skill works, it becomes reusable. Every future campaign that needs to scrape LinkedIn engagers calls the same skill.

---

## Pattern 3 — Trigify's Obsidian-memory pattern (Max Mitcham)

A third variation worth knowing. The Trigify founder built a similar 4-layer system but with **Obsidian as the memory layer** instead of a single `memory.md` file. The key insight: **memory writes back to itself**, becoming a living model of the business.

### Architecture
```
INPUT (user query, often dictated)
    ↓
CLAUDE CODE (execution layer, reads everything before acting)
    ↓
OBSIDIAN VAULT (memory layer — local markdown files)
    ├── client-conversations/    # every interaction
    ├── product-documentation/   # what the product does
    ├── past-email-performance/  # what got replies + why
    ├── content-decisions/        # what we publish + why
    └── workflow-results/         # what each task produced
    ↓
TRIGGER.DEV (orchestration — long-running async tasks with auto-retries)
    ↓
SUPABASE (operational data — PostgreSQL with real-time subscriptions)
```

### Why Obsidian over Notion / Airtable for memory
- **Local markdown files** = Claude Code reads + writes at the speed of disk (no API rate limits, no auth complexity)
- **Cross-reference at scale** — Claude can grep across hundreds of context files in a single task
- **Portability** — the entire knowledge base lives in a folder you control. Backups + migrations trivial.

Notion/Airtable can work for simpler setups but introduce latency on every read/write.

### The self-improvement loop
After each task, the agent:
1. **Summarizes what it learned** ("Cold email subject lines with question marks got 2× reply rate on Tier 1 accounts this week")
2. **Writes the insight back into the vault** (`/past-email-performance/2026-04-week3.md`)
3. **Next task pulls from that memory** before drafting

Over time, the vault becomes a living model of the business rather than a passive log.

### The 3-infrastructure piece for AI-agent ops
- **Claude Code** = execution layer (reads from Obsidian, writes to Supabase, calls external APIs)
- **Trigger.dev** = async orchestration (handles failures gracefully without manual intervention; queued jobs with auto-retries for long-running enrichment, signal detection, multi-step sequencing)
- **Supabase** = operational data + real-time subscriptions (agent reacts to state changes instantly instead of polling)

### When Trigify's pattern wins over Earleads' pattern
- **Trigify's wins when:** your memory grows fast and unstructured (lots of unique client situations, ad-hoc decisions, signal patterns). Obsidian's folder structure lets memory grow organically.
- **Earleads' wins when:** your workflow is well-defined and you want a tight constitution. A single `CLAUDE.md` + `memory.md` keeps the system disciplined.

In practice, mature setups use BOTH: structured rules in `CLAUDE.md`, evolving knowledge in Obsidian.

### The Trigify result
- Best-performing YouTube video sourced + structured + framed by the agent
- AI SDR workflow feeds Trigify's own sales pipeline autonomously (signals → enriched contacts → personalized outreach → results back to memory)

---

## Workflows.io's complementary "Company OS" pattern

Workflows.io ships the same architecture with one extra layer:

```
~/company-os-starter-kit/  (GitHub repo)
├── company/              # voice guide, design system, team page, industry intel
├── wiki/                  # SOPs (70% become skills; 30% stay as text)
├── clients/               # per-client repos (auto-synced via n8n)
├── raw/                   # unstructured dumping ground
├── plugin/                # 26 agents + 23 commands + ~94 hook-gated operations
└── skills/                # 79 Claude Code skills
```

Workflows.io's 5 open-sourced GTM skills:
1. **ICP Modeller** — vague description → structured tiered model
2. **GTM Strategist** — recommends which plays to run for which segment
3. **Outbound Copywriter** — personalized cold emails + sequences using voice guide
4. **LinkedIn Post Writer** — drafts in voice across hook + body + CTA
5. **Discovery Prep** — pre-call research → one-page brief

Repo: `github.com/Workflowsio/company-os-starter-kit`

---

## The headcount math (service-as-a-software)

Traditional B2B services agency: **8:1 staff:revenue per $M ARR**
AI-native (with this architecture): **2:1 or even 1:1**

- $10M ARR = 15-20 people
- $30M ARR = 60-80 people
- The constraint is no longer recruiting — it's **finding senior operators who can translate workflow expertise into runnable Claude Code skills.**

---

## The deeper shift (work itself changes)

From Othmane's framing:
- **Developer era** rewarded people who stayed focused on one deep task for hours
- **Claude Code era** rewards people who can:
  - Hold multiple contexts at once
  - Hop between agents
  - Give feedback + redirect
  - Keep the whole operation moving
- He calls it "**the ADHD era**" — when every task you start runs in the background, the skill shifts from deep focus to **high-bandwidth orchestration**

**Warning:** AI slop is not automation that helps. It is automation that **removes the craft**. The commodity layer is growing fast. Value moves up the ladder toward **creativity, taste, speed of iteration.**

> "Use the tools to do better work. Not just more work."

---

## When Claude Code beats Clay (and when Clay beats Claude Code)

| Use case | Better tool |
|---|---|
| Visual workspace + huge library of pre-built integrations | **Clay** |
| Static enrichment workflow that runs identical every time | **Clay** |
| Self-refining qualification logic based on campaign results | **Claude Code** |
| Multi-step research requiring reasoning across sources | **Claude Code** |
| Team without engineering background but with GTM expertise | **Clay** (lower learning curve for tables) |
| Bursty, creative, hypothesis-test-driven motion | **Claude Code** |
| Closing the campaign-outcome → ICP-refinement loop automatically | **Claude Code** (Clay can't) |

**The honest answer:** they work well **side by side**. Clay as the visual canvas; Claude Code as the orchestrator that loops intelligence from every output back into the next setup.

---

## The 60-minute first-agent install (Workflows.io published path)

```bash
# Step 1: Install
brew install gh
npm install -g @anthropic-ai/claude-code
claude   # authenticate
/help    # confirm install

# Step 2: Clone starter kit
git clone https://github.com/Workflowsio/company-os-starter-kit.git
cd company-os-starter-kit

# Step 3: Connect MCPs
claude mcp add apollo
claude mcp add findymail
claude mcp add instantly

# Step 4: Customize gtm-skills/outbound-copywriter.md (4 sections):
#   - Voice guide (paste your highest-performing past sequence)
#   - ICP definition (firmographic + behavioral signals for Tier 1)
#   - CTA preference (default first-touch CTA in plain language)
#   - Sequence length (3 or 5)

# Step 5: First run
# In Claude Code:
# "Run the outbound-copywriter skill for [LinkedIn URL]. Generate a three-step sequence."
```

**First-run-needs-corrections is expected.** Edit the skill → re-run → sharper output (the skill is now versioned with corrections).

---

## The prompt → project → agent distinction (critical)

| Type | Definition | Limitation |
|---|---|---|
| **Prompt** | One-shot input you type | No memory, no team reuse |
| **Project** | Chat with stored context | Ends at draft generation |
| **Agent** | Versioned skill via MCPs | Pulls live data, runs workflow end-to-end, team can call from terminal |

Most teams confuse a project for an agent. The MCP layer is the difference: **a skill that returns a Markdown plan but cannot act in your tools is a smarter SOP, not an agent.**

---

## Failure modes to avoid

1. **Over-engineering the first skill.** Three pages of clear instructions > ten pages of conditionals. Ship simple, patch what breaks.
2. **Shipping skills with no review.** Library drifts without PR protection. Treat skills like production code.
3. **Shipping skills without MCP layer.** A skill that outputs a plan but can't act = smarter SOP, not an agent.
4. **Treating Claude Code as pure automation.** The value is **compression** (collapsing the stack), not automation. Five platforms → one terminal. Five roles → one orchestrator-person directing five agents.
5. **Static memory file.** The memory needs to be updated continuously with campaign outcomes. Otherwise the feedback loop breaks.

---

## What this means for the gtm-master skill itself

This document describes the architecture **gtm-master itself sits inside.** gtm-master is one such skill (or skill-of-skills via clusters), designed to be run from Claude Code by GTM operators following this exact pattern.

The integration points:
- **Input layer** = user query that triggers gtm-master cluster routing
- **Rules layer** = CLAUDE.md global instructions
- **Skills layer** = gtm-master itself, plus other custom skills the user installs
- **Memory layer** = the user's `~/.claude/projects/.../memory/` files

gtm-master assumes this architecture exists. Its routing logic, the references to "tasks" and "knowledge files", the cluster index — all of it makes sense in the context of Claude Code as the operating layer.

---

## 2026-06 operator refinements (creator-radar)

Fresh field patterns layered on the 2026-05 model above. Source: creator-radar capture, card ids in [#].

- **5-layer variant + governance split** (Alex Vacca/ColdIQ). The 4-layer OS extended to 5: **Identity → Rules → Skills → Agents → Memory**, with a **brain/muscle governance rule: execution agents never rewrite their own rules.** Prevents drift across sessions (the system compounds instead of degrading). [#65]
- **Clay AND Claude Code, by altitude** (refines "When CC beats Clay"). Not either/or: **Clay = team-level cloud orchestration; Claude Code = individual-contributor local multiplier.** Pick by altitude, not feature. [#72]
- **Replace-Clay build path** (Joe Rhew): Claude Code isn't a drop-in Clay replacement — it *builds the tools* that replace Clay. Progressive: **Contexts → Skills → Scripts → Observability → closed feedback loops.** Each step compounds the last; adopt gradually. [#95]
- **Feed vs Build taxonomy** (Michel Lieben): classify every tool in the stack as **feed** (supplies data/API input) or **build** (the agent/orchestration layer). Removes integration confusion when assembling a CC GTM stack. [#48]
- **Tool retention test** (Alex Vacca): keep a tool only if **an agent can run it autonomously.** If it needs ~5 human clicks / a dashboard, drop it. Reframes stack evaluation from UI quality → agent-operability. [#60]
- **Infra layer (May 2026)** (Joe Rhew) — beyond enrichment providers, the code-based GTM stack: **Claude Code, Trigger.dev, Supabase, Railway, E2B, Spider, OpenRouter, Posthog.** (Extends the Trigify Trigger.dev+Supabase note above.) [#102]
- **Open-source CC GTM repos** to clone (add API keys, run): Michel Lieben/ColdIQ — 32 hooks, 15 integrations, 18 content prompts, targets Apollo/Instantly/Gmail/Slack [#58]. See also Workflows.io company-os-starter-kit (above).
- **Mini-tools as lead magnets** (Michel Lieben): ship free niche GTM mini-tools with Claude Code to collect emails + visitor-ID (Instantly/Vector/Midbound) for outbound re-engagement — PLG × outbound, distinct from content nurture. [#49]
- **Agency anatomy benchmark** (Michel Lieben): a real $7M/yr GTM agency mapped traffic → lead capture → sales → delivery, with named plays, team roles, retainer ranges, and tool stack per layer — usable as a campaign-ops architecture template. [#54]

**See also:** `clusters/campaign-ops/knowledge/agentic-gtm-patterns.md` (loop/eval/context engineering), `clusters/campaign-ops/knowledge/n8n-claude-code-workflows.md` (n8n+CC builds).

---

## Source

Synthesized from:
- ColdIQ blog: "How to Run a LinkedIn Outbound Campaign Entirely Inside Claude Code" (Earleads/Othmane Khadri's setup, $1M ARR Nov 2025)
- ColdIQ blog: "How Claude Code Builds an Entire Outbound Campaign in Under 20 Minutes"
- ColdIQ blog: "The 6 APIs That Turn Claude Code Into a Cold Email Engine"
- ColdIQ blog: "How to Use Claude Code to Build Unlimited Leads for Paid Ads"
- ColdIQ blog: "How We Manage $300K/Month in Ad Spend with Claude Code"
- ColdIQ blog: "How to Build an AI Agent That Runs Your Lead Generation"
- Workflows.io blog: "Build an Outbound AI Agent in 60 Minutes With Claude Code"
- Workflows.io blog: "Claude Code Skill Library: 5 GTM Agents That Replace SOPs"
- Workflows.io blog: "How to Build a Company OS on GitHub"
- Workflows.io blog: "Service-as-a-Software: The 2026 AI-Native Agency Playbook"

2026-05-13 crawl. See `~/workflows-io-extraction-2026-05-13.md` for the workflows.io source extraction.
