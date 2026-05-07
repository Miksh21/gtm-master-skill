# Claygent Guide

Clay's built-in AI research agent. The most powerful enrichment tool in Clay for unstructured, open-ended research tasks. Combines web search, ChatGPT, and web scraping into a single tool — browses the web, finds public data, reports results.

Use Claygent when data doesn't exist in standard databases and you need real-time, nuanced information from the web.

## How to Access

1. Open a table
2. Go to the Enrichment panel (right side)
3. Select "Claygent" under the AI section

---

## 3 Use Cases — Always Specify the Correct One

| Use Case | When to use | Cost |
|---|---|---|
| **Web Research** | Claygent needs to visit external websites to find information | Higher — visits pages |
| **Create or Modify Content** | Works on data already in the Clay table — analysis, classification, scoring, text transformation | Lower — no web browsing |
| **Image Generation** | Almost never used in GTM workflows | — |

---

## Models — Always Specify

| Model | Use case |
|---|---|
| **GPT-4.1 Mini** | Web Research — visiting pages, fetching content |
| **ChatGPT 4.1 Nano** | Create or Modify Content — text analysis, classification, scoring (cheapest) |

**Rule:** Use the cheapest model that does the job. Advanced reasoning models are calibrated for solving calculus — Claygent prompts in GTM workflows are extraction, classification, and short summaries. Fix problems with better prompts, not more expensive models.

---

## Credit Cost

- Simple questions (yes/no, single lookup): 1 credit
- Deeper analyses (multi-page scraping, reasoning): 2-3 credits
- Always use conditional runs to gate Claygent on relevant signals (see below)

---

## Claygent vs Standard Enrichments

| Use Case | Use This |
|---|---|
| Email/phone/company data | Standard enrichments (Apollo, Prospeo, etc.) |
| Data exists in a database | Standard enrichments |
| Data doesn't exist in databases | **Claygent** |
| Need real-time web context | **Claygent** |
| Very specific/nuanced information | **Claygent** |
| Scraping a specific webpage | **Claygent** |

---

## The Prompt-Writing Process — Follow Every Time

Five steps. Skipping any one of them is the most common cause of bad Claygent output.

### Step 1 — Define the Objective

Ask: what should this column produce? Be specific about the type of output you need. A vague objective leads to vague output. Claygent does not know your intent unless you tell it explicitly.

- Bad: "Find info about this company"
- Good: "Find how many physical office or branch locations this company operates worldwide"

### Step 2 — Identify the Inputs

What data does Claygent need to complete the task? Pass as many **relevant** data points as possible — the more context Claygent has, the better and more accurate its output. But only pass variables that actually help with the specific task — irrelevant context is noise.

**Rules for inputs:**
- Always reference Clay variables explicitly using `{Variable Name}` syntax with exact column names
- Pass multiple relevant variables — not just Domain. If Claygent is researching a company, give it Company Name + Domain + LinkedIn URL. If researching a person, give it Full Name + Company Domain + Job Title.
- Only include fields with less than 20% nulls — if a field is mostly empty, don't reference it
- If a variable doesn't help Claygent complete this specific task, don't include it. More context = better results, but irrelevant context = noise.

**Common input combinations by task type:**

| Task | Relevant inputs |
|---|---|
| Company qualification (visit website) | `{Domain}`, `{Company Name}` |
| Find company info on the web | `{Company Name}`, `{Domain}`, `{LinkedIn URL}` |
| Find person's LinkedIn | `{Full Name}`, `{Domain}`, `{Job Title}` |
| Classify/score existing data | `{Description}`, `{Products and Services}`, `{Industry}` — whatever columns contain the data to analyze |
| Name normalisation | `{Full Name}` — only the field being cleaned |

### Step 3 — Generate the Prompt

Combine objective + inputs into a structured prompt. Every prompt must include:

