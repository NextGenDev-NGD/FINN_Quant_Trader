# FINN — Day 7
## Monday · April 27, 2026 · Week 3 of 24
### Topic: The 9-Step Quant Workflow & Core Performance Metrics

```
MORNING   9:00–10:00 AM EST   60 min   Student-led brief
EVENING   8:00–9:30  PM EST   90 min   15 min review · 40 min concepts · 20 min Socratic · 15 min close
```

> **Prep:** Wiki Sections 3.1 and 3.3 read. Wiki Section 3.2 (descriptive stats) read. Published Sharpe ratio observation in hand. Hypothesis log open.

---

# MORNING — Daily Market Brief
## 9:00–10:00 AM

---

**9:00 | PRE-MARKET SCAN** `15 min`

Standard checklist. All blocks run by rotating students from this point forward.

> **ES, NQ, YM Futures** — direction and magnitude. Any weekend developments?
> **VIX** — compare to last Friday. Higher or lower?
> **Macro calendar** — events today?
> **Earnings calendar** — who reports this week?
> **Finviz sector heatmap**
> **10-year yield**
> **Bitcoin overnight**

---

**9:15 | STUDENT-LED BRIEF** `20 min`

Student rotation. After the brief, instructor gives 30-second coaching feedback.

---

**9:35 | HYPOTHESIS SETTING** `15 min`

Add this week's hypotheses. "This week, try to write at least one hypothesis that references a metric — Sharpe, max drawdown, or win rate. Even informally: 'If SPY falls 3% this week, the week's Sharpe will be below ___.' We'll check it Friday."

---

**9:50 | OBSERVATION ASSIGNMENT** `10 min`

"Find any investment, fund, or strategy online that publishes its Sharpe ratio. Write down the number and what it claims to mean. Bring it to class tonight."

---

---

# EVENING — Theory Session
## 8:00–9:30 PM

```
8:00  Day review + reading check           15 min
8:15  Core concepts A — quant workflow     20 min
8:35  Core concepts B — performance metrics 20 min
8:55  Socratic discussion                  20 min
9:15  Wednesday setup + close             15 min
```

---

**8:00 | DAY REVIEW + READING CHECK** `15 min`

"Who found a published Sharpe ratio today? Tell me the number. Do you trust it? Why might a published Sharpe be misleading?"

Cold-call: "Name all 9 steps of the quant workflow in order. No notes."

Give the student time. If they stall, others can help — but everyone should work toward knowing this cold. It is the structural skeleton of the entire course.

---

**8:15 | THE 9-STEP QUANT WORKFLOW** `20 min`

Walk through Wiki Section 3.1. For each step, make it concrete — not abstract.

**Step 1 — Hypothesis:** "Not 'I think AAPL will go up.' A hypothesis is: 'Stocks with RSI below 30 that close above the 20-day SMA on high volume tend to outperform the market over the next 5 days.' Specific. Testable. Measurable."

**Step 2 — Data Acquisition:** "We already did this. yfinance, Alpaca, FRED. But data quality matters — the best model on bad data is worse than no model."

**Step 3 — Feature Engineering:** "Raw OHLCV is not a signal. RSI derived from Close is a signal. A 20-day return rank across 500 stocks is a signal. Feature engineering is the art of turning data into prediction-relevant inputs."

**Step 4 — Statistical Testing:** "Before you build a model, test if the signal has predictive value at all. If stocks with RSI < 30 don't outperform any more often than random — your hypothesis is wrong. Kill it. Move on."

**Steps 5–9 — Model, Backtest, Risk, Paper Trade, Review:** Walk through the back half. Emphasize: "This is not linear. You iterate. Most hypotheses fail. That is the job."

[ASK] "Which step do most beginning traders skip entirely?"
> *Expected: Statistical testing. They go straight from hypothesis to trading without ever asking if the signal has predictive power.*

