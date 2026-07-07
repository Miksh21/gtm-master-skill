# Funnel Bottleneck Diagnosis — The Factory Model

GTM as a factory: four machines in series. **Revenue throughput is capped by the slowest machine.** The GTM engineer's job is to find the bottleneck and fix *that* — not to optimize the machine you're already best at. Doubling down on what already works adds ~0 throughput.

## When to load

- Any "what should I do / where should I invest" strategy question
- Before picking a tactic or cluster — diagnose first, then route
- Auditing a full motion that's underperforming ("we're doing outbound but pipeline is flat")

## The four machines

| # | Machine | Converts | Fixed by (gtm-master) |
|---|---|---|---|
| 1 | **Demand Gen** | cold ICP → aware | signals-as-awareness, engagement-on-content; mostly upstream of outbound (brand/content/ads) |
| 2 | **Demand Capture** | aware → lead (reply / form / signal) | `list-building`, `enrichment`, `signals`, cold-email opener |
| 3 | **Demand Conversion** | lead → pipeline (qualified meeting/opp) | `lead-scoring`, `sequences`, `objections`, `personas`, cold-email follow-ups |
| 4 | **Demand Closing** | pipeline → revenue | sales skill / deal team — mostly out of scope; BIPSY (philosophy.md Principle 2) diagnoses the *reps* here |

## How to find the bottleneck

1. **Compute stage-to-stage conversion** against benchmark. The machine with the worst rate *relative to its benchmark* is the constraint — not the one with the lowest absolute number.
2. **The "suspiciously high" tell.** A close rate far above the B2B norm means the bottleneck is *upstream* — you're only closing the trickle that makes it through. (Clay's own diagnosis: their close rate was "suspiciously high," which pointed to a Capture bottleneck, not a Closing strength.)
3. **A dead/exhausted input = Capture starved.** If no leads are flowing, copy and closing fixes do nothing. *Worked example (Talent'em audit):* the only "active" cold campaign sat at ~0 sends for 9 business days from lead-pool exhaustion — the constraint was Capture supply, so better copy or A/B variants would have changed nothing.

## The rule

**Fix the bottleneck, not your favorite machine.** When you fix it, the constraint *moves* to the next machine — re-diagnose and repeat. A different bottleneck needs a different playbook; don't reuse last quarter's.

## Business-model fit (which machine you can move cheaply)

How you fix a machine depends on the business model — see `philosophy.md` → "Business model dictates channels."
- **Self-serve / PLG:** Demand Gen is fixable cheaply with a UGC / community / content flywheel.
- **Long-cycle / enterprise:** Demand Gen needs ABM, unique experiences, and first-party-data content — the UGC flywheel will not work.
- **Don't port a Gen tactic across business models** (TikTok doesn't run ABM; Workday doesn't run Meta ads).

## Cross-references

- `philosophy.md` Principle 7 (this framing) + "Business model dictates channels"
- BIPSY (`philosophy.md` Principle 2) — diagnoses the reps inside the Closing machine
- `clusters/campaign-ops/knowledge/outbound-master-system.md` — the 7-step build once you know the bottleneck

## Source

Distilled from Clay's GTM conference, 2026 (Bruno Estrella, demand gen; David Grieco, growth). The factory/bottleneck framing is Grieco's: "your throughput is capped by whatever the slowest machine is… our job is to identify the bottleneck and solve it."
