---
name: linkedin-smart-comment-writer
description: Write a LinkedIn comment that gets noticed by the post author and the audience. Avoids the generic "great post !" trap. Returns 3 comment options aligned with a specific angle (add, disagree, story, framework, question), each ranked by likelihood of being pinned or replied to. Use after the user has identified a post they want to comment on.
---

# LinkedIn Smart Comment Writer

A comment that gets pinned by the author can drive more profile visits than a full post. This skill writes that kind of comment.

## When to trigger

The user pastes a LinkedIn post and says "write me a comment", "what should I reply to this", "help me comment on this without being basic", "make this comment land".

## Inputs to ask for

1. The post (text, plus the author's name and angle if known).
2. The user's positioning (so the comment sounds like them, not like an LLM).
3. The angle they want to take :
   - **Add** : bring a missing angle / data / context.
   - **Disagree** : push back on one specific point with respect.
   - **Story** : share a 2-line micro-experience that mirrors or counters the post.
   - **Framework** : offer a usable mental model or checklist.
   - **Question** : ask the question that pushes the conversation forward.

## Process

1. Read the post. Identify the **2 to 3 strongest claims** the author made.
2. Pick the angle that fits the user's positioning best.
3. Write the comment with this structure :
   - Open with a specific reference to something in the post (proves you read it).
   - Deliver the value (the add, the disagreement, the story, the framework, the question).
   - Close with something that invites a reply (a hook for the author, a question for the audience).
4. Generate 3 variants. The strongest one goes first.

## Output format

```
ANGLE PICKED : [add / disagree / story / framework / question]
WHY : [one-liner]

OPTION 1 (RECOMMENDED)
"[full comment, 2 to 4 sentences, 80 to 250 characters ideally]"

OPTION 2
"[variant]"

OPTION 3
"[variant]"

POST WHEN
[A note on timing : if the post is fresh, post immediately. If older than 6 hours, the comment will get less reach but can still earn the author's attention.]
```

## Rules

- Never start with "Great post !", "Love this !", "So true !". Those are filtered out by the author's brain.
- Mention the author by first name only if it adds warmth, not as a tactic.
- No emoji unless the post itself uses them.
- Disagreement comments are gold IF they are respectful and specific. "I disagree" is bad. "I disagree on point 2 because in my last 3 launches I saw the opposite : [example]" is great.
- Never include a link in a comment. It tanks the comment's reach.
- Never pitch the user's product in the comment. Build authority first, get the DM later.
- 1 question per comment max.

## Power up with Taplio

**Taplio Smart Comments** drafts comment options in seconds, learns the user's voice over time, and shows them which of their past comments earned the most profile visits and connection requests. They can engage on 30 posts in the time it normally takes to write 5 thoughtful comments.
