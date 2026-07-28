> Source: swan-gtm/gtm-skills (manny-medina / rutger-katz) · MIT · imported 2026-07-28 · external content, unreviewed

# AI Product Pricing, Credit Packaging, and Monetisation Ops

Three connected plays for pricing AI/data products (manny-medina, from pricing analysis across 60+ AI agent companies), plus the monetisation infrastructure that makes consumption pricing operable (rutger-katz).

## 1. Picking the Pricing Model (AI agents / AI-heavy products)

Profile the product on four questions before recommending anything:
1. **Breadth of responsibility**: comprehensive job function, or discrete tasks?
2. **Workload predictability**: consistent volume, or wildly variable?
3. **Attribution**: can a completed outcome be cleanly credited to the product? High autonomy (finishes work alone) or low (copilot)?
4. **Budget displaced**: headcount, BPO/outsourcing, tools budget, or a performance line item? Headcount budgets run ~10x larger than tool budgets; this answer moves price more than any other.

| Model | Fits when | Watch out |
|---|---|---|
| Per agent (FTE-replacement flat fee) | Comprehensive function, consistent workload, headcount budget | Low differentiation; cheaper competitors |
| Per action (consumption) | Varied discrete tasks, unpredictable frequency, BPO budget | Highest commoditization risk; pricing pressure only moves down |
| Per workflow (completed multi-step sequence) | Multi-step processes with standardized deliverables | Standard workflows invite compression; complex ones risk negative margin |
| Per outcome (pay for results) | High autonomy + clean attribution + a success metric the customer already tracks | Attribution disputes; bespoke outcomes proliferate contracts |

Rule of thumb: low autonomy + loose attribution → seat/subscription. High autonomy + high attribution → outcome. In between → workflow, or hybrid (subscription floor + consumption layer: the most common successful shape).

**Anchors: never anchor on compute cost.** Anchor on what the work costs done another way: a fully loaded SDR runs $70-90K/yr, so a $2,000/mo agent replacing 80% of the job is an easy story; BPO spend averages ~$877 per employee per year in the markets agents eat into; outcome pricing anchors on the unit the buyer already values (Intercom Fin: $0.99 per resolved ticket, no resolution no charge). Express price as a fraction of displaced cost, then sanity-check margin against worst-case execution cost.

Hard rules: MUST state which model wins and why the other three lose. NEVER price on tokens (races to zero as LLM costs fall). NEVER outcome-price without naming the metric and its verification method before signature. NEVER seat-price an agent that reduces seats (your success shrinks the deal).

## 2. Credit Packaging

Credits are the bridge between subscriptions and outcomes: sell the outcome, meter the credit.

- **Translate actions to credits by value delivered, never compute cost.** T-shirt sizes: quick document review ~3 credits; full multi-step assessment ~200. Keep the schedule simple enough that buyers develop intuition; if every action needs a lookup, collapse sizes.
- **Denomination is psychology**: 100,000 credits feels abundant, 100 feels stingy. Scale so allowances read generous.
- **80/20 sizing**: each tier's allowance sized so ~80% of its customers stay in bounds. Quote new customers at 70-80% of expected usage: growing into more credits is a win conversation; a mountain of unused credits is a churn signal. Design for ~80% utilization with ~20% buffer. Limited rollover only (unlimited rollover erases the expansion signal). No penalty-priced overages; every mechanic should make the customer feel like they're winning.
- **Enterprise rate card**: keep it OUT of the contract, referenced from it, as a living document; shipping new capabilities then never reopens procurement. LOCK the rate-card values and keep them identical across accounts; when a buyer wants a lower effective rate, adjust credit VOLUME (a bundling conversation), never the rate card. Consistency builds trust; bespoke per-account rate cards destroy it.
- **Sell in human terms**, never lead with the abstract unit: "your plan covers ~500 contract reviews a month, what a junior paralegal handles in a week"; "100,000 credits ≈ one person full-time for a month". Pitch against FUTURE hiring needs, not existing staff (growth story, not a threat). Back with a real-time consumption dashboard, threshold alerts, and a monthly line like "80,000 credits consumed → 2,400 documents processed → $18,000 cost avoidance".

Failure modes: pricing credits off compute, burying the schedule in the contract, punitive overage (recreates the bill shock credits exist to kill), allowances so low customers hit the wall in month one.

## 3. ROI Proof (the value receipt)

Agents are cognitively invisible to the people paying; value must be made explicit continuously, not scrambled at renewal. Three reporting categories exist; only one closes renewals: usage reporting (tasks run, tokens) = engineering metrics; performance analytics (uptime, latency) = reliability metrics; **ROI reporting (time saved, cost avoided, revenue generated) = the only commercial category**.

