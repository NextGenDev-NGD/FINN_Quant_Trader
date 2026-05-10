# FINN — Week 4: Integration, Review & Milestone 1
## Foundation Phase | Month 1: Market Literacy & Quant Mindset
**Dates:** May 4–9, 2026
**Week Number:** 4 of 24

---

## WEEK OVERVIEW

### Theme
Solidifying everything from Month 1. Demonstrating true comprehension rather than memorization. This week moves from learning to proving — the oral Milestone 1 assessment on Friday requires students to explain, interpret, and synthesize all Month 1 content without notes.

### Learning Objectives
By the end of this week, students will be able to:
- Explain any Month 1 concept in plain English to a non-technical audience
- Interpret a real performance metric table and give a qualified recommendation
- Describe a complete end-to-end trade scenario covering: asset class, order type, microstructure cost, and performance measurement
- Produce a full single-stock analysis notebook: data acquisition, feature engineering, metrics, visualization, and written interpretation
- Pass the Milestone 1 oral assessment demonstrating genuine understanding of all Month 1 content

### Materials Needed
- `finnenv` environment — all packages from Weeks 1–3 installed
- GitHub repo — all three previous workshop notebooks accessible for reference
- Starter notebook: `W04_workshop_integration_starter.ipynb`
- TradingView — for any chart reference during the assessment
- Glossary (full) — final review pass before Friday
- All weekly review logs from Weeks 1–3 — review before Monday

### Pre-Week Checklist (Instructor)
- [ ] Push `W04_workshop_integration_starter.ipynb` to GitHub
- [ ] Prepare Milestone 1 assessment materials: 3 performance tables, 3 order scenarios, 3 chart scenarios
- [ ] Prepare concept cards for Monday Lightning Round
- [ ] Prepare pair concept assignments for Monday Concept Pairs exercise
- [ ] Assign DMB rotation for Monday, Wednesday, Friday
- [ ] Plan assessment sequencing for Friday — schedule order if class is large
- [ ] Prepare Month 2 preview for Friday close

---

## MONDAY — May 4, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Observation Assignment:** "Today, observe the market and try to connect every movement you see to something we've studied in the last three weeks. Bring 2–3 connections to class tonight."

---

### EVENING: Theory Session (8:00–9:30 PM EST)
**Topic:** Month 1 Integration Review — All Concepts, No New Material
**Curriculum Source:** All of Sections 2, 3.1, 3.3

#### Pre-Session Setup
- [ ] No new pre-reading — students review Weeks 1–3 material only
- [ ] All three weekly review logs in hand
- [ ] Concept pairs assigned in advance (list below)
- [ ] Whiteboard or screen-share for lightning round

#### Block 1 — Day Review (8:00–8:15 PM) | 15 min

"What market connections did you find today? Walk me through them. I want to hear the concept, the observation, and the link between them."

Call on 3–4 students. For each: "Is that connection based on what you read in the curriculum, or on something you noticed yourself? Both are valid — I want to know the source."

#### Block 2 — Structured Review (8:15–8:55 PM) | 40 min

No new material tonight. This block is entirely student-driven review. Instructor facilitates. Students teach each other.

**Format — Lightning Round (20 min):**
Rapid-fire cold calls. One student, one term, one definition. Fast and precise.
- Asset classes (all 7) — what, characteristics, examples
- Order types (all 6) — definition, use case, risk
- Market participants (all 6) — role, incentive, market impact
- Indices (all 5) — what it tracks, ticker, why it matters
- Quant workflow (all 9 steps) — name and one-sentence description
- Performance metrics (all 9) — definition and "good" value

Pace: move fast. Don't dwell. If a student misses, note it and move on — it tells them where to study.

**Format — Concept Pairs (20 min):**
Split into pairs. Each pair gets assigned one concept from the month. They have 3 minutes to prepare a 2-minute explanation. Then they teach it to the class. Class asks one question each.

Concepts to assign:
- Bid-ask spread and slippage (pair 1)
- Sharpe ratio and Sortino ratio (pair 2)
- Max drawdown and Calmar ratio (pair 3)
- Market makers and HFTs (pair 4)
- Stop orders and stop-limit orders (pair 5)
- Quant workflow steps 1–5 (pair 6)

