# FINN — Day 11
## Wednesday · May 6, 2026 · Week 4 of 24
### Topic: Milestone Prep — Full Single-Stock Analysis Notebook

```
MORNING   9:00–10:00 AM EST   60 min   Student-led brief + observation assignment
EVENING   8:00–9:30  PM EST   90 min   10 min framing · 60 min independent build · 20 min share-out & muddiest point
```

> **Prep:** `finnenv` running, repo pulled. W01, W02, W03 notebooks accessible for reference. `W04_workshop_integration_starter.ipynb` open — blank template ready. Students have Week 1–3 notes. Tonight is the last session before Milestone 1 Friday — tone should feel like a dress rehearsal.

---

# MORNING — Daily Market Brief
## 9:00–10:00 AM

---

**9:00 | PRE-MARKET SCAN** `15 min`

Standard checklist. Note any macro events this week that could affect tonight's stock choices. "When you pick your ticker for tonight, pick something you genuinely want to understand — not the easiest one. Friday's assessment rewards genuine understanding, not safe choices."

> **ES, NQ, YM Futures**
> **VIX** — level and direction
> **Macro calendar** — any events today or Thursday?
> **Earnings calendar**
> **Finviz sector heatmap**
> **10-year yield**
> **Bitcoin**

---

**9:15 | STUDENT-LED BRIEF** `20 min`

Student rotation. Coaching feedback after the brief.

---

**9:35 | HYPOTHESIS SETTING** `15 min`

"Any new hypotheses today should reference a metric — Sharpe, drawdown, win rate, expectancy. If you're going to talk about a stock in tonight's workshop, start your hypothesis here."

---

**9:50 | OBSERVATION ASSIGNMENT** `10 min`

"Think about what ticker you want to analyze tonight. Go find 2 years of its price history — visually, on TradingView or Yahoo Finance. Write down: one observation about its volatility, one observation about volume behavior. Bring it to class."

---

---

# EVENING — Workshop Session
## 8:00–9:30 PM

```
8:00  Framing                                  10 min
8:10  Independent Build                         60 min
9:10  Share-Out & Muddiest Point               20 min
```

---

**8:00 | FRAMING** `10 min`

"Tonight's workshop is different. There's no guided build. You have all the code you need from the last 3 weeks — the data pull, the flagging function, the metrics. Tonight you apply all of it to a single stock of your choice.

The output is a complete analysis notebook: fetch data, clean it, flag notable days, calculate all performance metrics, visualize price and drawdown.

Then write a 300-word markdown analysis at the bottom answering: 'Based purely on this data, what kind of instrument is this? Is it suitable as a trading target? What risks does it carry?'

This notebook is your Milestone 1 artifact. It shows you can do the work."

> **Resource:** [ig_performance_metrics.html](../../resources/infographics/ig_performance_metrics.html) — Reference card for Section 3 metrics: Sharpe, drawdown, win rate, and expectancy.

Recommended notebook structure:
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

---

**8:10 | INDEPENDENT BUILD** `60 min`

Students work independently. No guided build. Instructor circulates and asks probing questions — does not provide solutions.

Questions to ask while circulating:
- "Why did you choose this ticker?"
- "What does this metric tell you about the asset's behavior?"
- "If a strategy produced this drawdown — would you trade it? Why?"
- "What surprised you most in this data?"

---

**9:10 | SHARE-OUT & MUDDIEST POINT** `20 min`

**Share-out (15 min):** 3 students present their analysis. Focus on the written section — "Did your interpretation of the data make sense? Did you connect the metrics to real-world meaning?"

**Muddiest Point (5 min):** Anything still unclear before Friday's assessment.
> *"The muddiest point — anything still unclear before Friday — was ___."*

> **Resource:** [Student Handbook Parts 1–5](../../resources/handbook/) — Complete Month 1 reference. Review tonight to identify any remaining gaps before Friday's assessment.

---

## DELIVERABLES

| What | When |
|------|------|
| Completed notebook `W04_workshop_integration_[initials].ipynb` pushed to GitHub | Tonight 11:59 PM |

---

*Day 11 · Wednesday May 6, 2026 · Draws from `FINN_W04.md`*
