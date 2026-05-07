# Email Finding & Waterfall

## Work Email Waterfall (Clay Native — Primary Approach)

Clay has a native **Work Email** enrichment that is a pre-built multi-provider waterfall. All providers are included, draggable, and toggleable. This is the standard approach.

**Mandatory inputs — must be present in the table before running:**
- Full name (or split first name + last name)
- Person's LinkedIn URL
- Company domain

All three are required. Missing any one significantly reduces match rates. Enrich and normalise these fields before running the waterfall.

**How it works:** Open the Work Email enrichment → drag providers into the correct order → toggle off providers you don't want → Save. The estimated average cost per row is shown at the bottom before saving.

**Expected coverage:** 80%+ with a well-configured waterfall vs 40-50% with a single provider.

---

## Provider Order Logic

**Never specify provider names in workflow specs.** Always describe the logic:

1. **First** — any provider the client has their own API key for (cheapest of those first, most expensive last)
2. **Then** — remaining providers without own API key, ordered cheapest to most expensive by Clay credit cost
3. **Toggle off** any provider the client has no API key for AND that requires own API key with no Clay-managed option

The client configures the actual providers based on what API keys they have. The logic is always the same: own API keys first (ordered by cost), then Clay-managed providers (ordered by cost).

---

## Standard Waterfall Order

| Position | Provider | Notes |
|---|---|---|
| 1st | FindyEmail | Partnership — always first |
| 2nd | Icypeas | Cheapest (0.5 cr) and accurate — always second |
| 3rd+ | Other providers in ascending cost order | |

When a client has no API keys connected: FindyEmail still goes first (Clay-managed). Icypeas second. Apollo drops out (requires own API key — no Clay-managed option).

---

## Provider Reference

| Provider | Cost | Connect | Notes |
|---|---|---|---|
| **Icypeas** | 0.5 cr | Own API key | Cheapest. Always include. Also does phone, LinkedIn URL finding, email validation (0.1 cr) |
| **FindyEmail** | 2 cr | Own API key preferred / Clay-managed available | Highest match rate per cost.  |
| **Leadmagic** | 1 cr email / 6 cr mobile | Own API key | Email at 1cr is cost-competitive. Mobile at 6cr only when phone is explicitly needed. |
| **Dropcontact** | 2 cr | Own API key / Clay-managed | Includes validation status inline — no separate validation step needed for rows it finds. |
| **Prospeo** | 2 cr | Own API key preferred | Accepts LinkedIn URL as alternative input — useful when domain is unclean. |
| **Hunter** | 2 cr | Own API key preferred | Has a free tier (own API) — if client has no other email API key, easiest free starting point. |
| **Nimbler** | 2 cr | Own API key preferred | Deep fallback for contacts other providers missed. |
| **Enrow** | 2 cr / 1 cr validation | Own API key | Alternative primary provider — test coverage against your ICP before committing. |
| **Apollo.io** | Own API | Own API key (no Clay-managed) | Large database, often catches records others miss. Same API key as Apollo people search. |
| **PeopleDataLabs** | Own API | Own API key (no Clay-managed) | Returns most data (job history, skills, education) but expensive. Include only if client has API key. Position last. |
| **Wiza** | Own API | Own API key | Requires LinkedIn URL — good for LinkedIn-sourced lists. |
| **BetterContact** | Own API | Own API key | Deprioritised — covered by FindyEmail + Icypeas at equal quality. Only keep if client already has it. |
| **Datagma** | Own API | Own API key | Deprioritised — covered by other waterfall providers. Also finds phone numbers. |

---

## Email Validation

**Always validate as part of the waterfall, before pushing to Instantly or any sequencer.** Do not send to unvalidated emails — damages sending reputation.

Clay's Work Email waterfall includes a mandatory validation step.

| Provider | Cost | Notes |
|---|---|---|
| **Icypeas Verify** | 0.1 cr | Cheapest validation in Clay. Default option. |
| **ZeroBounce** | 1 cr | Primary when client has no own validation API key |
| **Debounce** | 1 cr | Alternative to ZeroBounce — same quality, same cost |
| **NeverBounce** | Own API | Use when client has own NeverBounce API key |

**Apollo is never a valid choice for validation** — its validation is not accurate, regardless of whether an API key is connected.

---

## ContactOut — Converting Email to LinkedIn URL

**The use case:** email → LinkedIn profile URL. Works reliably for both personal/generic emails (gmail, yahoo, etc.) AND corporate/work emails.

- **Action:** Find professional URL from personal email
- **Input:** Email (personal or work)
- **Returns:** LinkedIn profile URL
- **Cost:** 4 credits/row
- **Account:** Clay-managed ContactOut - Social URL account

Despite the action name saying "personal email", ContactOut performs well on work emails too. This makes it the universal email → LinkedIn URL resolver — use it whenever you need a LinkedIn profile from any email type.

This is ContactOut's only valuable action in Clay workflows. Actions 2 and 3 (find personal email from LinkedIn, find mobile from LinkedIn) have cheaper alternatives and should not be the default.

---

## LinkedIn URL Finding (for Contacts)

When you have **company domain + full name** available:

**Primary — Claygent Web Research (GPT-4.1 Mini):**

```
You are a research agent. Your task is to find a person's LinkedIn profile URL.

You have the following information:
- Full Name: {Full Name}
- Company Domain: {Company Domain}
[OPTIONAL: - Job Title: {Job Title}]

Step 1: Find the company's LinkedIn page URL from the domain {Company Domain}. Search for "[Company Name] LinkedIn" or go to linkedin.com/company/[slug].

Step 2: Using the company LinkedIn page as context, search for {Full Name} at that company on LinkedIn.

Return the following:
- LinkedIn Profile URL: the full https://linkedin.com/in/... URL
- Confidence: High / Medium / Low
- LinkedIn Found: output Yes or No only

If you find more than 1 matching profile, output "Multiple Results Found" for LinkedIn Profile URL and No for LinkedIn Found.
If no match found, output "Not Found" and No for LinkedIn Found.
```

Conditional run:
```
Run if:
1) Full Name is not empty
AND
2) Company Domain is not empty
AND
3) LinkedIn Profile URL is empty
```

**If Job Title is available → always pass it to Claygent** — dramatically reduces ambiguity for common names.
**If more than 1 result found → output "Multiple Results Found"** — name alone is too ambiguous to proceed.

**Secondary — Datagma:** Fallback if Claygent is unavailable or returning poor match rates for a specific dataset. Requires own API key.
