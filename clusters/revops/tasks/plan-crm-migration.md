> Source: swan-gtm/gtm-skills (rutger-katz) · MIT · imported 2026-07-28 · external content, unreviewed

# Task: Plan a CRM Migration or Consolidation

Recipe for merging or migrating CRM instances without the standard failure mode: 55% of CRM initiatives fail because the business decision was skipped, the data model was never agreed, and adoption was a checkbox. A consolidation is 20% technical, 80% alignment.

## When to use this

User mentions merging CRM instances, consolidating after acquisition, moving between CRM platforms, dual-CRM coexistence, cutover planning, deduplication before migration, or "which CRM wins".

## Inputs required

- Both/all instances: platform, record counts (accounts/contacts/deals), custom fields, live automations, integrations
- The GTM model: one unified motion or separate motions per business unit?
- ARR by instance and what finance says total ARR is
- Target timeline and who owns the migration end-to-end (one named person)

## Step 0: Consolidate vs coexist (the business decision, before any tooling)

**Consolidate** when: single GTM with unified territory/pipeline/pricing, one P&L, one version of truth needed for ARR/NRR/board reporting, automations can be rebuilt once. Expect 16-24 weeks audit-to-normalization (12-18 months for large post-merger integrations).

**Coexist** when: business units keep independent motions, one CRM is clearly superior for its use case, or integration is needed at finance/reporting level only. Then integrate at three layers only: identity (one customer view via warehouse stitching on domain + parent name), finance (unified ARR), reporting (single KPI dashboard reading both sources). The warehouse becomes the system of truth; the CRMs never sync to each other.

## The 10-step sequencing (consolidation path)

1. **Audit both instances**: objects, properties, automations, integrations, users, data volume + quality.
2. **Define target architecture**: system of record PER OBJECT (account, contact, deal, subscription/ARR, activity: each gets one owning system and a documented decision), object model (e.g. lead-object vs lifecycle-stage model), KPI definitions agreed across both orgs.
3. **Data-quality pass in the SOURCE** (2-4 weeks): dedupe, standardize, clean both instances first. Never migrate garbage; post-migration cleanup costs 3x pre-migration. Kill unused custom fields ruthlessly.
4. **Field mapping + transformation rules**: every field documented, canonical picklists decided ("Negotiation" vs "In Negotiation"), formats harmonized (phone, currency: one base currency with FX or preserve per-deal), lifecycle/stage definitions agreed (this drives adoption later).
5. **Build the target** in sandbox: properties, pipelines, lifecycle stages, automations, integrations.
6. **Test-migrate a sample** (e.g. 1,000 accounts / 5,000 contacts / 500 deals): validate counts, associations, spot-check. Iterate mapping until clean.
7. **Plan the cutover**: 1-3 day window, freeze strategy, parallel-run plan, rollback procedure executable in 4-8 hours (not 3 days).
8. **Cutover + validation**: migrate, dedupe, build the ID crosswalk, reconcile counts and ARR, re-point integrations one by one.
9. **Adoption + hypercare** (2 weeks): daily check-ins, same-day workflow fixes.
10. **Normalize + sunset**: archive old systems, publish reconciliation, start the steady-state data-quality cadence.

## The landmines (check each explicitly)

