> Source: swan-gtm/gtm-skills (yahav-fuchs) · MIT · imported 2026-07-28 · external content, unreviewed

# AEO Measurement System: Visibility Tracking, Score Audits, Citation Mining

How to measure whether AI answer engines (ChatGPT, Perplexity, Claude, Google AIO) mention your brand, prove why a score moved, and mine the citations behind the answers into a content strategy.

**Scope split:** `reference/aeo-and-ai-buyer-discovery.md` covers the supply side (llms.txt, markdown endpoints, comparison pages, build-gate validation) and the market context. This file covers the demand side: the measurement loop that tells you whether any of that is working and where to aim next. Load both when doing full AEO work.

## 1. The measurement loop

```
seed prompts → scan engines → read visibility + explain → mine citations
→ pick content targets → ship content → re-scan → compare
```

Never run content effort without the loop. An AEO motion without measurement is guessing; a score without an explain is a number nobody can defend.

## 2. Set the baseline

1. **Define the brand AND competitor brands.** Ranking against named competitors is the readout that lands with stakeholders. Solo visibility numbers have no reference point.
2. **Define topics.** One topic per commercial question cluster (category, use case, comparison set).
3. **Seed prompts in buyer language, not brand language.** Use the questions buyers actually type into an AI engine:
   - "best X for Y"
   - "X vs Z"
   - "how do I solve W"
   Written in the buyer's words, never the category's marketing vocabulary. Batch-create prompts per topic.
4. **Spread across target engines and countries.** Visibility in one engine says nothing about another. Per-country results diverge. Both splits must exist in the data from day one.
5. **Read the baseline:** visibility timeline plus brand ranking. Who gets mentioned, for what, where.

**Prompt drift:** buyer language evolves. Refresh seeded prompts periodically or the panel measures yesterday's questions.

## 3. Read the results

Three readouts per topic, always together:

| Readout | What it tells you |
|---|---|
| **Visibility explain** | Why the score moved: which prompts and engines drove it |
| **Citations and sources** | The actionable half: which domains, URLs, and domain types the engines cite for these prompts. This is the target list. If engines cite three Reddit threads and two comparison posts for the category, that is where content effort goes |
| **Sentiment explain** | How the brand is characterized when it does appear. Visible-but-mispositioned needs different work than invisible |

Report per topic: visibility vs named competitors, trend, top cited sources, one concrete content action per gap.

**Rules:**
- MUST seed prompts in buyer language, not brand language.
- NEVER report a score without its explain and its cited sources. An unexplained number invites wrong conclusions.

## 4. Score audit: the three-step drill

Run when a visibility score moves unexpectedly, a stakeholder wants receipts, or a scan result looks wrong. Never explain a score movement from the aggregate alone: decompose first.

1. **Aggregate.** Pull the top-level number: visibility percentage, mention count, total scans, average sentiment for the period.
2. **Decompose.** Break the score into its component scan results: which scans registered a brand mention and which did not. Score drops usually localize here. One engine, one country, or one topic did the damage, not "the brand".
3. **Inspect.** For any surprising scan, pull the full record: the raw AI answer text, every extracted field, every citation found. This is where "we lost visibility" becomes "engine X stopped citing the comparison page for prompt Y".

### Methodology version check

Every scan result carries an analysis version. Before reading any long-term trend, confirm the version is consistent across the window. A methodology change explains a score shift that has nothing to do with the brand's actual standing. Version-boundary comparisons are the classic false alarm.

### What the audit is for

- **Discrepancy resolution:** why a scan hit or missed, settled with the raw answer, not a guess.
- **Competitor verification:** confirm how rivals actually appeared in the same answers before repeating a claim.
- **Client or stakeholder reporting:** an auditable derivation of every headline number. Scores that cannot show receipts do not survive a procurement review.

### Audit rules

- MUST verify analysis-version consistency before interpreting any trend.
- MUST inspect raw answers before disputing or explaining an individual scan.
- NEVER report a score movement without naming which scans drove it.
- The overlooked failure: averaging over the split that matters. Per-engine and per-country movements cancel out in the aggregate and hide the real story.

A defensible audit answers "why did the number move" with named prompts, engines, and cited (or newly missing) sources, and quotes the raw answer for every contested scan.

## 5. Citation drill-down: three levels

Run when citation data needs to become a content strategy. Work top-down; never stop at the domain level.

### Level 1: domains

Pull the domains that co-occur with the brand in AI answers, with citation counts and type (review site, competitor, news, community). This gives the shape: "a review platform appeared in 38 citations across answers mentioning the brand last week" tells you which kind of property owns the category's answers.

### Level 2: URLs

Drill into each heavyweight domain for the specific pages driving its citations. **Concentration is the finding:** one competitor comparison post out-citing every other page on its domain 14-to-1 means that single page, not the domain, owns the answer. Capture scan identifiers for level 3.

### Level 3: full answers

Open the complete AI responses behind the key citations: answer text, engine, brand sentiment, and how the citation is actually used. This is where you learn whether a cited page is quoted for its comparison table, its pricing, or its one-line verdict, which dictates what a competing page must contain.

## 6. Turn citations into strategy

- **Competitor intelligence:** heavily-cited competitor content reveals the structure AI engines prefer. Reverse-engineer the format, not just the topic. (This matches the comparison-page play in `reference/aeo-and-ai-buyer-discovery.md`: detailed LLM-visibility comparison pages drive organic AI citation.)
- **Content targets:** high-citation third-party properties (review sites, community threads) are where presence is earned. Rank them by citation count × plausibility of getting the brand added.
- **Reputation watch:** new domains entering the citation mix signal category coverage shifting before any score moves.

**Deliverable, always:** a hit-list of 5-10 URLs with citation counts, what each is cited for, and the concrete action per URL (earn a listing, update the thread, build the missing comparison page).

**Rules:**
- MUST drill to the URL level before recommending any content action.
- NEVER build strategy from domain aggregates alone. "Review sites matter" is not actionable; "this one comparison post drives 14× the citations" is.

Success criterion: content effort lands on pages that measurably enter the citation mix next period.

## 7. The Reddit connection

Citation mining routinely surfaces Reddit threads among the top cited sources for commercial prompts. When it does, the content action is not a blog post: it is earned participation in those threads and communities. That work has its own discipline. Load `clusters/aeo-reddit/knowledge/reddit-gtm-system.md` for the motion and `clusters/aeo-reddit/knowledge/reddit-account-safety.md` before touching any account.

## 8. Tooling note

The source workflows ran on a vendor CLI (ReddGrow's AEO module: brands, topics, prompt batches, visibility timelines, citation and sentiment explains). The system above is tool-agnostic: any AI-visibility tracker that stores per-scan raw answers works, and a manual prompt panel (same prompts, same engines, run on a schedule, results logged with dates and raw answer text) covers a pre-launch product at zero tool cost. The non-negotiable capability whatever the tool: access to the raw answer text per scan. Without it, the audit drill and level 3 of the citation drill are impossible, and every score is unfalsifiable.
