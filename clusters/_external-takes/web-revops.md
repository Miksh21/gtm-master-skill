# External takes — revops (Web radar, UNREVIEWED)


## CRM Hygiene (Play 42) — frontal.so  ·  filed 2026-11-07
Source: https://frontal.so/plays/crm-hygiene · cluster: revops
- ✅ supports [revops/tasks/plan-crm-migration.md:39]: exact-first then careful matching for dedupe.
- 🆕 new-angle: first pass is read-only and proves it (count records last modified by your own user); find which integration or import created each dirty record because duplicates regenerate; treat default picklist values as blank; never size duplicates from a tool's suggestion count.
- 🆕 new-angle: match rules: a name counts only with a matching domain; never key on a shared phone or company name; blank directory and link-in-bio domains first; a role inbox with a name stamped on it is a field fix, not a merge; survivor = furthest in funnel, then has email, then most recent.
- 🆕 new-angle: write gate: backup of the change set, owner approves the exact list as a saved view, check workflows and two-way syncs that will fire, estimate credits, log previous values; enrichment fills blanks only (exceptions: bad emails, job changers become a new contact, old one marked gone); then 'keep it on' with the same rules for every new record and a weekly sweep to Slack. Provenance: Frontal = former ColdIQ Agency (same operators as the coldiq-* holding files), so agreement with coldiq takes is NOT independent corroboration.
Review: additive
Status: holding

## PLG-to-Sales (13) and Meeting Form Orchestration (14) — frontal.so  ·  filed 2026-11-07
Source: https://frontal.so/plays/plg-to-sales · cluster: revops
- ✅ supports [revops/knowledge/handoffs-and-lead-routing.md:9]: route inbound forms fast with CRM lookup by domain and email before creating records (https://frontal.so/plays/meeting-form-orchestration).
- 🆕 new-angle: PLG data model first (users, accounts, product orgs, onboarding journeys, metrics, revenue) as HubSpot custom objects, real-time sync for sign-ups and batch for usage plus a QA dashboard; objective lead-stage exit criteria (new, attempting, connected, qualified, ready for deal); deals auto-routed to New Business, Existing Business or Renewal pipelines; automatic health tags (inactivity, overdue, missing contacts, upcoming renewal). Provenance: Frontal = former ColdIQ Agency (same operators as the coldiq-* holding files), so agreement with coldiq takes is NOT independent corroboration.
Review: additive
Status: holding
