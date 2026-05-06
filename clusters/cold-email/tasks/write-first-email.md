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
- **Lead with the signal**, not the sender. If the email could be sent to a different company without changing it, rewrite.
- **One CTA only** — soft ask, not a hard sell
- **Pain over features** — name the problem the signal implies, not your solution
- **No vanity openers** — never "I came across your profile…", "hope you're well", "quick question"
- **Subject line under 6 words** (use `tasks/write-subject-lines.md` to generate options)

## Process

1. Confirm ICP, signal, and angle are clear. If anything is fuzzy, ask before writing.
2. Pick a copywriting framework that fits the signal:
   - **Strong quantifiable signal** (hiring, funding, growth) → "Do the Maths" or "Challenge of Similar Companies"
   - **Behavioral signal** (job change, tech stack switch) → "Pattern Interrupt" or "Ask Before Pitch"
   - **Soft/inferred signal** → "Neutral Insight" or "Upfront Value"
   - Full framework menu: Read `knowledge/copywriting-frameworks.md`
3. Draft Step 1 using this skeleton:
   - **Opener** (1 sentence): signal reference, specific
   - **Problem** (1 sentence): the pain the signal implies for this role
   - **Bridge** (optional, 1 sentence): proof point with a number, or pattern observation
   - **CTA** (1 sentence): soft, scheduling-oriented, low-friction
4. Apply tone calibration:
   - VP/C-Level (ATL): direct, blunt, peer-to-peer, 40-70 words. See `knowledge/atl-btl-messaging.md`.
   - Manager/IC (BTL): logical, efficient, more context allowed, 60-90 words.
   - Founder: peer-to-peer, low formality, name-drop other founders if relevant.
5. Self-check before output:
   - Could this be sent to a different company without rewriting? → fail, redraft
   - Is the signal in sentence 1? → if not, restructure
   - Are there bullet points or HTML? → strip
   - Is the CTA a meeting demand or a question? → soft question wins
6. Generate 2-3 subject line options inline (or route to `tasks/write-subject-lines.md` for full ranked set)

## Output format

```
Hypothesis: [name or one-line description]
ICP: [role] @ [company type]
Signal: [specific trigger]
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

End with one line: *"Run `tasks/stress-test-sequence.md` once Steps 2 and 3 are drafted — don't launch below 8.1/10."*

## Pass criteria

- Word count in target range
- Signal appears in opening sentence
- Zero generic phrases ("hope you're well", "quick question", "wanted to reach out")
- One CTA, framed as a question
- Tone matches persona tier

## Common failures

- **Generic opener** — fix by replacing sentence 1 with the literal signal observation
- **Multiple CTAs** — strip to one, the most-conversion-likely
- **Feature dump in middle** — replace with the problem the persona feels because of the signal
- **Subject line over 6 words** — regenerate using `tasks/write-subject-lines.md`

## Deeper knowledge (load only when needed)

- 13 named frameworks with full templates → `knowledge/copywriting-frameworks.md`
- Email component rules (opener / body / CTA / sign-off) → `knowledge/copywriting-principles.md`
- ATL vs BTL deep guide → `knowledge/atl-btl-messaging.md`
- E-commerce vertical specifics → `knowledge/copywriting-ecom-playbook.md`
- ColdIQ playbook (3 value-prop styles, 3 preview patterns) → `knowledge/coldiq-playbook.md`
- Ready-to-deploy templates → `knowledge/email-templates-library.md`
