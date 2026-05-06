# Task: Add Spintax to a Sequence

Apply `{option1|option2|option3}` variation across an approved sequence to make each send look unique — improving deliverability and reducing spam-filter pattern detection.

## When to use this

Apply this AFTER the sequence has passed `tasks/stress-test-sequence.md` (8.1+ on every step). Never spintax bad copy — variation doesn't fix a bad email.

## Inputs required

- **Final approved sequence** — every step, copy locked
- **Sending volume context** — high volume (5,000+/day) needs more variation than low volume (< 500/day)

## What spintax is

Syntax: `{option1|option2|option3}` — the platform picks one at random per send.

- `{Hi|Hello|Hey} {{first_name}}` → "Hi John", "Hello Sarah", "Hey Mike"
- `{Best|Thanks|Cheers}` → randomized sign-off

Supported natively in Instantly, PlusVibe, Smartlead, Lemlist. Test rendering in your platform before launching.

## Where to apply spintax (in order of impact)

1. **Greeting** — `{Hi|Hello|Hey} {{first_name}}`
2. **Sign-off** — `{Best|Thanks|Talk soon|Cheers}`
3. **CTA phrasing** — same meaning, different words: `{Worth a chat?|Open to a 15-min call?|Up for a quick conversation?}`
4. **Opening phrase** — first 3-5 words before the signal reference
5. **Transition phrases** — "The reason I'm reaching out" → `{The reason I'm reaching out|What made me write|Why I'm sending this}`
6. **Subject line** — if 3 winners were selected from `tasks/write-subject-lines.md`, rotate them via spintax

## What NOT to randomize

| Element | Why |
|---|---|
| The signal reference | Must be specific and consistent — variation here loses the personalization |
| Company / role variables | These come from the data, not from spintax |
| The core argument | Variation in logic confuses the message |
| PS lines | Should be consistent — PS builds a recognizable pattern |
| Numbers / stats / proof | Specificity is the credibility — never vary "47%" to "around half" |

## Process

1. Read each step of the sequence
2. Identify 3-5 spintax points per step using the impact-ordered list above
3. Write 2-3 variants per point. Variants must:
   - Mean the same thing
   - Match the same tone (don't mix "Hey there" with "Greetings")
   - Be the same length (within 1-2 words)
4. Wrap in `{variant1|variant2|variant3}` syntax inline
5. Note any platform-specific tokens (`{{first_name}}`, `{{company_name}}`) and keep them outside the spintax wrappers
6. Return the full sequence with spintax applied

## Output format

```
SEQUENCE WITH SPINTAX — [hypothesis name]
Volume tier: [low <500/day | mid 500-5K/day | high 5K+/day]
Variants per point: [2 for low, 3 for mid/high]

STEP 1 — [n] variation points applied
Subject: {subject A|subject B|subject C}
---
{Hi|Hello|Hey} {{first_name}},

{The reason I'm reaching out|What prompted this email} is...
[rest of body — signal reference and proof points unchanged]

{Best|Thanks|Talk soon},
[Sender name]
---

[Repeat for each step]

CHECKS
✓ Signal references unchanged across all steps
✓ Numbers/stats unchanged
✓ Tone consistent within each spintax group
✓ Platform tokens outside spintax wrappers
```

## Pass criteria

- 3-5 spintax points per step (high volume) or 3 per step (low volume)
- 2 variants minimum per point (low/mid volume), 3 variants (high volume)
- No spintax inside signal references, numbers, or proof points
- Total possible permutations per step: 2^5 = 32 (low) to 3^5 = 243 (high)

## Common failures

- **Spintaxing the signal reference** → kills the personalization that earns the reply
- **Variants with different tones** mixed in one wrapper → "Hi" and "Greetings" are different registers; pick one register and vary within it
- **Spintax in numbers** → "47%" → "around half" loses credibility
- **Forgetting to test platform rendering** → some platforms strip nested spintax; send a test to yourself first
- **Spintaxing a bad email** → variation doesn't fix bad copy. Re-stress-test.

## What to do after

- Send a test email to yourself in the actual sending platform — confirm spintax renders
- Run the spintax'd sequence through `tasks/stress-test-sequence.md` ONE more time on the most likely permutation — confirm quality is preserved
- Launch
