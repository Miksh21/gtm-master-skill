> Source: swan-gtm/gtm-skills (yahav-fuchs) · MIT · imported 2026-07-28 · external content, unreviewed

# Task: Run an AEO Audit

Establish an AI-visibility baseline for a brand, or trace an existing score's movement down to the raw AI answers behind it. Ends in a defensible readout plus a ranked content hit-list.

## When to use this

User asks "do we show up in ChatGPT/Perplexity answers", "track our AEO score", "why did our AI visibility drop", "prove this visibility number", or "where should content effort go for AI visibility". Two modes:

- **Baseline mode**: no measurement exists yet.
- **Investigation mode**: a score exists and moved, or looks wrong.

## Inputs required

- **Brand** (name, domain) and **named competitors** (2-5)
- **Topics**: the commercial question clusters that matter (category, use cases, comparison sets)
- **Target engines and countries**
- **Tool access**: any AI-visibility tracker with per-scan raw answers, or a manual prompt panel run on a schedule. No raw answers = no audit; stop and fix tooling first
- Investigation mode only: **the period and the reported score movement**

### Zero-tool option: the manual prompt panel

A pre-launch brand needs no paid tracker to start. Build the panel once and run it on a fixed schedule:

- 10-30 prompts per topic, buyer language, frozen between runs (changes = new version, note it)
- Same engines, same countries, every run; log per scan: date, prompt, engine, country, brand mentioned (y/n), competitors mentioned, citations (URLs), and the full raw answer text saved verbatim
- Weekly cadence is enough to see movement; the saved raw answers are what make later audits possible

This IS the tool for the process below; "pull the scans" then means "read the log".

## Process

Full system context: `clusters/aeo-reddit/knowledge/aeo-measurement-system.md`. Supply-side fixes: `reference/aeo-and-ai-buyer-discovery.md`.

### Baseline mode

1. Define brand + competitors + topics.
2. Seed prompts per topic in buyer language: "best X for Y", "X vs Z", "how do I solve W". Buyer words, never marketing vocabulary. Spread across all target engines and countries.
3. Run the scans; pull the visibility timeline and brand ranking.
4. For each topic, pull the three readouts together: visibility explain, citations and sources, sentiment explain.
5. Run the citation drill-down: domains → URLs → full answers. Do not stop at domains; concentration on single URLs is the finding.
6. Build the hit-list: 5-10 URLs ranked by citation count × plausibility of earning a brand mention, with the concrete action per URL.

### Investigation mode (the three-step drill)

1. **Check the analysis version first.** If the methodology version changed inside the window, the "trend" is probably an artifact. Report that and stop or re-window.
2. **Aggregate**: pull the headline number for the period (visibility %, mention count, total scans, average sentiment).
3. **Decompose**: split by engine, country, and topic. Find which scans flipped. Score drops usually localize to one engine, one country, or one topic.
4. **Inspect**: for every surprising scan, pull the raw AI answer text, extracted fields, and citations. Name what changed ("engine X stopped citing the comparison page for prompt Y").
5. If citations shifted, run the drill-down on the new citation mix and refresh the hit-list.

## Output format

```
AEO audit: [brand] | [baseline | investigation]
Period: [dates] | Engines: [list] | Countries: [list]
Analysis version consistent: [yes / NO, findings invalid across boundary]

PER TOPIC
Topic: [name]
Visibility: [brand X% vs competitor A Y%, competitor B Z%] | Trend: [direction]
Driven by: [named prompts + engines]
Sentiment when visible: [one line]
Top cited sources: [domain | count | type]

[Investigation mode only]
SCORE MOVEMENT
Headline: [from → to]
Localized to: [engine / country / topic]
Scans that drove it: [ids or prompts]
Raw-answer evidence: [quote or paraphrase per contested scan]

HIT-LIST (ranked)
1. [URL] | [citation count] | cited for [what] | action: [earn listing / update thread / build comparison page]
...5-10 entries

NEXT ACTIONS
[one concrete content action per gap, owner, re-scan date]
```

## Pass criteria

- Prompts are in buyer language; a buyer would actually type them
- Every reported score has its explain and its cited sources attached
- Analysis-version consistency checked before any trend claim
- Score movement (if any) is named to specific scans, engines, countries
- Hit-list reaches URL level, 5-10 entries, one action each
- Per-engine and per-country splits reported, not just the aggregate

## Common failures

- **Explaining a movement from the aggregate**: per-engine and per-country moves cancel out and hide the story. Decompose first, always.
- **Trend read across a methodology-version boundary**: the classic false alarm. Version check is step one.
- **Strategy from domain aggregates**: "review sites matter" is not actionable. Drill to the URL that owns the answer.
- **Prompts in brand language**: measures nothing buyers ask. Re-seed.
- **Stale prompt panel**: buyer language drifts; refresh prompts each quarter or the panel measures old questions.
- **Disputing a scan without reading the raw answer**: the raw answer settles it, not a guess.

## What to do after

- Reddit URLs in the hit-list → run `clusters/aeo-reddit/tasks/research-subreddits.md` on those communities; the earn-the-citation motion is `clusters/aeo-reddit/knowledge/reddit-gtm-system.md`
- Own-site gaps (missing comparison page, unreadable docs) → supply-side plays in `reference/aeo-and-ai-buyer-discovery.md` (llms.txt, markdown endpoints, comparison pages)
- Schedule the re-scan before closing; the loop only proves itself on the second measurement