> **Resource:** [ig_quant_workflow.html](../../resources/infographics/ig_quant_workflow.html) — Visual flowchart of all 9 steps. Use as a reference card alongside tonight's wiki reading.

---

**8:35 | PERFORMANCE METRICS** `20 min`

Walk through Wiki Section 3.3. Concrete examples, specific numbers.

**Sharpe Ratio:** "Hedge fund A returns 20% per year. Hedge fund B returns 15% per year. Which is better? You can't answer without knowing volatility. If A had 40% annual volatility and B had 5% — B is far superior on a risk-adjusted basis. Sharpe tells you return per unit of risk taken."

*Formula: Sharpe = (Portfolio Return − Risk-Free Rate) / Portfolio Standard Deviation*

**Max Drawdown:** "Your portfolio went from $10,000 to $7,000 before recovering — that's a 30% max drawdown. Ask yourself: could you hold through a 30% loss without abandoning the strategy? Most people can't. Size your exposure so the drawdown you can psychologically tolerate matches your strategy's historical worst."

**Win Rate + R:R:** "A 40% win rate is not a bad strategy. If your average winner is 3× your average loser — you make money at 40%. A 70% win rate with 0.5 R:R is a losing strategy. Never judge a strategy by win rate alone."

**Expectancy:** "Expected value per trade = (Win Rate × Avg Win) − (Loss Rate × Avg Loss). If positive, the strategy makes money over time, in expectation. This is the only number that matters in the long run."

> **Resource:** [ig_performance_metrics.html](../../resources/infographics/ig_performance_metrics.html) — Visual reference card: Sharpe, drawdown, win rate, and expectancy with formulas and interpretation benchmarks.

---

**8:55 | SOCRATIC DISCUSSION** `20 min`

1. "Backtesting shows a Sharpe of 2.5 over 5 years. You deploy it live. After 3 months, the Sharpe is 0.4. What happened? Give me 3 possible explanations."
   > *Expected: Overfitting. Regime change. Transaction costs not modeled. Market adapted.*

2. "Devil's advocate: Is the quant workflow just a sophisticated way of fitting patterns to historical data? How would you prove your strategy is real alpha versus a historical coincidence?"
   > *Expected: Out-of-sample testing. Walk-forward validation. A causal mechanism that explains why the signal works — not just correlation.*

3. "A strategy has a win rate of 80% but a Sharpe ratio of 0.3. How is this possible? What does it imply about the loss structure?"
   > *Expected: Small frequent wins, occasional catastrophic losses. Classic risk profile of uncapped-loss strategies.*

[Don't resolve these tonight. Wednesday gives them the tools to work through the math themselves.]

---

**9:15 | WEDNESDAY SETUP + CLOSE** `15 min`

**Wednesday workshop:** "We calculate all the metrics we discussed tonight on real return data. `W03_workshop_metrics_starter.ipynb` — pull it before Wednesday's DMB. Come ready to implement Sharpe, drawdown, and expectancy from scratch in Python. No importing from a library. We build them ourselves first."

"Why build from scratch? If you use a library you don't understand, you don't know when it's wrong. And it will be wrong. Understanding the math is the only way to catch errors and know what you're actually measuring."

**Pre-reading for next Monday (Week 4 — review week):**
- Review all of Wiki Sections 2 and 3
- Review your own weekly notes from Weeks 1–3
- Glossary: review the entire glossary — know every term

**Milestone 1 reminder:** End of Week 4. Oral assessment. "Treat pre-reading this weekend as exam preparation. Any concept from Weeks 1–3 is fair game. No notes during the assessment."

**Closing reflection:**
*"The most important thing I need to understand before Wednesday is ___."*

---

## DELIVERABLES

| What | When |
|------|------|
| Reading Notes + 3 Hypotheses | Tonight 11:59 PM |
| Pull `W03_workshop_metrics_starter.ipynb` | Before Wednesday DMB |

---

*Day 7 · Monday April 27, 2026 · Draws from `FINN_W03.md`*
