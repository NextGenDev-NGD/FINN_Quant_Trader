# FINN — Week 3: Measuring Markets & The Quant Workflow
## Foundation Phase | Month 1: Market Literacy & Quant Mindset
**Dates:** April 27 – May 2, 2026
**Week Number:** 3 of 24

---

## WEEK OVERVIEW

### Theme
From market observer to market analyst. How quants measure, evaluate, and think systematically. This week introduces the 9-step FINN Quant Workflow and the core performance metrics that define whether a strategy is worth trading.

### Learning Objectives
By the end of this week, students will be able to:
- Recite all 9 steps of the FINN Quant Workflow from memory and describe each step's purpose
- Define Sharpe ratio, max drawdown, win rate, expectancy, and Calmar ratio with formulas
- Explain why risk-adjusted return (Sharpe) is more meaningful than raw return alone
- Implement total return, annualized return, annual volatility, Sharpe ratio, max drawdown, win rate, and expectancy from scratch in Python
- Explain why we multiply daily standard deviation by √252 to annualize
- Visualize cumulative return and drawdown series on the same chart
- Begin preparing for Milestone 1 oral assessment (end of Week 4)

### Materials Needed
- `finnenv` environment — `yfinance`, `pandas`, `numpy`, `matplotlib` installed
- GitHub repo — starter notebook `W03_workshop_metrics_starter.ipynb` (distribute before class)
- TradingView — SPY weekly chart for Friday review
- Hypothesis log — running from Weeks 1–2
- Flashcard or quick-reference format for 9-step workflow (recommend students make their own)

### Pre-Week Checklist (Instructor)
- [ ] Push `W03_workshop_metrics_starter.ipynb` to GitHub before Wednesday
- [ ] Assign DMB student rotation for Monday, Wednesday, Friday
- [ ] Prepare Milestone 1 preview content for Friday's Block 4
- [ ] Brief students in advance: Week 4 Friday is Milestone 1 oral assessment
- [ ] Note: Performance metrics workshop builds all metrics from scratch — no quantstats library

---

## MONDAY — April 27, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

Standard DMB checklist. All blocks run by rotating students from this point forward.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Find any investment, fund, or strategy online that publishes its Sharpe ratio. Write it down — what's the number and what does it claim to mean? Bring it to class tonight."

---

### EVENING: Theory Session (8:00–9:30 PM EST)
**Topic:** The Quant Workflow & Core Performance Metrics
**Curriculum Source:** Wiki Sections 3.1, 3.3

#### Pre-Session Setup
- [ ] Wiki Section 3.1 read — 9-step workflow memorized
- [ ] Wiki Section 3.3 read — performance metrics table reviewed
- [ ] Wiki Section 3.2 (descriptive stats) read
- [ ] Sharpe ratio observation logged

#### Block 1 — Day Review & Reading Check (8:00–8:15 PM) | 15 min

"Who found a published Sharpe ratio today? Tell me the number. Do you trust it? Why might a published Sharpe be misleading?"

Cold-call: "Name all 9 steps of the quant workflow in order. No notes." Give the student time. If they stall, other students can help — but everyone should work toward knowing this cold. It is the skeleton of the course.

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 min

**Topic A: The 9-Step Quant Workflow (20 min)**

Walk through Wiki Section 3.1 in detail. For each step, make it concrete:

- **Step 1 — Hypothesis:** "Not 'I think AAPL will go up.' That's not a hypothesis. A hypothesis is: 'Stocks with RSI below 30 that close above the 20-day SMA on high volume tend to outperform the market over the next 5 days.' Specific. Testable. Measurable."

- **Step 2 — Data Acquisition:** "We already did this Wednesday. yfinance, Alpaca, FRED. But data quality matters — the best model on bad data is worse than no model."

- **Step 3 — Feature Engineering:** "Raw OHLCV is not a signal. RSI derived from Close is a signal. A 20-day return rank across 500 stocks is a signal. Feature engineering is the art of turning data into prediction-relevant inputs."

