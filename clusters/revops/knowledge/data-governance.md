> Source: swan-gtm/gtm-skills (rutger-katz) · MIT · imported 2026-07-28 · external content, unreviewed

# Revenue Data Governance and GTM Data Architecture

The discipline every other RevOps practice depends on. Data architecture follows the customer journey (bow tie), not the org chart and not the tool. Prevention, detection, and correction working together; fix governance before building metrics or scaling.

## Data Model Design

Object architecture mapped to lifecycle: Leads/Contacts (title, industry, company_size, lead_source) → Accounts (revenue, industry, employee_count, country; status prospect|customer|churned|inactive; parent-child hierarchy) → Opportunities (deal_size, stage, stage_entered_date, close_date, deal_type; line items) → Subscriptions (ARR, contract dates, renewal date, discount) + Health (active users, adoption, tickets, NPS) → Activities linked to contact/account/opportunity.

Critical relationships: Account→Contact 1:many, Account→Opportunity 1:many, Contact→Opportunity many:many (multiple contacts influence one deal), Opportunity→Line Items, Account→Subscription, Activity→context links. Missing relationships = reporting gaps: if you can't connect contact → account → opportunity → revenue, you can't calculate deal influence or expansion velocity.

Custom object vs property: custom object when many records per parent, separate history needed, repeating data, or separate external sync. Property when single value, supplementary, no separate history.

**Data dictionary**: living document with every object, relationship + cardinality, property with type and owner, required-vs-optional per stage, deprecated fields + replacements. Update quarterly. Undocumented field = it doesn't exist.

## Field Governance

Naming conventions (prefix by owner):
```
rev_*  RevOps core        mktg_*  Marketing-owned    sales_*  Sales-owned
cs_*   CS-owned           int_*   Integration/system  calc_*   Calculated/formula
Never: random abbreviations, mixed case, tmp_/test_/x_ prefixes.
```

Field creation process: document (name, type, why, system of record) → review (duplicate? standard field usable?) → approve within 5 business days → implement + add to dictionary. Each field carries: purpose, owner, type + validation, source (manual/formula/integration/enrichment), where used, deprecation plan.

Deprecation timeline: ANNOUNCE 2 weeks (notify users, document replacement) → MIGRATE 4 weeks (formula/bulk/API; audit 100% migrated) → HIDE 2 weeks (remove from views/forms/workflows, keep readable; test reports) → DELETE after 6 months (archive export first; 12-month hide for revenue/date/identifier fields).

The proliferation problem: scale-ups accumulate 500+ fields, 200 unused. Prevention: conventions make duplicates obvious, approval adds good friction, quarterly audit of fields untouched 3+ months, delete aggressively.

## Data Quality Operations

Five dimensions with targets (B2B SaaS practice baselines):

```
COMPLETENESS 95%+  required fields per stage populated
ACCURACY     90%+  sample audits of 50-100 records vs reality
CONSISTENCY  99%+  same data same everywhere (closed-won deal → account shows subscription)
TIMELINESS   85%+  engagement weekly, firmographics quarterly-yearly, stage changes within 2 business days
UNIQUENESS   99%+  no duplicate contacts/accounts per domain

DQ Score = Completeness×0.25 + Accuracy×0.25 + Consistency×0.25 + Timeliness×0.15 + Uniqueness×0.10
Track monthly. Target 85%+ org-wide. Below 85% on any dimension: fix completeness and consistency first.
```

