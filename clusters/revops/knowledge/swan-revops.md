# Swan external takes — revops (Unvalidated)

## When to load
Only on a request for alternatives, a pushback on a canonical revops position, or a deliberate second-opinion check (gtm-master SKILL.md step 5). Topics: customer GTM-config health audits, usage-based expansion proposals, warehouse-to-GTM sync (reverse ETL). Always attribute; never present as gtm-master doctrine.

## Unvalidated — external, not yet run by Jan
> Filed by the Swan radar from third-party skills. Attributed; NOT gtm-master doctrine.
> A bullet moves into the body above only after it has been run in a real campaign and worked.

### Account health audits
- (single-case: audits of customer workflows inside one GTM platform) Tier-persistence check: count accounts with a tier label vs accounts whose status shows sequencing language ("sequence drafted", "queued"; these definitely passed qualification), report the gap as a number and % ("19 of 26 missing, 73%"), then read the workflows to confirm whether they call the central scoring step before sequencing. Partial persistence is its own failure. [jeremy-hurst/account-health-audit]
- (single-case: audits of customer workflows inside one GTM platform) Enrichment spend is never flagged as waste on volume alone: sample 30+ accounts, split qualified vs disqualified, and flag waste only when expensive enrichment fires AFTER disqualification or no qualification gate exists. [jeremy-hurst/account-health-audit]
- (single-case: audits of customer workflows inside one GTM platform) Dead-workflow rule: zero executions for 5+ days (configurable) is flagged by name and day count; outreach workflows are checked for connected senders and whether sequences actually send or sit as drafts. [jeremy-hurst/account-health-audit]
- (single-case: audits of customer workflows inside one GTM platform) Audit messaging by reading workflow instructions word for word, never titles or run counts: play workflows own signal/hook/research, one central voice layer owns voice; inline voice rules and zero saved message examples per sender are flags. [jeremy-hurst/account-health-audit]
- Every flagged finding pairs with one concrete intervention from a fixed failure -> intervention table (dead workflow -> re-enable session with the champion; persistence gap -> wire workflows to the scoring step; post-disqualification spend -> repair the gate; inline voice -> consolidate). [jeremy-hurst/account-health-audit]

### Expansion proposals
- (single-case: one usage-priced vendor) Invoice decomposition: split platform fee from consumption fee and reconcile to the total; take the included allocation from the PLAN definition (a live balance can include purchased overage) and the subscription live from billing, never a cached mapping. [jeremy-hurst/expansion-opportunity-analysis]
- (single-case: one usage-priced vendor) Proposal math on the trailing 3 COMPLETED months (exclude the partial month): conservative = trailing avg x 0.90 at current rate; growth = trailing avg x 1.50 at current rate minus 10%; overage = 2x the option's unit rate; footnote the math so the customer can check it. [jeremy-hurst/expansion-opportunity-analysis]
- Five expansion patterns tested in order, each needing cited account data: repeated overage purchases (3+ per cycle); customer-initiated capacity request (warmest, treat as commercial, get the trajectory call before pitching a plan); upgrades plus heavy overage in 90 days; >=90% utilisation plus a roadmap signal; senior believer with acknowledged under-use (use-case expansion, not volume). No forced matches: name a new pattern if none fit. [jeremy-hurst/expansion-opportunity-analysis]
- Expansion timing and rails: go now on customer requests and pre-renewal windows; wait on open escalations, departed champions and one-hot-month spikes; confirm the champion list with the owner before relationship-led plays; ~10 days of silence escalates internally to the owner, never another customer message; one active expansion play per account. [jeremy-hurst/expansion-opportunity-analysis]

### Reverse ETL
- Warehouse -> GTM sync in fixed steps: identity resolution before any write (confidence floor 0.90, below it quarantined, never guess-created); CDC so only deltas move; field type guards (reject with reason); suppression/consent applied after matching so every hold is logged; batches to destination limits with 429 backoff; dry run with a max-delete guard (>10% of an audience removed = abort); reconciliation report of expected vs written. [austin-hay/reverse-etl-activation]
- Sequencer enrollment is never automatic off a warehouse sync (a bad upstream filter becomes a mass mis-send); it is a separate gated step. Default cadence: CRM near-realtime, ad audiences hourly, sequences on-enroll only. [austin-hay/reverse-etl-activation]
- Authority per field: warehouse owns computed traits (scores, tiers, segments), CRM owns rep-owned fields, and a sync never overwrites a rep-owned field; if identity resolution misses the floor for a meaningful share, fix the upstream keys, never lower the floor. [austin-hay/reverse-etl-activation]

### Revenue engine maturity
- Overall maturity level = the lowest dimension score (ICP, lead scoring, outreach, data quality, feedback loops, automation), never an average, no partial credit; watch the spread between best and worst dimension, it predicts wasted spend (sequencer on an undefined ICP, AI personalization on duplicate-ridden data). [scott-wueschinski/revenue-engine-maturity-diagnostic]
- Prescription gate: no automation, AI messaging or predictive scoring for a company below Level 3 on data quality or ICP definition; plan one level up only, in dependency order, starting with the unmet criterion most other dimensions consume. [scott-wueschinski/revenue-engine-maturity-diagnostic]
- Score from artifacts, not answers (ICP doc, live sequence, CRM duplicate count, last optimization-review notes); what cannot be shown scores absent, because self-assessment runs high. [scott-wueschinski/revenue-engine-maturity-diagnostic]

## Source
github.com/swan-gtm/gtm-skills (MIT). Promoted from `_external-takes/swan-revops.md` at /creator-radar-review 2026-10-01.