- **Step 4 — Statistical Testing:** "Before you build a model, test if the signal even has predictive value. If stocks with RSI < 30 don't outperform ANY more often than random — your hypothesis is wrong. Kill it. Move on."

- **Steps 5–9:** Walk through model → backtest → risk → paper trade → review. Emphasize the loop: "This is not linear. You iterate. Most hypotheses fail. That's the job."

**Topic B: Performance Metrics (20 min)**

Walk through Wiki Section 3.3 metrics table. For each metric, use a concrete example:

- **Sharpe Ratio:** "Hedge fund A returns 20%/year. Hedge fund B returns 15%/year. Which is better? You can't answer without knowing the volatility. If A had 40% annual volatility and B had 5%, B is far superior on a risk-adjusted basis. Sharpe tells you return per unit of risk taken."

- **Max Drawdown:** "If your portfolio went from $10,000 to $7,000 before recovering — that's a 30% max drawdown. Ask yourself: could you psychologically hold through a 30% loss without abandoning the strategy? Most people can't. Size your exposure so the drawdown you can tolerate matches your strategy's historical worst."

- **Win Rate + R:R:** "A 40% win rate is not a bad strategy. If your average winner is 3× your average loser — you make money at 40% win rate. A 70% win rate with a 0.5 R:R is a losing strategy. Never judge by win rate alone."

- **Expectancy:** "Expected value per trade = (Win Rate × Avg Win) − (Loss Rate × Avg Loss). If this is positive, the strategy makes money over time, in expectation. This is the only number that matters in the long run."

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 min

1. "Backtesting shows a Sharpe ratio of 2.5 over 5 years of historical data. You deploy it live. After 3 months, the Sharpe is 0.4. What happened? Give me 3 possible explanations."
   *(Expected: Overfitting. Regime change. Transaction costs not modeled. Market adapted.)*

2. "Devil's advocate: Is the quant workflow just a sophisticated way of fitting patterns to historical data? How would you prove your strategy is real alpha versus a historical coincidence?"
   *(Expected: Out-of-sample testing. Walk-forward. Causal mechanism not just correlation.)*

3. "A strategy has a win rate of 80% but a Sharpe ratio of 0.3. How is this possible? What does it imply about the loss structure?"
   *(Expected: Small frequent wins, occasional catastrophic losses. Classic risk of options selling or mean-reversion without stops.)*

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 min

**Wednesday workshop:**
"We calculate all the metrics we discussed tonight on real return data. Starter notebook: `W03_workshop_metrics_starter.ipynb`. Come ready to implement Sharpe, drawdown, and expectancy from scratch in Python. No importing from a library — we build them ourselves first."

Why build from scratch? "If you use a library you don't understand, you don't know when it's wrong. And it will be wrong. Understanding the math behind the metric is the only way to catch errors and know what you're actually measuring."

**Pre-reading for next Monday (Week 4 — review week):**
- Review all of Wiki Sections 2 and 3 — everything from Month 1
- Review your own weekly notes from Weeks 1–3
- Glossary: review the entire glossary — know every term

**Milestone 1 reminder:** End of Week 4. Oral assessment. "Treat your pre-reading this weekend as exam preparation. Any concept from Weeks 1–3 is fair game. No notes during the assessment."

**Monday Deliverable:** Reading Notes + 3 Hypotheses by 11:59 PM

---

## WEDNESDAY — April 29, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Observation Assignment:** "Before tonight's class, find a mutual fund or ETF that publishes its 3-year Sharpe ratio and maximum drawdown in its factsheet. Write both numbers down. We'll use them tonight."

---

### EVENING: Workshop Session (8:00–9:30 PM EST)
**Workshop:** W3 — Building Performance Metrics from Scratch in Python
**Notebook:** `W03_workshop_metrics_[initials].ipynb`
**Curriculum Source:** Wiki Section 3.3, Code Pattern 4

