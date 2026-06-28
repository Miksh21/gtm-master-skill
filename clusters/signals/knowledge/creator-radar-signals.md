# Creator-Radar Signals — 2026 Field Tactics

## When to load
Sourcing/acting on buying signals in 2026: competitor-intel mining, engager-to-audience pipelines, LLM-extracted feature signals, event-driven enrichment, signal-to-pipeline-stage scoring, signal-gated calls. Complements `signal-scoring.md` and `signal-taxonomy.md`. Triggers: "signal stacking", "intent-triggered", "post engagers", "awareness scoring", "warm calling signal", "signal taxonomy 2026".

## Primary-research signals (humans as the source)
- **Ex-competitor-employee DM play.** Founders/leaders DM recently-departed competitor employees for unfiltered market intel — they speak candidly about pain, gaps, buyer behavior with no NDA pressure. Cheap primary research on competitor weakness. [#135]

## Engagement-as-signal pipelines
- **Filter viral-post engagers through Clay by ICP**, then build (a) lookalike ad audiences and (b) outbound lists from the qualified subset. Engagers are platform- AND brand-aware — a tighter signal than website visitors. [#177]
- **LinkedIn-engager → meeting, 7-step:** Apify export engagers → Clay enrich + ICP tier → email waterfall (Wiza → Prospeo → LeadMagic → FullEnrich) → signal-layered outreach by tier. Turns organic content into a structured warm pipeline, not cold lists. [#66]

## LLM-extracted & event-driven signals
- **Boolean/labeled feature extraction.** Run LLM pipelines over unstructured data (call transcripts, blogs, LinkedIn posts) to mint queryable columns (e.g. "is this company evaluating Snowflake's semantic layer?"), then join back to a structured CDP for precision targeting + personalization. [#192]
- **Agentic web-search monitors triggered by CRM events** (e.g. Profound-class tools) auto-enrich accounts and alert reps when a *named individual* acts on LinkedIn. Keeps accounts live with no manual research; individual-comment granularity is newly reliable in 2024-25 tooling. [#193]
- **Unify signals inside the rep's execution tool.** Push external CDP signals via API into Apollo/Amplemarket so first- and third-party intent surface in one UI — no context switching, reps act faster. [#197]

## Signal → pipeline-stage scoring (Awareness ladder)
- **5-stage awareness model:** Identified → Aware → Interested → Considering → Selecting, rolled up from stacked signals. Translates raw signal scores into a stage framework reps act on directly; maps each stage to automatic cross-channel switches (content / outbound / ads) via 1st- and 2nd-party signals — a systematic retargeting engine, not ad-hoc follow-up. **Aware→Interested is the goldmine sub-stage most teams miss.** [#34 #40 #39]
- **2026 signal taxonomy:** 1st/2nd/3rd-party categories, 20+ sub-types, a named tool stack per sub-type — use as a vendor shortlist and a reusable mental model for signal-strategy design. Claim: signal campaigns outperform cold outbound by 3-5x. [#43]

## Signal-gated calling & coordinated pre-heat
- **Signal-triggered cold calls** (content engagement, lead-magnet download, pricing-page visit) hit **15-25% reply vs 3.43% raw cold email**; the signal is the warm opener that qualifies the list before dialing. (Baseline: 1 cold call in 37 books a meeting.) [#68]
- **PLG signal triangulation:** engineer signs up → outreach the engineer AND the org's decision-makers → warm DMs + ads BEFORE the SDR call. Three coordinated plays (PLG signal + org expansion + ad warming) pre-heat the buying committee before any cold touch. [#109]
- **ICP-matched proof, always.** In signal/warm outbound, anchor credibility with the case study closest to the target's segment/industry/use case — bespoke proof reads as evidence, generic proof reads as a sales asset. Relevance is the multiplier. [#115]

## Source
creator-radar 2026-06; card ids in [#135 #177 #66 #192 #193 #197 #34 #40 #39 #43 #68 #109 #115].