Benchmark first: what each task cost before automation (time per task × loaded hourly rate of whoever did it), which value units the customer ALREADY tracks (use theirs, never invent proxies), price paid for the period. No benchmark ever agreed? Capture one now and flag it: value definition belongs before deployment.

Monthly receipt, per account (never average across accounts):
1. **Tasks resolved** in the customer's language ("847 support tickets resolved")
2. **Hours returned** = tasks × human-equivalent time − remaining human touch
3. **Cost avoided** = hours returned × loaded rate + hard costs displaced
4. **ROI multiple** = value delivered ÷ price paid

Show the arithmetic: a buyer who can re-derive the number defends it internally; a black-box multiple gets discounted. Deliver as one forwardable page: headline multiple, the three numbers, a trend line, zero adjectives. With a monthly receipt, renewal stops being a defense; you remind the customer what losing the product costs. Hard rules: separate customer-agreed benchmarks from assumptions and label every assumption; never fabricate a rate; never lead with activity counts alone.

## 4. Monetisation Ops (making consumption pricing operable)

**The five-layer stack**; break any layer and the system collapses:
1. METERING (what events happened, whose were they) 2. RATING (what do they owe given their contract) 3. INVOICING (auditable proof) 4. COLLECTIONS 5. REVENUE RECONCILIATION (what to recognize and why). Bad metering → bill shock churn; bad rating → leakage or overbilling; bad invoicing → no audit trail; bad rev-rec → wrong books.

**Metering essentials**: every billable event carries a globally unique event ID (idempotency key); dedupe log for 12+ months; at-least-once delivery absorbed into exactly-once billing records; late-event backfill (24-72 h) re-runs the period total. Map every raw identifier (api_key, user_id, tenant) to ONE billing customer ID; sync the mapping hourly or the first day of a new key goes unbilled. At 1B+ events/month: warehouse-native metering (raw stream → warehouse → SQL aggregation by customer × period × dimension) beats purpose-built middleware; backfill is a query and the audit trail is built in.

**Six contract structures the rating engine must handle simultaneously**: pure usage; usage with minimum floor (charge = max(minimum, usage)); tiered/volume; hybrid seats + usage overage; outcome-based (invoice in arrears, metric lags); hybrid with credits (allowance, then pay-as-you-go). Gotchas: store intermediates at six decimals and round only at invoice total (rounding × 1M contracts = real leakage); define tier boundaries inclusive/exclusive explicitly; snapshot mixed dimensions at documented timestamps; annual commit + mid-year usage doubling = separate overage invoice + scheduled true-up; credits default to no-rollover with explicit expiry dates; outcome contracts invoice in arrears with clear communication.

**Invoice = proof**: every line item traces to a metered record and a contract clause; footer records generation timestamp, system version, and source-data link. Never invoice before metering is final; never recognize revenue before invoices are sent; never close the books until recognized = invoiced (exceptions logged).

**Revenue recognition, simplest defensible pattern**: bill conservatively (only actual consumption), recognize on invoice date, track adjustments as separate line items, automate month-end reconciliation (sum of invoices vs GL; variance ~zero). Forecast variable revenue separately: committed floor (highly predictable) + historical average overage per segment with a confidence interval.

**Per-seat → usage migration**, three approaches: parallel billing (safest: existing contracts ride to renewal, new deals on usage; 12-24 months); scheduled migration with grandfathered floor (usage floor = last year's seat spend, upside only; 6-12 months); aggressive coupon + education (risky on usage spikes). Checklist: stagger renewal-date migrations, deploy metering 60 days before the first migrated invoice, model a 5-15% short-term revenue dip with recovery by month 6, proactively brief the top 20 customers before the first bill, monitor disputes for 3 months.

**Price increases**: lock increases into annual contracts at signature; 90-day notice for month-to-month; value-driven framing ("the efficiency we shipped saves you more than the 8% increase costs") beats naked increases; segment increases by usage-value cohort. Communicate 60+ days ahead: proactive communication cuts increase-driven churn roughly from 15% to 5%.

**Quarterly billing data-quality audit**: event dedup rate <0.5%; customer-mapping accuracy 99.9%+; 99% of events processed within 24 h; 100% invoice-to-metering match; rounding variance under a fixed monthly cap; 98%+ valid payment methods; spot-check 20 contracts/month against master data.

Market context: 77% of the largest software companies use consumption-based pricing somewhere; ~43% of companies run hybrid models heading toward ~61%; usage-based standard in ~38% of SaaS heading to ~70% (Gartner/BVP). 78% of IT leaders report unexpected consumption or AI charges in the past year: transparency dashboards are retention infrastructure, not a nice-to-have.
