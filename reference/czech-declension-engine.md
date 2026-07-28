# Czech declension engine — vocatives, gender, injected nouns

The single decision tree for ALL Czech (and by extension Slovak) declension work in outbound: salutation vocatives, gender detection, and declining injected values (job titles, company names) inside sentence templates.

## The iron rule

**Never regex Czech morphology.** Palatalization (Luděk → Luďku, not Luděku), invariant surnames (Kočí, Krejčí), foreign surnames, and women without -ová all break hand-rolled rules, and a wrong form in line one reads machine-made before the first sentence ends. Every declension value comes from one of the three engines below.

## Engine selection (in this order)

| Engine | Use for | Cost | Commercial use |
|---|---|---|---|
| **sklonovani-jmen.cz API** | Production campaigns: name declension (all 7 cases incl. vocative), gender detection, handles titles + rare/foreign names | from 30 CZK / 1000 names, no monthly fee | ✅ explicitly allowed — **default for client/company work** |
| **MorphoDiTa** (LINDAT REST or local) | Testing, QA cross-checks, personal/portfolio projects | free | ❌ models are **CC BY-NC-SA (non-commercial)** — do NOT use in commercial production without a license from ÚFAL. Library itself is MPL 2.0; the restriction is the Czech MorfFlex models. |
| **LLM per-row** (Claude/GPT, one call per contact) | The tail neither dictionary solves: ambiguous/unisex first names, out-of-vocabulary names, and declining **multi-word phrases in context** (job titles, company names mid-sentence) | ~cents per row | ✅ |

Referee for genuinely weird cases (manual lookup): https://prirucka.ujc.cas.cz (Internetová jazyková příručka, ÚJČ).

## MorphoDiTa quick reference (verified 2026-07-16)

Dictionary-backed morphological generator (MorfFlex CZ, includes proper names). REST endpoint:

```
https://lindat.mff.cuni.cz/services/morphodita/api/generate?data=Luděk
```

Returns all forms as `form \t lemma \t tag`. Czech positional tag: position 5 = case, **vocative = 5**, so filter for tag matching `NNMS5` (masc. sg. vocative) / `NNFS5` (fem.). Verified outputs: Luděk → **Luďku**, Modrák → **Modráku**, Smith → **Smithi**, Kočí → **Kočí** (invariant). Proper-name lemmas carry the `_;Y` flag.

What it does NOT solve: gender for ambiguous first names, which case a template slot needs (that's template design), multi-word phrase agreement (it generates per single word).

Best legal use in a commercial pipeline: **offline QA referee** in dev — cross-check a sample of LLM-generated vocatives against MorphoDiTa before launch, keep it out of the production send path. If it should BE the production path, license the models commercially via ÚFAL first.

## Declining injected nouns (job titles, roles) — LLM job

`"Hledáte {{role}}"` needs the accusative: "datového analytika", not the nominative your enrichment tool returned. Multi-word agreement (adjective + noun must both decline) makes this an LLM-per-row task, not a dictionary lookup. Prompt must state the target case explicitly and instruct: return ONLY the declined phrase.

## Pipeline rules (recap from Czech copy rules)

- Vocatives and gender are **contact fields**, materialized once in the SSOT, never computed in the sending tool (see `{SKILL_BASE}/reference/lemlist-dynamic-personalization.md` for the send-time assembly with Liquid).
- Never map vocative fields onto native firstName/lastName.
- Company names: human form (strip s.r.o./a.s., derive from domain when in doubt).
- Sender-gendered verbs resolve at send time from the sender, not the contact.
- QA gate before any CZ/SK launch: sample 20+ rendered emails, verify every declined form; one wrong vocative kills the thread.
