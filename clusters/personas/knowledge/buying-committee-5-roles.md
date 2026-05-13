# Buying Committee — 5 Roles with Per-Role Messaging Strategy

**B2B deals average 6-10 stakeholders (Gartner 2023).** Single-thread outreach = single-point-of-failure. This file gives 5 canonical roles to fill per account + per-role messaging guidance.

Pairs with `clusters/personas/tasks/build-persona.md` (the recipe for building individual personas). This file is the **standardized committee skeleton** to multithread against.

## When to load

- "Multi-thread Tier 1 accounts" → identify the 5 roles
- "Persona-specific messaging for [Exec / Ops / Tech / Finance / End-User]"
- "Who do we send what to" mapping for a tiered campaign
- ABM stakeholder mapping (Step 7 of `abm-operating-system-2026.md`)

---

## The 5 roles

For every Tier 1 account, attempt to identify and engage one contact per role. The total set = the buying committee.

```
1. Exec       → strategic direction + budget ownership
2. Ops        → process + execution + internal sponsorship
3. Tech       → feasibility + integration + security
4. Finance    → ROI + cost + risk
5. End-User   → daily workflow pain + product validation
```

Don't stop at "Head of X" or "CTO" — each role represents a different *perspective* on the deal, and each demands a different *message strategy.*

---

## Role 1 — Exec (strategic direction + budget)

**Typical titles:** CEO, COO, CRO, CPO, CDO, VP-level leadership.

**What they own:**
- Final sign-off authority
- Top-down initiatives tied to revenue, risk, or operational efficiency
- Budget approval

**Messaging strategy:**
- **Concise + strategic.** Senior leaders don't read long sequences.
- **One or two high-quality touchpoints** tied to **business impact**, not feature lists.
- Frame value as: shorter sales cycles / forecast accuracy / margin expansion / strategic risk reduction.
- ROI talk is OK but only at the C-level abstraction (e.g., "20% reduction in CAC payback period" beats "saves 4 hours/week per rep").

**Example opener pattern:**
> "Saw [Company] just hit [milestone / funding round]. Most [ICP-equivalent CROs/CMOs] we work with at this stage are dealing with [strategic problem]. Worth a 15-min look?"

