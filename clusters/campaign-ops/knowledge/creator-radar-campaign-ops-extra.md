# Creator-Radar Campaign-Ops — Extra Field Hacks

## When to load
Standalone ops hacks not covered by the Claude-Code GTM operating model: tool-inventory bootstrapping, AI-managed campaign optimization loops, layout-resilient browser automation, battlecard governance, pre-automation observation, offbeat brand-reach surfaces. Complements `reference/claude-code-gtm-architecture.md`, `agentic-gtm-patterns.md`, `gtm-engineer-field-notes.md` (does NOT duplicate them). Triggers: "what APIs do I need", "optimize cold email automatically", "Clay automation breaks on layout change", "battlecard confidence", "shadow reps", "B2B brand reach airports".

## Bootstrapping & observation
- **Browser-history tool inventory.** To list every tool that needs an API key before wiring AI agents, export browser history (last 30 days, dedupe in a Google Sheet) — zero-cost, minutes, no formal audit. "Your search history has everything." [#77]
- **Shadow reps/CSMs for weeks (until 2am), not one day,** before building automations — capture the visceral, unspoken bottlenecks (e.g. midnight post-call follow-up) that reps can't articulate in a 30-min interview. Ensures the agent replicates real edge cases, not an idealized process map; drove adoption + eliminated 1,800 hrs/month of CSM work at Profound. [#125 #126]

## AI-managed optimization loop
- **Weekly autoresearch loop over campaign data** auto-iterates messaging/audiences and doubled positive reply rate across 150+ Smartlead campaigns. Critical constraint: **lock the CTA, free all other variables** — prevents the loop from reward-hacking and keeps it operationally credible. [#81]

## Layout-resilient automation
- **Build Clay/web automation on front-end-API reads, not screenshots.** Browser-use reads the front-end API rather than guessing pixel positions, so Claude-Code/Codex-built Clay table automation survives layout changes and stays maintenance-free — vs pixel-hunting that breaks when the UI moves. [#84]

## Sales enablement governance
- **Battlecard confidence tiers:** tag every claim HIGH / MEDIUM / LOW / UNVERIFIED with a source URL, so reps know what survives a live fact-check. The source-URL requirement forces accountability + freshness and prevents the credibility collapse from a publicly disproved claim mid-demo. [#108]
  - Evidence (2026-10-11): add a separate adversarial fact-check agent that flags, not fixes: each claim Grounded (in source), Third-party verified (URL plus quote) or Unsubstantiated. It caught six invented details a "do not invent" prompt missed. [#1937]

## Offbeat brand-reach surface
- **Airport/flight targeting (Sam Blond):** use SF airports/flights as a B2B brand surface instead of expensive billboards — airports concentrate high-density B2B buyers in a captive, attentive environment at lower CPM than traditional OOH; routes act as geo/demo filters. [#134]

## Creator-radar 2026-10-11
- **Fewer, real experiments:** AI made variants free, so teams split data across too many campaigns. Run three real experiments (different audience, channel, offer) instead of ten variants of one idea; cut campaigns to keep samples readable. [#1760]
- **PMF Pulse skill:** every 20 prospect calls, output verbatim quotes, counts ("7 of 20"), a discovery-question scorecard, an experiment log vs the last report, and three assigned changes. [#2033]
- **Enablement asset rating:** reps rate each asset across 5 situations (cold touch, discovery follow-up, objection, multi-stakeholder, stalled deal). Finding: reps prefer 3-4 min clips over full webinars and still use one-pagers most. [#1809]
- **Logos by visitor identity:** group customer logos as "Migrated off Zendesk", "Under 50 employees" instead of one wall; run a one-star "too advanced" review as an ad to repel wrong-fit buyers. [#1745]
- **Trojan-horse add-on (single-case: Gorgias):** ship a free add-on inside the competitor's platform that diagnoses their customers' accounts (e.g. Zendesk tickets); proves value on their data and feeds battlecards with real findings. [#1932]
- **Switcher play:** an employee posts a free top-plan offer to anyone who cancels a named competitor (proof screenshot, DM to claim, 24h deadline); each claim opens a private DM, ask why they cancelled. [#1747]
- **Dinner agent (single-case: Merge):** automates invite lists (closed-lost accounts as invitees) and seating charts; field dinners went from 1-2 per quarter to 3-5 per month. [#1952]
- **VC perk portals:** get listed with a standing discount, including funds that passed or have not invested; evergreen distribution to every portco they touch. [#2002]


## Source
creator-radar 2026-06; card ids in [#77 #125 #126 #81 #84 #108 #134].