#### Block 3 — Milestone Simulation (8:55–9:15 PM) | 20 min

Run a practice version of the oral assessment. Pick 2–3 students and run shortened versions of the real assessment questions:

Sample questions:
- "Explain market microstructure. What is the order book? Give me a concrete example."
- "A strategy has Sharpe 1.8, max drawdown −12%, win rate 42%. Evaluate it."
- "Walk me through steps 1–5 of the quant workflow using a real trade setup as your example."

After each, give brief feedback — not a grade, just: stronger, sharper, more specific. This gives the class a calibration for what the assessment expects.

#### Block 4 — Final Prep & Close (9:15–9:30 PM) | 15 min

"Friday is Milestone 1. Wednesday workshop is the last session before it. Wednesday we will build a complete single-stock analysis notebook — this is also your practice for talking through quantitative work out loud.

Any questions about what to expect Friday? Ask them now."

No new reading assigned. Existing material only.

**Monday Deliverable:** Reading Notes (review only — no new content) + 3 Hypotheses by 11:59 PM

---

## WEDNESDAY — May 6, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

Standard format with Portfolio Pulse (not yet — still pre-paper-trading). Note any macro events this week.

---

### EVENING: Workshop Session (8:00–9:30 PM EST)
**Workshop:** W4 — Milestone Prep: Full Single-Stock Analysis Notebook
**Notebook:** `W04_workshop_integration_[initials].ipynb`
**Curriculum Source:** All of Month 1 — integration exercise

#### Pre-Session Setup
- [ ] `finnenv` running, repo pulled
- [ ] W01, W02, W03 notebooks accessible for reference (students may refer to their own work)
- [ ] `W04_workshop_integration_starter.ipynb` open — blank template ready
- [ ] Students have their Week 1–3 notes for reference

#### Block 1 — Framing (8:00–8:10 PM) | 10 min

"Tonight's workshop is different. There's no guided build. You have all the code you need from the last 3 weeks — the data pull, the flagging function, the metrics. Tonight you apply all of it to a single stock of your choice.

The output is a complete analysis notebook: fetch data, clean it, flag notable days, calculate all performance metrics, visualize price and drawdown.

Then write a 300-word markdown analysis at the bottom answering: 'Based purely on this data, what kind of instrument is this? Is it suitable as a trading target? What risks does it carry?'

This notebook is your Milestone 1 artifact. It shows you can do the work."

#### Block 2 — Independent Work (8:10–9:10 PM) | 60 min

Students work independently. No guided build. Instructor circulates and asks probing questions — does not provide solutions. Questions to ask circulating:
- "Why did you choose this ticker?"
- "What does this metric tell you about the asset's behavior?"
- "If a strategy produced this drawdown — would you trade it? Why?"
- "What surprised you most in this data?"

Recommended structure students should aim for:
```
Section 1: Data Acquisition
  - Fetch 2 years of daily OHLCV
  - Display head, tail, describe, info, null check

Section 2: Feature Engineering
  - Daily return
  - HL_Range_Pct
  - Volume ratio and flags

Section 3: Performance Metrics
  - Total return and annualized return
  - Annual volatility
  - Sharpe ratio
  - Max drawdown with visualization
  - Win rate and expectancy

Section 4: Visualization
  - Price and volume chart
  - Cumulative return and drawdown chart
  - Notable days marked

Section 5: Written Analysis (300 words minimum)
  - What did the data tell you?
  - What risks does this instrument carry?
  - Would this be a suitable paper trading target? Why?
```

> **Resource:** Performance metrics reference — Sharpe, drawdown, win rate, and expectancy with formulas and interpretation benchmarks — use during independent work to verify calculations → `resources/infographics/ig_performance_metrics.html`

#### Block 3 — Share-Out & Muddiest Point (9:10–9:30 PM) | 20 min

**Share-out (15 min):** 3 students present their analysis. Focus on the written section — "Did your interpretation of the data make sense? Did you connect the metrics to real-world meaning?"

**Muddiest Point (5 min):**
> *"The muddiest point — anything still unclear before Friday's assessment — was ___."*

**Wednesday Deliverable:** Completed notebook `W04_workshop_integration_[initials].ipynb` submitted to GitHub by 11:59 PM

