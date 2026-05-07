# Enrich Person — Clay Native Integration

**Required inputs:** At least one of: Business Email OR LinkedIn URL (both optional — provide one or both)
**Connect:** Clay-managed (Clay credits)
**Cost:** 1 credit per row

---

## Inputs

| Input | Required | Notes |
|---|---|---|
| **Business Email** | Optional (1 of 2) | Work email address |
| **LinkedIn URL** | Optional (2 of 2) | Person's LinkedIn profile URL |

At least one input must be provided. When both are provided, match rate is highest. When only one is available, Clay still attempts the lookup — email alone or LinkedIn URL alone both work.

---

## What It Returns

- Current job title
- Company name
- Location
- LinkedIn profile data
- Employment history

---

## Primary Use Case — Title Enrichment for Signal Workflows

When processing inbound signal data (Warmly, RB2B, LinkedIn engagement) where many rows arrive without a job title:

1. Run Enrich Person on rows missing a title
2. Use the returned title to populate a Unified Job Title column
3. Gate all downstream qualification on the Unified Job Title

**Conditional run:**
```
IS_EMPTY({/Title/})
```

Provide both inputs when available to maximise match rate:
- **Input 1:** `/Business Email/`
- **Input 2:** `/LinkedIn URL/`

---

## When to Use vs Other Options

| Scenario | Use |
|---|---|
| Need current job title for a person you have email/LinkedIn for | **Enrich Person** |
| Need to find contacts at a specific company by title | **Apollo: Find people at company by job title** or **Find People** |
| Need full company enrichment (headcount, industry, funding) | **Enrich Company** (separate integration) |
| Need to verify/find email addresses | **Email waterfall** (FindyEmail → Icypeas → etc.) |

**Do not confuse with Apollo's "Enrich person" action** — Apollo's version is not used in standard workflows. This is Clay's native Enrich Person integration.
