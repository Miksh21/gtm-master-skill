---
name: clay-engineer
description: >
  Clay Engineer — end-to-end Clay workflow builder. Takes a CSV or domain list, an ICP definition, and a target output (Instantly campaign, HubSpot accounts, Salesforce records) and builds the full Clay workflow: company qualification with Claygent, contact finding, email and phone waterfalls, personalization, Sending Gate logic, and CRM/sequencer push. Use whenever the user wants to build a Clay workflow, spec an outbound campaign or ABM program, design table architecture, write Claygent prompts, or asks any Clay platform question.
---

# Clay Engineer

End-to-end Clay workflow builder. Takes a list of companies (CSV or Clay Find Companies pull), an ICP definition, and a target destination — and builds the full Clay workflow: qualification, contact finding, enrichment, email/phone waterfalls, personalization, Sending Gate, and push to CRM or sequencer.

This skill is modular. Each file covers one domain. Use this master file to orient, then navigate to the relevant reference file.

---

## How to Use This Skill

The skill expects three things to start a workflow:

1. **A list source** — a CSV of company domains, or a Clay Find Companies pull spec
2. **An ICP definition** — what qualifies, what disqualifies, with concrete examples
3. **A target output** — Instantly campaign, HubSpot accounts, Salesforce records, or a Google Sheet

Once those are clear, run discovery (`phases/01-discovery.md`) for the missing details, then build the workflow phase by phase.

**Ask before building.** When something is unclear (segment structure, CRM properties, copy variables), ask the user — don't guess.

---

## Global Rules — Always Apply

### 1. Gates Before Credits
**Never spend a credit on a row you are going to discard.**

Free checks first (formula columns), then cheap enrichments, then expensive enrichments, then export. This order is non-negotiable.

### 2. Sending Gate Formula Column — Always Before Export
**Never put complex conditional logic directly in a sending enrichment's conditional run field.**

Always create a dedicated "Ready to Send" formula column. Put all conditions there. Inspect every row before committing. Then the sending step uses one simple condition: `Run if Ready to Send = TRUE`. Applies to Instantly, HeyReach, HubSpot create, Salesforce create, Slack — anything irreversible.

### 3. Data Unification — Merge Multiple Sources into One Column
**Whenever the same data point can come from multiple enrichment steps, unify them into one formula column before any downstream step uses it.**

Pattern: Source A → Source B (conditional on A being empty) → Formula column that outputs whichever is not empty. All downstream steps reference the formula column only.

### 4. ICP Qualification Always Runs First
Claygent Web Research (GPT-4.1 Mini) on the company domain is the first gate. Visit the actual website — never trust self-reported industry tags from a database export.

### 5. Free Before Paid
If a formula column can do the same job as a Claygent step, use the formula column. Claygent is for language understanding, judgment, web research, and text analysis. Not for string manipulation that a formula handles perfectly.

### 6. Never Assume — Ask First
Before writing a single enrichment step: understand what the destination requires, what the source gives you, and what the output goal is. Discovery questions are in `phases/01-discovery.md`.

### 7. Clay-Managed Account vs Own API Key
- **Blue key icon in Clay UI** → own API key only (no Clay-managed option)
- **No blue key** → choose Clay-managed (Clay credits) OR own API key

Use own API key when the tool is used constantly across many workflows and many records. Use Clay-managed when it's a one-off or low-volume enrichment.

**Exception — Sumble:** Never connect via own API key. Native Clay integration is cheaper.

### 8. Multiple Sending Steps Are Supported
One Clay table can have multiple Instantly or HeyReach "Add Lead to Campaign" steps, each with different conditional runs routing to different campaigns. Each campaign-specific personalisation enrichment must carry the same conditional run as its corresponding sending step.

---

## File Map

### Phases (Workflow Stages)

| File | What it covers |
|---|---|
| `phases/01-discovery.md` | Discovery questions to ask before every workflow build |
| `phases/02-list-building.md` | Clay Find Companies, sizing, filter reliability |
| `phases/03-qualification.md` | ICP qualification (Claygent Web Research vs formula column), prompt rules and template |
| `phases/04-table-architecture.md` | Table A vs Table B, multi-segment architecture, multiple sending steps, data unification, auto-dedupe |
| `phases/05-enrichment.md` | Contact finding decision tree, name normalisation, email waterfall, personalisation variables, conditional run patterns |
| `phases/06-export.md` | Sending Gate formula column, Instantly export, HeyReach export, CRM export |

### Clay Platform

| File | What it covers |
|---|---|
| `clay/claygent.md` | Claygent use cases, models, prompt rules, all prompt templates |
| `clay/formula-syntax.md` | Formula columns and conditional run formulas — syntax, patterns, common examples |
| `clay/table-mechanics.md` | Auto-dedupe, auto-update, keep existing results, scheduling, enrichment templates, credits system |
| `clay/waterfall.md` | Native waterfall (Work Email, Mobile Phone), Custom Waterfall column, Merge Columns |

### Databases

| File | What it covers |
|---|---|
| `providers/databases/clay-find-companies.md` | Clay native company search — filters, industry mapping, AI Filters, filter intensity strategy |