- **Deduplication**: match on email (contacts) and domain (accounts) exact-first; exact matching catches only 60-70% of dupes, add fuzzy matching + manual review of borderline cases. Expect 30-50% of records needing review in a mid-market merge; 2-4 weeks of work. Define survivorship rules per field BEFORE merging (most recent / most complete / authoritative source). Agree the canonical account hierarchy; never merge parent into subsidiary. Dedup is not one-time: ~70% annual contact decay means weekly fuzzy-match runs post-cutover.
- **ID crosswalk**: map every old ID → new ID (contacts, accounts, deals). Keep forever. This is the rollback plan and the integration-debugging tool.
- **Associations**: contact→account, contact→deal (multi-threading), account hierarchies, deal→deal (expansion lineage). Test end-to-end in sandbox; a broken contact-account link breaks all deal reporting.
- **Historical activity**: decide full migrate (<500K activities, mind API rate limits, attachments, email threading: disconnect old CRM from the mail sync and let the new CRM backfill from the mailbox) vs partial (last 18-24 months, cuts effort 60%+) vs archive read-only (cheapest; plan a 2-week shadow period because reps will ask "where's my old deal").
- **Automations do not travel.** Document every live workflow (purpose, trigger, actions), rebuild in the target, run in parallel comparing outputs, kill old ones only after 1-2 stable weeks. Rebuild lead routing and scoring FIRST (they drive adoption). Typical: 4-6 weeks for 50+ automations.
- **Integrations re-point**: list every system that reads/writes the CRM (sequencer, billing, enrichment, BI, email sync, chat bots). Pause all writers 1 week before cutover; resume one at a time post-migration while checking for duplicates. Highest-risk: any tool syncing to BOTH instances during transition, and finance ARR sync pointing at two places.
- **ARR tie-out**: pre-cutover, export active ARR from all instances, dedupe, sum, reconcile to finance. Investigate any gap (duplicated deals? uninvoiced deals? subscriptions missing from CRM?) BEFORE migrating; verify again within 48 h post-cutover. This is board-facing data.
- **Reporting re-baseline**: contact counts will drop 20-40% from dedup; pipeline value shifts as stages are redefined. Rebuild critical dashboards pre-cutover, run old + new side by side for 4 weeks, and publish a Migration Impact Summary to leadership BEFORE cutover ("contact count drops 120K → 80K from dedup; ARR unchanged"). Freeze new baselines at weeks 5-8.
- **GDPR carry-over**: opt-outs migrate as a suppression list and get verified; lawful basis + consent source/date travel with each contact (consent without evidence is non-compliant); Article 21 objections must remain enforced in the new system; align retention periods; update vendor DPAs before cutover.

## Adoption playbook (the real killer)

Awareness (8 wk pre): all-hands on why. Design (6 wk): reps co-design workflows and dashboards. Training (4 wk): role-based, hands-on sandbox. Pilot (2 wk): 2-3 teams live in parallel, fix issues. Cutover day 0: old CRM read-only, heavy comms. Hypercare (wk 1-2): daily check-ins, same-day fixes. Reinforcement (wk 3-8): feature sessions, data-quality recognition. Track: login frequency, activity logging rate, required-field compliance, forecast accuracy, support tickets. Any metric down for 2+ weeks post-cutover = intervene (training, workflow redesign, or extended parallel period).

## Output format

```
CRM Migration Plan: [source instance(s)] → [target]
Decision: [CONSOLIDATE / COEXIST] because [one line]

SYSTEM OF RECORD
Account: [system + note] | Contact: [...] | Deal: [...] | ARR/subscription: [...] | Activity: [...]

TIMELINE ([n] weeks)
Wk 1-2 audit | Wk 3-4 source data-quality pass | Wk 5-6 target build + mapping | Wk 7 sample test-migrate
Wk 8 cutover ([date], freeze [date], rollback window [n] h) | Wk 9-10 hypercare | Wk 11+ normalize

RISK REGISTER: [dedup volume estimate, integrations to pause, ARR gap if any, automations count to rebuild]
MIGRATION IMPACT SUMMARY (pre-publish): contacts [n]→[n], pipeline [€]→[€], ARR unchanged at [€]
ADOPTION: pilot teams [...], training dates [...], hypercare owner [...]
```

## Pass criteria

- Consolidate-vs-coexist decided from the GTM model, not platform preference
- Every object has exactly one system of record, written down
- Source data cleaned BEFORE migration; sample test-migration done before full cutover
- ID crosswalk + rollback plan exist; rollback executable in hours
- ARR tied out to finance pre- and post-cutover
- Impact summary published to leadership before numbers change

## Common failures

- "We'll clean up after cutover" (3x cost)
- Migrating every custom field "because someone might use it"
- Exporting/importing workflows across platforms (trigger logic never survives; rebuild)
- Two sequencer/enrichment tools writing to both CRMs during the window (duplicate storm)
- Panicking stakeholders at the post-dedup pipeline number because nobody pre-published the impact summary

## Deeper knowledge

- Governance rules the target must enforce from day 1 → `clusters/revops/knowledge/data-governance.md`
- Platform-specific portable notes → `clusters/revops/reference/crm-platform-portable-principles.md`
