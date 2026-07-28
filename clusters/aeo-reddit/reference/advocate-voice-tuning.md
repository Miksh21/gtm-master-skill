> Source: swan-gtm/gtm-skills (yahav-fuchs) · MIT · imported 2026-07-28 · external content, unreviewed

# Advocate Voice Tuning

How to make AI-drafted Reddit comments sound like the person they are supposed to be and get the product facts right. Two levers: teach the voice by rewriting sample drafts, and feed a tight knowledge base. Use when drafts feel off-brand, when a new persona spins up, or when drafts get product details wrong.

## 1. Teach the voice by rewriting

Take a handful of real drafts (five is enough) and rewrite each the way you would actually say it, or approve the ones that already sound right. Even 2-3 rewrites carry useful signal. The deltas between draft and rewrite become explicit voice guidelines across five dimensions:

| Dimension | What the delta reveals |
|---|---|
| Vocabulary | "uses" vs "leverages"; the words the person would never type |
| Sentence rhythm | Short and punchy vs long and qualified |
| Hedging style | "in my experience..." vs flat statements |
| Disclosure habits | How often and how directly affiliation gets mentioned |
| Comment structure | Empathy-led vs question-led vs statement-led |

### Do it well

- **Rewrite instinctively.** First-thought phrasing is the authentic signal; polished phrasing is not.
- **Rewrite from the Reddit post, not from the AI's draft.** Rewriting the draft anchors you to its structure and kills the signal.
- **Include your natural disclosure style in the rewrites.** Disclosure is part of the voice, not a compliance layer bolted on after.
- **Pick samples from varied subreddits** so the guidelines generalize instead of overfitting one community's tone.

### Worked delta example

Generic product, generic thread ("what should I use to dedupe our CRM?"):

| | Text |
|---|---|
| AI draft | "Great question! You should leverage a dedicated deduplication solution. Our platform offers robust matching capabilities that seamlessly integrate with your CRM." |
| Human rewrite | "We fought this for about a year. Fuzzy matching on company names is where most tools fall over, worth testing with your actual worst duplicates before buying anything. I work on a tool in this space (happy to say which if useful), but honestly the fix that helped most was tightening the intake form." |
| Extracted guidelines | Never "leverage", "robust", "seamlessly". Opens with lived experience, not praise of the question. Hedges ("about a year", "most tools"). Disclosure mid-comment, offer-shaped, not a link. Ends on advice that does not require the product |

That last guideline is the one extraction tends to miss and a human review catches: the willingness to give away the non-product answer is what makes the comment survive.

### Review the extraction

Review the extracted guidelines afterward and hand-edit what the extraction missed. MUST review and edit rather than trusting extraction blindly. Sessions accumulate: rerun after off-brand batches, after repositioning, or when spinning up a new persona.

### Session inputs and outputs

A voice session consumes: 5 recent drafts from varied subreddits, the person's rewrites or approvals of them, and any prior guideline set. It produces: an updated guideline set across the five dimensions, a banned-word list, and 1-2 disclosure phrasings in the person's own words. Store the output with the campaign so every future draft inherits it.

## 2. Feed the facts

Voice without facts still produces wrong comments. Attach a knowledge base per campaign:

- Product overview and differentiators
- Feature specifics
- Real use cases
- Pricing
- FAQs
- Tone examples

**Focus beats volume: a tight 5-page knowledge base on one product outperforms a 100-page dump.** The drafting engine retrieves only the chunks relevant to each thread, so padding dilutes retrieval.

Exclude:

- Raw code
- Image-dependent decks (images are not indexed, only surrounding text)
- Internal ops docs

**Refresh after every major release.** Stale knowledge produces confidently outdated drafts: the voice sounds right while describing last quarter's product. This is the most overlooked failure in the whole system, because nothing looks broken.

**One campaign per product** keeps retrieval clean. Mixing products in one knowledge base produces cross-contaminated drafts.

## 3. The improvement loop

1. Batch of drafts arrives.
2. Reviewer approves, rewrites, or skips each (rewrites feed section 1).
3. Off-brand batch → rerun a voice session. Wrong facts → fix the knowledge base, not the voice.
4. Track edits-per-approved-draft over time.

Diagnose by failure type before choosing the lever. Tuning the wrong one wastes the session:

| Symptom in drafts | Broken lever | Fix |
|---|---|---|
| Wrong rhythm, banned words, template feel | Voice | Rewrite session (section 1) |
| Wrong features, wrong pricing, outdated claims | Knowledge | Update the knowledge base (section 2) |
| Right voice, right facts, wrong thread fit | Neither | Targeting: revisit subreddit selection and draft relevance |
| Disclosure missing or clumsy | Voice | Include disclosure phrasing in the next rewrites |

## 4. Success criteria

- Drafts are indistinguishable from the person's own comments: same rhythm, same hedging, same disclosure habits.
- Factually current after every release.
- The reviewer approves drafts with fewer and fewer edits over time. Edits-per-draft trending down is the metric that says tuning worked.

## Rules

- MUST review and hand-edit extracted voice guidelines; never trust extraction blindly.
- MUST refresh the knowledge base after major product changes.
- NEVER pad the knowledge base with content that does not help answer a buyer's thread.

## Cross-references

- Draft approval loop and daily caps: `clusters/aeo-reddit/knowledge/reddit-gtm-system.md` sections 4-5
- Per-comment compliance before anything posts: `clusters/aeo-reddit/knowledge/reddit-account-safety.md` section 3
