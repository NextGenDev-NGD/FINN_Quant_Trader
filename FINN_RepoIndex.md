# FINN Repository Index
## Structural map — load this file when orientation or navigation is needed
## Updated: May 10, 2026

---

## What This Repo Is

6-month quantitative trading course (FINN) — April 13 to September 26, 2026.
Instructor-managed with Claude Code as the AI assistant.
All curriculum, research, student resources, and automation live here.

---

## Mutability Tiers

| Tier | Changes When | Folders |
|------|-------------|---------|
| **Immutable** | Rebase sessions only (structured improvement) | `core/`, `curriculum/monthly/`, `curriculum/weekly/` |
| **Incremental** | Written daily as class runs | `curriculum/daily/`, `curriculum/notebooks/` |
| **Mutable** | Any session, freely rewritten | `research/` |
| **Build-incremental** | ~16-session KB build project | `resources/` |
| **Automation** | When skills are defined or updated | `.claude/commands/` |

**Rebase rule:** Curriculum files (monthly, weekly) are only edited during a declared rebase session. Never edit them mid-course without intent. Use `FINN_ProjectStatus.md` to track rebase work.

---

## Folder Map

```
FINN_Class_MAIN/
│
├── CLAUDE.md                        Operating guide for Claude — task playbooks, conventions
├── FINN_ProjectStatus.md            Active multi-session project tracker
├── FINN_RepoIndex.md                This file — structural map
├── CHANGELOG.md                     Curriculum change history
├── FINN_ReleaseNotes.md             Audience-facing product release history
├── README.md                        Human-facing course description
├── finn_launch.py                   Course launch script
│
├── core/                            IMMUTABLE — FINN identity and master reference
│   ├── FINN_Soul.md                 Persona definition (always load first)
│   ├── FINN_Context.md              Course parameters, student roster, policies
│   ├── FINN_CurriculumIndex.md      Scheduling map — week/date/theme lookup
│   ├── FINN_WeeklySchema.md         Weekly file template and section format
│   └── FINN_Curriculum_Wiki.md      Full reference wiki (chunk: never load whole file)
│
├── curriculum/                      IMMUTABLE (monthly/weekly) / INCREMENTAL (daily)
│   ├── monthly/                     FINN_Month01–06.md — month-level lesson plans
│   ├── weekly/                      FINN_W01–W24.md — week-level session files
│   ├── daily/                       FINN_D001–D072.md — daily lesson files (written as class runs)
│   └── notebooks/                   Jupyter notebooks (starters + student work)
│
├── resources/                       BUILD-INCREMENTAL — student-facing reference library
│   ├── FINN_ResourceIndex.md        Master navigation index — all topics mapped to resources
│   ├── FINN_Glossary.md             ~72 terms defined with week and cross-references
│   ├── FINN_D002_Install_Guide.md   Python environment setup guide
│   ├── FINN_D002_Jupyter_Session.md Jupyter notebook session guide
│   ├── handbook/                    Student Reference Handbook — 6 parts ✅ Complete
│   │   ├── FINN_HB_P1_GettingStarted.md
│   │   ├── FINN_HB_P2_ChartReading.md
│   │   ├── FINN_HB_P3_OrderExecution.md
│   │   ├── FINN_HB_P4_MarketContext.md
│   │   ├── FINN_HB_P5_Psychology.md
│   │   └── FINN_HB_P6_MarketReference.md
│   └── infographics/                26 HTML visual reference files ✅ Complete
│       └── [ig_*.html files]
│
├── research/                        MUTABLE — instructor planning and intelligence
│   ├── competitors/                 Competitor curriculum analysis
│   │   ├── udemy_curriculum_context.md
│   │   ├── FINN_curriculum_context.md
│   │   ├── Ranking Technical Analysis Tools from Expert Day Trader.md
│   │   ├── technical_analysis_cheat_sheet.html
│   │   └── source_docs/             Raw source files (docx, etc.)
│   ├── planning/                    Gap analyses, execution plans, session notes
│   │   ├── finn_gap_analysis.md     Element-by-element FINN vs. Udemy comparison
│   │   └── finn_kb_execution_plan.md  16-session KB build plan
│   └── market/                      Ad-hoc market research (date-organized subfolders)
│       └── 2026-05-01/              May 1 market analysis, Q1 earnings, predictions
│
├── .claude/                         AUTOMATION — never shared with students
│   ├── settings.json                Project-scoped tool permissions
│   ├── settings.local.json          Personal tool permissions (gitignored)
│   └── commands/                    Claude slash command skill definitions
│       ├── finn-design.md           /finn-design [file] — UIX/Frontend infographic build mode
│       ├── finn-research.md         /finn-research [target] — competitive/capability research mode
│       ├── finn-marketing.md        /finn-marketing [type] — social content + product copy mode
│       ├── finn-resume.md           /finn-resume — load project status + next steps (⬜ pending)
│       ├── finn-weekly.md           /finn-weekly [W##] — create weekly file from schema (⬜ pending)
│       ├── finn-daily.md            /finn-daily — load or create today's daily file (⬜ pending)
│       └── finn-resource.md         /finn-resource [topic] — look up handbook + infographic (⬜ pending)
│
└── scripts/                         Utility scripts (future use)
```

