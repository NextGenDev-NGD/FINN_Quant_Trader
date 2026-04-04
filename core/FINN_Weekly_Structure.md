# FINN — Weekly Class Structure & Session Templates
## Financial Intelligence & Navigation Network
### Recurring Format Guide · April 2026

---

> **PURPOSE OF THIS DOCUMENT**
> This file defines the **static, reusable structure** for every class session and daily meeting
> throughout the course. It does not change week to week. It is the container — the curriculum
> wiki fills it with content. Use this document alongside `FINN_Curriculum_Wiki.md` to build
> each week's lesson plan by slotting the appropriate curriculum topics into the defined formats below.

---

## Table of Contents

- [1. Weekly Rhythm Overview](#1-weekly-rhythm-overview)
- [2. Daily Market Brief (DMB) — 9:00–10:00 AM EST](#2-daily-market-brief-dmb--900-1000-am-est)
- [3. Monday — Theory Session](#3-monday--theory-session)
- [4. Wednesday — Workshop Session](#4-wednesday--workshop-session)
- [5. Friday — Review & Market Session](#5-friday--review--market-session)
- [6. The Evening Advantage](#6-the-evening-advantage)
- [7. Weekly Deliverables Framework](#7-weekly-deliverables-framework)
- [8. Cancellation & Recovery System](#8-cancellation--recovery-system)
- [9. Semester Milestones](#9-semester-milestones)
- [10. Roles & Responsibilities](#10-roles--responsibilities)
- [11. Tools Used Per Session Type](#11-tools-used-per-session-type)
- [12. Session Health Checks](#12-session-health-checks)

---

## 1. Weekly Rhythm Overview

The course runs on a three-session weekly cycle with a daily morning brief.
Each session serves a distinct cognitive purpose. The structure never changes — only the content advances.

```
FULL WEEKLY SCHEDULE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  MON   9:00–10:00 AM EST  │  Daily Market Brief (DMB) — Required
        8:00–9:30 PM EST   │  Theory Session (90 min) — Deep Learning, No Code
        Deliverable        │  Reading Notes + 3 Weekly Hypotheses (written)

  TUE   9:00–10:00 AM EST  │  Daily Market Brief (DMB) — Optional (strongly encouraged)
        No evening class   │  Independent study + hypothesis tracking
        Makeup slot        │  Available for cancelled Mon/Wed/Fri sessions if needed

  WED   9:00–10:00 AM EST  │  Daily Market Brief (DMB) — Required
        8:00–9:30 PM EST   │  Workshop Session (90 min) — Hands-On Python, Notebooks
        Deliverable        │  Completed Jupyter Notebook submitted to GitHub

  THU   9:00–10:00 AM EST  │  Daily Market Brief (DMB) — Optional (strongly encouraged)
        No evening class   │  Independent study + hypothesis tracking
        Makeup slot        │  Available for cancelled Mon/Wed/Fri sessions if needed

  FRI   9:00–10:00 AM EST  │  Daily Market Brief (DMB) — Required
        8:00–9:30 PM EST   │  Review & Market Session (90 min) — Retrospective + Charts
        Deliverable        │  Weekly Review Log + Hypothesis Outcome Record

  SAT/SUN               ❌  │  NO CLASS. NO MAKEUP. STRICTLY OFF.
                            │  Cool-off period — protected absolutely to prevent burnout.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### Cognitive Purpose by Day

| Day | Session Type | Cognitive Mode | Primary Goal |
|-----|-------------|----------------|-------------|
| Monday AM | DMB | **Observe** | Set the week's analytical lens with fresh market data |
| Monday PM | Theory | **Acquire** | Build conceptual understanding and vocabulary |
| Tuesday AM | DMB (opt.) | **Track** | Monitor hypotheses against live intraday behavior |
| Wednesday AM | DMB | **Observe** | Mid-week market pulse — has anything shifted? |
| Wednesday PM | Workshop | **Apply** | Translate theory into working code and practice |
| Thursday AM | DMB (opt.) | **Refine** | Late-week thesis check before Friday close |
| Friday AM | DMB | **Observe** | Final market observations before weekly close |
| Friday PM | Review + Market | **Consolidate** | Validate learning, audit predictions, close the week |

---

## 2. Daily Market Brief (DMB) — 9:00–10:00 AM EST

### Purpose

The DMB is the daily analytical anchor of this course. It runs in the morning during market hours,
building a full day of real-time observation that students bring into the evening class.
By 8PM, every student has already watched the market respond to the day's news, tested their
hypotheses against live price action, and accumulated cooked-in sentiment and data to discuss.

The DMB is what makes the evening sessions analytically sharp rather than purely academic.

> **Required days:** Monday, Wednesday, Friday.
> **Optional but strongly encouraged:** Tuesday, Thursday.
> **Weekends:** Off. No exceptions.

---

### DMB Structure (60 minutes)

#### Block 1 — Pre-Market Scan (9:00–9:15 AM) | 15 minutes

**Led by:** Instructor or designated student (rotating)
**Tools:** TradingView, Finviz, Investing.com, FRED, Alpaca News

Purely observational. No opinions yet — only data. Every session, every week:

- [ ] **Overnight Futures:** ES (S&P 500), NQ (NASDAQ), YM (Dow) — direction and magnitude
- [ ] **VIX Level:** Current reading vs. prior close — above/below 20?
- [ ] **Macro Calendar:** Any scheduled releases today? (CPI, FOMC, jobs, GDP, PMI)
- [ ] **Earnings Calendar:** Major earnings before or after market today?
- [ ] **Sector Heat Map:** Pre-market sector colors — use Finviz
- [ ] **Bond Market:** 10-year yield direction — risk-on or risk-off signal?
- [ ] **Crypto Pulse:** BTC/ETH overnight — broader risk appetite indicator

---

#### Block 2 — Student-Led Brief (9:15–9:35 AM) | 20 minutes

**Led by:** Rotating student presenter (see Section 10 for rotation format)
**Tools:** TradingView personal watchlist, weekly hypothesis log

On their assigned lead day, the student presents their tracked watchlist:

```
Ticker:       [SYMBOL]
Current:      $[PRICE] | [+/- % from yesterday's close]
Setup:        [What the chart is showing — one sentence, no jargon]
Catalyst:     [What could move it today — news, level, event]
Hypothesis:   [What I expect and why — must be falsifiable]
Signal Check: [Any indicator worth noting — RSI, VWAP, volume, etc.]
```

Present 3–5 tickers. Keep each entry under 2 minutes. Quality over quantity.

---

#### Block 3 — Hypothesis Setting (9:35–9:50 AM) | 15 minutes

**Led by:** Instructor
**Tools:** Shared hypothesis log (GitHub markdown file)

The class collectively builds its daily market hypothesis. Every hypothesis must be:
- **Specific** — a ticker, sector, or index. Not "the market might go up."
- **Falsifiable** — we must be able to verify it right or wrong by Friday at the latest
- **Reasoned** — backed by at least one data point or signal

```
Date:          [YYYY-MM-DD]
Submitted by:  [Name]
Hypothesis:    [Specific, falsifiable statement]
Basis:         [Signal, indicator, or data that supports this]
Timeframe:     [Intraday / This week / This month]
Outcome:       [Leave blank — filled in at Friday review]
```

**No prediction shaming.** Wrong hypotheses are data. They are required for learning.

---

#### Block 4 — Observation Assignment (9:50–10:00 AM) | 10 minutes

**Led by:** Instructor
**Purpose:** One specific thing to observe during market hours, tied to the current curriculum topic.

This bridges the morning DMB with the evening class. Students spend the day watching for it.

| Curriculum Phase | Sample Observation Assignment |
|-----------------|-------------------------------|
| Market Fundamentals | "Watch the bid-ask spread on a small-cap vs. SPY — log the difference" |
| Technical Indicators | "Track RSI on QQQ throughout the day — does it reach oversold before bouncing?" |
| AI/Sentiment Phase | "Find one news item that moved a stock today and score its sentiment manually" |
| Backtesting Phase | "Identify one setup today that matches our current strategy's entry rules" |
| Paper Trading Phase | "Log any paper trade signal — whether you act on it or not" |

---

### DMB Ground Rules

1. **Start at 9:00 AM sharp.** Market opens at 9:30 — the brief must finish by 10:00.
2. **Data before opinions.** Block 1 is facts only. Interpretations belong in Block 3.
3. **Hypotheses must be written.** Verbal-only hypotheses do not count.
4. **The log is permanent.** Every hypothesis is kept. All are reviewed Friday.
5. **Wrong predictions are celebrated.** They are the best learning data we have.

---

## 3. Monday — Theory Session

**Time:** 8:00–9:30 PM EST
**Duration:** 90 minutes

### Purpose

Monday evening is for **deep conceptual learning**. Students arrive having spent the day
in the market — DMB in the morning, observation assignment during hours, live price action
all day. The evening class takes that raw market experience and gives it intellectual structure.

No code is written during Monday sessions. No tools are open unless displaying reference material.
The work is reading, thinking, debating, and building mental models.

> **The evening timing is an asset.** Students don't arrive cold — they arrive with a full
> day of market context. The Monday theory session is where we explain what they just watched.

---

### Pre-Session Requirements (before 8:00 PM Monday)

- [ ] Assigned reading from `FINN_Curriculum_Wiki.md` completed
- [ ] Minimum 5 bullet-point notes from the reading
- [ ] 1 challenging question prepared — not clarifying, genuinely challenging
- [ ] Observation assignment from morning DMB logged
- [ ] Previous week's Friday review log reviewed

---

### Monday Session Structure (90 minutes)

#### Block 1 — Day Review & Reading Check (0:00–0:15) | 15 minutes

**Format:** Open discussion — no slides

Opens by synthesizing the day's market behavior through this week's curriculum lens.
Then moves into a cold-call style reading check.

**Opening sequence:**
1. "What did the market do today that connects to what you read?" (2–3 responses)
2. "What was the single most important idea from the pre-reading?" (open)
3. "Where did the reading lose you?" (surfaces confusion early)

Students who did not complete the reading become visible naturally —
not through punishment, but through inability to contribute meaningfully.

---

#### Block 2 — Core Concept Delivery (0:15–0:55) | 40 minutes

**Format:** Instructor-led with whiteboard or slides. Students take structured notes.

Primary teaching block. Source material is the curriculum wiki. Emphasis on:

- **Why this concept exists** — what problem does it solve in the real world?
- **How professionals use it** — quant desk, portfolio manager, analyst context
- **Where it breaks** — common misapplications, edge cases, failure modes
- **AI/quant connection** — always link back to the FINN thesis

**Student note-taking format — Cornell Method adapted for FINN:**

```
┌──────────────────────────────┬────────────────────────────────────────┐
│  QUESTIONS / SIGNALS         │  NOTES                                 │
│                              │                                        │
│  Write questions as you      │  Main content — concepts, formulas,    │
│  take notes. Return to       │  definitions, examples as taught.      │
│  these in Wednesday's        │  Your words where possible.            │
│  workshop.                   │                                        │
│                              │                                        │
├──────────────────────────────┴────────────────────────────────────────┤
│  SUMMARY  (write after class — never copy, always paraphrase)         │
│                                                                       │
│  3 key ideas from today:  1.___  2.___  3.___                         │
│  1 thing I want to test Wednesday:  ___                               │
│  How today's market behavior connected to this topic:  ___            │
└───────────────────────────────────────────────────────────────────────┘
```

---

#### Block 3 — Socratic Discussion (0:55–1:15) | 20 minutes

**Format:** Student-led, instructor facilitates

Students bring their prepared challenging questions. Instructor does not answer —
redirects to the class. Goal: stress-test understanding and surface assumptions.

**Discussion protocols:**
- No question is too basic in this block
- Directly challenge the reading if something seems wrong
- Connect today's material to previous weeks wherever possible
- Instructor introduces a **devil's advocate position** to deepen the debate

**Devil's advocate prompts by topic:**

| Topic | Devil's Advocate Prompt |
|-------|------------------------|
| Technical Analysis | "If indicators are just derivatives of price, how can they ever predict price?" |
| Backtesting | "If a strategy worked historically, why would it keep working?" |
| AI/LLM Sentiment | "If everyone uses the same LLM on the same news, does the signal disappear?" |
| Factor Models | "Momentum has worked for decades — is the market inefficient, or just unextractable?" |
| Risk Management | "If you always use a stop-loss, are you systematically giving money to market makers?" |
| Paper Trading | "If paper trading has no real money at stake, can it ever replicate real decision-making?" |

---

#### Block 4 — Wednesday Setup & Close (1:15–1:30) | 15 minutes

**Format:** Instructor-guided

1. Instructor assigns Wednesday's workshop exercise — specific problem, notebook, dataset
2. Students write their **3 weekly hypotheses** (added to shared log)
3. Reading for next Monday confirmed
4. **5-minute closing reflection:** Each student writes one sentence —
   *"The most important thing I need to understand before Wednesday is ___."*

---

### Monday Instructor Checklist

- [ ] Pre-reading assigned at least 3 days prior (previous Friday)
- [ ] Core concept slides or whiteboard plan prepared
- [ ] 3–5 Socratic prompts ready
- [ ] Devil's advocate position prepared for Block 3
- [ ] Wednesday workshop exercise defined and ready to distribute
- [ ] Connection to today's market observation from DMB made explicit
- [ ] Muddiest Points from last Wednesday reviewed and addressed if needed

---

## 4. Wednesday — Workshop Session

**Time:** 8:00–9:30 PM EST
**Duration:** 90 minutes

### Purpose

Wednesday evening is for **applied learning through practice**. Every concept from Monday
is now tested against real data, real code, and real tools. Students arrive having spent
two more market days observing — Tuesday and Wednesday DMBs have given them additional
context to bring into the hands-on work.

The gap between understanding a concept and implementing it is where real skill is built.
Wednesday is where students discover that gap — and start closing it.

> **Wednesday is allowed to fail.** Bugs, errors, and wrong approaches are not setbacks —
> they are the session working as intended. A workshop where nothing breaks is a workshop
> that wasn't challenging enough.

---

### Pre-Session Requirements (before 8:00 PM Wednesday)

- [ ] Monday notes reviewed — especially the Questions/Signals column
- [ ] Python environment (`finnenv`) confirmed running
- [ ] Latest code pulled from course GitHub repository
- [ ] Assigned workshop notebook open and ready
- [ ] Observation from today's DMB logged

---

### Wednesday Session Structure (90 minutes)

#### Block 1 — Framing & Context Bridge (0:00–0:10) | 10 minutes

**Format:** Brief instructor setup — maximum 10 minutes, no exceptions

The instructor explicitly connects:
- Monday's theory → what we're building tonight
- DMB observations from Monday and Wednesday → how they relate to tonight's exercise
- The expected output — what "done" looks like for tonight

> Always answer: *"Why are we building this tonight?"* Students who understand
> the purpose of an exercise retain significantly more of what they build.

---

#### Block 2 — Guided Build (0:10–0:50) | 40 minutes

**Format:** Instructor codes live. Students follow along and run cells simultaneously.

Build the workshop's core solution step by step. Narrate every decision:
- Why this data structure over another?
- Why this library for this task?
- What breaks if we change this?
- Where does this map to Monday's concept?

**Live coding standards:**
- Always start from a blank or skeleton notebook — no pre-filled answers
- Deliberate mistakes are made and debugged live — plan 2–3 of these per session
- Students must run every cell themselves — no passive watching
- Pause after every major step: *"Did that run for you? What did you get?"*
- If a student's output differs — explore it, don't dismiss it. It's usually more instructive.

---

#### Block 3 — Independent / Pair Work (0:50–1:15) | 25 minutes

**Format:** Students work independently or in pairs on the extension problem

Every workshop has two components:

| Component | Description | Expected by |
|-----------|-------------|-------------|
| **Core Exercise** | Direct variation of the guided build — slightly modified parameters or dataset | All students |
| **Extension Challenge** | Harder problem requiring genuine problem-solving beyond the walkthrough | Students who finish core |

Instructor circulates, assists, and asks probing questions rather than giving direct answers.

**Instructor prompts during circulation:**
- "What did you expect that line to do? What did it actually do?"
- "How would this break if the data came in differently?"
- "Can you make this more efficient or readable?"
- "What would you need to add to turn this into a real trading signal?"
- "How does what you just built connect to what we saw in the market today?"

---

#### Block 4 — Share-Out & Muddiest Point (1:15–1:30) | 15 minutes

**Share-out (10 min):**
- 2 students share screen and walk through their solution — instructor selects, not volunteers
- Prioritize different approaches over identical ones
- Discussion: what worked, what was different, what was more elegant
- Process matters more than correct output

**Muddiest Point (5 min) — Mandatory closing ritual:**

Every student writes one sentence:
> *"The muddiest point from tonight's workshop — the thing I least understood — was ___."*

Collected anonymously. Directly informs Monday's opening block.
These are the most valuable feedback data in the entire course.

**Notebook submission:**
- Push completed notebook to GitHub before end of day Wednesday
- Naming convention: `WXX_workshop_[topic]_[initials].ipynb`
- Example: `W03_workshop_rsi_strategy_JD.ipynb`

---

### Wednesday Instructor Checklist

- [ ] Workshop notebook prepared with blanks — not answers — for guided build
- [ ] Extension challenge defined — requires genuine problem-solving
- [ ] GitHub starter file committed to repo before 8 PM
- [ ] Environment confirmed (run the notebook yourself before class)
- [ ] 2–3 deliberate mistakes planned for live debugging
- [ ] Muddiest Point collection method ready
- [ ] Connection to today's market observation from DMB planned

---

## 5. Friday — Review & Market Session

**Time:** 8:00–9:30 PM EST
**Duration:** 90 minutes

### Purpose

Friday evening is for **consolidation, validation, and closure**. The week's cognitive loop
closes here. We review what we learned, audit what we predicted against what actually happened,
analyze the week's market behavior in depth, and look ahead to next week.

By 8PM on a Friday, students have five days of DMB data, a full week of market behavior,
weekly options expiration data, and the complete intellectual experience of the week —
all ready to examine together.

> **Friday is where hypotheses go to be tested.** Everything predicted Monday morning
> gets answered Friday night. That feedback loop is the core engine of the course.

---

### Pre-Session Requirements (before 8:00 PM Friday)

- [ ] Week's hypothesis log reviewed — know your outcomes before class
- [ ] TradingView charts ready: SPY, QQQ, VIX + personal watchlist tickers
- [ ] Wednesday notebook reviewed — does your code reflect what you understand now?
- [ ] Any market anomalies or surprises from the week noted and ready to share

---

### Friday Session Structure (90 minutes)

#### Block 1 — Retrospective (0:00–0:30) | 30 minutes

**Format:** Socratic review — instructor facilitates, students lead

Not a re-lecture. Students demonstrate understanding through explanation.
Instructor calls on students — no volunteering, no hands raised.

**Question format:** *"Explain [concept] as if you were teaching someone who missed Monday."*
Students must connect the concept to Wednesday's workshop code where possible.
Any concept that multiple students struggle with is flagged for next Monday's opening.

**Retrospective question bank (select 3–4 per week):**

```
Conceptual:
  "What is the core idea behind [this week's topic] in one sentence?"
  "What would break in our strategy if [key assumption] were false?"
  "How does [this week's concept] connect to [prior week's concept]?"

Applied:
  "In Wednesday's notebook, why did we make [specific code decision]?"
  "If you were presenting your solution to a quant — what would you say?"
  "What would you change about your Wednesday code now, three days later?"

Critical:
  "What is the biggest weakness in what we studied this week?"
  "Where would this approach fail in live trading?"
  "What did the market do this week that challenged or confirmed this concept?"
```

---

#### Block 2 — Market Autopsy (0:30–1:05) | 35 minutes

**Format:** TradingView screen share — instructor leads, students contribute

The most dynamic block of the week. We analyze the week's actual market behavior
through the lens of our curriculum and our hypotheses. The market is the case study.
This week's price action is the dataset.

**Step 1 — Hypothesis Audit (10 min)**

Open the week's hypothesis log. For each hypothesis from Monday and the DMBs:
- Correct? Partially correct? Wrong?
- What did the market actually do?
- If wrong — what signal would have told us earlier?
- If right — was it skill or coincidence? Explore this honestly.
- Update the `Outcome` field in the log for every entry.

**Step 2 — Chart Review (15 min)**

| Chart | What to Look For |
|-------|-----------------|
| SPY daily | Dominant weekly structure — trend, range, or reversal? |
| QQQ daily | Did tech lead or lag SPY? What does the divergence tell us? |
| VIX | How did volatility behave relative to price moves? |
| Student watchlist (1–2) | Review against the setup from Monday's DMB |

**Chart review focus questions:**
- "Where would our current strategy have entered and exited this week?"
- "What indicator would have helped most — and why?"
- "Was there a pattern this week that matches something we've studied?"
- "What would our backtest have returned on this week's actual data?"

**Step 3 — Sector Rotation Check (10 min)**

Using TradingView sector performance or Finviz heatmap:
- Which sectors outperformed? Which underperformed?
- Does the rotation tell a macro story? (risk-on, risk-off, defensive rotation)
- Any unusual volume or momentum worth tracking into next week?

---

#### Block 3 — Derivatives Window (1:05–1:20) | 15 minutes

**Format:** Instructor-led with TradingView options data or market scanner

Every Friday, we observe the options and futures market as weekly contracts expire.
This block is an observational habit in early months, deepening into active analysis
as we reach the options curriculum module.

**Weekly derivatives checklist:**

- [ ] **Put/Call Ratio:** Elevated (bearish sentiment) or depressed (complacent/bullish)?
- [ ] **VIX Term Structure:** Short-term vs. long-term VIX — backwardation signals fear
- [ ] **Weekly Options Expiry:** What strikes had highest open interest? Where was max pain?
- [ ] **Futures Roll:** Notable activity in ES/NQ front-month contracts?
- [ ] **Unusual Options Activity:** Any large single-stock prints this week?

> **Months 1–2:** Observation only. Record without deep interpretation.
> **Month 3+:** Interpretation becomes the expectation. Connect to strategy signals.
> **Month 5–6:** Options activity becomes an active input to paper trading decisions.

---

#### Block 4 — Next Week Preview & Close (1:20–1:30) | 10 minutes

**Format:** Instructor-led rapid forward look

**Next Week Preview checklist:**
- [ ] Next Monday's topic confirmed — assign reading now (students have the weekend)
- [ ] Upcoming macro events: Fed meeting? CPI? Major earnings? Options expiration?
- [ ] Any open setups from this week's chart review worth monitoring next week?
- [ ] DMB rotation assignments updated — who leads Mon/Wed/Fri next week?
- [ ] Muddiest Points from Wednesday addressed or flagged for Monday?

**Closing ritual — Weekly One-Liner:**

Every student writes one sentence before logging off:
> *"This week I learned ___, and next week I want to understand ___."*

Kept in the course log permanently. Over 6 months this becomes a visible,
measurable record of each student's intellectual growth — readable at the capstone.

---

### Friday Instructor Checklist

- [ ] Hypothesis log updated with all entries ready for audit
- [ ] TradingView charts prepared: SPY, QQQ, VIX + student watchlist names
- [ ] 3–4 retrospective questions selected from question bank
- [ ] Options data sources ready: put/call ratio, VIX term structure, max pain
- [ ] Next week's reading assigned and confirmed in curriculum wiki
- [ ] Student DMB rotation updated for following week
- [ ] Muddiest Points from Wednesday reviewed — plan Monday response

---

## 6. The Evening Advantage

This section documents the intentional design logic behind the 8PM start time.
It exists so instructors and students understand why the schedule is structured this way —
not as a constraint to work around, but as a feature to actively exploit.

### Why 8PM Works Better Than a Morning Class

A morning trading class requires students to learn concepts before observing them.
The 8PM structure inverts this: students observe first, then learn the framework
that explains what they watched. This mirrors how real financial professionals
develop market intuition.

```
TRADITIONAL MORNING CLASS                   FINN MODEL (inverted)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━         ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Teach concept → Watch market                Watch market → Learn concept
Theory first, observation second            Observation first, theory second
Student arrives cold                        Student arrives with data
Concepts feel abstract                      Concepts explain what was just seen
```

### What Students Carry Into Every Evening Class

By 8PM on a class day, every student has already:

- Attended the morning DMB with pre-market data and a structured hypothesis
- Spent the trading day watching the market through the lens of an observation assignment
- Seen real price action, real news flow, and real indicator behavior
- Had their hypotheses confirmed, challenged, or broken by live market behavior
- Accumulated specific questions that the evening class will answer

### How to Exploit the Evening Context

Open every evening class by asking: *"What did you see today?"*
Before any slide, before any concept — let students surface their observations.
Then teach the framework that explains what they described.
This creates immediate felt relevance that morning classes structurally cannot achieve.

---

## 7. Weekly Deliverables Framework

All deliverables are submitted to the course GitHub repository. The repository is a
living portfolio of each student's progression. At Milestones 1, 3, and 6, this
portfolio is the primary evidence of skill development.

### Deliverable Specifications

| Deliverable | Due | Format | Location | Purpose |
|-------------|-----|--------|----------|---------|
| Reading Notes + 3 Hypotheses | Monday 11:59 PM | Markdown | GitHub + hypothesis log | Preparation accountability |
| Workshop Notebook | Wednesday 11:59 PM | `.ipynb` | GitHub repo | Applied skill demonstration |
| Weekly Review Log | Friday 11:59 PM | Markdown | GitHub repo | Reflection and consolidation |
| Hypothesis Outcome Record | Friday 11:59 PM | Appended to log | Shared log | Prediction tracking |
| Muddiest Point | Wednesday in class | 1 sentence | Shared doc | Instructor feedback signal |
| Weekly One-Liner | Friday in class | 1 sentence | Course log | Longitudinal growth record |

### GitHub Repository Structure

```
finn-course/
├── README.md
├── hypothesis-log/
│   └── hypothesis_log_master.md       ← All hypotheses, all weeks, all outcomes
├── weekly-notes/
│   ├── W01_reading_notes_[initials].md
│   └── W02_reading_notes_[initials].md
├── workshops/
│   ├── W01_workshop_market_data_[initials].ipynb
│   └── W02_workshop_indicators_[initials].ipynb
├── review-logs/
│   ├── W01_review_log_[initials].md
│   └── W02_review_log_[initials].md
├── resources/
│   ├── FINN_Curriculum_Wiki.md
│   └── FINN_Weekly_Structure.md
└── capstone/
    └── [milestone deliverables stored here]
```

### Weekly Review Log Template

```markdown
# Weekly Review Log — Week [XX]
**Student:** [Name]
**Week of:** [Date Range]
**Topic Covered:** [Curriculum Section]
**Session Status:** [All attended / Makeup used / Async fallback]

---

## Monday Theory — What I Learned
[3–5 bullet points — core concepts in your own words, not copied from slides]

## Wednesday Workshop — What I Built
[What the notebook does and what you learned building it]
**Notebook link:** [GitHub link]

## Hypothesis Outcomes
| Hypothesis | Expected | Actual | Correct? | Lesson |
|------------|----------|--------|----------|--------|
| [text] | | | Y/N/Partial | |

## Market Observations
[2–3 sentences on what you observed through the lens of this week's topic]

## Muddiest Point
[What confused you Wednesday — resolved or still open? How are you resolving it?]

## Weekly One-Liner
This week I learned ___, and next week I want to understand ___.
```

---

## 8. Cancellation & Recovery System

### Design Philosophy

Cancellations in this course are not failures — they are a planned-for reality.
Adult learners balancing work and family will have weeks where attendance is
partial or impossible. The recovery system is designed around three principles:

1. **Protect the milestones above all else.** Month 1, Month 3, and Month 6 checkpoints
   are non-negotiable anchors. Everything between them can flex.
2. **No dead days.** A cancelled session becomes an async fallback day — structured
   self-study that keeps learning moving without requiring everyone in the same place.
3. **No weekend makeup sessions.** The Saturday/Sunday cool-off is a burnout buffer.
   It is protected absolutely. Recovery happens on Tuesday and Thursday only.

---

### Cancellation Triggers

A session is officially cancelled when either of the following is true:

| Trigger | Threshold |
|---------|-----------|
| Instructor unavailable | Any Monday, Wednesday, or Friday evening |
| Student quorum not met | Less than 50% of enrolled students available |

When a session is cancelled, the instructor notifies the group **by 6:00 PM** on the
day of the session and activates the appropriate recovery protocol below.

---

### Recovery Tiers

Three tiers of recovery depending on how many sessions are missed in a given week
and how close we are to a milestone.

---

#### Tier 1 — Single Session Missed (most common)

**Scenario:** One session is cancelled in a given week.

**Response:** Async Fallback Package activated for the missed session.
No makeup session required unless within 2 weeks of a milestone.

**Async Fallback Package contents:**

| Component | Description |
|-----------|-------------|
| Reading Assignment | The curriculum wiki section that would have been taught |
| Guided Notes Template | Structured note-taking scaffold with fill-in prompts |
| Self-Study Questions | 5 written questions — same depth as the Socratic block |
| Optional Resource | Curated external resource (video, article) covering the topic |
| Deliverable | Completed notes + answers submitted to GitHub by original session deadline |

**Async Fallback is not a lighter version of the session.** It is a different format
for the same cognitive work. Students who complete it arrive at the next live session
prepared. Students who skip it fall behind visibly.

---

#### Tier 2 — Two Sessions Missed in One Week

**Scenario:** Two of the three weekly evening sessions are cancelled.

**Response:**
- Both missed sessions receive Async Fallback Packages
- One optional **Tuesday or Thursday makeup session** is offered (60 min, not 90)
- The makeup compresses the two missed sessions — theory only, no workshop.
  Workshop content carries forward to the next Wednesday.

**Makeup Session Structure (60 min, Tue or Thu 8:00–9:00 PM):**

| Block | Time | Content |
|-------|------|---------|
| Theory Catch-Up | 0:00–0:40 | Core concepts from both missed sessions, compressed |
| Q&A on Async Work | 0:40–0:55 | Students bring questions from their async packages |
| Forward Preview | 0:55–1:00 | What to expect in the next live session |

---

#### Tier 3 — Full Week Cancelled

**Scenario:** All three evening sessions in a single week are cancelled.

**Response:**
- Full Async Fallback Package for all three sessions
- The week's curriculum topic is carried forward into the next week
- Next week runs a **compressed dual-topic structure** (see below)
- One optional Tue/Thu makeup offered if milestone proximity requires it

**Compressed Dual-Topic Week Structure:**

| Session | Normal Content | Compressed Content |
|---------|---------------|-------------------|
| Monday | Week N+1 theory | Week N theory (catch-up, condensed) |
| Wednesday | Week N+1 workshop | Combined N + N+1 workshop |
| Friday | Week N+1 review | Combined review — both topics |

This is demanding but achievable. It is used **once per month maximum.**
If full-week cancellations happen in consecutive weeks, escalate to the
Milestone Protection Protocol below.

---

### Milestone Protection Protocol

The three milestone checkpoints — Month 1, Month 3, Month 6 — are protected regardless
of how many sessions are cancelled between them. If cumulative cancellations threaten
a milestone's content coverage, the following protocol activates:

**Step 1 — Triage the curriculum**

Using `FINN_Curriculum_Wiki.md` as the map, classify all remaining content:

| Priority | Content | Action if Time is Short |
|----------|---------|------------------------|
| **Core** | Quant workflow, Python stack, risk management, backtesting | Never cut — compress if needed |
| **Important** | Technical indicators, factor models, ML signals | Compress into single sessions |
| **Supplementary** | Advanced ML, reinforcement learning, deep dives | Defer to post-milestone or async |

**Step 2 — Protect the deliverable, not the delivery**

If content must be compressed, the milestone deliverable does not change.
What changes is how much in-class time was used to reach it.
Async packages fill the gap between.

**Step 3 — Extend the phase, not the milestone standard**

Because this course has no hard end date, the correct response to significant
cancellation pressure is to extend the current phase rather than rush to the
milestone with inadequate preparation. A student who reaches Month 3's milestone
in 14 weeks with genuine competence is ahead of one who reaches it in 10 weeks without it.

The milestones measure skill level, not time elapsed.

---

### Proactive Cancellation Calendar

Flag these periods at the start of the course as high-risk.
Build async fallback packages for them in advance — these are guaranteed disruptions.

| Period | Risk Level | Likely Cause |
|--------|-----------|-------------|
| Major US holidays (MLK, Memorial Day, July 4th, Labor Day, Thanksgiving) | **High** | Instructor + student unavailability |
| Tax season (Feb–April) | **Medium** | Work overload for finance-adjacent students |
| End of quarter (March, June, September, December) | **Medium** | Work deadline pressure |
| Back-to-school (August–September) | **Medium** | Family schedule disruption |
| Major earnings seasons (Jan, Apr, Jul, Oct) | **Low–Medium** | Schedule disruption + high news flow |

> **Recommendation:** Build all Major Holiday async packages at course start.
> These are guaranteed — plan for them now, not when they arrive.

---

### Individual Student Absence Policy

For students missing sessions while the rest of the class meets:

| Absences in a Month | Response |
|--------------------|---------|
| 1 session missed | Async Fallback Package completed independently. No makeup required. |
| 2 sessions missed | Async packages for both + brief instructor check-in before next live session |
| 3 sessions missed | Async packages + one-on-one makeup (30 min) before next milestone |
| 4+ sessions missed | Individual curriculum review — assess whether pace adjustment is needed |

**The standard is effort and consistency, not perfect attendance.**
Adult learners have legitimate obligations. The system exists to keep everyone
moving forward, not to penalize real life.

---

### Async Fallback Package Template

Each package should take approximately 90 minutes to complete — equivalent to
the live session it replaces.

```markdown
# Async Fallback Package — Week [XX] [Monday / Wednesday / Friday]
**Original Session Date:** [Date]
**Topic:** [Curriculum section this session would have covered]
**Estimated Completion Time:** 90 minutes
**Due:** [Original session day] 11:59 PM

---

## Context
[1 paragraph — what this session was going to cover and why it matters now]

## Required Reading
- FINN Curriculum Wiki: [specific section link]
- External resource: [article, video, or documentation URL]

## Guided Notes
Answer the following as you read. Use Cornell format.

1. What problem does [this week's concept] solve?
2. How would a professional quant use this in practice?
3. Where could this concept fail or be misapplied?
4. How does it connect to what we covered last week?
5. [Topic-specific question tailored to this week's content]

## Self-Study Exercise
[Monday async: written analysis or annotation task — no code]
[Wednesday async: guided Jupyter notebook exercise to complete independently]
[Friday async: TradingView market review task + hypothesis log update]

## Submission
- [ ] Guided notes pushed to GitHub: `WXX_async_[day]_[initials].md`
- [ ] Exercise completed and submitted: `WXX_async_exercise_[initials].[md or ipynb]`
- [ ] Hypothesis log updated if applicable

## Questions
Post in the course communication channel. Tag the instructor.
All async questions answered within 24 hours.
```

---

## 9. Semester Milestones

Four formal checkpoints mark student progression. These are the non-negotiable anchors.
Everything between them can flex in timing — these cannot flex in standard.

The Month 1 / Month 3 / Month 6 comparison structure exists to make skill growth
**visible and measurable** — not just to the instructor but to the student themselves.
By Month 6, every student should be able to look back at their Month 1 work
and clearly see the distance they have traveled.

---

### Milestone 1 — Market Literacy Assessment
**Timing:** End of Month 1
**Format:** Oral examination — 20 minutes per student
**Purpose:** Confirm foundational vocabulary, market structure, and the quant workflow
are genuinely understood before quantitative methods begin.

**Coverage:** Asset classes, order types, market participants, the 9-step quant workflow,
key performance metrics, market microstructure basics.

**Pass criteria:** Student can explain any Month 1 concept in their own words,
with a real-world example, without notes.

---

### Milestone 2 — Strategy Presentation
**Timing:** End of Month 2
**Format:** 15-minute presentation + 5 min Q&A per student
**Purpose:** Demonstrate ability to build, backtest, and critically evaluate a complete strategy.

**Presentation structure:**
```
1. Hypothesis      (1 min)  — what edge are you capturing and why?
2. Data & Features (2 min)  — what data, indicators, transformations?
3. Strategy Logic  (2 min)  — entry/exit rules explained clearly
4. Backtest Results (4 min) — charts, metrics, benchmark comparison
5. What Could Go Wrong (3 min) — overfitting, regime sensitivity
6. What You'd Do Differently (3 min) — honest self-assessment
```

---

### Milestone 3 — Paper Trading Mid-Review
**Timing:** End of Month 4
**Format:** Portfolio review — individual, 30 minutes
**Purpose:** Audit paper trading performance, journal quality, and strategy discipline
over the first two months of live simulation.

**Review covers:** P&L vs. SPY benchmark, Sharpe ratio, max drawdown, win rate,
trade journal completeness, strategy adherence, one best and one worst trade explained.

---

### Milestone 4 — Final Capstone
**Timing:** End of Month 6 or when curriculum is complete
**Format:** 30-minute presentation + written report
**Purpose:** End-to-end mastery — hypothesis through AI-augmented strategy,
backtesting, paper trading, and performance attribution.

**Evaluation criteria:**

| Criterion | Weight | What We Look For |
|-----------|--------|-----------------|
| Hypothesis Quality | 15% | Specific, testable, intellectually grounded |
| Technical Execution | 25% | Correct, clean, reproducible code |
| Backtest Rigor | 20% | Sound methodology, pitfalls avoided |
| AI Integration | 15% | Meaningful use, not superficial |
| Self-Assessment | 15% | Honest about limitations and failures |
| Communication | 10% | Complex ideas explained clearly |

---

### Skill Progression Comparison Framework

At each milestone, evaluate the same dimensions. The goal is visible, measurable movement.

| Dimension | Month 1 Baseline | Month 3 Expected | Month 6 Target |
|-----------|-----------------|-----------------|----------------|
| Market Vocabulary | Can define terms | Uses terms in context | Explains terms to others |
| Python Proficiency | Runs provided code | Writes code from scratch | Debugs and extends others' code |
| Strategy Thinking | Understands signals | Builds rule-based strategies | Designs and tests ML strategies |
| Risk Awareness | Knows the rules | Applies rules to paper trades | Identifies risk intuitively |
| Market Intuition | Observes market | Forms daily hypotheses | Explains market behavior with framework |
| AI/Tool Integration | Aware of tools | Uses tools with guidance | Builds pipelines independently |

---

## 10. Roles & Responsibilities

### Student Responsibilities

**Every session:**
- Arrive on time with pre-work completed
- Contribute at least one substantive comment or question per class
- Maintain the hypothesis log with current, complete, honest entries
- Push all deliverables to GitHub before stated deadlines

**Rotating DMB Lead (Mon/Wed/Fri):**
- Prepare the student brief the evening before
- Have TradingView charts ready at 9:00 AM sharp
- Lead Block 2 for assigned watchlist — no more than 2 minutes per ticker

**Watchlist ownership:**
- Maintain a personal watchlist of 5–8 tickers throughout the course
- Changes must be documented: why added, why removed
- These tickers are the student's analytical responsibility in the DMB

### Instructor Responsibilities

**Every session:**
- Assign pre-reading at least 3 days in advance
- Prepare session materials aligned to curriculum wiki
- Collect and review Muddiest Points before the next class
- Maintain the master hypothesis log

**Weekly:**
- Update curriculum progress tracker
- Review submitted notebooks before next workshop
- Prepare following week's observation assignment
- Assess cancellation risk — build async packages proactively

---

## 11. Tools Used Per Session Type

| Tool | DMB | Monday PM | Wednesday PM | Friday PM |
|------|-----|-----------|-------------|-----------|
| TradingView | ✅ Primary | Reference only | Reference only | ✅ Primary |
| Finviz / Heatmap | ✅ Block 1 | — | — | ✅ Block 2 |
| Jupyter / Colab | — | — | ✅ Primary | Review only |
| Python (finnenv) | — | — | ✅ Primary | Optional |
| GitHub | — | Note submission | ✅ Notebook push | Log submission |
| Hypothesis Log | ✅ Block 3 | ✅ Block 4 | — | ✅ Block 1 |
| Curriculum Wiki | Reference | ✅ Source | ✅ Reference | ✅ Reference |
| Options Scanner | — | — | — | ✅ Block 3 |
| Alpaca / yfinance | — | — | ✅ Data source | Optional |
| LangChain / OpenAI | — | — | Modules 6+ | Modules 6+ |

---

## 12. Session Health Checks

Quick diagnostics to evaluate whether each session type is working well.
If most answers are "No" in a category, the session format needs adjustment.

### Is the DMB Working?
- [ ] Hypotheses are specific and falsifiable — not vague statements
- [ ] The hypothesis log is maintained consistently and completely
- [ ] Rotating student leads are improving their brief quality over time
- [ ] Observation assignments connect visibly to the evening class that day
- [ ] Optional Tuesday/Thursday attendance is growing over the first month

### Is Monday Working?
- [ ] Students arrive with completed pre-reading notes
- [ ] The Socratic block generates genuine disagreement and debate
- [ ] Students connect Monday's material to the day's market observations
- [ ] Last Wednesday's Muddiest Points are addressed in this session
- [ ] Students leave with clearly defined, written hypotheses for the week

### Is Wednesday Working?
- [ ] Students hit errors and debug them — not just copying working code
- [ ] The extension challenge is being attempted by most students
- [ ] The instructor asks probing questions rather than giving direct answers
- [ ] Notebooks are pushed to GitHub same day
- [ ] Muddiest Points reveal conceptual gaps, not just syntax errors

### Is Friday Working?
- [ ] Students can retrospect without re-reading their notes
- [ ] Hypothesis outcomes are analyzed honestly — including wrong predictions
- [ ] The market autopsy generates visible "aha" moments or confirmations
- [ ] The derivatives window is building observable fluency over time
- [ ] Students leave with specific reading goals, not vague intentions

### Is the Recovery System Working?
- [ ] Async packages are built before they are needed, not reactively
- [ ] Cancelled sessions do not create content gaps at milestone checkpoints
- [ ] Makeup sessions remain the exception, not the norm
- [ ] Students completing async fallbacks arrive at live sessions prepared
- [ ] The no-weekend rule is being held without exception, every week

---

*FINN — Weekly Class Structure & Session Templates*
*Version 1.1 · April 2026*
*Use alongside `FINN_Curriculum_Wiki.md` to build weekly lesson plans.*
*This document defines the container. The curriculum wiki fills it.*
*Weekends are off. Always.*
