# Phone Finding

## Mobile Phone Waterfall (Clay Native)

Clay has a native **Mobile Phone** enrichment that works identically to the Work Email waterfall — all providers pre-loaded, draggable, toggleable.

**Mandatory inputs:**
- Full name
- Person's LinkedIn URL

**Optional inputs (improve match rate):**
- Company name
- Company domain
- Work email

**Order logic — same as Work Email:**
- Client has API key → include it, position by cost ascending
- No API key → use Clay-managed cost as sort key, cheapest first
- Requires own API key with no Clay-managed option → toggle off if no key

**Important:** Phone enrichment is significantly more expensive per match than email. Only run the phone waterfall when phone outreach (cold call, SMS) is explicitly part of the campaign. Never run it by default.

---

## Phone Provider Reference

| Provider | Cost | Notes |
|---|---|---|
| **ClearoutPhone** | 1 cr (validation) | Phone validation after finding a number. Also finds phone from name + domain. |
| **Lusha** | 5 cr/phone | Also finds work email at 1 cr. Expensive for phone — only when phone outreach explicitly needed. |
| **SMARTe** | Own API | Specialised for direct dial phone numbers — stronger phone coverage than email-first tools. |
| **Swordfish** | Own API | Phone-first enrichment — strong for mobile phone numbers. Use for SMS/cold call campaigns. |
| **SignalHire** | Own API | Phone + email fallback. Good coverage for non-US markets. |
| **Identity Matrix** | Own API | Direct phone + work email. Primarily US contacts. |
| **Upcell** | Own API | Phone enrichment from LinkedIn URL. Waterfall fallback. |
| **Trestle** | Own API | Reverse phone lookup — verifying or enriching a number you already have. Niche use case. |
| **LiveData** | Own API | Phone enrichment fallback. Less widely used — test coverage against your ICP. |
| **Weekday** | Own API | Community-validated phone + email data. |
| **LeadIQ** | Own API | Known for phone alongside email. Alternative to Lusha. |
| **Fullenrich** | Own API | Phone + email combined tool. Similar to Datagma. |
| **Leadmagic** | 6 cr/mobile | Also finds email at 1 cr. Mobile at 6 cr is expensive — only when explicitly needed. |
| **ContactOut** | 13 cr/mobile | Expensive. Only if all other phone providers have already failed. |

---

## Phone Validation

Always validate phone numbers after finding them. Use ClearoutPhone (1 cr/row):
- Returns: validity status, carrier, line type (mobile/landline/VoIP)
- Conditional run: `Run if Phone Number is not empty`

---

## The Org — For Multi-Threading

Not a phone tool, but relevant for contact-level research:
- **Input:** Company name or LinkedIn company URL
- **Returns:** Org chart structure, manager-to-report relationships, job titles
- **Use for:** Multi-threading strategies where you need to identify the right level of seniority or find an executive's direct reports
