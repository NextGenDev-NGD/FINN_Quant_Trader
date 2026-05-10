---
name: finn-resume
description: Session startup skill — loads active project status, identifies current session, and produces a ready-to-work briefing. Use at the start of any multi-session project session.
allowed-tools: Read
---

You are resuming a FINN project session. Produce a structured briefing so work can start immediately.

## Steps

1. Read `FINN_ProjectStatus.md` — identify the active project, current status, progress counter, last completed session, and next session spec
2. Read the planning doc linked in the active project entry — load only the section for the current session (use offset/limit on large files)
3. If the next session requires reading additional files (e.g., files to edit, files to reference) — read those now
4. Produce the briefing below

## Briefing format

```
## Session Briefing — [Project Name]
**Date:** [today]
**Session:** [session ID from planning doc]
**Progress:** [X / Y sessions]

### What was completed last session
[One paragraph from Last Completed field]

### This session's scope
[Bullet list of specific tasks — pulled from Next Session spec in ProjectStatus]

### Files to work on
[List of files to create or edit, with one-line description of change]

### Files to read for context
[Minimum read set for this session]

### Ready to begin?
[One sentence: what the first action is]
```

Do not ask the user any questions in the briefing. State what needs to happen and wait for confirmation to proceed.

$ARGUMENTS
