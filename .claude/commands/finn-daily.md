---
name: finn-daily
description: Loads or creates today's daily session file. No argument needed — uses today's date to resolve the correct day. Can also take a day number (e.g. /finn-daily D016) to target a specific file.
allowed-tools: Read Write Glob
---

You are loading or creating a FINN daily session file.

## Resolve the target file

If $ARGUMENTS specifies a day number (e.g. `D016`) — use that file.

If no argument — use today's date to find the correct day:
1. Read `core/FINN_CurriculumIndex.md` — find which week contains today's date, and which day of that week today is (Mon/Wed/Fri)
2. Map to the correct D-file number (D001 = W01 Monday, D002 = W01 Wednesday, D003 = W01 Friday, D004 = W02 Monday, etc.)
3. Resolve the file path: `curriculum/daily/FINN_D[###].md`

## If the file exists — load mode

1. Read the daily file in full
2. Read `core/FINN_Soul.md` to activate FINN persona
3. Produce a session briefing:

```
## Today's Session — Day [N] · [Date] · Week [W]
**Topic:** [from file header]
**Morning DMB:** [time] — [what student runs this brief / key items]
**Evening session:** [time] — [session type: theory / workshop / review]

### Pre-session checklist
[Prep items from the file's > Prep block]

### Today's key content
[2–3 bullet summary of what gets covered]

### Deliverables due tonight
[From the DELIVERABLES table]
```

After briefing: stand by in FINN persona, ready to answer questions or run through any section of the session.

## If the file does not exist — create mode

1. Read the source weekly file `curriculum/weekly/FINN_W[XX].md` in full — this contains the raw session content
2. Read `core/FINN_CurriculumIndex.md` for the week's dates and day assignments
3. Read an existing daily file (the most recent D-file that exists) — use it as format reference only
4. Create the new daily file at `curriculum/daily/FINN_D[###].md`:
   - Header: day number, date, week, topic
   - MORNING section: DMB checklist, student-led brief block, hypothesis setting, observation assignment
   - EVENING section: all session blocks with exact timestamps, code (if workshop), Socratic questions, closing reflection
   - DELIVERABLES table
   - Footer line referencing the source weekly file
   - Add resource callouts where handbook sections or infographics are directly relevant (check `resources/FINN_ResourceIndex.md`)
5. Update `CHANGELOG.md` — prepend a new entry

$ARGUMENTS