---

## FRIDAY — May 8, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation (standard format)

Keep brief efficient. Students need mental energy for the assessment tonight. Note any major macro events during market hours.

---

### EVENING: Milestone 1 Oral Assessment (8:00–9:30 PM EST)

**Format:** Individual oral assessments — 20 minutes per student
**Note:** Run assessments sequentially. Other students observe or study quietly. If class is large, assessments may continue into a second session the following day.

#### Pre-Session Setup
- [ ] Assessment order prepared and shared with students in advance
- [ ] Quiet space arranged for waiting students (can review notes while waiting)
- [ ] Assessment rubric or scoring notes ready
- [ ] TradingView available for chart-based questions
- [ ] Performance metric table scenarios prepared (3 different options)

#### Assessment Format (20 minutes per student)

**Part 1 — Concept Recall (5 min)**
Instructor asks 3 rapid-fire definitional questions from any Month 1 concept. Student must answer without notes. Examples:
- "What is the bid-ask spread? Give me the formula for the cost to a trader."
- "Name the 9 steps of the quant workflow."
- "What does a Sharpe ratio of 0.4 tell you?"

**Part 2 — Applied Interpretation (8 min)**
Instructor presents one of the following scenarios. Student interprets out loud:
- A performance metric table from a real or hypothetical strategy
- A candlestick chart with a notable week of price action to describe
- A brief description of an order book scenario to analyze

**Part 3 — Integration Question (7 min)**
One open-ended question requiring synthesis of multiple concepts:
- "A retail trader wants to day trade a small-cap stock with $50,000. Walk me through every risk they face — from market structure, to order mechanics, to performance measurement."
- "Using the quant workflow, walk me through the first 4 steps for a hypothesis you would personally want to test."

> **Resource:** FINN quant workflow — 9-step pipeline reference for Milestone 1 questions requiring workflow recall and application → `resources/infographics/ig_quant_workflow.html`

**Pass criteria:** Student can explain any concept in their own words with a real-world example, without notes, demonstrating genuine understanding not memorization.

#### After Assessments — Month 1 Close (remaining time)

Once all assessments are complete:

**Month 1 retrospective (10 min):**
"Looking back at Week 1 — what feels completely obvious now that felt foreign then? What was the hardest concept of the month? What surprised you most about how markets work?"

**Month 2 preview (5 min):**
"Next month we go from understanding markets to building strategies. We add statistics, indicators, backtesting, and AI. The Python work gets significantly heavier. Everything we did this month is the foundation that makes Month 2 possible."

**Pre-reading for Month 2, Week 1 (distributed now):**
- Wiki Section 3.2 — Full statistics section (hypothesis testing, time series)
- Wiki Section 4.2 — Full Python stack table
- Wiki Section 5.1 — Technical indicators overview

**Monthly One-Liner:**
> *"Month 1 taught me ___, and Month 2 I want to ___."*

---

## WEEKLY DELIVERABLES SUMMARY

| Deliverable | Due | Format |
|-------------|-----|--------|
| Reading Notes + 3 Hypotheses | Monday 11:59 PM | Markdown in hypothesis log |
| Workshop Notebook (W04) | Wednesday 11:59 PM | `.ipynb` pushed to GitHub |
| Weekly Review Log | Friday 11:59 PM | Markdown |
| Hypothesis Outcome Record | Friday 11:59 PM | Appended to hypothesis log |
| **Milestone 1 Assessment** | **Friday Evening** | **Oral — no written submission** |

---

## INSTRUCTOR NOTES FOR WEEK 4

**Monday review format:** The Lightning Round creates productive pressure — the pace of rapid-fire cold calls reveals gaps immediately, without lengthy discussion. After the round, say: "If you missed something, that's what to focus on before Friday. Not the things you knew — the things you missed."

**Milestone simulation selection:** Pick students who would benefit from public practice — those who tend toward strong conceptual understanding but might struggle with verbal articulation. Avoid picking students who are visibly anxious; offer them a private practice session before Friday instead.

**Assessment tone:** Make the assessment feel like a conversation, not an interrogation. Start with a concept the student is strong in (based on your classroom observations) and build confidence before moving to harder questions. The goal is to see what they know, not to catch them failing.

