# Task: Set Up a Second Brain for a Client / Company

Build a structured, indexable knowledge base about a company — stored as markdown files — so Claude can instantly access deep context without being briefed from scratch every session.

## When to use this

User asks to set up a second brain, build a context library, create company knowledge files, or prepare a workspace for repeated GTM work on the same client.

## Inputs required

- Company name + description
- ICP and offer documentation
- Available materials: pitch deck, website copy, case studies, sales scripts, call recordings
- Team structure (who runs what)

## File structure to create

```
/[company-name]/
├── CLAUDE.md            ← master context file, always loaded
├── icp.md               ← ICP definition (output of build-icp)
├── offer.md             ← what you sell, pricing, positioning
├── personas/
│   ├── vp-sales.md      ← persona profiles (output of build-persona)
│   ├── cro.md
│   └── founder.md
├── signals/
│   └── signal-map.md    ← buyer signals (output of map-signals-to-icp)
├── proof/
│   ├── case-studies.md  ← results, social proof
│   └── objections.md    ← known objections + handling
├── competitors/
│   └── [competitor].md  ← one file per key competitor
└── campaigns/
    └── hypothesis-log.md ← record of all hypotheses tested + results
```

## CLAUDE.md (the master file)

The CLAUDE.md is read FIRST in every session. Keep it short — nav, not brief. Should contain:
- One-sentence company description
- The offer in plain language (one paragraph max)
- ICP summary (3 lines)
- Links to all other files in the second brain
- Current campaigns running (update weekly)
- Last updated date

Target length: readable in 60 seconds.

## Process

1. Create the directory structure above
2. Ask for all available materials (website, deck, case studies, transcripts, etc.)
3. Populate CLAUDE.md as the master nav
4. Generate ICP via `clusters/icp/tasks/build-icp.md`
5. Generate persona files via `clusters/personas/tasks/build-persona.md` (one per role)
6. Generate signal map via `clusters/signals/tasks/map-signals-to-icp.md`
7. Populate proof files (case-studies + objections) from provided materials
8. Create hypothesis-log.md template
9. Return a checklist of what's complete vs needs more input

## Output format

Return CLAUDE.md content first so user can review the master nav immediately. Then list the populated files + any gaps.

```
Second brain: [company-name]
Location: [path]

CLAUDE.md content:
[paste the actual CLAUDE.md]

POPULATED
✓ icp.md
✓ personas/vp-sales.md
✓ personas/cro.md
✓ signals/signal-map.md
✓ proof/case-studies.md (3 case studies extracted)

GAPS — needs input
✗ proof/objections.md (no transcripts provided)
✗ competitors/* (no competitor list)
✗ offer.md (need pricing details)
```

## Pass criteria

- CLAUDE.md ≤ 60-second read
- ICP, ≥1 persona, signal map all populated
- Hypothesis-log.md template in place (even if empty)
- Gaps clearly listed, not silently skipped

## Common failures

- **CLAUDE.md as a brief, not a nav** — keep it under 60 seconds; depth lives in the linked files
- **Skipping competitors file** — Claude needs to know what objections to expect; this is the cheapest win
- **No call-recording extraction** — if recordings exist and you didn't pull customer language verbatim, you missed the highest-value input. Add quotes to the persona file directly.
- **Static second brain** — set a recurring weekly 15-min update task or it goes stale in a quarter

## What to do after

- Schedule weekly 15-min update (cron / calendar reminder)
- Every hypothesis result → log in hypothesis-log.md (institutional memory)
- New competitor mentioned → add a competitor file before the end of the week
- Claude Code: ensure the second-brain directory is symlinked into the project's `.claude/` for auto-load
