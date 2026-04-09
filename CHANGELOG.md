# FINN — Changelog
## Financial Intelligence & Navigation Network

---

### [2026-04-04] — Initial Repository Organization

**Time:** April 4, 2026

**Changes:**
- Organized root-level files into a structured folder layout
  - Created `core/` — houses the four master reference files: `FINN_Soul.md`, `FINN_Context.md`, `FINN_Curriculum_Wiki.md`, `FINN_Weekly_Structure.md`
  - Created `curriculum/` — houses the six monthly lesson plans: `FINN_Month01.md` through `FINN_Month06.md`
  - `README.md` remains in root as the primary navigation entry point
- Created this `CHANGELOG.md` file to track all future updates to the repository

**Status:** Repository initialized. Onboarding week begins April 6, 2026. Curriculum Week 1 begins April 13, 2026.

---

### [2026-04-06] — Weekly Lesson Files Created (W01–W15)

**Time:** April 6, 2026

**Changes:**
- Created 15 weekly lesson files under `curriculum/weekly/`:
  - `FINN_W01.md` through `FINN_W15.md`
  - Each file contains the full Mon/Wed/Fri session plan for its week: DMB blocks, evening session blocks, guided Python build, Socratic questions, deliverables, instructor notes, and curated resources
  - Coverage: W01–W04 (Month 1 / Foundation), W05–W08 (Month 2 / Quant Methods + AI), W09–W12 (Month 3 / Paper Trading I), W13–W15 (Month 4 partial / Paper Trading II)
- **W16–W24 not yet written.** Remaining weeks cover Month 4 (W16), Month 5 (W17–W20), and Month 6 (W21–W24).

**Status:** 15 of 24 weekly files complete. Session is the source of truth for daily execution.

---

### [2026-04-06] — Monthly Files Reorganized into Subdirectory

**Time:** April 6, 2026

**Changes:**
- Moved six monthly lesson plan files from `curriculum/` (root) into `curriculum/monthly/`:
  - `FINN_Month01.md` through `FINN_Month06.md`
- No content changes — file moves only
- `README.md` file index already references the correct paths

**Status:** Repository structure now matches the layout described in `README.md` and `FINN_Context.md`.

---

### [2026-04-08] — Daily Class Files Introduced (D001)

**Time:** April 8, 2026

**Changes:**
- Created `curriculum/daily/` folder — new layer between weekly lesson plans and live delivery
- Created `FINN_D001.md` — Day 1, Monday April 13, 2026 (Week 1)
  - Teleprompter-format script covering both the morning DMB and evening theory session
  - Structure: 60 min material + 30 min dedicated Q&A per evening session
  - Written in first-person FINN voice for live delivery — not a lesson plan
  - Populated with real market context from April 8, 2026:
    - Iran ceasefire → S&P 500 +2.51%, oil -16%, VIX 25.78, BTC $71,906
    - Bank earnings week (JPMorgan, Goldman, Wells Fargo)
    - 10-year yield at 4.33%

**Format decisions for daily files:**
- Single file per calendar day (AM + PM sessions combined)
- Bold time stamps at every transition, `[ASK]` / `[SHOW]` action cues inline
- Q&A is its own named 30-min block with seed questions and FINN-ask guidance
- Deliverables table at the bottom, file footer references source weekly file

**Status:** Day 1 complete. D002 (Wednesday April 15) and D003 (Friday April 17) pending.
Format approved before proceeding to remaining days.

---

### [2026-04-08] — Claude Context Files Created

**Time:** April 8, 2026

**Changes:**
- Created `CLAUDE.md` (repo root) — Claude Code operating guide: task playbooks, file token budget table, naming conventions, code conventions, FINN voice quick-reference
- Created `core/FINN_CurriculumIndex.md` — Dense 24-week index: dates, themes, notebook names, milestones, async weeks, content thread map. Replaces reading monthly files for scheduling/context.
- Created `core/FINN_WeeklySchema.md` — Exact weekly file template with all section headers, timing blocks, code block format, async day format. Replaces reading existing weekly files for format reference.

**Purpose:** Optimize token usage and reduce read overhead when Claude creates or reviews curriculum files in future sessions.

---

### [2026-04-08] — Weekly Lesson Files Completed (W21–W24)

**Time:** April 8, 2026

**Changes:**
- Created 4 weekly lesson files under `curriculum/weekly/`, completing the full 24-week set:
  - `FINN_W21.md` — Capstone Launch (Aug 31–Sep 5): CapstonePipeline v2.0, first live capstone trades, Report Section 1
  - `FINN_W22.md` — Deep Execution + Full Analytics (Sep 7–12): Labor Day async package, 4-month analytics notebook, Report Sections 2–4
  - `FINN_W23.md` — Analysis, Writing & Honest Assessment (Sep 14–19): AI contribution visualization, all 5 capstone charts, Report Sections 5–7
  - `FINN_W24.md` — Presentation, Finale & Course Close (Sep 21–26): Dress rehearsal, Milestone 4 presentations, course close ritual
- All 24 of 24 weekly files are now complete

**Status:** Curriculum complete. Full 24-week weekly file coverage from W01 (April 13, 2026) through W24 (September 26, 2026).

---
