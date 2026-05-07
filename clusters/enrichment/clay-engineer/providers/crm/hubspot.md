# HubSpot — Clay Integration

## Overview

Most common CRM for SMB/Mid-Market. Always ask which CRM the client uses before building any workflow — field names, actions, and upsert logic differ.

---

## HubSpot Actions in Clay

- Lookup Company (by domain)
- Lookup Contact (by email, LinkedIn URL, or name)
- Create Company
- Create Contact
- Update Company
- Update Contact
- Upsert (create if not exists, update if exists)

---

## Core Workflow Pattern — Database List Builds

**Company Level:**
1. Lookup CRM Company by domain
2. If found → update relevant fields
3. If not found → run company qualification
   - If not qualified → stop
   - If qualified → create new company

**Contact Level:**
4. Lookup CRM Contact using best available match key
5. If found → update relevant fields
6. If not found → create new contact

---

## Core Workflow Pattern — Signal Workflows (Warmly, RB2B, LinkedIn Engagement)

**CRM lookup is always the FIRST enrichment step whenever the contact may already exist in the CRM.** Do not spend credits enriching or qualifying a contact who is already in the CRM. The order is:

1. **CRM Contact Lookup (by email)** — FIRST, before any enrichment
2. If found → update signal fields (Last Source, timestamp, pages viewed) → optionally notify sales rep → **stop** (do not re-enrich or re-qualify)
3. If not found → proceed with enrichment and qualification pipeline:
   - Enrich Person (title, company data) → Title Qualification → Company Qualification → Create Contact

**Why this order matters:** Signal workflows process high volumes of repeat visitors. Running title enrichment, company qualification, and other paid steps before checking CRM wastes credits on contacts your team is already working. CRM lookup is free or near-free — always gate everything behind it.

**Conditional run for all enrichment steps after CRM lookup:**
```
IS_EMPTY({/HubSpot Contact/})
```
This ensures enrichment, qualification, and create steps only run on contacts NOT already in the CRM.

---

## Match Keys — Priority Order

| For | Match key | Notes |
|---|---|---|
| Company lookup | Domain / Website URL | Always use domain — never company name alone |
| Contact — work email available | Work email | Most reliable |
| Contact — LinkedIn available | Name + LinkedIn URL | Second most reliable |
| Contact — name + company only | Name + Company | Use when no email or LinkedIn |
| Contact — LinkedIn-sourced | LinkedIn Profile URL | Always use for LinkedIn-sourced contacts |
| Contact — personal email only | Personal email | Weakest — only use as last resort |

**CRM company lookup always uses domain as match key — never company name alone.**

---

## Conditional Run Formulas

**Company Lookup:**
```
Run if Company Domain is not empty
```

**Contact Lookup:**
```
Run if CRM Company Result is not empty
```
(Never add a domain check here — domain was already validated in the company lookup step)

**Update existing record:**
```
Run if CRM Contact Result is not empty
```

**Create new record:**
```
Run if CRM Contact Result is empty
```

---

## Always Try to Create Contact Even Without Email

If work email is found → create contact with email.
If work email NOT found but LinkedIn is available → still create the contact (without email). LinkedIn URL alone is enough for CRM tracking. Never skip CRM create just because email is missing.

---

## Last Source Field

Always set Last Source (or equivalent custom field) on every CRM create and update:

| Signal | Last Source value |
|---|---|
| Website visitor | "Website Visitor" |
| LinkedIn connection | "LinkedIn Connection" |
| Job posting | "Job Posting Signal" |
| LinkedIn post mention | "LinkedIn Post Signal" |
| LinkedIn engagement (others' content) | "LinkedIn Engagement Signal — [Creator Name]" |
| LinkedIn engagement (own content) | "LinkedIn Engagement Signal — Own Content" |

---

## Warm Lead Fields (LinkedIn Engagement — Own Content Only)

When a contact engages with your own LinkedIn content and is ICP-qualified, set these additional CRM fields:
- **Warm Lead** = Yes
- **Warmth Score** = Hot (comment) / Warm (INTEREST reaction) / Mild (LIKE)
- **Engagement Topic** = topic from Claygent analysis

---

## Company Qualification Before Create

Before creating a new company in CRM, always qualify it first. Build as a free Clay formula column:
```
IF Industry is one of the following AND Employee Count is between X and Y AND Location is in [list] THEN "Qualified" otherwise "Not Qualified"
```

Or use Claygent (Create or Modify Content) if qualification requires analysis beyond simple field matching.

---

## Full HubSpot Action List in Clay

From Clay's enrichment catalog:
- Get Company
- Get Contact
- Create Company
- Create Contact
- Update Company
- Update Contact
- Get Association Labels
- Associate Records
- Get Deal
- Create Deal
- Update Deal