### Contact Finding

| File | What it covers |
|---|---|
| `providers/contact-finding/email-waterfall.md` | Email providers, waterfall order, validation tools, LinkedIn URL finding for contacts |
| `providers/contact-finding/phone.md` | Phone finding providers, validation |

### Enrichments

| File | What it covers |
|---|---|
| `providers/enrichments/enrich-person.md` | Clay native person enrichment |
| `providers/enrichments/professional-posts.md` | Clay native LinkedIn posts family — find a person's posts, reactions, comments, shares; pull engagers on a specific post. Pairs with the LinkedIn Post Theme Summary prompt in `clay/claygent.md`. |
| `providers/enrichments/apify.md` | Web scraping marketplace (use only when no Clay-native alternative exists — for LinkedIn posts, prefer professional-posts.md) |
| `providers/enrichments/builtwith-sumble.md` | Tech stack detection — BuiltWith (website-facing), Sumble (internal tools) |
| `providers/enrichments/semrush.md` | Web traffic enrichment |
| `providers/enrichments/crunchbase.md` | Funding signals, investor identification, executive finding |
| `providers/enrichments/http-api.md` | Custom API connections — JSON body rules, authentication, rate limiting |

### Sequencers

| File | What it covers |
|---|---|
| `providers/sequencers/instantly.md` | Instantly — Add Lead to Campaign, variable mapping, multiple sending steps |
| `providers/sequencers/heyreach.md` | HeyReach — LinkedIn outreach |

### CRM

| File | What it covers |
|---|---|
| `providers/crm/hubspot.md` | HubSpot actions, match keys, conditional run formulas |
| `providers/crm/salesforce.md` | Salesforce actions, match keys, list import |

### Other

| File | What it covers |
|---|---|
| `providers/other/google-sheets.md` | Google Sheets actions, setup, run settings |

### UI Playbook (Execution Layer)

Deterministic recipes for driving Clay's UI via the Playwright MCP — pairs with phases (the *what*) to cover the *how to actually click through Clay*. See `ui-playbook/README.md` for setup, conventions, and known sticky points (Lexical editor, Run Settings scoping, drag-to-reorder).

| File | What it covers |
|---|---|
| `ui-playbook/README.md` | Playwright MCP setup, conventions, known sticky points, hardening protocol |
| `ui-playbook/add-claygent-web-research-column.md` | Add a Claygent Web Research column with custom prompt, JSON schema generation, and optional conditional run (draft v0 — needs first-run hardening) |

---

## FETE Framework

Every Clay workflow:

**F — Find:** Get data into Clay. CSV import, CRM import, webhooks, Find People, Find Companies, Find Jobs.

**E — Enrich:** Add missing data using waterfalls, Claygent, AI formulas, and 150+ integrations.

**T — Transform:** Clean, format, classify, score using formula columns, AI, and Claygent content analysis.

**Export:** Push results to CRM, sequencing tools, Slack, Google Sheets, or any system via integrations or webhooks.

---

## Standard Workflow Order

For a standard list build:

**Table A:**
1. Import CSV / connect Clay Find Companies source
1b. (Clay Find Companies tables only) LinkedIn headcount verification — Claygent Web Research (ChatGPT 4.1 Nano). Clay Find Companies only gives headcount ranges (51-200) and is often wrong. Scrapes LinkedIn for exact count.
1c. (Clay Find Companies tables only) Apply table filter on LinkedIn headcount column — exclude companies outside the tier's headcount range. Filters hide rows entirely, enrichments don't run, no credits spent.
2. Claygent Web Research ICP qualification (GPT-4.1 Mini) — gated on Domain not empty
3. Company-level enrichments (tech stack, funding, etc.) — gated on qualified

**Table B:**
1. Find contacts — gated on ICP qualified
2. Name normalisation (Claygent ChatGPT 4.1 Nano)
3. Company name normalisation (Claygent ChatGPT 4.1 Nano)
4. Email waterfall — gated on name + domain present
5. Email validation — built into waterfall
6. LinkedIn URL finding — if needed for HeyReach or CRM
7. Personalisation enrichments — gated on qualified + email found
8. Data unification formula columns
9. Sending Gate formula column
10. CRM Company Lookup + Create/Update
11. CRM Contact Lookup + Create/Update
12. Instantly push — gated on Ready to Send = TRUE
13. HeyReach push — gated on Ready to Send = TRUE + LinkedIn URL not empty

---

## Key Principles to Internalise

**Rules restrict. Thinking extends.** This skill contains hard rules (never skip qualification, never put logic in sending step, never use own API key for Sumble) and thinking frameworks (multi-segment architecture reasoning, table B split logic). Rules are always followed. Thinking frameworks are applied to each unique situation — if a case falls outside the rules, use the underlying reasoning to navigate it.

**If you have doubts about a segmentation or architecture decision** — present options with trade-offs to the user. Never silently pick one when the right answer depends on the user's stack, titles, or campaign goals.

**Workflow knowledge degrades.** If you're about to claim a specific provider does or doesn't support something, grep the skill file first. Never assert from memory alone.
