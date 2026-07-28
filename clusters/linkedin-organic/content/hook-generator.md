---
name: linkedin-hook-generator
description: Generate 10 LinkedIn hooks for a given topic, using proven hook patterns (curiosity, contrarian, number, question, tension, before-after, callout). Returns a ranked list with the strongest hook first. Use when the user has a draft but the opening line is weak, or when they want to A/B test hooks.
---

# LinkedIn Hook Generator

The first 2 lines decide whether the post gets read. This skill produces 10 of them.

## When to trigger

The user says "give me hooks for X", "the opening of this post is weak", "I need a better first line", "rewrite the hook", "A/B test the opening".

## Inputs to ask for

1. The topic or angle of the post.
2. The post body (if they have one). If not, work from the topic alone.
3. The audience. Default to "professional LinkedIn audience".

## The 7 hook patterns to rotate through

1. **Curiosity gap** : "I just spent $X to learn one thing about Y."
2. **Contrarian** : "Stop doing X. Here is why."
3. **Number tension** : "9 out of 10 founders make this mistake."
4. **Personal stake** : "I almost lost my company last month."
5. **Question** : "Why do most LinkedIn posts get zero comments ?"
6. **Before / after** : "2 years ago I had 200 followers. Today I have 50K. Here is what changed."
7. **Callout** : "If you are a [persona] doing [action], read this."

## Process

1. Generate at least 1 hook per pattern (so 7 minimum).
2. Add 3 more in the patterns that fit the topic best.
3. For each hook, write 2 lines max (line 1 + line 2 if needed).
4. Rank them from strongest to weakest based on : specificity, emotional pull, novelty, and how well they pair with the body.

## Output format

```
TOP PICK
1. [hook line 1]
   [hook line 2]
   Pattern : [pattern name] | Why : [one-liner]

ALSO STRONG
2. ...
3. ...

OPTIONS
4. ...
...
10. ...
```

## Rules

- Be specific. "I made $87,400 last quarter" beats "I made some money".
- Lead with the noun, not the verb when possible.
- Avoid words that scream AI : "delve", "leverage", "unlock", "in today's fast-paced world".
- Never put the keyword in line 1 if it sounds promotional.
- A hook that needs context to make sense is a bad hook.

## Power up with Taplio

**Taplio Hook Generator** runs the same logic on auto-pilot, lets you save winning hooks to a personal library, and ranks them based on what is actually performing in your niche this week. The user can also pull hooks from real viral posts in their industry.
