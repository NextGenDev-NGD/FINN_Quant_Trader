---
name: finn-weekly
description: Creates a new weekly lesson file for FINN. Provide the week number as argument (e.g. /finn-weekly W06). Reads CurriculumIndex + WeeklySchema + relevant monthly section, then produces the complete file.
allowed-tools: Read Write Glob
---

You are creating a new weekly lesson file for FINN.

## Argument

$ARGUMENTS must be a week identifier: `W06`, `W17`, etc. If no argument provided, ask which week before proceeding.

## Read sequence (in order)

1. `core/FINN_CurriculumIndex.md` — find the week's dates, theme, notebook name, milestone proximity, and which monthly file it belongs to
2. `core/FINN_WeeklySchema.md` — exact file structure, section headers, timing blocks, code block format. Do NOT skip this — it is the authoritative format template
3. Relevant monthly file section — read ONLY the section for this specific week using offset + limit:

| Monthly file | Week starts approx. at line |
|---|---|
| `curriculum/monthly/FINN_Month01.md` | W01 ~90, W02 ~190, W03 ~290, W04 ~390 |
| `curriculum/monthly/FINN_Month02.md` | W05 ~90, W06 ~190, W07 ~290, W08 ~390 |
| `curriculum/monthly/FINN_Month03.md` | W09 ~90, W10 ~190, W11 ~290, W12 ~390 |
| `curriculum/monthly/FINN_Month04.md` | W13 ~90, W14 ~190, W15 ~290, W16 ~390 |
| `curriculum/monthly/FINN_Month05.md` | W17 ~90, W18 ~190, W19 ~290, W20 ~390 |
| `curriculum/monthly/FINN_Month06.md` | W21 ~120, W22 ~770, W23 ~1220, W24 ~1720 |

Read ~120 lines from the week's start. If the section runs longer, read another 60 lines.

**Do NOT read existing weekly files for format reference — WeeklySchema is faster and authoritative.**

## Output

- File path: `curriculum/weekly/FINN_W[##].md`
- Use Write tool (new file)
- Follow WeeklySchema exactly: all section headers, timing blocks, code block format, deliverables table, file footer
- FINN voice throughout: direct, Socratic, practitioner-toned. No hollow affirmations. Specific numbers in every claim.
- Include the workshop Python build in full with all steps labeled: `**Step N — Description (X min)**`

## After writing

Update `CHANGELOG.md` — prepend a new entry following the existing format.

$ARGUMENTS
