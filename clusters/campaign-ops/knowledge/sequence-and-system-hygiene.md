# Sequence and System Hygiene

Operating habits that keep a live outbound system correct as it grows: many campaigns, cloned sequences, shared enrichment logic, several people editing. None of this is strategy. It is what stops silent breakage.

## Editing live sequences

- **Every copy of the "same" email.** A branched sequence (connected / invite pending / cold, or split by any condition) holds the same email as two or three sibling steps. A copy change must land on all of them. A missed sibling is how one persona's copy leaks into another's sequence.
- **Snapshot before, diff after.** Export or dump the sequence tree before an edit and again after it, then compare. After any API push, re-fetch and grep every step for leftovers (the old sender name, the old hook, the old persona's vocabulary).
- **Conditionals need populated fields.** A merge-field conditional whose field nobody fills silently falls back to the default branch. Before shipping, confirm the enrichment step actually writes that field for real contacts.
- **Clone from the newest, not from memory.** When building or adapting a sequence, start from the most recent sequence of the same family and copy its proven parts (delays, footers, branch wiring). Older sequences carry retired patterns.
- **Modernize on touch, but propose it.** Touching an old sequence is the moment to bring it up to the current standard.
  - Diff it against the current reference: stale conditions, missing branches, delays left over from a paused campaign, outdated footers or opt-outs, tracking settings.
  - List the gaps as proposals, each with the current state, the suggested change and the reason, and get approval before pushing.
  - "Nothing to change" is a valid result; say it explicitly.

## Channel mechanics

- **No real email found → LinkedIn-only track.** Decide this at enrichment time, where it is known for certain, and route those contacts away from email steps.
- **LinkedIn messages only reach connections.** LinkedIn message steps belong on paths where the invite was accepted. On a cold email-only path they fire for almost no one and add noise.
- **The same angle on two channels** reaches the overlapping path twice: vary the phrasing or space the steps apart.

## Campaign documentation

Every live campaign gets one short page:
- **Trigger:** what event or condition selects contacts, from which source, how often.
- **Who:** the final company and persona profile *after* all qualification, not the raw pull.
- **Why:** what intent the trigger reveals, and whether the trigger is named in the copy or used only to pick who and when (see the hook vs intent-only decision in `clusters/cold-email/tasks/write-first-email.md`).
- **How it reaches them:** angles, channel mix, routing, the fields that drive personalization.
- **Pipeline:** source → enrichment → CRM → sequencer, with what each step writes back.
- **Tracking:** which CRM fields mark the contact as touched by this campaign.
- **Results and risks:** the metric it is judged on, known risks, planned changes.

**Keep registries for reused parts.** One list of triggers and one list of angles, each entry linked to the campaigns that use it. A new campaign reuses entries before it invents new ones.

## Shared enrichment logic

- **One canonical version.** Build a pipeline used by several tables (qualification, person enrichment, CRM push) as one reusable unit, e.g. a Clay function or subroutine, not copy-pasted columns.
- **Document the exceptions.** Where copies must exist (a variant without CRM writes, a hand-rebuilt table), document each one and what it deliberately does differently.
- **Check drift.** Compare each copy against the canonical version column by column, before a change (so old drift isn't blamed on you) and after it (so only deliberate differences remain).
- **Change the canonical version first**, then the variants that should follow it.

## Docs follow the system

- **After every change to the live system**, update the docs it touches in the same session. Keep a short "if you changed X, update Y" map so nobody has to remember the cross-references.
- **Log it.** Keep a changelog entry: what changed, why, and what is left open.
- **Tell the team** when shared docs change, so nobody works from a stale copy.