**What kills these messages:**
- Long sequences (3+ steps will be ignored or marked spam)
- Feature-led copy ("our platform offers")
- Asking for a 45-min "discovery call" (they don't have it)

---

## Role 2 — Ops (process + execution + internal sponsor)

**Typical titles:** VP Operations, Head of RevOps, Business Ops, Operations Manager.

**What they own:**
- Workflows + daily execution layers
- Process improvement projects
- Often act as project sponsors / internal champions during evaluation

**Messaging strategy:**
- **Mid-funnel conversations** around process improvement + automation + efficiency.
- They feel the operational pain *directly* — call out the pain in operational language ("manual handoffs", "data fragmentation", "reporting overhead").
- They convert on **proof of speed + reduced complexity.** Not "saves money" but "removes the 3-hour Monday-morning reporting task."

**Example opener pattern:**
> "Most RevOps leaders we work with at [company size] hit a wall when [specific operational symptom]. Here's a 2-min teardown of how [peer company] solved it: [resource link]."

**What lands:**
- Before/after process diagrams
- Time-to-execute benchmarks ("cut deliverable from 5 days to 6 hours")
- "How we did this for [peer company]" case studies

---

## Role 3 — Tech (feasibility + integration + security gatekeeper)

**Typical titles:** CTO, VP Engineering, Head of Data, Architect, IT Director.

**What they own:**
- System integration
- Data security
- Technical validation
- Gatekeeping adoption — **no tech sign-off = no deal**

**Messaging strategy:**
- **Focus on integration + risk mitigation + security compliance.** Not features.
- Reassure on reliability, scalability, maintenance burden.
- Back every claim with concrete proof: APIs, certifications, uptime SLAs, integration partner list.
- This persona is allergic to marketing-speak. Plain technical language wins.

**Example opener pattern:**
> "Quick technical question on [Company]'s [stack item]. Most [target stack] teams hit [specific integration friction]. We solve it via [specific API / approach]. SOC2 + uptime details here if useful: [link]."

**What kills these messages:**
- Vague claims ("seamless integration")
- Asking them to sit through a sales demo before seeing technical docs
- Missing security/compliance context for an enterprise-tier prospect

---

## Role 4 — Finance (ROI + cost + risk)

**Typical titles:** CFO, VP Finance, Controller, Head of FP&A.

**What they own:**
- Budget approvals
- ROI + payback + cost-benefit evaluation
- Can accelerate OR halt deals late in the cycle (this is when most deals die)

**Messaging strategy:**
- **Use data-backed ROI narratives.** Total cost of ownership (TCO), risk reduction, payback models.
- **Finance personas don't respond to emotion. They respond to math.**
- Specifics: "$X CAC reduction over 12 months at Y volume" beats "improves efficiency."
- Show the *risk* of NOT acting (compliance gap, competitor advantage, talent attrition) alongside the upside.

**Example opener pattern:**
> "Quick financial framing for [Company] — at [revenue tier], [specific cost problem] typically runs $X annually. We've documented Y% reduction with comparable customers. 12-month payback model here: [link]."

**What lands:**
- Spreadsheet-style ROI breakdowns
- Customer benchmarks normalized to comparable company sizes
- Risk-of-inaction framing alongside ROI

---

## Role 5 — End-User (workflow pain + product validation)

**Typical titles:** ICs or first-line managers in the relevant function — Marketing Manager, Data Analyst, CS Lead, Senior Engineer, Sales Operations Manager.

**What they own:**
- Daily product use
- Validating practical benefits + usability
- Becoming powerful internal champions OR blockers based on direct experience

**Messaging strategy:**
- **Practical + empathetic.** Acknowledge the daily friction they live with.
- **Ask discovery questions** about workflow + tool limitations rather than pitching.
- They're your gateway to credible insights and user-level proof for later sales conversations.
- Avoid talking budget or strategy — they don't own it, and bringing it up signals you don't know the org structure.

**Example opener pattern:**
> "Most [IC role]s I talk to are dealing with [common operational frustration]. What's your current workaround? Curious whether [our solution category] would actually help or just add another tool."

**What kills these messages:**
- "Are you the decision-maker?" (yes/no offends and disqualifies)
- Pricing/ROI talk (not their domain)
- Asking for a meeting before earning context

---

## Multithreading mechanics

### Tier-aware contact sourcing (uses Step 5 of `outbound-master-system.md`)

| Tier | Contact coverage target |
|---|---|
| **Tier 1** | All 5 roles where possible. Multi-thread across the full committee. |
| **Tier 2** | 2-3 roles (typically Exec + Ops, or Ops + Tech). |
| **Tier 3** | 1 role (typically Ops or End-User as the entry point). |

### Tooling

- **Findymail** — primary email + verification
- **BetterContact** — phone for Tier 1 (Exec + Ops typically warrant calls)
- **Apollo Enrich** — coverage expansion when other tools miss specific functions (Finance often needs Apollo)

### Sequencing order

Don't blast all 5 roles on day 1. Order matters:

```
Day 1-2: Exec + End-User (top + bottom — highest impact + lowest threat)
Day 3-5: Ops + Tech (middle layer — process + technical validation)
Day 7-10: Finance (after others have engaged, frame around their validated ROI signals)
```

If any one role replies positively, **escalate that account** — they're a potential champion. Engage other roles with reference to the champion's interest.

---

## Cross-references

- Individual persona-building recipe: `clusters/personas/tasks/build-persona.md`
- Where multi-threading fits in the outbound motion: `clusters/campaign-ops/knowledge/outbound-master-system.md` (Step 5)
- ABM context (Step 7 of the ABM operating system): `clusters/campaign-ops/knowledge/abm-operating-system-2026.md`
- Multi-thread inbound (when one signup triggers committee coverage): `clusters/sequences/knowledge/tiered-routing-template.md`

## Source

Workflows.io "The 7-Step Outbound GTM Framework" blog (Step 5 — Contact Sourcing), 2026-05-13 crawl. Gartner 6-10 stakeholder benchmark cited in source.