#### Pre-Session Setup
- [ ] `finnenv` running, repo pulled
- [ ] `W03_workshop_metrics_starter.ipynb` open
- [ ] Fund/ETF factsheet with Sharpe and max drawdown from DMB assignment ready
- [ ] Monday notes reviewed

#### Block 1 — Framing (8:00–8:10 PM) | 10 min

"Monday we defined every performance metric. Tonight we implement them. There are libraries that compute these for you — `quantstats`, `pyfolio`. We are NOT using them tonight. We build from scratch first.

Why? Because if you use a library you don't understand, you don't know when it's wrong. And it will be wrong. Understanding the math behind the metric is the only way to catch errors and know what you're actually measuring."

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 min

```python
import yfinance as yf
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# Fetch 3 years of SPY data
df = yf.download("SPY", period="3y", interval="1d")
df['Return'] = df['Close'].pct_change().dropna()
returns = df['Return'].dropna()
print(f"Working with {len(returns)} daily returns")
print(f"Date range: {returns.index[0].date()} to {returns.index[-1].date()}")
```

**Step 1 — Total and annualized return (5 min)**
```python
def total_return(returns):
    """Compound total return over the period."""
    return (1 + returns).prod() - 1

def annualized_return(returns, periods_per_year=252):
    """Annualized return assuming daily returns."""
    n = len(returns)
    return (1 + total_return(returns)) ** (periods_per_year / n) - 1

print(f"Total Return:     {total_return(returns):.2%}")
print(f"Annualized Return: {annualized_return(returns):.2%}")
```

**Step 2 — Volatility (5 min)**
```python
def annual_volatility(returns, periods_per_year=252):
    """Annualized standard deviation of daily returns."""
    return returns.std() * np.sqrt(periods_per_year)

print(f"Annual Volatility: {annual_volatility(returns):.2%}")
```
*"Why multiply by sqrt(252)? Because variance scales linearly with time, and standard deviation scales with the square root of time. 252 trading days per year — so daily std × √252 = annual std."*

**Step 3 — Sharpe Ratio (8 min)**
```python
def sharpe_ratio(returns, risk_free_rate=0.05, periods_per_year=252):
    """
    Sharpe Ratio: excess return per unit of risk.
    risk_free_rate: annual rate (use current 3-month T-bill rate)
    """
    daily_rf = risk_free_rate / periods_per_year
    excess_returns = returns - daily_rf
    if excess_returns.std() == 0:
        return 0
    return (excess_returns.mean() / excess_returns.std()) * np.sqrt(periods_per_year)

sharpe = sharpe_ratio(returns)
print(f"Sharpe Ratio: {sharpe:.3f}")
print("Interpretation:", end=" ")
if sharpe > 1.5:
    print("Excellent")
elif sharpe > 1.0:
    print("Good")
elif sharpe > 0.5:
    print("Acceptable")
else:
    print("Poor")
```

**Step 4 — Maximum Drawdown (12 min)**
```python
def max_drawdown(returns):
    """
    Maximum peak-to-trough decline in cumulative returns.
    Returns the drawdown as a negative percentage.
    """
    cumulative = (1 + returns).cumprod()
    rolling_max = cumulative.cummax()
    drawdown = (cumulative - rolling_max) / rolling_max
    return drawdown.min()

def drawdown_series(returns):
    """Return the full drawdown time series for visualization."""
    cumulative = (1 + returns).cumprod()
    rolling_max = cumulative.cummax()
    return (cumulative - rolling_max) / rolling_max

mdd = max_drawdown(returns)
print(f"Maximum Drawdown: {mdd:.2%}")

# Visualize cumulative return and drawdown
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(14, 8), sharex=True)

cumret = (1 + returns).cumprod()
ax1.plot(cumret.index, cumret, color='steelblue', lw=1.5)
ax1.set_title('SPY — Cumulative Return (3 Years)', fontsize=13)
ax1.set_ylabel('Growth of $1')
ax1.grid(True, alpha=0.3)

dd_series = drawdown_series(returns)
ax2.fill_between(dd_series.index, dd_series, 0, color='red', alpha=0.4)
ax2.set_title('Drawdown from Peak', fontsize=13)
ax2.set_ylabel('Drawdown (%)')
ax2.grid(True, alpha=0.3)

plt.tight_layout()
plt.show()
```