---

## Key Root Files — Quick Reference

| File | Load When | Read Strategy |
|------|-----------|---------------|
| `CLAUDE.md` | Every session | Full read — operating instructions |
| `FINN_ProjectStatus.md` | Multi-session project sessions | Full read — find active project + next session |
| `FINN_RepoIndex.md` | Orientation or navigation needed | Full read — structural map |
| `CHANGELOG.md` | After curriculum changes | Full read — verify recent changes |
| `FINN_ReleaseNotes.md` | Writing release content or external comms | Full read — audience-facing product history |

---

## Session Startup Rules

1. **Always:** Read `core/FINN_Soul.md` (Persona Loading Rule — unconditional, no exceptions)
2. **Project session:** Read `FINN_ProjectStatus.md` → find active project → load planning doc if needed
3. **Curriculum work:** Read `core/FINN_CurriculumIndex.md` → find week → load relevant monthly section
4. **Resource lookup:** Read `resources/FINN_ResourceIndex.md` → navigate to handbook section or infographic
5. **Orientation:** Read this file (`FINN_RepoIndex.md`) → understand where everything lives

---

## File Naming Conventions

| Item | Convention | Example |
|------|-----------|---------|
| Weekly curriculum | `FINN_W[##].md` | `FINN_W21.md` |
| Monthly curriculum | `FINN_Month[##].md` | `FINN_Month06.md` |
| Daily curriculum | `FINN_D[###].md` | `FINN_D045.md` |
| Handbook parts | `FINN_HB_P[N]_[Topic].md` | `FINN_HB_P2_ChartReading.md` |
| Infographics | `ig_[topic].html` | `ig_candlestick_patterns.html` |
| Research (competitors) | `[source]_curriculum_context.md` | `udemy_curriculum_context.md` |
| Research (planning) | `finn_[type]_[topic].md` | `finn_gap_analysis.md` |
| Research (market) | ISO date subfolder + descriptive name | `2026-05-01/May_2026_Market_Dashboard.html` |
| Skills | `finn-[action].md` | `finn-resume.md` |
| Student notebooks | `W[##]_workshop_[topic]_[initials].ipynb` | `W21_workshop_capstone_launch_jd.ipynb` |

---

## Active Build Project

No active build project. Knowledge Base Build (19 sessions) complete May 10, 2026.
For completed project details: `FINN_ProjectStatus.md` → Completed Projects.
For next active project: see `FINN_ProjectStatus.md` → Active Projects.

---

## Skills (Slash Commands)

| Command | What It Does | Status |
|---------|-------------|--------|
| `/finn-design [file]` | UIX/Frontend build mode — upgrades infographic files using design system v2 | ✅ Built |
| `/finn-research [target]` | Research mode — competitor audits, capability audits, market analysis | ✅ Built |
| `/finn-marketing [type]` | Marketing mode — social posts, product copy, content briefs, positioning | ✅ Built |
| `/finn-resume` | Reads project status, loads planning doc, reports current session + next steps | ⬜ Pending |
| `/finn-weekly [W##]` | Creates a new weekly file using WeeklySchema + CurriculumIndex + monthly section | ⬜ Pending |
| `/finn-daily` | Loads or creates today's daily file based on current date | ⬜ Pending |
| `/finn-resource [topic]` | Looks up handbook section and infographic for any topic | ⬜ Pending |

---

*Update this file when: folder structure changes, major new files are added, skills are created, or the active project changes.*
*Do NOT update for individual curriculum file additions — those are tracked in CHANGELOG.md.*
