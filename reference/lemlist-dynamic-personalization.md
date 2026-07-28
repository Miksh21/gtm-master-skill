# lemlist — Dynamic personalization (Liquid, spintax, per-sender) — never bake sender-dependent values

**Core principle:** A personalization value that depends on the **sender** (who's sending) must be resolved **at send time**, never pre-computed and stored on the contact. The same contact can be sent by different senders across campaigns, so a baked value (e.g. a full salutation computed for one assumed sender) is wrong the moment the sender differs. Store only **sender-independent blocks** on the contact; resolve sender-dependent forms with Liquid or per-sender personalization.

## What lives where

| Value type | Depends on | Where it lives |
|---|---|---|
| first-name vocative, last-name vocative, gender, company name, role | the **contact** | contact custom field (write via API/sync) — how to COMPUTE these values → `{SKILL_BASE}/reference/czech-declension-engine.md` |
| salutation **form** (informal first-name vs formal pane/paní), sender's gendered words, sender signature | the **sender** | resolve at send time — Liquid and/or lemlist per-sender personalization |
| the assembled salutation | sender **and** contact | Liquid conditional in copy, combining both |

## lemlist supports Liquid conditionals (deterministic, free — prefer over AI columns)
`{% if %}…{% elsif %}…{% else %}…{% endif %}`, `==`, `contains`, `and`/`or`. Variable names are case-sensitive and must match the lead field name exactly (camelCase / snake_case both accepted). Always include `{% else %}` so it renders when data is missing.

**Salutation pattern** (sender-style × contact-gender), in the email body:
```liquid
Dobrý den{% if salutationStyle == "informal" %}, {{firstNameVocative}}{% elsif gender == "F" %}, paní {{lastNameVocative}}{% else %}, pane {{lastNameVocative}}{% endif %},
```
- `salutationStyle` = a per-lead field derived from the **sender/owner** (informal vs formal) — NOT a baked salutation.
- `gender`, `firstNameVocative`, `lastNameVocative` = contact fields.

**Sender's own gendered words / signature** depend only on the sender → use **lemlist per-sender personalization** (each sending account sets its own value for the variable), so the *actual* sending mailbox supplies it. Fallback if per-sender isn't available: a `sender` lead field + Liquid:
```liquid
{% if senderGender == "F" %}Všimla{% else %}Všiml{% endif %}
```

## Liquid vs AI column — when to use which
- **Liquid conditional** → deterministic rules (if sender X then form A else form B). Free, instant, predictable. **Default choice.**
- **AI column** (lemlist, BYO OpenAI key) → only when the value needs genuine generation/judgment (e.g. a bespoke one-liner from messy inputs). Costs credits per lead and can drift; never use it for a rule a conditional can express.

## Spintax (lemlist)
`{{spintax}}` style variation for anti-pattern/anti-spam: `{Dobrý den|Hezký den}`. Combine with Liquid — spintax varies fixed phrases, Liquid branches on data. Keep the salutation in Liquid (must be correct), spin only neutral filler.

## Anti-patterns
- ❌ Pre-computing a full `salutation` per contact for an assumed sender (breaks when sender changes).
- ❌ Mapping a vocative field to lemlist's native `firstName`/`lastName` (overwrites the real name). Vocatives are their own custom fields.
- ❌ Using an AI column for a deterministic if/else (cost + drift).
- ✅ Contact = building blocks; sender-dependent form = Liquid / per-sender at send time.
