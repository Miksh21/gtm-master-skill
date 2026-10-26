# External takes — aeo-reddit (Swan radar, UNREVIEWED)

## AI Visibility Prompt Research — swan-gtm/gtm-skills/skills/elad-hefetz/ai-visibility-prompt-research · filed 2026-10-12
Source: https://github.com/swan-gtm/gtm-skills · cluster: aeo-reddit
- 🆕 new-angle: withhold the brand until the final pass; build non-branded category prompts first, then add branded prompts (alternatives, pricing, vs) as one isolated topic flagged is_branded, so branded rows never inflate category visibility.
- 🆕 new-angle: mine sales-call and pre-sales transcripts (after the open-web pass) as the highest-signal prompt source, and tag every prompt with provenance (social / keyword / sales_transcript / competitor / brand_page).
- 🆕 new-angle: write prompts as real questions ("what do teams use to see cloud cost per customer?"), not keyword strings ("best cloud cost tool 2026"); 4-7 personas, skew to consideration and decision stage; 60-200 prompts total.
- 🆕 new-angle: 2-4 engines per prompt, varied across the set (technical personas to research engines, exec to mainstream, "best/alternatives" to search-embedded); one language per row, regions limited to that language, translate never machine-localize; validate the file and hand off, never auto-import.
- ✅ supports [aeo-reddit/knowledge/aeo-measurement-system.md:22]: seed prompts in buyer language, never brand or marketing vocabulary.
Review: additive
Status: holding

## AI visibility sampling — swan-gtm/gtm-skills/skills/huxley-peckham/ai-visibility-sampling · filed 2026-10-26
Source: https://github.com/swan-gtm/gtm-skills · cluster: aeo-reddit
- 🆕 new-angle: never score from a single ask: ask every question at least 3 times per engine per measurement, keep each full answer verbatim and dated, and decide presence by majority vote with the vote count shown (3/3 and 2/3 are different facts; the margin is where next month's movement shows first).
- 🆕 new-angle: define three presence tiers before scoring and apply them mechanically: named as a recommendation, mentioned in passing, cited as a source; report the recommendation tier separately and never blend it, since it is the one that predicts buyers arriving (the gtm-master scan log records only brand mentioned y/n).
- 🆕 new-angle: the product is a question x engine grid with vote counts per cell, aggregate on top; a 0/3 to 3/3 flip is movement, a margin wobble is weather. Unstable (split-vote) questions are the undecided, winnable ones and become the work queue.
- ✅ supports [aeo-reddit/tasks/run-aeo-audit.md:26]: prompt set frozen between runs with changes versioned; swan adds that a changed set marks a series break with a restated baseline, never spliced into one trend line.
Review: additive
Status: holding