**Prevention first** (don't plan to fix bad data, prevent it): validation rules (email format, dates, stage moves forward only without approval); required fields at STAGE TRANSITIONS, not record creation (10 required fields at creation = garbage data + rep resistance); minimum required: contact = email/first/last/account_id, opportunity = account_id/name/stage/close_date; picklists over free text for anything filtered or reported; default values wherever possible.

**Detection**: weekly automated scans (fuzzy duplicate accounts on name+domain, null required fields, stage anomalies: backwards movement or stuck >180 days, data drift: values changed without activity log). Real-time anomaly alerts (close date in past, contact on 5+ accounts, implausible ARR on one deal, stage change with 30 days no activity, deal closed in <3 days or >365). Quarterly audits: sample 5% of closed opportunities, churned accounts, and enrichment data; recompute dimension scores.

**The data quality tax** (sell governance to the CFO): DQ Tax = hours wasted × hourly cost + revenue impact of wrong-data decisions. Example: ops 2 h/wk on dupes + 20 reps × 0.5 h/wk ≈ €56K/year. Show this number; governance gets budget.

## Deduplication and Records

Detection: exact match (email; account domain; phone) high confidence; fuzzy match ("Acme Corp" ≈ "ACME CORPORATION"; "John Smith"+@acme.com ≈ j.smith@acme.com) requires review. Merge protocol: contact survivor = most complete + recent activity, preserve all activities/relationships, keep audit trail; account survivor = usually the older record, move all children, never merge parent into subsidiary, log everything. Prevention at creation: email lookup on contact forms, fuzzy name+country match on account creation with logged override. Hierarchy: parent = ultimate legal entity; on acquisition create a parent relationship, don't delete; every contact maps to exactly one primary account.

## Integration Flows

**System of record per data point, one owner, others read:**
```
Account name: CRM | Annual revenue: enrichment vendor → CRM weekly | Sales stage: CRM (sales only)
Subscription dates: finance system → CRM (never edit in CRM) | Lead source: CRM (integrations read only)
```
Undefined system of record = guaranteed conflicts.

Sync direction: one-way (master → reader) is the default; bidirectional is dangerous, use rarely, define per-field conflict winners and a 24 h investigation SLA. Architecture by scale: point-to-point (2-3 systems, breaks at 5+) → hub-and-spoke with CRM as hub (recommended to ~€80M ARR; watch sync latency) → iPaaS (5+ systems, complex transforms; operational burden: monitoring, error handling) → event-driven streams or warehouse-native data fabric (€50M+ or high-frequency needs; single source of truth, zero-copy). Monitoring: alert within 4 h after 3 sync failures; weekly record-count drift comparison; latency alert at >2 hours. Never trust a sync because you set it up.

## Warehouse-Native Architecture (when CRM-native stops scaling)

Reference shape: sources (CRM, product, billing, support) → ELT (Fivetran/Airbyte) → cloud warehouse (raw + staging) → dbt transformation layer (versioned, tested marts) → reverse ETL (Hightouch/Census) back to CRM + BI tools. The warehouse is the hub; tools query live or sync on demand, they do not keep copies.

Why it wins at scale: one authoritative copy instead of 20 stale ones; AI/agents need unified fresh context; definition changes propagate instantly instead of rippling through five systems' code. Users report 15-30% CAC reduction and 25-45% higher conversion from warehouse-computed scores and routing.

dbt in one paragraph: every metric definition is SQL, versioned, tested, documented. When "pipeline coverage" changes, everyone downstream sees it at once, and any number traces to the code that produced it. Rollout: staging (cleaned raw) → marts (leads, deals, customers) → tests + docs.

**When NOT to go warehouse-native**: revenue team under ~20 people, single-CRM stack with no separate product/billing/support systems, or heavy data-residency constraints. Around 20 seats or sub-€1M ARR the ROI is negative; by ~100 seats or €5M ARR staying CRM-native is intentionally slower.

Anti-patterns: transformation sprawl (every dbt model needs an owner and a known downstream consumer; delete orphans quarterly); real-time obsession (start nightly or 6-hourly; a correct 1-hour-old score beats an expensive real-time one); building identity resolution from scratch (buy first: vendor matching gets ~92% in weeks vs 85% after 3 months of custom work); deferring data quality ("fix it after go-live" stalls the project; define quality gates in dbt and CRM up front).

Success measures: event-to-activation time < 2 h; monthly reconciliation variance < 1%; every leadership metric traceable to a dbt model.

## Enrichment Governance

What: firmographics, technographics, intent, news. When: on creation, on stage transition, quarterly refresh for active accounts, event-driven. Write rules: AUTO-OVERWRITE only immutable data (founding year, domain); FILL-EMPTY-ONLY where manual entry is authoritative; SUGGEST-with-review as the default for conflictable data (size, title). Vendor evaluation: sample-enrich 100 test accounts before committing; measure accuracy against known-good data and coverage of your target market; document the vendor's data sources for GDPR. Identity resolution: deterministic matching (email, phone, domain) first, probabilistic as an add-on. Clay-specific enrichment mechanics live in the enrichment cluster; this file owns the governance side.

## Definitions and Taxonomy

The shared-definitions problem: sales says €2M pipeline, marketing says 50 leads, finance forecasts €1.8M, nobody agrees what "pipeline" or "qualified" means. Governance loop: propose (owner writes measurable criteria) → review (marketing, sales, finance) → approve (revenue leader signs, version-controlled) → communicate (published + trained) → review quarterly.

**Stage definitions tied to data** (operationalize; you can't lie about stage if the data isn't there):
```
PROSPECT:       account_name + contact_email + lead_source
QUALIFICATION:  + title + company_size + budget_range + expected_close_quarter
PROPOSAL:       + deal_size + decision_maker_identified
NEGOTIATION:    + close_date + terms_documented + risks_identified
```

One Vision of Truth ≠ one database: marketing owns the lead definition, sales the opportunity definition, finance the ARR definition, CS the health score; tools stay separate, definitions and dashboards are shared. A semantic layer (shared metric definitions every report and agent uses) is the difference between one pipeline number and three contradictory dashboards.

## Operating Model

Roles: DATA OWNER (executive; VP Sales owns stage accuracy; mandates corrections, approves fields) | DATA STEWARD (RevOps; daily enforcement, audits, dedup, deletes bad data) | DATA CONSUMER (reps/CSMs; follow standards, measured on quality) | GOVERNANCE COUNCIL (VP Sales + Marketing + Finance + CS + RevOps; monthly scorecard + incidents, quarterly field approvals + definition updates, annual maturity + roadmap).

Maturity: L1 CHAOS (no standards, 500+ fields, "we don't trust reports"; 3-6 months to fix) → L2 REACTIVE (some conventions, ad-hoc cleanup; 6-12 months with a council) → L3 PROACTIVE (monthly council, prevention enforced, automated scoring; target within 12 months) → L4 OPTIMIZED (automated enforcement, real-time monitoring; needs data engineering resource).

AI-readiness prerequisites: single source of truth for intelligence (warehouse) with CRM as operational layer; sales/marketing/product/third-party data joined; defined quality minimums before training anything; converged definitions. If the data foundation isn't ready, escalate to exec level rather than bolting AI onto broken infrastructure. Agent guardrails when agents write to the CRM: no writes to immutable fields (account_name, created_date, closed-won revenue); validate all mutable writes against allowed ranges; merges surfaced as candidates only, human-approved; escalate to a human below a confidence threshold on stage changes and data writes; log every agent action append-only (what it read, decided, wrote, when); >15% escalation rate per agent = broken prompt or broken upstream data.

## GDPR Essentials for Revenue Data

- Article 14: notify enriched contacts within one month of collection; keep a per-contact source trail.
- Article 21: unconditional right to object to direct marketing; processing stops immediately; DND flag + automated cessation workflow + audit log.
- Legitimate interest for B2B outreach requires a documented three-part balancing test.
- Right to deletion: pipeline must delete from warehouse, reverse-ETL destinations, and downstream systems within 30 days; automate it.
- US transfers: SCCs alone insufficient post-Schrems II; require transfer-risk assessment, encryption, supplementary safeguards; prefer EU-based vendors for EU data.
- Vendor assessment before engagement: DPA, SCCs, SOC2/ISO27001, data sources, transfer mechanisms; log in a vendor risk register.
- Consent per channel varies by country (e.g. consent required for direct marketing in Germany/Austria; NL permits B2B cold email to corporate addresses); track basis per channel in a consent platform.
