# Qualification Prompt Framework (website-content account qualification)

The copy-paste framework for the **centerpiece qualification prompt** — the AI research agent that classifies every TAM company as qualified/not based on its website content. This runs as the initial qualification (industry + product fit) BEFORE deeper firmographic/technographic/signal enrichment, and is the single highest-leverage prompt in a TAM build: back-test and optimize it against ground truth before scaling.

Use with Claygent / Clay "Use AI" / Claude Code web research. Companion to `claygent-guide.md` (general prompt-writing rules).

## Why this structure works

- **Exclusions checked FIRST** — most false positives are adjacent business models (agencies, resellers, consultancies); killing them up front beats hoping the qualify-signals discriminate
- **Explicit hybrid handling** — the common failure case is companies doing the target activity *alongside* something else; without a threshold rule the model flip-flops
- **3-outcome response** — forcing `INSUFFICIENT INFORMATION` as a legal answer prevents confident garbage on thin websites
- **Evidence required in the response** — makes back-testing and spot-checking possible

## The template

```
You are analyzing a company's website to determine if they are a TRUE [TARGET_COMPANY_TYPE].

[One-sentence definition of what this company type does and how it operates.]

EXCLUDE (NOT A [TARGET_COMPANY_TYPE]) if PRIMARY business is:
- [EXCLUSION_1]: [Signals to look for, e.g., specific page language, site sections, positioning clues]
- [EXCLUSION_2]: [Signals to look for]
- [EXCLUSION_3]: [Signals to look for]

QUALIFY ([TARGET_COMPANY_TYPE]) if you find:
- Explicit terms: [3-5 keywords or phrases that directly confirm this company type]
- Industry pattern: [A structural signal, e.g., naming conventions, business model indicators, customer-facing language]
- [QUALIFYING_SIGNAL_3]: [What to look for and why it confirms qualification]
- [QUALIFYING_SIGNAL_4]: [What to look for and why it confirms qualification]

HYBRID COMPANIES ([Describe the common overlap, e.g., companies that perform the target activity alongside an adjacent business model]):
- QUALIFY if [threshold, e.g., the target activity represents a meaningful portion of revenue, product mix, or customer base]
- EXCLUDE only if [threshold, e.g., the target activity is incidental and the primary business is clearly something else]

DECISION PRIORITY:
1. Check for exclusions first
2. Look for qualifying evidence
3. For hybrids, check if [TARGET_COMPANY_TYPE] activity is significant (not just minor or incidental)

RESPOND WITH:
- QUALIFIED [TARGET_COMPANY_TYPE] - [Specific evidence found]
- NOT A [TARGET_COMPANY_TYPE] - [Reason: which exclusion category]
- INSUFFICIENT INFORMATION - [Reason: unclear or limited content]

Analyze the following company's website: {Domain}
```

## Operating notes

- **Why AI qualification is unavoidable:** database industry filters don't suffice — e.g. vertical SaaS sits under its end-industry vertical, not "software development". Broad multi-source list pulls (needed for 90%+ TAM coverage) make AI website qualification the filter of record.
- **Back-test in Clay** against a labeled sample (known-qualified + known-excluded domains) and iterate on the exclusion/hybrid rules until precision holds — this is where the Clay time goes after Claude Code did the merge/dedupe.
- Budget for it: AI qualification spend scales with list breadth; it's one of the two cost drivers of a TAM map (see `clusters/campaign-ops/knowledge/abm-engine-implementation.md` Step 1).

## Source

Dan Rosenthal (Workflows.io), "How to build a modern ABM engine", Growth Unhinged, 2026-05-27.