**Step 5 — Win rate and expectancy (10 min)**
```python
def win_rate(returns):
    """Percentage of positive return days."""
    return (returns > 0).mean()

def expectancy(returns):
    """
    Expected value per trade/period.
    E = (Win Rate × Avg Win) - (Loss Rate × Avg Loss)
    """
    wins = returns[returns > 0]
    losses = returns[returns < 0]

    win_r = len(wins) / len(returns)
    loss_r = len(losses) / len(returns)
    avg_win = wins.mean() if len(wins) > 0 else 0
    avg_loss = abs(losses.mean()) if len(losses) > 0 else 0

    e = (win_r * avg_win) - (loss_r * avg_loss)

    print(f"Win Rate:    {win_r:.2%}")
    print(f"Loss Rate:   {loss_r:.2%}")
    print(f"Avg Win:     {avg_win:.4%}")
    print(f"Avg Loss:    {avg_loss:.4%}")
    print(f"R:R Ratio:   {avg_win/avg_loss:.2f}")
    print(f"Expectancy:  {e:.4%} per day")
    return e

expectancy(returns)
```

#### Block 3 — Independent Work (8:50–9:15 PM) | 25 min

**Core Exercise:**
Run all 5 metric functions on 3 different assets — compare SPY to QQQ and one high-volatility stock (student's choice). Answer in markdown:
1. Which asset had the best Sharpe? Does that surprise you?
2. Which had the worst max drawdown? When did the peak-to-trough occur?
3. Using the fund/ETF data from the DMB observation — does your calculated Sharpe match what was published? If not, why might they differ?

**Extension Challenge:**
Wrap all metrics into a single `performance_summary()` function that takes a return series and prints a formatted report. Then run it on all 3 assets and build a comparison DataFrame.

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 min

**Share-out:** Focus on Sharpe ratio comparison across assets. "Which surprised you most? Which metric felt most useful for comparing strategies?"

**Muddiest Point:**
> *"The muddiest point from tonight was ___."*

**Wednesday Deliverable:** Completed notebook `W03_workshop_metrics_[initials].ipynb` submitted to GitHub by 11:59 PM

---

## FRIDAY — May 1, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Observation Assignment:** "Before tonight's class, calculate the approximate Sharpe ratio for SPY this week. Use the last 5 days of returns (this week only). What does the weekly Sharpe look like? Is this meaningful? We'll debate it tonight."

---

### EVENING: Review & Market Session (8:00–9:30 PM EST)

#### Pre-Session Setup
- [ ] Hypothesis log reviewed — all Week 3 hypotheses ready for audit
- [ ] TradingView with SPY daily chart + drawdown visualization ready
- [ ] Milestone 1 preparation materials ready for Block 4

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 min

1. "Recite the 9-step quant workflow from memory. Every step."
2. "What is the Sharpe ratio telling you that a simple return figure cannot? Give me the formula and explain each term."
3. "In Wednesday's notebook — why do we multiply standard deviation by √252? Explain the math."
4. "Max drawdown of −28%. Sharpe of 1.1. Is this a good strategy? Defend your answer."
5. "What is expectancy? Give me a strategy that has a 35% win rate but is still profitable."

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 min

**Hypothesis audit:** Close all this week's hypotheses.

**Chart review — apply metrics:**
"This week we're going to think about the market's behavior in metric terms.

SPY's weekly return was ___%. Its high-low range was ___%. The weekly drawdown from Monday's open to the lowest intraday point was ___%. These are the same metrics we calculated Wednesday — now we're reading them on real data."

Walk through: "If SPY this week were a strategy in a backtest, what would the weekly Sharpe look like? The student from the DMB observation calculated this — what did you get? Is a single-week Sharpe meaningful? Why not?"

*(Answer: No. Sharpe requires many observations to be statistically meaningful. A single week's Sharpe is noise. This is a setup for next week's statistics content.)*

**Sector rotation:** Standard Finviz heatmap review.

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 min

Continue observation. Specifically note put/call ratio and VIX behavior leading into the weekend. Ask: "Does VIX tend to move before weekends? Why might that be?"

#### Block 4 — Milestone 1 Preview & Close (9:20–9:30 PM) | 10 min

**Milestone 1 is next Friday, May 8.**

"The oral assessment will be 20 minutes each, one on one. Any topic from Weeks 1–3 is fair game. I will ask you to explain concepts as if you're teaching them. You will be asked to interpret a chart, a metric, and an order scenario. There are no trick questions. If you did the work, you pass.

Spend this weekend reviewing:
- All three weekly review logs
- Your Cornell notes from all three Monday sessions
- The full glossary — every term

Monday will be a review session — we'll use the entire 90 minutes to drill concepts, answer questions, and make sure everyone is ready."

**DMB rotation for Week 4:** Assign all three leads.

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

## WEEKLY DELIVERABLES SUMMARY

| Deliverable | Due | Format |
|-------------|-----|--------|
| Reading Notes + 3 Hypotheses | Monday 11:59 PM | Markdown in hypothesis log |
| Workshop Notebook (W03) | Wednesday 11:59 PM | `.ipynb` pushed to GitHub |
| Weekly Review Log | Friday 11:59 PM | Markdown |
| Hypothesis Outcome Record | Friday 11:59 PM | Appended to hypothesis log |

---

## INSTRUCTOR NOTES FOR WEEK 3

**The 9-step workflow as a skeleton:** Every subsequent month of the course refers back to the quant workflow. When students present at Milestone 2, they use it as a structure. When they build backtests in Month 2, each step maps to a workflow stage. Spend real time on this tonight — it is the conceptual infrastructure of the course.

**Building metrics from scratch:** Students often want to use `quantstats` immediately. Hold the line. When they later see a "weird" Sharpe from a library function, the students who built it from scratch will know exactly what to check. This investment pays dividends in Month 2 backtesting.

**The √252 question:** This concept trips up many students. Make it concrete: "Variance of daily returns is 0.0001. Annual variance = 0.0001 × 252 = 0.0252. Annual std = √0.0252 = 15.9%. But daily std = √0.0001 = 1%. And 1% × √252 = 15.9%. So multiplying daily std by √252 gives the same answer as computing annual std directly. That's why the formula works."

**Published Sharpe comparison:** When students find that their calculated Sharpe differs from a published number, the most common reasons are: different risk-free rate assumed, different time period, monthly vs. daily returns, and fees not reflected. This is a valuable calibration exercise — "trust but verify" every number from a third party.

**Milestone 1 pacing:** Make sure students understand that Milestone 1 is not a written exam — it is a conversation. The student who can explain market microstructure to a friend at dinner will pass. The student who memorized definitions without understanding them will not. Frame this clearly so they prepare correctly.

**Single-week Sharpe discussion:** The Friday insight that a single week's Sharpe is meaningless is a gateway to the statistics content in Month 2. When they grasp intuitively that "more data = more reliable metrics," the formal hypothesis testing in Week 5 will land much more easily.

---

## WEEKLY RESOURCES

> Resources are labeled **[Pre-session]** (review before class) or **[Homework]** (explore after). FINN covers every concept live — these are your scaffolding, not your syllabus.

---

### Monday — The Quant Workflow & Performance Metrics

- **[Article | Pre-session]** [Beginner's Guide to Quantitative Trading](https://www.quantstart.com/articles/Beginners-Guide-to-Quantitative-Trading/) — QuantStart. Covers the full cycle: strategy identification → backtesting → execution → risk management. Read before Monday to have the framework in your head before FINN walks through the 9-step FINN Quant Workflow. The QuantStart version and the FINN workflow align closely.

- **[Article | Pre-session]** [Sharpe Ratio: Formula, Applications & Algorithmic Trading](https://blog.quantinsti.com/sharpe-ratio-applications-algorithmic-trading/) — QuantInsti. Practitioner-level explanation including how quant funds actually use the Sharpe as a strategy filter. Key quote to internalize before class: any strategy with annualized Sharpe under 1.0 (after costs) gets ignored; serious funds ignore anything under 2.0.

- **[Article | Homework]** [What Is the Sharpe Ratio?](https://www.britannica.com/money/sharpe-ratio-overview) — Britannica Money. Covers the formula, interpretation, and honest limitations — particularly the normal distribution assumption. Read after class to understand where the metric breaks down.

- **[Article | Homework]** [Systematic Trading: Strategies, Concepts & Quantitative Approach](https://blog.quantinsti.com/systematic-trading/) — QuantInsti. Big-picture view of what it means to trade systematically versus discretionarily. Reinforces Monday's workflow discussion with real examples of how systematic processes are structured.

- **[YouTube | Pre-session]** Search YouTube for: *"Sharpe ratio explained quant finance 2022 2023"* — look for a 10–15 min video that shows the formula, walks through an example calculation, and explains what a "good" Sharpe looks like in practice. Skip anything that only covers personal investing — look for a quant/hedge fund framing. Channels worth checking: **Patrick Boyle**, **QuantInsti**, **Ryan O'Connell CFA**.

---

### Wednesday — Python Metrics Workshop: Building From Scratch

- **[Article | Pre-session]** [Sharpe, Sortino and Calmar Ratios with Python](https://www.codearmo.com/blog/sharpe-sortino-and-calmar-ratios-python) — Codearmo (last updated April 2026). Implements all three ratios from scratch using pandas — no external finance libraries. This mirrors exactly how Wednesday's workshop is structured. Read and run the code before class if possible.

- **[Article | Pre-session]** [Risk-Adjusted Performance Metrics Calculation in Python](https://www.wenvenn.com/20240306/risk-adjusted-performance-metrics-calculation-in-python/) — Wenvenn (March 2024). Builds Sharpe and max drawdown from scratch using numpy and pandas with S&P 500 data. Clean, annotated code — good second reading alongside the Codearmo article.

- **[Article | Reference]** [Guide to Quantitative Trading Strategies and Backtesting](https://www.pyquantnews.com/free-python-resources/guide-to-quantitative-trading-strategies-and-backtesting) — PyQuant News. Broader context for where metrics fit within a full backtesting workflow. Bookmark this — it becomes directly relevant in Month 2.

- **[YouTube | Homework]** Search YouTube for: *"max drawdown Python pandas calculate from scratch 2023"* — look for a short tutorial (under 15 min) that uses cummax() and rolling calculations rather than a pre-built library function. Understanding the implementation is the point — not just knowing the formula.

---

### Friday — Metrics in Context & Milestone 1 Preview

- **[Article | Pre-session]** [Modelling Drawdown With Python](https://medium.com/swlh/modelling-drawdown-with-python-98ccb49356ba) — Partha Mishra / Medium. Visual walkthrough of how drawdown evolves over time on a real equity curve. Good to review before Friday's session where we apply metrics to the actual week's market data.

- **[Article | Homework]** [What Is Quant Trading? A Beginner's Guide](https://wundertrading.com/journal/en/learn/article/quant-trading) — Wundertrading. Plain-English synthesis of the quant approach — useful for practicing how to explain this in Milestone 1 terms. FINN's ask at Milestone 1: "explain this to a non-technical person." Use this article to check whether your explanation is clearer or muddier than theirs.

---

*FINN Week 3 — Measuring Markets & The Quant Workflow | Part of FINN_Month01.md*
