# Creator-Radar Lead Scoring: 2026 Model-Building & AI-Qualification Tactics

## When to load
Building or refitting a lead-scoring model from closed-won data, replacing NAICS/firmographic buckets, running AI qualification passes, setting classifier confidence cut-offs, handling unknown data in scores, or deciding what happens to below-cutoff leads. Complements `tasks/score-and-prioritize.md` and `signals/knowledge/signal-scoring.md`. Triggers: "vibe data science", "regression lead score", "AI qualification pass", "confidence threshold", "deterministic scoring prompt", "unknown dimensions", "low-score leads".

## Building the model from data
- **Vibe data-science scoring** (backs `campaign-ops/knowledge/abm-operating-system-2026.md` Step 1 backtest and the `icp/tasks/build-icp.md` backtest validation): give Claude Code ~50 closed-won and ~20 closed-lost CSVs, let it iterate regression models and back-test on historical leads; pick the simplest explainable model, a human strips spurious features. Refit about every 6 months. [#416]
- **Custom archetypes instead of NAICS:** LLM-classify companies into custom archetypes and workload fit (Parallel API accepts freeform classification prompts), then fit a linear regression on revenue to weight each dimension. Reps read the taxonomy; the weights are empirical. [#1299]
- **Keyword industry tiers need corroboration:** require two distinct keywords or a title match; one stray keyword ("wellness" in a benefits paragraph) falsely boosted companies. [#1851]

## AI qualification passes
- **Two-pass qualification:** a cheap lenient model cuts the list (minimises false negatives), then a costly strict model judges deep fit on survivors only; under 10% reach top tier. [#1565]
- **Deterministic scoring prompt** (backs `icp/knowledge/creator-radar-icp.md` ICP Prompt Loop, 3 clean rounds of 10): define terms with numbers or closed lists, first-match-wins rules, closed labels, explicit missing-data and boundary rules; run 10 times on 2+ models until identical. 90% consistency on 5,000 leads still misroutes 500. [#1767]
- **Unknown is a score, not a zero:** let the agent score U for unknown; report the score on known dimensions plus coverage, and require 4 of 5 dimensions known before drafting. 80% on 2 of 5 known is a research task, not a lead. [#1652]

## Confidence lanes & routing
- **Classifier confidence lanes** (backs `revops/knowledge/data-governance.md` "escalate to a human below a confidence threshold"): 0.90+ auto-enroll, 0.70-0.90 rep review, under 0.70 research or drop; stricter cut-offs for hard-to-undo actions. Check the 0.90 cut-off against 30 hand labels before trusting it. [#1672]
- **Counter-view (2026-10-11)** to `tasks/score-and-prioritize.md` tier table "Tier 3 < 40 Hold or discard": (single-case: Salesforce internal claim) an engagement agent working previously ignored low-scored inbound leads generated over $100M pipeline in 8 months. Send below-cutoff leads to an agent lane, not discard. [#1951]

## Source
creator-radar review 2026-10-11, cards from Supabase insight_cards: [#416 #1299 #1851 #1565 #1767 #1652 #1672 #1951].
