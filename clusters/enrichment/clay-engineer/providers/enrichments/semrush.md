# SEMrush — Clay Integration

Primary web traffic enrichment. All actions run on Clay credits — no own API key needed.

**Always use SEMrush over SimilarWeb** for web traffic enrichment. SimilarWeb's "Get monthly website visits" action requires own API key — SEMrush runs fully on Clay credits at 2–3 cr/row.

---

## Actions

| Action | Cost | Use |
|---|---|---|
| Get traffic analytics | 2 cr/row | Monthly visits, traffic trend — primary filter for scale qualification |
| Get competitors in paid search | 2 cr/row | Competitor domains in paid search |
| Get company traffic sources | 3 cr/row | Breakdown: organic, paid, direct, referral, social |
| Get company website traffic's geographic distribution | 3 cr/result | Traffic split by country |
| Get company top pages | 3 cr/row | Most visited pages on the domain |
| Get company social media engagement | 3 cr/row | Social engagement metrics |

**Required input for all actions:** Company domain

---

## Primary Use Cases

**Scale qualification filter:**
Use "Get traffic analytics" (2 cr/row) as the monthly traffic threshold for ICP qualification — e.g. companies with >10k monthly visitors. This signals market presence without needing revenue data (which is unreliable).

**Paid search intent signal:**
Use "Get company traffic sources" to identify companies investing heavily in paid search. High paid search investment = active growth motion = higher buying intent.

**Competitor intelligence:**
Use "Get competitors in paid search" to find who a prospect is competing against on paid ads.

---

## When to Gate SEMrush Behind ICP Qualification

At 2–3 credits per row, SEMrush should always run after free qualification gates, not before. Always apply ICP qualification formula first, then run SEMrush only on qualified companies.

```
Run if:
1) Domain is not empty
AND
2) ICP Qualified = TRUE
```
