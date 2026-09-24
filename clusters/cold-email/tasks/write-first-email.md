# Task: Write First Cold Email (Step 1)

Recipe for writing the opening email of a cold sequence — signal-led, persona-aware, ready to plug into Step 1 of a 3-touch cadence.

## When to use this

User asks to write a cold email, an "email 1", a first touch, an outbound template, or the opening of a sequence.

## Inputs required

If any of these are missing, ask before drafting:

- **ICP** — role + company type (e.g. "VP Sales @ B2B SaaS, 50-200 employees")
- **Signal** — the active trigger ("just hired their first SDR", "raised Series A 2 weeks ago", "competitor just churned"). If signal is vague ("they're growing"), push back and ask for the specific evidence.
- **Angle** — the core argument tying signal → problem → offer
- **Persona seniority** — VP/C-Level (ATL) vs Manager/IC (BTL). Tone changes.
- **Channel** — cold email vs LinkedIn InMail
- **Optional**: existing brand voice samples, prior winning copy

## Principles (non-negotiable)

- **60-90 words max** for BTL emails, **40-70 words** for ATL
- **Plain text only** — no HTML, no images, no bullets in cold email
- **Lead with the prospect, not the sender.** If the email could be sent to a different company without changing it, rewrite.
- **Decide per signal: hook or intent-only.** Run the alpha test (`clusters/signals/knowledge/go-to-market-alpha.md`): can a competitor buy this exact signal off the shelf?
  - **Commodity signal** (funding, generic hiring, job change, tech install): everyone opens with it, so naming it reads as mass outreach ("congrats on the round"). Use it as intent only: it picks *who* and *when*; sentence 1 names the operational situation the signal implies for this company, not the signal.
  - **Alpha signal** (derived from your product's value or first-party data, e.g. a geo cross-join no vendor sells): lead with it. That is the whole point of having it.
  - A client's playbook may fix this per signal; that decision wins over this default.
- **One CTA only** — soft ask, not a hard sell
- **Pain over features** — name the problem the signal implies, not your solution
- **No vanity openers** — never "I came across your profile…", "hope you're well", "quick question"
- **Subject line under 6 words** (use `clusters/cold-email/tasks/write-subject-lines.md` to generate options)

## Process

1. Confirm ICP, signal, and angle are clear. If anything is fuzzy, ask before writing.
2. Pick a copywriting framework that fits the signal:
   - **Strong quantifiable signal** (hiring, funding, growth) → "Do the Maths" or "Challenge of Similar Companies"
   - **Behavioral signal** (job change, tech stack switch) → "Pattern Interrupt" or "Ask Before Pitch"
   - **Soft/inferred signal** → "Neutral Insight" or "Upfront Value"
   - Full framework menu: Read `clusters/cold-email/knowledge/copywriting-frameworks.md`
3. Draft Step 1 using this skeleton:
   - **Opener** (1 sentence): alpha signal → the signal itself, specific; commodity signal → the situation it implies at this company, without naming the trigger
   - **Problem** (1 sentence): the pain the signal implies for this role
   - **Bridge** (optional, 1 sentence): proof point with a number, or pattern observation
   - **CTA** (1 sentence): soft, scheduling-oriented, low-friction
4. Apply tone calibration:
   - VP/C-Level (ATL): direct, blunt, peer-to-peer, 40-70 words. See `clusters/cold-email/knowledge/atl-btl-messaging.md`.
   - Manager/IC (BTL): logical, efficient, more context allowed, 60-90 words.
   - Founder: peer-to-peer, low formality, name-drop other founders if relevant.
5. Self-check before output:
   - Could this be sent to a different company without rewriting? → fail, redraft
   - Alpha signal: is it in sentence 1? → if not, restructure. Commodity signal: is it named anywhere ("saw you raised", "noticed you're hiring")? → cut it, keep the implied situation
   - Are there bullet points or HTML? → strip
   - Is the CTA a meeting demand or a question? → soft question wins
6. Generate 2-3 subject line options inline (or route to `clusters/cold-email/tasks/write-subject-lines.md` for full ranked set)

## Output format

```
Hypothesis: [name or one-line description]
ICP: [role] @ [company type]
Signal: [specific trigger] — [hook | intent-only] (alpha test: [why])
Angle: [core argument]
Persona tier: [ATL / BTL]

STEP 1 — Email — Day 1
Subject options:
  A: [option, < 6 words]
  B: [option, < 6 words]
  C: [option, < 6 words]
---
[Email body — 60-90 words BTL or 40-70 words ATL]
---
Word count: [n]
Framework used: [name]
```

End with one line: *"Run `clusters/cold-email/tasks/stress-test-sequence.md` once Steps 2 and 3 are drafted — don't launch below 8.1/10."*

## Pass criteria

- Word count in target range
- Hook-vs-intent decision stated in the header; alpha signal in the opening sentence, commodity signal never named
- Zero generic phrases ("hope you're well", "quick question", "wanted to reach out")
- One CTA, framed as a question
- Tone matches persona tier

## Common failures

- **Generic opener** — fix by replacing sentence 1 with the literal observation: the alpha signal, or the situation a commodity signal implies at this company
- **Commodity trigger named** ("congrats on the Series B", "saw you're hiring") — reads as the same email every vendor sent that week; replace with the situation it implies
- **Multiple CTAs** — strip to one, the most-conversion-likely
- **Feature dump in middle** — replace with the problem the persona feels because of the signal
- **Subject line over 6 words** — regenerate using `clusters/cold-email/tasks/write-subject-lines.md`

## Deeper knowledge (load only when needed)

- 13 named frameworks with full templates → `clusters/cold-email/knowledge/copywriting-frameworks.md`
- Email component rules (opener / body / CTA / sign-off) → `clusters/cold-email/knowledge/copywriting-principles.md`
- ATL vs BTL deep guide → `clusters/cold-email/knowledge/atl-btl-messaging.md`
- E-commerce vertical specifics → `clusters/cold-email/knowledge/copywriting-ecom-playbook.md`
- ColdIQ playbook (3 value-prop styles, 3 preview patterns) → `clusters/cold-email/knowledge/coldiq-playbook.md`
- Ready-to-deploy templates → `clusters/cold-email/knowledge/email-templates-library.md`