1. **Role + objective** — what Claygent is and what it should do
2. **Input section** — all relevant `{Variables}` listed explicitly
3. **Instructions** — what to look for, where to search, how to evaluate
4. **Output format** — exact structure expected (Yes/No, number, category, sentence, list)
5. **Fallback instruction** — what to return when information is unavailable ("Unknown", "Not Found", "No", or use Eric Noski's "purple" trick — see Rule 3 below)

### Step 4 — Set Output Schema in Clay

After pasting the prompt into Clay, **do not run it yet.** Scroll down to the **Define Outputs** section below the prompt field. Click **JSON schema → Generate from prompt** → review the generated schema → confirm. This ensures Clay parses Claygent's response into structured columns rather than returning raw text. Always do this before running at scale.

### Step 5 — Test Before Running at Scale

Run the prompt on **at least 3 rows** and inspect the output before enabling it on the full table. Check:
- Is the output in the expected format?
- Are the results accurate for those test rows?
- Did the fallback instruction work when data was missing?

---

## 8 Prompting Rules (Eric Noski)

### Rule 1: The 10-Minute Manual Research Rule
Ask yourself: "What would I do if I researched this person for 10 minutes?" What information would I look for? THEN automate that with Claygent. Never guess what you could do — start from manual research.

### Rule 2: One Task Per Claygent
**Bad:** Claygent that checks site content + decides if e-commerce + classifies industry
**Good:** Claygent #1: Retrieve site content → Use AI #2: Is it a CPG? → Use AI #3: What products? → Use AI #4: What industry?

AI fails when given too many tasks. ChatGPT 4.1 Nano costs almost nothing — separate the tasks.

### Rule 3: Use "purple" as Null Keyword
When nothing is found, output a specific keyword like **"purple"** instead of letting AI say "No information found" in 100 different ways. Makes downstream filtering easy.

```
If no case study found, output 'purple'
```

### Rule 4: Always Include Examples in Prompts
Even a mediocre prompt becomes excellent with 3-4 examples. Manually research a few cases, include them in the prompt. Shows AI exactly what you want.

### Rule 5: Use the Metaprompter
1. Go to ChatGPT
2. Explain what you want to accomplish
3. Ask: "Create a prompt for this"
4. Ask: "What questions do you have to improve this prompt?"
5. Answer the questions → improved prompt

### Rule 6: Ask for Reasoning Before the Answer
"Tell me the reasoning why you think it's this kind of company before you give me the final answer." AI predicts the next word — by explaining first, it has more context to answer better.

### Rule 7: Prepare for Edge Cases
20% of the work = putting integrations together. **80% = adjusting the AI.** Review outputs constantly — as soon as an output doesn't look right, adjust the prompt.

### Rule 8: Iterate Without Spending Credits
Use the builder to test and iterate on prompts before running on the full table. Test on 1-3 rows in the builder until the output is exactly what you want.

---

## Conditional Runs for Claygent — When They're Needed vs Redundant

**Clay automatically skips a Claygent step (and spends zero credits) when any `{Variable}` referenced in the prompt is empty.** It throws a "missing input" status, not a credit charge.

**Implication:** never add a conditional run that just checks "is the input variable not empty" — it's redundant.

| Scenario | Add a conditional run? |
|---|---|
| Gating on the same field the prompt references (e.g. prompt uses `{Domain}`, gate says `Run if Domain is not empty`) | **No — redundant**, Clay handles it |
| Gating on a different field than the prompt input (e.g. prompt uses `{LinkedIn URL}`, gate says `Run if ICP Qualified = "Yes"`) | **Yes — needed**, this is the actual cost-control gate |
| Gating on a string value, not emptiness (e.g. `Run if LinkedIn URL ≠ "Not Found"`) | **Yes — needed**, "Not Found" is a non-empty string Claygent will still try to use |
| Gating on a downstream condition (e.g. headcount in range, qualification passed, validation status = "verified") | **Yes — needed**, free filter |

**Rule of thumb:** conditional runs exist to gate on a **different** signal than the input variable's emptiness. If your only condition is "input not empty," delete it.

---

## Prompt Rules — Quick Reference

- Always use `{Clay Variable}` syntax with exact column names
- Never use generic output names like "Pass" or "Result" — always use descriptive names
- Never ask Claygent to do more than one task per column (Rule 2)
- Only include fields with less than 20% nulls as inputs
- Pass multiple relevant variables — Company Name + Domain + LinkedIn URL is almost always better than Domain alone. Only omit a variable if it genuinely doesn't help the task.
- **Never restrict Claygent to specific pages** (homepage, about page) in Web Research — let it navigate freely. Use language like "Search the web for information about {Company Name}" — never "visit the homepage and about page"
- For Web Research tasks needing information beyond the company website (location counts, funding history, market data), explicitly tell Claygent to search the web broadly — Google Maps, directories, Wikipedia, news, press releases
- Always include a fallback instruction ("Unknown", "Not Found", "No", or "purple")
- Always specify the exact output format (Yes/No, exact number, category from a list, comma-separated list, etc.)
- Test on at least 3 rows before running at scale (Step 5)

---

## Account Setup

**OpenAI API key** — connect your own OpenAI API key for Claygent. Claygent is one of the tools used constantly across many workflows and many records — own API key is the right call. Connect via: Enrichment → Account → Manage accounts → add OpenAI API key.

---

## Canonical Prompt Template

```
You are a [web research / text analysis] agent. Your task is to [SPECIFIC OBJECTIVE — be precise about what the column should produce].

You have the following information:
- [Field Label]: {Exact Clay Column Name}
- [Field Label]: {Exact Clay Column Name}
- [Field Label]: {Exact Clay Column Name}
[Include all relevant variables — not just one]

[INSTRUCTIONS — what to look for, where to search, how to evaluate]

[OUTPUT FORMAT — specify exact structure:]
Return one of the following only — no explanation:
- "[Option A]"
- "[Option B]"
- "[Fallback value]" — if [condition when info is unavailable]
```

---

## Production Prompt Library

### LinkedIn Headcount Verification — ALWAYS FIRST IN EVERY TABLE
Use Case: Web Research | Model: ChatGPT 4.1 Nano

**This is Column 0 in every table where Clay Find Companies was used as the list-building source. No exceptions.** Runs before ICP qualification, before tech stack, before everything else. Clay Find Companies only returns headcount as a range (51-200, 201-500) — and the ranges are often wrong. LinkedIn is the source of truth for exact headcount. Skip when the source database already provides exact headcount.

Conditional run: None — when Clay Find Companies is the source, LinkedIn URL is always populated.

```
You are a web research agent. Your task is to visit a company's LinkedIn profile page and extract the exact number of employees.

You have the following information:
- Company LinkedIn URL: {LinkedIn URL}

Visit the LinkedIn company page and find the exact employee count displayed on the profile. Return the precise number — not a range like "1,001-5,000", the actual number shown (e.g. 3,847).

Return the exact number only — no explanation, no formatting, no commas, just the number.

If the LinkedIn page is unavailable or the employee count is not visible, return "Not Found".
```

**Mandatory next step:** Apply a table filter on the LinkedIn headcount column to exclude companies outside the tier's headcount range. Filters are free and hide rows entirely — no credits spent on out-of-range rows.

- T1: `Where LinkedIn Employee Count ≥ 10000`
- T2: `Where LinkedIn Employee Count ≥ 1000 AND ≤ 10000`
- T3: `Where LinkedIn Employee Count ≥ 500 AND ≤ 5000`

---

### Name Normalisation — Full Name as One Column
Use Case: Create or Modify Content | Model: ChatGPT 4.1 Nano

```
You are a text normalisation agent. Your task is to clean a person's full name pulled from a list provider or LinkedIn.

You have the following information:
- Raw Name: {Full Name}

Clean the name by:
1. Removing credentials and suffixes (PhD, CFA, MBA, CPA, MSc, MD, PMP, FRSA, CTO, etc.)
2. Removing emojis or special characters
3. Removing extra words not part of the actual first and last name (e.g. "| Open to work", company names, taglines)
4. Formatting in standard Title Case (First Last)
5. Return the cleaned full name only — no explanation, no punctuation, just the name

If already clean, return as-is in Title Case.
```

---

### Company Name Normalisation
Use Case: Create or Modify Content | Model: ChatGPT 4.1 Nano

```
You are a text normalisation agent. Your task is to clean a company name so it is suitable for use as a personalisation variable in a cold email.

You have the following information:
- Raw Company Name: {Company Name}

Clean the company name by:
1. Removing legal suffixes (Inc, Inc., Ltd, Ltd., LLC, LLP, GmbH, S.A., S.L., B.V., PLC, Corp, Corp., Co., Limited, Pty, Pty Ltd, AG, SAS, SARL, or similar)
2. Removing country, city, or region names appended to the name (e.g. "- Germany", "UK", "Europe", "APAC")
3. Removing standalone punctuation left after stripping (commas, dashes, pipes at start or end)
4. Fixing all-caps — convert to Title Case unless it is a known brand capitalisation (HubSpot, OpenAI, GoCardless — preserve these as-is)
5. Return the cleaned name only — no explanation, just the name

Examples:
- "Acme Corp, Inc." → "Acme Corp"
- "HubSpot Ltd." → "HubSpot"
- "Acme Corp GmbH - Germany" → "Acme"
- "THE COCA-COLA COMPANY" → "Coca-Cola"
- "Stripe | Payments Infrastructure" → "Stripe"

If the name is already clean, return it as-is.
```

---

### ICP Qualification — Generic Template
Use Case: Web Research | Model: GPT-4.1 Mini

```
Visit {Domain} and explore the website to understand what this company does, what products or services it sells, and who its customers are.

Your task is to determine whether this company is a [TARGET INDUSTRY/TYPE] company.

A qualifying company:
- [QUALIFYING CRITERIA 1]
- [QUALIFYING CRITERIA 2]
- [QUALIFYING CRITERIA 3]

Non-qualifying companies:
- [DISQUALIFYING TYPE WITH REAL EXAMPLES]
- [DISQUALIFYING TYPE WITH REAL EXAMPLES]

Important: do not disqualify a company just because it mentions one of the above in passing — look at what the company primarily does and sells. Only disqualify if the non-qualifying activity is clearly the core business.

Return one of the following outputs only — no explanation:
- "[Sub-industry A]" — if the company qualifies and is primarily [Sub-industry A]
- "[Sub-industry B]" — if the company qualifies and is primarily [Sub-industry B]
- "[Sub-industry A] & [Sub-industry B]" — if the company genuinely operates in both
- "No" — if the company does not qualify
- "No" — if the website is unavailable or too thin to make a confident decision
```

---

### LinkedIn URL Finding (Person)
Use Case: Web Research | Model: GPT-4.1 Mini

```
You are a research agent. Your task is to find a person's LinkedIn profile URL.

You have the following information:
- Full Name: {Full Name}
- Company Domain: {Company Domain}

Step 1: Find the company's LinkedIn page URL from the domain {Company Domain}. Search for "[Company Name] LinkedIn" or go to linkedin.com/company/[slug].

Step 2: Using the company LinkedIn page as context, search for {Full Name} at that company on LinkedIn.

Return the following:
- LinkedIn Profile URL: the full https://linkedin.com/in/... URL
- Confidence: High / Medium / Low
- LinkedIn Found: output Yes or No only

If you find more than 1 matching profile, output "Multiple Results Found" for LinkedIn Profile URL and No for LinkedIn Found.
If no match found, output "Not Found" and No for LinkedIn Found.
```

---

### LinkedIn Company URL from Domain
Use Case: Web Research | Model: GPT-4.1 Mini

Verifies a company's official LinkedIn page when domain is the only known identifier. A wrong LinkedIn URL contaminates every downstream enrichment (headcount, HQ, employees, signals) — accuracy matters more than coverage.

```
You are a web research agent. Your task is to find the official LinkedIn company page URL for a given company. Accuracy matters more than coverage — never guess.

You have the following information:
- Company Domain: {Domain}
- Company Name: {Company Name}

Step 1 — Identify the company.
Visit {Domain}. Note the exact company name as displayed on the homepage, what they sell, the industry, and the headquarters city/country if shown anywhere (footer, contact page, about page).

Step 2 — Search for the LinkedIn page using:
- "[exact company name from website] LinkedIn"
- site:linkedin.com/company "[exact company name]"
- "[company name] [industry or city]" linkedin.com/company

Step 3 — Verify the match. The LinkedIn page is a confirmed match ONLY if at least 2 of the following are true:
- The "Website" field on the LinkedIn page matches {Domain} (strongest signal — counts as 2)
- The company description on LinkedIn aligns with what the website says they do
- The industry tag on LinkedIn aligns with the company's actual industry
- The "Headquarters" location on LinkedIn is consistent with the website

Step 4 — Disambiguation:
- If multiple LinkedIn pages exist for the same name, pick the one whose Website field exactly matches {Domain}
- If no LinkedIn page has Website = {Domain}, return "Not Found"
- If the company was acquired, return the parent company's LinkedIn ONLY if {Domain} currently redirects to the parent's domain. Otherwise return "Not Found"

Step 5 — Filter out non-matches:
- Personal LinkedIn profiles (linkedin.com/in/...) — not company pages
- School / university / government pages
- Look-alike companies sharing the name in different industries or geographies

Return ONE of:
- The full URL in the format https://www.linkedin.com/company/[handle]/ — only if confidently verified per Step 3
- "Not Found" — if no confident match

Never return a guessed or partially-verified URL.
```

---

### Company Domain Finding
Use Case: Web Research | Model: GPT-4.1 Mini

```
Find the official website domain for the following company.

Company Name: {Company Name}
Industry: {Industry}
City: {City}

Search for "[Company Name] [Industry] [City]" and identify the correct company. Return only the domain (e.g. company.com) — no explanation, no www prefix, no https.

If multiple companies match, use the city and industry to disambiguate. If you cannot find it with confidence, return "Not Found".
```

---

### LinkedIn Post Theme Summary
Use Case: Create or Modify Content | Model: ChatGPT 4.1 Nano

Pairs with the Professional Posts enrichment (`clay-engineer/providers/enrichments/professional-posts.md`). Takes a person's recent post array and outputs a one-line theme summary suitable as a `{{linkedin_topic}}` personalisation variable.

```
You are a research agent. Your task is to summarise the recurring themes in a person's recent professional posts so the output can be used as a one-line personalisation opener in a cold email.

You have the following information:
- Recent posts: {Recent Posts}

Rules:
1. Look at the past 90 days of activity only. Ignore older posts.
2. Identify the 1-2 themes the person posts about most often. Themes must be recurring — a single one-off post does not count.
3. Output ONE concise sentence in the format: "you've been posting about [theme]" — written in second person, lowercase first letter, no period at the end.
4. Use specific topics, not vague categories.
   - Bad: "leadership", "growth", "innovation"
   - Good: "raising bridge rounds in this market", "treasury management for early-stage fintechs", "shipping LLM features without burning runway"
5. If the input is empty, returns fewer than 2 posts in the last 90 days, or the posts have no clear recurring theme, return EXACTLY: "No recent activity"
6. Never invent or extrapolate beyond what the posts actually say.

Return only the sentence. No quotes, no explanation, no preamble.
```

**Wire into Sending Gate:** drop the row OR fall back to another personalisation variable when "No recent activity" appears.

---

### Company Tier Qualification (ColdIQ)
Use Case: Create or Modify Content | Model: ChatGPT 4.1 Nano

```
You are qualifying companies for a B2B outbound campaign. Based on the company information provided, assign a tier:

Tier 1: B2B software companies with 40+ headcount that sell to other businesses
Tier 2: B2B companies that sell digitally but are not software companies
Tier 3: Companies in a relevant industry but not our ideal fit

Company: {Company Name}
Industry: {Industry}
Employee Count: {Employee Count}
Description: {Company Description}

Return ONLY: "Tier 1", "Tier 2", or "Tier 3" followed by a one-sentence reason.
```

---

### Contact Seniority Tier (ColdIQ)
Use Case: Create or Modify Content | Model: ChatGPT 4.1 Nano

```
Based on the following job title, assign a seniority tier:

Tier 1: C-level, VP, Founder, Head of, Director (decision-makers with budget authority)
Tier 2: Manager, Senior (influencers who can champion internally)
Tier 3: Associate, Coordinator, Specialist (end users, not decision-makers)

Title: {Title}

Return ONLY: "Tier 1", "Tier 2", or "Tier 3"
```

---

### Personalized Opening Line (ColdIQ)
Use Case: Create or Modify Content | Model: ChatGPT 4.1 Nano

```
Write a cold email opening line (1 sentence, under 20 words) based on this signal:

Signal: {Signal/Trigger}
Company: {Company Name}
Person: {First Name}, {Title}

Rules:
- Reference the signal naturally, don't force it
- Sound like a human, not AI
- Don't pitch anything yet
- Don't start with "I noticed" or "I saw"
- Make it about THEM, not you
```

---

### Tech Stack Detection from BuiltWith URL
Use Case: Web Research | Model: GPT-4.1 Mini

```
Visit this BuiltWith URL and list the key technologies used by this company:
{BuiltWith URL}

Return a comma-separated list of the top 10 most relevant technologies (CRM, marketing automation, analytics, web framework only). Ignore tracking pixels and common libraries.
```

---

## Quick Examples

**Free trial detection:**
```
Visit {company_url}. Does this company offer a free trial?
Look for: "free trial", "try for free", "start free", "demo", "trial period".
Return 'Yes' if found, 'No' if not found, 'purple' if the page cannot be loaded.
```

**Case study industries:**
```
Visit {company_url}/customers or {company_url}/case-studies.
List the industries of the first 3 case studies shown.
Format: "Industry1, Industry2, Industry3"
If no case studies page exists, output 'purple'.
```

**Competitor mentions:**
```
Search Google for: site:{company_domain} "{competitor_name}"
Does this company mention {competitor_name} on their website?
Return 'Yes' if found with the specific page URL, 'No' if not found.
```

**Hiring signals from careers page:**
```
Visit {company_url}/careers or {company_url}/jobs.
Count the number of open roles. List the departments hiring.
Format: "X open roles — Engineering, Sales, Marketing"
If no careers page exists, output 'purple'.
```

---

## See Also

- Full Claygent reference (clay-engineer master) — `clay-engineer/clay-engineer-master.md`
- Conditional run formula syntax → `clay-engineer/platform/formula-syntax.md`
- ICP qualification phase (where Claygent ICP qual is the first paid step) → `clay-engineer/phases/03-qualification.md`
- Enrich Person (alternative to Claygent for structured person data) → `clay-engineer/providers/enrichments/enrich-person.md`
- Professional Posts (LinkedIn posts → `{{linkedin_topic}}` pairing) → `clay-engineer/providers/enrichments/professional-posts.md`
