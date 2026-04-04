# FINN — Financial Intelligence & Navigation Network
## Course Repository README
**Version:** 1.0 | **Created:** April 3, 2026 | **Starts:** April 13, 2026 | **Ends:** September 26, 2026

---

> *Train students to approach every market question as a testable hypothesis, every trade as a data-driven decision, and every result as feedback for a better model.*

---

## What Is FINN?

FINN is a 6-month FinTech, Quantitative Trading, and AI Automation course designed to train students to operate as junior quantitative analysts. It combines rigorous data science methodology with financial market knowledge to build, test, and deploy AI-assisted trading strategies — using exclusively free tools, Python-native workflows, and a practitioner-led teaching approach.

The course runs Monday/Wednesday/Friday evenings (8:00–9:30 PM EST) plus a Daily Market Brief (9:00–10:00 AM EST) during market hours. Paper trading on Webull begins Month 3 and runs through the final session.

---

## How to Use This Repository

**If you are a student:** Start with `FINN_Curriculum_Wiki.md` as your knowledge reference, then follow the monthly lesson plan for your current week. Every session has exact timestamps, block-by-block structure, and deliverable requirements.

**If you are the instructor:** Load `FINN_Context.md` first — it contains every design decision and course parameter. Then `FINN_Soul.md` for operating in voice. Monthly files drive each session.

**If you are resuming a session with FINN (AI):** Load `FINN_Context.md` and `FINN_Soul.md` at session start. FINN will reorient fully from those two files.

---

## Complete File Index

### Reference Files — Load These First

| File | Purpose | When to Use |
|------|---------|-------------|
| `FINN_Context.md` | Operational reference — all course parameters, design decisions, file inventory, calendar | Start of any new session with FINN |
| `FINN_Soul.md` | Persona sentiment and character — who FINN is, teaching voice, values, philosophy | Before operating as or interacting with FINN |
| `FINN_Curriculum_Wiki.md` | Master knowledge base — all concepts, tools, Python code, resources, glossary | Ongoing reference throughout the course |
| `FINN_Weekly_Structure.md` | Session templates — static blueprint for every DMB, Monday, Wednesday, Friday class | Building weekly lesson plans; running sessions |

### Monthly Lesson Plans — The Course in Action

Each file covers 4 weeks: 12 class sessions (Mon/Wed/Fri × 4 weeks) with exact timestamps, all session blocks written in full, workshop code, Socratic questions, deliverables, and instructor checklists.

| File | Phase | Dates | Milestone |
|------|-------|-------|-----------|
| `FINN_Month01.md` | Foundation | Apr 13 – May 9 | **M1: Market Literacy Assessment** (May 8) |
| `FINN_Month02.md` | Quant Methods + AI | May 11 – Jun 6 | **M2: Strategy Presentation** (Jun 5–6) |
| `FINN_Month03.md` | Paper Trading I | Jun 8 – Jul 3 | *(M3 prep begins)* |
| `FINN_Month04.md` | Paper Trading II | Jul 6 – Aug 1 | **M3: Paper Trading Mid-Review** (Aug 1) |
| `FINN_Month05.md` | Optimization + Capstone Design | Aug 3 – Aug 28 | Capstone Locked (Aug 28) |
| `FINN_Month06.md` | Capstone Execution + Finale | Aug 31 – Sep 26 | **M4: Capstone Presentations** (Sep 25–26) |

---

## How the Files Work Together

```
FINN_Soul.md          ←── Who FINN is
FINN_Context.md       ←── What the course is
        │
        ├── FINN_Curriculum_Wiki.md     ←── The WHAT (all knowledge)
        │
        └── FINN_Weekly_Structure.md   ←── The HOW (all session formats)
                    │
                    ├── FINN_Month01.md  ←── Week-by-week: content poured into structure
                    ├── FINN_Month02.md
                    ├── FINN_Month03.md
                    ├── FINN_Month04.md
                    ├── FINN_Month05.md
                    └── FINN_Month06.md
```

The **Curriculum Wiki** is the content library. The **Weekly Structure** is the reusable container. The **Monthly files** are where content meets structure — every session fully planned, every minute accounted for, every deliverable specified.

---

## Course Timeline at a Glance

| Week | Dates | Content | File |
|------|-------|---------|------|
| Onboarding | Apr 6–11 | Dev setup, accounts, test trades | *(not in curriculum files)* |
| 1–4 | Apr 13 – May 9 | Market literacy, Python fundamentals | `FINN_Month01.md` |
| 5–8 | May 11 – Jun 6 | Statistics, backtesting, AI signals | `FINN_Month02.md` |
| 9–12 | Jun 8 – Jul 3 | Live paper trading, risk management | `FINN_Month03.md` |
| 13–16 | Jul 6 – Aug 1 | Automation, multi-position, Milestone 3 | `FINN_Month04.md` |
| 17–20 | Aug 3 – Aug 28 | XGBoost, live sentiment, capstone design | `FINN_Month05.md` |
| 21–24 | Aug 31 – Sep 26 | Capstone execution, final analysis, Milestone 4 | `FINN_Month06.md` |

**Key dates:** Memorial Day May 25 (async), July 4 market closes early Jul 3, Labor Day Sep 7 (async). All pre-built async packages are embedded in their respective monthly files.

---

## The Four Milestones

| # | Name | Date | Format |
|---|------|------|--------|
| M1 | Market Literacy Assessment | May 8, 2026 | 20-min oral per student |
| M2 | Strategy Presentation | Jun 5–6, 2026 | 15-min presentation + 5-min Q&A |
| M3 | Paper Trading Mid-Review | Aug 1, 2026 | 30-min individual portfolio review |
| M4 | Final Capstone | Sep 25–26, 2026 | 20-min presentation + 10-min Q&A + written report |

---

## Quick-Start: Getting the Environment Ready

```bash
# 1. Create environment
conda create -n finnenv python=3.11
conda activate finnenv

# 2. Install all dependencies
pip install pandas numpy scipy statsmodels \
            yfinance alpaca-py fredapi \
            pandas-ta \
            scikit-learn xgboost lightgbm \
            backtrader vectorbt quantstats \
            openai langchain langchain-openai \
            transformers torch \
            plotly matplotlib seaborn \
            webull praw newsapi-python \
            schedule \
            jupyter ipykernel python-dotenv requests

# 3. Set up .env file (never commit this)
# WEBULL_EMAIL=
# WEBULL_PASSWORD=
# WEBULL_TRADE_PIN=
# ALPACA_API_KEY=
# ALPACA_SECRET_KEY=
# OPENAI_API_KEY=
# NEWSAPI_KEY=
# FRED_API_KEY=
```

**Accounts required (all free):** Webull · Alpaca · GitHub · Google (Colab) · FRED · HuggingFace · NewsAPI · Alpha Vantage · QuantConnect

---

## Student Repository Structure

```
finn-course-[initials]/
├── README.md
├── hypothesis-log/
│   └── hypothesis_log_master.md
├── workshops/
│   └── W01_workshop_market_data_[initials].ipynb  (through W24)
├── weekly-notes/
│   └── W01_reading_notes_[initials].md
├── review-logs/
│   └── W01_review_log_[initials].md
├── resources/
│   └── (all FINN course files live here)
└── capstone/
    ├── capstone_spec_[initials].md
    ├── trading_journal.csv
    ├── signal_reports/
    ├── charts/
    └── capstone_report_final_[initials].md
```

---

*FINN — Financial Intelligence & Navigation Network*
*Not financial advice. All strategies are for educational purposes only.*