**Handling "pass with conditions":** If a student struggles significantly with Part 1 but excels in Parts 2 and 3, document their conceptual gap clearly and flag it for Month 2 follow-up. Oral assessments reward understanding and penalize memorization — use this distinction deliberately.

**Post-assessment debrief format:** When all assessments are done, the group retrospective should feel celebratory. Month 1 is a genuine accomplishment — students went from zero to building real financial models in 4 weeks. Name that progress explicitly.

**Month 2 transition:** The Monday of Month 2 begins statistics for quants — a significant conceptual leap. Use the Friday close to plant the seed: "The question we couldn't answer all month was: how do you know if a signal is real or random? Next month, we answer that mathematically."

**Documentation of Milestone 1 results:**
```
Student: [Name]
Date: May 8, 2026
Outcome: Pass / Needs Review
Strongest area: ___
Area to watch in Month 2: ___
Notes: ___
```

---

## WEEKLY RESOURCES

> Week 4 is a review and assessment week — no new concepts. Resources here are synthesis tools and reference checks to consolidate Month 1 before Milestone 1. Revisit your W01–W03 resources if any concept feels shaky.

---

### Monday — Month 1 Integration Review

- **[Article | Pre-session]** [Beginner's Guide to Quantitative Trading](https://www.quantstart.com/articles/Beginners-Guide-to-Quantitative-Trading/) — QuantStart. Re-read this with fresh eyes now that you've completed Weeks 1–3. The goal this time is not to learn from it — it's to test whether you can identify where our curriculum departs from the standard framework and *why*. FINN's workflow is a practitioner-refined version of what's described here.

- **[Article | Pre-session]** [What Is Quant Trading? A Beginner's Guide](https://wundertrading.com/journal/en/learn/article/quant-trading) — Wundertrading. Plain-language synthesis article. Use it as a self-test: can you explain everything in this article more clearly, with more nuance, than the author does? If yes — you're ready for Milestone 1.

- **[Article | Homework]** [Systematic Trading: Strategies, Concepts & Quantitative Approach](https://blog.quantinsti.com/systematic-trading/) — QuantInsti. Read the intro and "Steps in Systematic Trading" section only. Write your own version of those steps in your own words — this is the kind of synthesis Milestone 1 will ask for.

---

### Wednesday — Integration Notebook & Full Single-Stock Analysis

- **[Article | Reference]** [yfinance Library — A Complete Guide](https://algotrading101.com/learn/yfinance-guide/) — AlgoTrading101. Full reference for yfinance. Keep this open during the integration notebook build — if you hit a data fetch question, check here first before asking.

- **[Article | Reference]** [Risk-Adjusted Performance Metrics Calculation in Python](https://www.wenvenn.com/20240306/risk-adjusted-performance-metrics-calculation-in-python/) — Wenvenn (March 2024). Full metrics implementation reference. Wednesday's notebook will draw on every metric built in Weeks 1–3 — use this as your implementation cheat sheet.

---

### Friday — Milestone 1 Oral Assessment

> No new resources for Friday. Your preparation is everything you've read and built over the last four weeks. The assessment is not a test of memory — it is a test of whether you can *explain* and *connect* concepts in real time.

**Review checklist before Friday:**
- Can you define and use: bid-ask spread, market microstructure, PFOF, OHLCV, Sharpe ratio, max drawdown, win rate, expectancy?
- Can you walk through the FINN Quant Workflow from memory?
- Can you explain *why* each metric matters — not just what it is?
- Can you describe a specific trade scenario end-to-end: asset class → order type → execution cost → performance measurement?

> **Resource:** Complete Month 1 reference library — `resources/handbook/FINN_HB_P1_GettingStarted.md` (trade types, platforms) · `resources/handbook/FINN_HB_P2_ChartReading.md` (chart patterns) · `resources/handbook/FINN_HB_P3_OrderExecution.md` (order types) · `resources/handbook/FINN_HB_P4_MarketContext.md` (daily routine, market context) — covers every framework and concept assessed in Milestone 1

---

*FINN Week 4 — Integration, Review & Milestone 1 | Part of FINN_Month01.md*
