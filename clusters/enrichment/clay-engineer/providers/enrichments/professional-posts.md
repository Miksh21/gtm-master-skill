# Professional Posts — Clay Native Integration

Clay's native family of enrichments for LinkedIn-style "professional posts" — fetching a person's posts, reactions, comments, shares, plus engagement on a specific post. Native means no Apify setup, no own API key, runs as a regular Clay enrichment.

**Pricing:** 0.5 credit/row or 0.5 credit/result depending on the action. Cheaper than Apify in almost every scenario.

**Why "professional posts" not "LinkedIn":** Clay can't use LinkedIn's brand name on the action labels. "Professional posts" = LinkedIn posts.

---

## When to Use Each Action

The Professional Posts family has both **Sources** (create new tables from results) and **Enrichments** (add data to an existing row).

### Sources (create a new table)

| Action | Cost | Use case |
|---|---|---|
| **Find professional posts** | 0.5 / row | Search for posts matching a keyword, hashtag, or topic. Each post becomes a row. Use for sourcing engagement-based campaigns. |
| **Get interactions with professional posts** | 0.5 / row | Pulls all the people who liked, commented, or shared a specific post. Each engager becomes a row. Use for engagement-based targeting (e.g. people who engaged with a competitor's launch post). |

### Enrichments (add to existing row)

| Action | Cost | Returns | Use case |
|---|---|---|---|
| **Enrich professional post** | 0.5 / row | Post metadata — text, date, engagement counts, author | When you have a post URL and want details. |
| **Get a person's professional posts and shares** | 0.5 / result | Array of posts the person published or reshared, with text + dates + URLs | **Most common for personalization** — pull a contact's recent posts to write a tailored opener. |
| **Get a person's professional post comments** | 0.5 / result | Array of comments the person has made on others' posts | When you want to see what they engage with, not just what they post. |
| **Get a person's professional post reactions** | 0.5 / result | Array of posts the person has reacted to | Lighter signal than comments — shows what topics they care about. |
| **Get comments on a professional post** | 0.5 / result | Array of comments on a specific post | Engagement targeting — find everyone who commented on a launch post. |
| **Get reactions on a professional post** | 0.5 / result | Array of reactions on a specific post | Same as above but for likes/reactions instead of comments. |
| **Get shares on a professional post** | 0.5 / result | Array of users who reshared a specific post | Highest-intent engagement — these people put it on their feed. |

---

## The Standard Personalization Pattern

For outbound campaigns where you want a "you've been posting about X" line:

1. **Get a person's professional posts and shares** — input: their LinkedIn URL or LinkedIn username. Configure to return last N posts (typically 10-20) within the last 60-90 days.
2. **Claygent (Create or Modify Content, ChatGPT 4.1 Nano)** — input: the posts array. Output: a one-line theme summary for use as `{{linkedin_topic}}` in the email copy. See `clay/claygent.md` → LinkedIn Post Theme Summary.
3. Use the output as a personalisation variable in Instantly / HeyReach.

**Cost per enriched contact:** 0.5 credit (posts fetch) + ~1 credit (Claygent summary) = **~1.5 credits/contact**. Compare to Apify (~5-10 credits equivalent + own API key setup).

**Always gate this behind a free filter — only enrich contacts that will actually receive an email.** Place this step AFTER the Sending Gate condition is mostly built (after email validation, after CRM dedup), so you don't burn credits on contacts who'll never be sent to.

---

## Engagement-Based Targeting Pattern

For sourcing campaigns based on who engaged with specific content:

1. **Get interactions with professional posts** (Source) — input: a specific post URL (e.g. a competitor's launch post, your CEO's viral post, a partner's announcement). Returns one row per engager.
2. Output rows have: engager name, LinkedIn URL, engagement type (like / comment / reaction emoji).
3. Run normal qualification and contact finding from there.

**Cost:** 0.5 credit per engager returned. Volume varies wildly — a viral post might return 1,000+ engagers, a niche post might return 20.

---

## Inputs Required

**Clay UI naming:** the input field is labeled **"Professional URL"** in every Professional Posts action. This is Clay's branding-safe label for **LinkedIn URL** — Clay can't use the LinkedIn name on action UI. Map your LinkedIn URL column to this field.

For person-level actions:
- **Professional URL** (= LinkedIn Profile URL, preferred) OR **LinkedIn Username** (the slug after `/in/`)
- Some actions also accept Full Name + Company Domain as a fallback, but match rate drops

For post-level actions:
- **Professional URL** (= LinkedIn Post URL) in the format `https://www.linkedin.com/posts/...`

---

## Date Filtering

Most person-level post actions support a date filter or a "last N posts" cap. Use it:
- **For personalization:** last 60-90 days. Older posts feel stale in cold copy.
- **For interest classification:** last 12 months. More signal, less stale concern since it's just for tagging.

If the contact hasn't posted in the last 90 days, the action returns an empty array — and your downstream Claygent summary should output "No recent activity" so the Sending Gate can drop them or fall back to another personalization angle.

---

## Common Gotchas

- **No LinkedIn URL = no posts.** You must enrich the LinkedIn URL first (via Clay Enrich Person or Claygent web research). FindyEmail and most email finders do not return LinkedIn URLs.
- **Empty arrays are valid output** — the contact exists but doesn't post. Handle with a Claygent fallback ("No recent activity") or a formula-column gate.
- **Costs scale per result, not per request.** "Get a person's professional posts and shares" at 0.5/result × 15 posts = 7.5 credits per contact. Cap the result count at 10-15 posts to control cost.
- **Rate limits.** Like all LinkedIn-derived data, scraping has limits. If you're enriching 1,000+ contacts, expect throttling and runtime measured in hours, not minutes.

---

## When NOT to Use This

- **You only have email, no LinkedIn URL, and don't want to enrich one.** Skip the LinkedIn personalization angle entirely. Use a different signal (recent funding, hiring activity, tech stack).
- **Your audience doesn't post.** Senior CFOs and operations leaders post less than CMOs and founders. If your fingerprint shows < 20% of contacts have posted in the last 90 days, the personalization variable will fall back too often. Use a different signal.
- **Tight budgets.** At 0.5-1.5 credits per enriched contact, this is cheap individually but adds up at 5,000+ contact volumes.
