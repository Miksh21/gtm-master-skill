# Swan external takes — content-marketing (Unvalidated)

## When to load
Only on a request for alternatives, a pushback on a canonical SEO/content position, or a deliberate second-opinion check (gtm-master SKILL.md step 5). Topics: repeat-run SEO deltas, SERP-validated content gaps, competitor hub detection, AI-visibility metrics, GEO block sizes, technical site audit. Always attribute; never present as gtm-master doctrine.

## Unvalidated — external, not yet run by Jan
> Filed by the Swan radar from third-party skills. Attributed; NOT gtm-master doctrine.
> A bullet moves into the body above only after it has been run in a real campaign and worked.

### SEO intel
- Delta discipline for repeat runs: dated append-only snapshot per domain; last run >14 days = full baseline, within 14 days = delta mode, same day = ask first. Key findings by page_url|rule_id into New / Worsened / Unchanged / Resolved; exec summary shows only New + Worsened, resolved count as wins. Rank moves: |Δ|>=5 major, 2-4 notable, <=1 stable, plus new entry/drop-out; first-run rows are BASELINE, never NEW. [alon-goldenberg/seo-intel]
- Content gaps validated against the SERP in two passes: pass 1 light sweep of every gap for competitor presence; pass 2 only on confirmed gaps, capturing AI Overview, snippet, PAA. Strength from competitor rank (top 10 = 3, 11-20 = 2, else 1); effort from competitor word count (<1.5k = 1, 1.5-3k = 2, 3k+ = 3, +1 if hub page); "thin" = own coverage <30% of the best competitor's words; <50% gaps validated = say so in the TL;DR. Gaps still pass the account-context filter of seo-topic-pipeline.md first. [alon-goldenberg/seo-intel]
- Honest hub detection in competitor teardown: count only body anchors between H1 and the first footer marker; drop anchors present on >80% of pages; a hub = 3+ same-theme pages linking to it by exact normalized URL (never substring); strip boilerplate H2s (conclusion, FAQ, TL;DR) before clustering. Delta triggers: 3+ pages under a new theme, blog velocity ±30%, keyword-rich anchor ratio moving >10 points. [alon-goldenberg/seo-intel]
- AI-visibility metrics missing from aeo-measurement-system: citation rate = domain citations / brand mentions (many mentions, few citations = discussed but not linked, fixable); share of AI voice with zero-division read as "space may not trigger AI answers yet"; common-word brand guard (count a mention only with a domain term within 5 words or a cited domain); "no AI answer" logged as an early-positioning opportunity. [alon-goldenberg/seo-intel]
- (single-case: Princeton GEO study priors, not re-tested) GEO boosts: cite sources +40%, statistics +37%, expert quotes +30%, keyword stuffing −10%; apply the 3-4 most relevant per page. Self-contained blocks: 134-167 words for AI citation, 40-55 for snippet/PAA, <30 for voice; format chosen from SERP features; organic top-5 pages supply ~80% of AI Overview citations. [alon-goldenberg/seo-intel]
- Technical site audit (gtm-master has none): seven categories (meta, headings, JSON-LD, internal links, content quality with 4-gram shingle Jaccard >0.9 = duplicate, technical, observed CWV); tag every finding [C] confirmed / [L] likely / [H] hypothesis (CWV always [H]); a rule firing on >10% of pages goes up one severity; grade A = 0 critical and <=2 high, F = >5 critical. [alon-goldenberg/seo-intel]

## Source
swan-gtm/gtm-skills (alon-goldenberg/seo-intel) · MIT · filed 2026-09-28 · reviewed 2026-10-01
