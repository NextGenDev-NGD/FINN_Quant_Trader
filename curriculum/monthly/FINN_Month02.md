# FINN — Month 02 Lesson Plan
## Financial Intelligence & Navigation Network
### Quant Methods, AI Integration & Strategy Development
**Dates:** May 11 – June 6, 2026
**Phase:** Month 2 of 6 — Quant Methods + AI
**Milestone:** M2 — Strategy Presentation (End of Week 8 / June 5–6, 2026)

---

> **INSTRUCTOR NOTE**
> Month 2 is the technical heart of the foundation phase. Students arrive having passed
> Milestone 1 — they understand markets, participants, and metrics. Now we give them
> the quantitative and AI toolkit to build strategies with.
>
> The workload increases significantly this month. Python sessions become more complex,
> the statistics are real, and by Week 8 every student must present a complete backtested
> strategy. Hold the standard — this is where the course separates students who are
> truly engaging from those going through motions.
>
> **Memorial Day — Monday May 25, 2026:** Federal holiday. High cancellation risk.
> Async fallback package for Week 3 Monday is pre-built at the end of this file.
> Plan for it. Do not be caught off-guard.

---

## Month 2 Overview

### Learning Objectives

By the end of Month 2, every student will be able to:

- Apply statistical hypothesis testing to validate whether a signal has predictive value
- Explain stationarity, autocorrelation, and why they matter for financial time series
- Calculate and interpret technical indicators (RSI, MACD, Bollinger Bands, ATR, VWAP) as data features
- Build a complete feature matrix from raw OHLCV data using `pandas-ta`
- Run a rules-based backtest using Backtrader and interpret the results honestly
- Apply walk-forward testing methodology and explain why it matters
- Build a basic ML signal using scikit-learn with time-series cross-validation
- Integrate a sentiment signal using FinBERT or an LLM API on financial news headlines
- Identify and explain at least 3 backtesting pitfalls: look-ahead bias, overfitting, survivorship bias
- Present a complete, backtested trading strategy at Milestone 2 — hypothesis through findings

### Month 2 Curriculum Sources
*(from `FINN_Curriculum_Wiki.md`)*

- Section 3.2: Full statistics (hypothesis testing, time series — completing what Month 1 deferred)
- Section 4.3: Code patterns 2, 3, 4 (indicators, backtest, tear sheet)
- Section 5.1 & 5.2: Technical indicators as data inputs, candlestick pattern encoding
- Section 6: AI & LLM integration (full — sentiment pipeline, ML signal generation)
- Section 7: Backtesting & strategy development (full)

### Month 2 at a Glance

| Week | Dates | Theme | Monday Topic | Wednesday Workshop | Friday Focus |
|------|-------|-------|-------------|-------------------|-------------|
| 5 | May 11–16 | Statistics for Quants | Hypothesis testing, stationarity, time series stats | Statistical tests on return data in Python | Statistics in the real week's market |
| 6 | May 18–23 | Technical Indicators as Features | Indicators as model inputs, feature engineering | Building a full feature matrix with pandas-ta | Indicator behavior on this week's charts |
| 7 | May 25–30 | Backtesting & Strategy Logic | ⚠️ Memorial Day — Async Mon | Backtrader walkthrough — SMA strategy | Backtest results vs. live week |
| 8 | Jun 1–6 | AI Signals & Milestone 2 | ML signals + LLM sentiment pipeline | Strategy refinement + milestone prep | **Milestone 2 Presentations** |

---

---

# WEEK 5 — Statistics for Quants
**Theme:** Moving from description to inference. Testing whether signals are real or noise.

---

## Monday, May 11, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

#### Block 1 — Pre-Market Scan (9:00–9:15 AM)
Standard checklist. Flag any continuation from last week's market behavior.
Reference: "We closed Month 1 with Milestone 1. What has the market done
in the week since? Any regime shifts from last Friday's close?"

#### Block 2 — Student-Led Brief (9:15–9:35 AM)
Rotating student presenter — standard format.
Instructor note: "By Week 5, the student briefs should be noticeably sharper
than Week 1. If they are not, give direct feedback before Block 3."

#### Block 3 — Hypothesis Setting (9:35–9:50 AM)
Reopen the hypothesis log. Note Month 2 starts here.
Add a section header in the log: `## Month 2 — Week 5`.
First hypothesis of the month should reflect Month 2's statistical lens:
encourage students to frame hypotheses as testable statistical claims.

Example prompt: "Can someone frame a hypothesis that could be tested with
a t-test? Something like: 'Days with VIX above 20 have lower average
SPY returns than days with VIX below 20.' That's a statistical hypothesis."

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "During market hours, find any financial news headline
about a company or index. Write the headline down word for word.
Then personally rate it: Bullish, Bearish, or Neutral — and your confidence 0–100.
Bring it tonight. We'll compare your rating to what we can compute."

---

### Monday, May 11, 2026 — Theory Session
**Time:** 8:00–9:30 PM EST
**Topic:** Statistics for Quants — Hypothesis Testing, Stationarity & Time Series
**Curriculum source:** Wiki Section 3.2 (full)

#### Pre-Session Requirements
- [ ] Wiki Section 3.2 read in full — all four subsections
- [ ] Wiki Section 4.2 reviewed — especially scipy and statsmodels entries
- [ ] News headline from DMB observation logged with personal sentiment rating

---

#### Block 1 — Day Review & Reading Check (8:00–8:15 PM) | 15 minutes

"Who found a news headline today? Read it aloud. What did you rate it?
Bullish, Bearish, or Neutral — and why?

Now here's the question that will drive tonight and all of Month 2:
How do you know if you're right? How do you test whether your intuition
about a headline has any actual predictive value for the stock's price?
That's what statistics lets you do. That's what tonight is about."

Cold-call reading check:
- "What is a null hypothesis? Give me an example in market terms."
- "What does a p-value of 0.03 mean in plain English?"
- "Name the three time series concepts from the reading."

---

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 minutes

**Topic A: Hypothesis Testing Applied to Markets (20 min)**

Start with first principles — do not assume prior statistics knowledge.

"A hypothesis test starts with a boring assumption: the null hypothesis.
The null hypothesis is always 'nothing interesting is happening.'
For us: 'This signal has no predictive relationship with returns.'

We collect data, compute a test statistic, and ask: how likely is this data
if the null hypothesis is true? That probability is the p-value.
If p < 0.05, we say: this result is unlikely enough by chance that we reject
the null. The signal probably does something."

**Walk through a concrete market example on the board:**

"Hypothesis: 'Stocks with RSI below 30 outperform the market over the next 5 days.'
- H₀: There is no difference in 5-day forward returns between RSI<30 stocks and the market
- H₁: RSI<30 stocks have higher 5-day forward returns than the market
- We collect 3 years of data, find every RSI<30 instance, measure the 5-day return after
- We compute a t-test comparing those returns to the market's 5-day average return
- If p < 0.05, we have statistical evidence the RSI<30 signal works"

**The Information Coefficient (IC):**
"The IC is the correlation between your predicted rank and the actual return rank.
IC of 0 = your model is random. IC of 1 = perfect. IC of 0.05 = modest but real edge.
Professional quants consider IC > 0.05 meaningful. IC > 0.10 is strong."

**Type I and Type II errors:**
"Type I error: you think the signal is real but it's noise — you trade a fake edge.
Type II error: you think the signal is noise but it's real — you miss a genuine edge.
In trading, Type I errors cost money directly. Type II errors cost opportunity.
Multiple testing makes Type I errors far more likely — the more signals you test,
the more false positives you find by chance alone. This is why quants are skeptical."

**Topic B: Time Series Fundamentals (20 min)**

"Financial data is not like cross-sectional data. The order matters.
Today's return is related to yesterday's return. This violates the independence
assumption of standard statistics. We need different tools."

**Stationarity:**
"A stationary series has constant mean and variance over time — it doesn't trend.
Most price series are NOT stationary. They trend up or down.
Daily returns ARE stationary — because we've differenced the price series.
Why does this matter? Most statistical models assume stationarity.
If you run a regression on non-stationary data, your results are garbage — spurious correlation."

*Draw on whiteboard: AAPL price (non-stationary, trending up) vs. AAPL daily return
(stationary, mean-reverting around zero).*

"The ADF test (Augmented Dickey-Fuller) formally tests for stationarity.
p < 0.05 in an ADF test means the series IS stationary. We will run this Wednesday."

**Autocorrelation:**
"Does today's return predict tomorrow's return?
If returns have positive autocorrelation — momentum. Yesterday's winner tends to win again.
If returns have negative autocorrelation — mean reversion. Yesterday's winner tends to lose.
Most daily equity returns have near-zero autocorrelation — close to random walk.
But at weekly and monthly horizons, momentum factors emerge. This is why momentum works."

**Rolling statistics:**
"Rather than computing a single mean over all history, we compute it over a rolling window.
A 20-day rolling mean gives you the average of the last 20 days, updated daily.
This captures regime changes — periods when the market behaves differently."

---

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 minutes

1. "We run 100 tests on 100 different signals. 5 of them show p < 0.05.
   Should we trade those 5 signals? What's the problem?"
   *(Expected: multiple testing problem. With 100 tests at 5% threshold,
   we expect 5 false positives by chance alone. Need Bonferroni correction or
   out-of-sample validation.)*

2. "Devil's advocate: Isn't p < 0.05 arbitrary? Why not p < 0.10 or p < 0.01?
   Who decided 5% was the magic number?"
   *(Expected: it IS somewhat arbitrary — Fisher originally proposed it as a guideline.
   In finance with high noise, many argue p < 0.01 is more appropriate.
   The point is: a threshold is a tool, not a truth.)*

3. "If stock prices are close to a random walk (near-zero autocorrelation),
   does that mean quantitative trading is impossible?"
   *(Expected: No. Even small departures from random walk — 0.05 IC — are exploitable
   at scale with enough trades. The edge doesn't have to be large, just consistent
   and real across enough observations.)*

4. "A signal worked from 2015–2020. You deploy it in 2021. It stops working.
   What are three possible statistical explanations?"
   *(Regime change. Overfitting — it was never real. Signal crowding — too many people
   found it and arbitraged it away.)*

---

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 minutes

**Wednesday workshop:**
"We'll implement the ADF test, rolling statistics, and a proper t-test
on a real market hypothesis. Starter notebook: `W05_workshop_statistics_starter.ipynb`.
Come ready to run real hypothesis tests on real return data."

**Weekly hypotheses:** At least one this week must be framed as a statistical hypothesis
(testable with a t-test or correlation measure).

**Pre-reading:**
- Wiki Section 5.1 — Technical indicators table (full read)
- Wiki Section 5.2 — Candlestick patterns as features
- Begin reviewing Wiki Section 7.1 — Backtesting best practices

**Closing reflection:**
*"The most important thing I need to understand before Wednesday is ___."*

---

## Wednesday, May 13, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Observation Assignment:**
"Today, find a stock that had an unusual move this week. Mentally frame a statistical
hypothesis about what caused it. Bring it tonight — we'll test the underlying idea."

---

### Wednesday, May 13, 2026 — Workshop Session
**Time:** 8:00–9:30 PM EST
**Topic:** Statistical Tests on Financial Data — ADF, t-tests, Rolling Stats, IC
**Curriculum source:** Wiki Section 3.2
**Notebook:** `W05_workshop_statistics_[initials].ipynb`

---

#### Block 1 — Framing & Context Bridge (8:00–8:10 PM) | 10 minutes

"Monday we built the statistical vocabulary.
Tonight we use it. We will run three tests:
1. ADF test — is our return series stationary?
2. t-test — does RSI < 30 actually predict higher forward returns?
3. Rolling correlation — does the relationship change over time?

Every line of code tonight maps directly to a concept from Monday.
By the end you'll have run a real hypothesis test on a real signal.
That is the beginning of quantitative research."

---

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 minutes

```python
import yfinance as yf
import pandas as pd
import numpy as np
import pandas_ta as ta
import matplotlib.pyplot as plt
from scipy import stats
from statsmodels.tsa.stattools import adfuller

# Fetch 3 years of SPY
ticker = "SPY"
df = yf.download(ticker, period="3y", interval="1d")
df['Return'] = df['Close'].pct_change()
df.dropna(inplace=True)
print(f"Dataset: {len(df)} trading days | {ticker}")
```

**Step 1 — ADF Stationarity Test (8 min)**
```python
def run_adf_test(series, series_name):
    """
    Augmented Dickey-Fuller test for stationarity.
    H0: Series has a unit root (non-stationary)
    H1: Series is stationary
    p < 0.05: Reject H0 — series IS stationary
    """
    result = adfuller(series.dropna())
    adf_stat = result[0]
    p_value = result[1]
    critical_values = result[4]

    print(f"\n{'='*50}")
    print(f"ADF Test: {series_name}")
    print(f"{'='*50}")
    print(f"ADF Statistic:  {adf_stat:.4f}")
    print(f"p-value:        {p_value:.4f}")
    print(f"Critical Values:")
    for key, val in critical_values.items():
        print(f"  {key}: {val:.4f}")
    print(f"\nConclusion: Series is {'STATIONARY ✓' if p_value < 0.05 else 'NON-STATIONARY ✗'}")
    print(f"(p = {p_value:.4f} {'< 0.05 — reject H0' if p_value < 0.05 else '>= 0.05 — fail to reject H0'})")

# Test both price (non-stationary) and returns (stationary)
run_adf_test(df['Close'], "SPY Closing Price")
run_adf_test(df['Return'], "SPY Daily Returns")
```
*Pause: "Price fails the test — non-stationary. Returns pass — stationary.
This is why we always work with returns, not prices, in statistical models."*

**Step 2 — Add RSI and build the hypothesis (10 min)**
```python
# Add RSI indicator
df['RSI'] = ta.rsi(df['Close'], length=14)

# Define the signal: RSI < 30 = oversold = potential buy signal
df['RSI_Oversold'] = df['RSI'] < 30

# Calculate forward 5-day return (what happens AFTER the signal)
df['Fwd_5d_Return'] = df['Close'].pct_change(5).shift(-5)

df_clean = df[['RSI', 'RSI_Oversold', 'Return', 'Fwd_5d_Return']].dropna()

# Split into signal and non-signal groups
signal_returns = df_clean.loc[df_clean['RSI_Oversold'], 'Fwd_5d_Return']
baseline_returns = df_clean.loc[~df_clean['RSI_Oversold'], 'Fwd_5d_Return']

print(f"\nRSI < 30 instances: {len(signal_returns)}")
print(f"Baseline instances: {len(baseline_returns)}")
print(f"\nSignal group mean 5d return:   {signal_returns.mean():.4%}")
print(f"Baseline group mean 5d return: {baseline_returns.mean():.4%}")
```
*Deliberate issue: note that `shift(-5)` uses future data — this is intentional
for computing what happened after, but flag it: "In a backtest, never use shift(-N)
as a feature input. Only use it to compute the label. This is a research step,
not a live trading signal."*

**Step 3 — Run the t-test (8 min)**
```python
def test_signal_hypothesis(signal_returns, baseline_returns, signal_name):
    """
    Two-sample t-test: does the signal group have significantly different returns?
    H0: Mean returns are equal between signal and baseline groups
    H1: Signal group has higher mean returns
    """
    t_stat, p_value = stats.ttest_ind(signal_returns, baseline_returns,
                                       alternative='greater')  # One-tailed

    print(f"\n{'='*50}")
    print(f"T-Test: {signal_name}")
    print(f"{'='*50}")
    print(f"t-statistic:  {t_stat:.4f}")
    print(f"p-value:      {p_value:.4f}")
    print(f"\nConclusion: Signal {'HAS ✓' if p_value < 0.05 else 'DOES NOT HAVE ✗'} "
          f"statistically significant predictive value")
    print(f"(at p < 0.05 threshold)")

    # Effect size (Cohen's d)
    pooled_std = np.sqrt((signal_returns.std()**2 + baseline_returns.std()**2) / 2)
    cohens_d = (signal_returns.mean() - baseline_returns.mean()) / pooled_std
    print(f"\nEffect size (Cohen's d): {cohens_d:.4f}")
    print(f"Practical significance: {'Large' if abs(cohens_d) > 0.8 else 'Medium' if abs(cohens_d) > 0.5 else 'Small'}")

test_signal_hypothesis(signal_returns, baseline_returns, "RSI < 30 → 5-Day Forward Return")
```

**Step 4 — Information Coefficient (7 min)**
```python
from scipy.stats import spearmanr

def information_coefficient(predictions, actuals):
    """
    IC = Spearman rank correlation between predicted signal and actual returns.
    Uses Spearman (rank-based) rather than Pearson (linear) for robustness.
    IC > 0.05 = modest edge. IC > 0.10 = strong edge.
    """
    ic, p_value = spearmanr(predictions, actuals)
    print(f"\nInformation Coefficient (IC): {ic:.4f}")
    print(f"p-value: {p_value:.4f}")
    print(f"Signal quality: {'Strong ✓' if abs(ic) > 0.10 else 'Modest' if abs(ic) > 0.05 else 'Weak ✗'}")
    return ic

# Use RSI as the "prediction" — lower RSI should predict higher forward return
# Negate RSI so that lower values map to higher predicted returns
ic = information_coefficient(-df_clean['RSI'], df_clean['Fwd_5d_Return'])
```

**Step 5 — Rolling 90-day IC (7 min)**
```python
# Does the IC stay stable over time, or does it decay?
window = 90  # Rolling 90-day IC
rolling_ic = []
rolling_dates = []

for i in range(window, len(df_clean)):
    window_data = df_clean.iloc[i-window:i]
    ic_val, _ = spearmanr(-window_data['RSI'], window_data['Fwd_5d_Return'])
    rolling_ic.append(ic_val)
    rolling_dates.append(df_clean.index[i])

rolling_ic_series = pd.Series(rolling_ic, index=rolling_dates)

plt.figure(figsize=(14, 5))
plt.plot(rolling_ic_series.index, rolling_ic_series, color='steelblue', lw=1.5)
plt.axhline(0, color='black', lw=0.8, linestyle='--')
plt.axhline(0.05, color='green', lw=1, linestyle='--', label='IC = 0.05 threshold')
plt.axhline(-0.05, color='red', lw=1, linestyle='--')
plt.fill_between(rolling_ic_series.index, rolling_ic_series, 0,
                 where=rolling_ic_series > 0, alpha=0.3, color='green')
plt.fill_between(rolling_ic_series.index, rolling_ic_series, 0,
                 where=rolling_ic_series < 0, alpha=0.3, color='red')
plt.title(f'Rolling 90-Day IC: RSI Signal vs. 5-Day Forward Return', fontsize=13)
plt.ylabel('Information Coefficient')
plt.legend()
plt.grid(True, alpha=0.3)
plt.tight_layout()
plt.show()

print(f"\nMean rolling IC: {rolling_ic_series.mean():.4f}")
print(f"IC positive {(rolling_ic_series > 0).mean():.1%} of the time")
```
*"This is regime analysis. If the IC is positive some years and negative others,
the signal is regime-dependent — it only works in certain market conditions.
That's crucial to know before you build a strategy around it."*

---

#### Block 3 — Independent / Pair Work (8:50–9:15 PM) | 25 minutes

**Core Exercise:**
Choose a different signal (RSI > 70 as overbought, MACD crossover, or volume surge ratio > 2)
and run the full hypothesis testing pipeline:
1. ADF test on the return series
2. Split signal vs. baseline returns
3. t-test with p-value interpretation
4. IC calculation
5. Rolling IC chart

Answer in markdown:
1. Is your signal statistically significant? What does p-value say?
2. Is the effect size practically meaningful? (Cohen's d)
3. Does the IC hold up over time, or does it decay?
4. Would you trust this signal enough to build a strategy around it? Why or why not?

**Extension Challenge:**
Test the same signal on 3 different assets (e.g., SPY, QQQ, IWM).
Does the statistical significance hold across all three?
What does it mean if a signal is significant for SPY but not for small caps?

---

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 minutes

**Share-out:** Students share their signal test results.
Focus discussion: "How many of you found a significant result? How many didn't?
What does it mean if most signals we test are NOT significant?"
*(Answer: most ideas are wrong. That's science. The quant workflow filters them.)*

**Muddiest Point:**
> *"The muddiest point from tonight was ___."*

**Notebook submission:** `W05_workshop_statistics_[initials].ipynb` to GitHub.

---

## Friday, May 15, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Observation Assignment:**
"Review this week's price action for SPY. Using what we know about autocorrelation —
did Monday's return direction predict Tuesday's? Did Wednesday's predict Thursday's?
Build a simple table of daily returns and the next-day direction. Bring it tonight."

---

### Friday, May 15, 2026 — Review & Market Session
**Time:** 8:00–9:30 PM EST
**Topic:** Week 5 Review + Statistical Thinking on This Week's Market

---

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 minutes

1. "Explain the null hypothesis. Give me a null hypothesis for a real trading signal
   you'd want to test — not RSI, something you came up with."

2. "What is the ADF test testing? Why do we run it on returns but not prices?"

3. "The IC of a signal is 0.03. p-value is 0.08. Should you trade it?
   Walk me through your reasoning — statistical significance AND practical significance."

4. "In Wednesday's notebook, we used `shift(-5)` to compute forward returns.
   Why is it absolutely forbidden to use `shift(-N)` as a feature in a live model?"

5. "What is the multiple testing problem? Give me a concrete example of how it
   produces false positives in trading research."

---

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 minutes

**Hypothesis Audit:** Close all Week 5 hypotheses.
Focus specifically on any statistical hypotheses students framed Monday.
"Did your statistical hypothesis hold up this week? Could we even test it
with 5 days of data? What sample size would you actually need?"

**Chart Review — statistical lens:**
Pull up SPY daily chart.
"What was the daily return each day this week? Let's compute the week's autocorrelation
manually — did each day's direction predict the next?

If Monday was up 0.8%, what would a momentum hypothesis predict for Tuesday?
What actually happened? Is one week enough data to draw conclusions? Why not?"

Walk through the VIX behavior:
"VIX moved from ___ to ___. If we had a hypothesis that 'weeks with VIX > 20
produce lower mean SPY returns' — where would we even start to test it?
What data would we need? What's the right test?"

**Sector Rotation:**
Apply statistical framing: "Which sectors outperformed this week?
Is that consistent with what we'd predict given this week's macro backdrop?
How would you test whether sector rotation is predictable?"

---

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 minutes

Standard derivatives checklist. Add statistical framing:
"The put/call ratio this week averaged ___. Over the last 4 weeks it has been:
___, ___, ___, ___. Is there a pattern? Could we test whether elevated P/C ratio
predicts next-week returns? What's the hypothesis?"
*(Don't test it yet — plant the seed. This becomes a student Milestone 2 option.)*

---

#### Block 4 — Next Week Preview & Close (9:20–9:30 PM) | 10 minutes

**Next week:** Technical indicators as data features — the engine of our feature matrix.
This is where we bridge from statistics to strategy building.

**Assign reading:**
- Wiki Section 5.1 — Full indicators table (all 10 indicators)
- Wiki Section 5.2 — Candlestick patterns as features
- Wiki Section 4.3 — Code Pattern 2 (pandas-ta indicator setup)

**DMB rotation:** Assign next week's leads.

**Note Memorial Day (May 25):** Mention now that Week 7 Monday is a holiday.
Async package will be distributed in advance.

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

---

# WEEK 6 — Technical Indicators as Data Features
**Theme:** Indicators are not crystal balls. They are engineered features. Test them like data.

---

## Monday, May 18, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Pull up any stock on TradingView and add RSI (14) and
MACD (12,26,9) to the chart. Find one moment in the last 3 months where
RSI was below 30 AND MACD had a bullish crossover at the same time.
Write down the date and what the stock did in the following 5 days.
Bring it tonight."

---

### Monday, May 18, 2026 — Theory Session
**Time:** 8:00–9:30 PM EST
**Topic:** Technical Indicators as Quantifiable Features — Not Chart Reading
**Curriculum source:** Wiki Sections 5.1, 5.2

#### Pre-Session Requirements
- [ ] Wiki Section 5.1 read — all 10 indicators, definitions and signal use
- [ ] Wiki Section 5.2 read — candlestick pattern encoding table
- [ ] TradingView observation from DMB logged
- [ ] Week 5 workshop notebook reviewed

---

#### Block 1 — Day Review & Reading Check (8:00–8:15 PM) | 15 minutes

"Who found a confluence of RSI < 30 and bullish MACD crossover on TradingView today?
What happened in the following 5 days? Did the stock go up?

And here's the follow-up question: Is one example meaningful?
How many instances would we need before we could trust a pattern?"

Cold-call reading check:
- "Name 5 technical indicators from the reading. What type is each one — momentum, trend, volatility?"
- "What is ATR and why is it in the volatility category?"
- "What does VWAP stand for and why do institutions use it?"

---

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 minutes

**Topic A: Reframing Indicators — From Art to Feature Engineering (10 min)**

"Traditional technical analysis says: 'RSI below 30 means oversold — buy.'
We say: 'RSI below 30 is a binary feature in our feature matrix.
It may or may not predict positive forward returns. Test it.'

The difference is not the tool — it's the mindset. Every indicator in this room
is a data transformation that may or may not contain signal. Your job is to test
whether it does, quantify how much, and combine the strong signals into a model.

We are not chart readers. We are feature engineers."

> **Resource:** FINN 9-Step Quant Workflow — `resources/infographics/ig_quant_workflow.html` — Feature engineering is Step 3.

**Topic B: The 10 Core Indicators — Deep Walk (30 min)**

Walk through Wiki Section 5.1 indicator table. For each indicator,
cover three things: what it calculates, how it behaves, and how we use it as a feature.

- **RSI (14):**
"RSI = 100 - [100/(1 + RS)] where RS = avg gain / avg loss over 14 periods.
Ranges 0–100. Below 30 = historically oversold. Above 70 = historically overbought.
As a feature: the raw RSI value, not just the binary threshold. A model might find
that RSI = 25 predicts differently from RSI = 29.
Feature usage: `df['RSI'] = ta.rsi(df['Close'], length=14)`"

- **MACD (12, 26, 9):**
"MACD = EMA(12) - EMA(26). Signal line = EMA(9) of MACD. Histogram = MACD - Signal.
The crossover (MACD crosses above Signal) is the traditional signal.
As a feature: use the histogram value (magnitude of divergence), not just the crossover binary.
Feature usage: `macd = ta.macd(df['Close']); df = df.join(macd)`"

- **Bollinger Bands (20, 2σ):**
"Middle band = 20-day SMA. Upper/lower = ±2 standard deviations.
When price touches the lower band, it has moved 2σ below average — statistically extreme.
%B = (Close - Lower Band) / (Upper Band - Lower Band). %B < 0 = below lower band.
Feature usage: `df['%B'] = ta.bbands(df['Close'])['BBP_20_2.0']`"

- **ATR (14):**
"Average True Range = average of max(High-Low, |High-PrevClose|, |Low-PrevClose|) over 14 days.
Pure volatility measure — no directional component. Used for:
1. Position sizing: risk per share = ATR × multiplier
2. Stop placement: stop = entry - (ATR × 1.5)
3. Volatility filter: only trade when ATR is above/below threshold
Feature usage: `df['ATR'] = ta.atr(df['High'], df['Low'], df['Close'], length=14)`"

- **EMA/SMA (20, 50, 200):**
"SMA = simple average. EMA = weighted average emphasizing recent prices.
200-day SMA = the long-term trend filter used by institutional traders.
Price above 200 SMA = bull regime. Price below = bear regime.
Feature usage: `df['EMA_20'] = ta.ema(df['Close'], length=20)`"

- **Volume and OBV:**
"OBV = cumulative sum of volume, adding on up days and subtracting on down days.
OBV divergence: price makes a new high but OBV doesn't = distribution (smart money selling).
Feature usage: `df['OBV'] = ta.obv(df['Close'], df['Volume'])`"

> **Resource:** Volume patterns guide — `resources/infographics/ig_volume_analysis.html` | Market reference handbook — `resources/handbook/FINN_HB_P6_MarketReference.md §6.2`

- **VWAP:**
"Volume-Weighted Average Price = sum(price × volume) / sum(volume) for the session.
VWAP resets daily — it's an intraday indicator. Institutions use it as a fair value anchor.
Price above VWAP = bullish intraday bias. Below = bearish bias.
For daily data, we compute a rolling approximation. True VWAP requires intraday data."

- **Stochastic, ADX (brief):**
"Stochastic %K/%D: close relative to high-low range over 14 periods. Crossover signals.
ADX: trend strength 0–100 — above 25 = strong trend present (no direction info).
Feature: use ADX as a regime filter — only apply trend-following signals when ADX > 25."

**Topic C: Candlestick Patterns as Binary Features (5 min)**

"Candlestick patterns are encoded as 1 or 0 in the feature matrix.
`pandas-ta` provides `cdl_pattern()` which computes these automatically.
As features, they add pattern-based signal to the numeric indicators."

> **Resources:** Candlestick patterns — `resources/infographics/ig_candlestick_patterns.html` | Continuation patterns — `resources/infographics/ig_chart_patterns_continuation.html` | Reversal patterns — `resources/infographics/ig_chart_patterns_reversal.html` | Fibonacci — `resources/infographics/ig_fibonacci.html` | Heikin Ashi — `resources/infographics/ig_heikin_ashi.html` | MTF analysis — `resources/infographics/ig_mtf_analysis.html` | Chart reading handbook — `resources/handbook/FINN_HB_P2_ChartReading.md`

---

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 minutes

1. "We have RSI, MACD, Bollinger Bands, ATR, and 3 EMAs as features.
   What's wrong with just throwing all of them into an ML model together?
   What problem does that create?"
   *(Multicollinearity — many indicators are derived from the same price series
   and are highly correlated. Adding correlated features doesn't add information,
   it adds noise. Feature selection matters.)*

2. "ATR tells you nothing about direction. Is it useful in a model that's trying
   to predict whether to go long or short? Why or why not?"
   *(Yes — as a regime or sizing input, not a directional signal.
   Low ATR regime → mean reversion strategies work better.
   High ATR regime → trend following works better.)*

3. "Devil's advocate: Every indicator is just a mathematical transformation of
   price and volume. Since they're all derived from the same underlying data,
   can they ever provide truly independent signals?"
   *(Interesting philosophical point — they can't be completely independent.
   But different transformations can emphasize different aspects: momentum vs.
   volatility vs. trend. The combination can be more predictive than any one alone.)*

---

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 minutes

**Wednesday workshop:**
"We build the feature matrix. Starter notebook: `W06_workshop_features_starter.ipynb`.
We'll add all 10 indicators to a DataFrame and encode candlestick patterns.
By the end, you'll have a production-ready feature matrix for 3 tickers."

**Pre-reading:**
- Wiki Section 7.1 — Backtesting best practices (read before next week)
- Wiki Section 7.2 — Backtesting tools comparison
- Wiki Section 4.3 — Code Pattern 3 (Backtrader)

**Milestone 2 notice:** Two weeks from now.
Students should be deciding what signal or hypothesis they want to backtest.
By Friday this week, every student should have their Milestone 2 strategy hypothesis written.

---

## Wednesday, May 20, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Observation Assignment:**
"Pull up SPY on TradingView. Add: RSI(14), MACD(12,26,9), Bollinger Bands(20,2),
and volume bars. Look at the last two weeks of price action.
Find one moment where at least 3 of these indicators gave a signal simultaneously.
Write down the date and what happened. Bring it tonight."

---

### Wednesday, May 20, 2026 — Workshop Session
**Time:** 8:00–9:30 PM EST
**Topic:** Building a Complete Feature Matrix with pandas-ta
**Curriculum source:** Wiki Sections 5.1, 5.2, Code Pattern 2
**Notebook:** `W06_workshop_features_[initials].ipynb`

---

#### Block 1 — Framing & Context Bridge (8:00–8:10 PM) | 10 minutes

"Monday we understood what each indicator measures.
Tonight we build the feature matrix — the structured table that a machine learning model
or a rules-based strategy will consume.

Think of the feature matrix as the translated version of raw price data.
Each row is a trading day. Each column is a quantified signal.
When we're done tonight, we'll have a DataFrame with 20+ features per day
for 3 tickers — and it will be reusable for any ticker, any time period.

This is the engineering work that sits between data and strategy."

---

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 minutes

```python
import yfinance as yf
import pandas as pd
import numpy as np
import pandas_ta as ta
import matplotlib.pyplot as plt

def build_feature_matrix(ticker, period="3y", interval="1d"):
    """
    Build a complete feature matrix for a given ticker.
    Returns a DataFrame with price data + all engineered features.
    """
    # --- DATA ACQUISITION ---
    df = yf.download(ticker, period=period, interval=interval)
    df.columns = [c[0] if isinstance(c, tuple) else c for c in df.columns]
    df.dropna(inplace=True)
    print(f"Fetched {len(df)} rows for {ticker}")

    # --- RETURNS ---
    df['Return']       = df['Close'].pct_change()
    df['Return_5d']    = df['Close'].pct_change(5)
    df['Return_20d']   = df['Close'].pct_change(20)
    df['Log_Return']   = np.log(df['Close'] / df['Close'].shift(1))

    # --- TREND FEATURES ---
    df['EMA_9']        = ta.ema(df['Close'], length=9)
    df['EMA_20']       = ta.ema(df['Close'], length=20)
    df['EMA_50']       = ta.ema(df['Close'], length=50)
    df['SMA_200']      = ta.sma(df['Close'], length=200)

    # Price relative to moving averages (normalized)
    df['Close_vs_EMA20']  = (df['Close'] - df['EMA_20']) / df['EMA_20']
    df['Close_vs_SMA200'] = (df['Close'] - df['SMA_200']) / df['SMA_200']
    df['EMA20_vs_EMA50']  = (df['EMA_20'] - df['EMA_50']) / df['EMA_50']

    # --- MOMENTUM FEATURES ---
    df['RSI_14']       = ta.rsi(df['Close'], length=14)
    df['RSI_7']        = ta.rsi(df['Close'], length=7)

    macd_df = ta.macd(df['Close'], fast=12, slow=26, signal=9)
    df['MACD']         = macd_df['MACD_12_26_9']
    df['MACD_Signal']  = macd_df['MACDs_12_26_9']
    df['MACD_Hist']    = macd_df['MACDh_12_26_9']
    df['MACD_Cross']   = (df['MACD'] > df['MACD_Signal']).astype(int)

    stoch_df = ta.stoch(df['High'], df['Low'], df['Close'])
    df['Stoch_K']      = stoch_df['STOCHk_14_3_3']
    df['Stoch_D']      = stoch_df['STOCHd_14_3_3']

    # --- VOLATILITY FEATURES ---
    df['ATR_14']       = ta.atr(df['High'], df['Low'], df['Close'], length=14)
    df['ATR_Norm']     = df['ATR_14'] / df['Close']  # Normalized ATR

    bb_df = ta.bbands(df['Close'], length=20, std=2)
    df['BB_Upper']     = bb_df['BBU_20_2.0']
    df['BB_Lower']     = bb_df['BBL_20_2.0']
    df['BB_Pct']       = bb_df['BBP_20_2.0']   # %B: 0=lower band, 1=upper band
    df['BB_Width']     = (df['BB_Upper'] - df['BB_Lower']) / df['Close']

    df['Vol_20d']      = df['Return'].rolling(20).std() * np.sqrt(252)
    df['HL_Range_Pct'] = (df['High'] - df['Low']) / df['Close']

    # --- VOLUME FEATURES ---
    df['OBV']          = ta.obv(df['Close'], df['Volume'])
    df['OBV_Change']   = df['OBV'].pct_change(5)
    df['Vol_Ratio']    = df['Volume'] / df['Volume'].rolling(20).mean()

    # ADX (trend strength)
    adx_df = ta.adx(df['High'], df['Low'], df['Close'], length=14)
    df['ADX']          = adx_df['ADX_14']

    # --- CANDLESTICK PATTERN FEATURES ---
    cdl = ta.cdl_pattern(df['Open'], df['High'], df['Low'], df['Close'],
                          name=['doji', 'hammer', 'engulfing', 'morningstar'])
    df = pd.concat([df, cdl], axis=1)

    # --- LABEL (for ML — forward 5-day return positive?) ---
    df['Label']        = (df['Close'].pct_change(5).shift(-5) > 0).astype(int)

    df.dropna(inplace=True)
    print(f"Feature matrix shape: {df.shape}")
    print(f"Features: {[c for c in df.columns if c not in ['Open','High','Low','Close','Volume']]}")
    return df
```
*Pause: "Note what we're doing with the label: shift(-5) gives us the future 5-day return.
This is only for research purposes — computing what will happen after the signal.
In a live model, the label is never available. We train on past data, predict on new data."*

```python
# Build feature matrices for 3 tickers
tickers = ['SPY', 'QQQ', 'AAPL']
feature_matrices = {}

for t in tickers:
    feature_matrices[t] = build_feature_matrix(t, period="3y")
    print(f"\n{t}: {feature_matrices[t].shape[0]} rows, "
          f"{feature_matrices[t].shape[1]} features\n{'─'*40}")

# Inspect the SPY feature matrix
spy_fm = feature_matrices['SPY']
print("\nFeature matrix sample (last 5 rows, key columns):")
key_cols = ['Close', 'RSI_14', 'MACD_Hist', 'ATR_Norm', 'BB_Pct', 'Vol_Ratio', 'ADX', 'Label']
print(spy_fm[key_cols].tail())
```

**Step 2 — Feature correlation analysis (8 min)**
```python
# Check for multicollinearity — are features redundant?
feature_cols = ['RSI_14', 'RSI_7', 'MACD_Hist', 'MACD_Cross',
                'BB_Pct', 'ATR_Norm', 'Vol_Ratio', 'ADX',
                'Close_vs_EMA20', 'EMA20_vs_EMA50']

corr_matrix = spy_fm[feature_cols].corr()

plt.figure(figsize=(10, 8))
import matplotlib.colors as mcolors
im = plt.imshow(corr_matrix, cmap='RdYlGn', vmin=-1, vmax=1, aspect='auto')
plt.colorbar(im)
plt.xticks(range(len(feature_cols)), feature_cols, rotation=45, ha='right')
plt.yticks(range(len(feature_cols)), feature_cols)
plt.title('Feature Correlation Matrix — SPY', fontsize=13)
plt.tight_layout()
plt.show()

# Flag highly correlated feature pairs
print("\nHighly correlated feature pairs (|r| > 0.7):")
for i in range(len(feature_cols)):
    for j in range(i+1, len(feature_cols)):
        r = corr_matrix.iloc[i, j]
        if abs(r) > 0.7:
            print(f"  {feature_cols[i]} & {feature_cols[j]}: r = {r:.3f}")
```

---

#### Block 3 — Independent / Pair Work (8:50–9:15 PM) | 25 minutes

**Core Exercise:**
Run `build_feature_matrix()` on 2 tickers of your choice (not SPY/QQQ/AAPL).
Then answer in markdown:
1. How many NaN rows were dropped? Why do they appear?
2. Which feature pair has the highest correlation in your tickers?
3. Look at the `Label` column distribution — what % of days are labeled 1 (positive)?
4. Find one week in your data where RSI < 30 AND BB_Pct < 0.1 simultaneously.
   What was the actual 5-day forward return that week?

**Extension Challenge:**
Add 3 more features of your own design to `build_feature_matrix()`:
1. A momentum feature: the 10-day minus 30-day return spread
2. A gap feature: (Open - prior Close) / prior Close
3. A volume trend: OBV vs. 20-day OBV moving average

Check whether they are correlated with existing features.

---

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 minutes

**Share-out:** Walk through the correlation matrix results.
"Which indicators are nearly redundant? What does that tell us about using them together?"

**Muddiest Point:**
> *"The muddiest point from tonight was ___."*

**Milestone 2 reminder:**
"By Friday this week, every student must have their Milestone 2 hypothesis written
and submitted to the hypothesis log. The hypothesis is the strategy you will backtest."

**Notebook submission:** `W06_workshop_features_[initials].ipynb` to GitHub.

---

## Friday, May 22, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Note to instructor:** This is the last regular Friday before Memorial Day weekend.
Distribute the Week 7 Monday Async Package at the end of today's DMB.
"Monday May 25 is Memorial Day. The Monday evening class is cancelled.
Your async package for Monday is in the GitHub repo. Complete it by Tuesday.
Wednesday class runs as normal. Thanksgiving, not the end of the world."

---

### Friday, May 22, 2026 — Review & Market Session
**Time:** 8:00–9:30 PM EST
**Topic:** Week 6 Review + Indicator Behavior on This Week's Charts + Milestone 2 Strategy Lock

---

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 minutes

1. "What is the difference between using RSI as a chart-reading tool versus
   using it as a feature in a quantitative model? What changes about how you interpret it?"

2. "What is ATR measuring? Give me a concrete example of how you'd use it for position sizing."

3. "In Wednesday's notebook, we computed a feature correlation matrix.
   RSI_14 and RSI_7 were highly correlated. What are the implications of
   using both as features in the same model?"

4. "What does BB_Pct = 0 mean? What does BB_Pct = 1 mean?
   Which would typically signal a mean-reversion buy opportunity?"

5. "What is ADX telling you that RSI and MACD cannot tell you?"

---

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 minutes

**Hypothesis Audit:** Close Week 6 hypotheses.

**Chart Review — Indicators on Live Charts:**
Open TradingView. Add RSI, MACD, Bollinger Bands, and volume to SPY.
Walk through this week's price action:
- "Was RSI overbought or oversold at any point this week?"
- "Did MACD cross during the week? Was it a meaningful move or noise?"
- "Did price touch a Bollinger Band? What happened after?"
- "Were there any high-volume days? What caused them?"

Pull up one student's watchlist ticker:
"If you had our full feature matrix running on this ticker this week,
what signals would it have flagged? Let's read the indicator states together."

**Sector Rotation:** Standard checklist.

---

#### Block 3 — Milestone 2 Strategy Lock (9:05–9:20 PM) | 15 minutes

**Every student must submit their Milestone 2 hypothesis tonight.**

"Your Milestone 2 strategy hypothesis must answer:
1. What is the edge I am trying to capture? (Momentum? Mean reversion? Sentiment?)
2. What specific signal(s) will trigger entry?
3. What is the exit rule?
4. What universe of stocks and what time period?

Format it using the hypothesis log template. Submit before midnight tonight."

Walk through 2–3 student examples to calibrate:
- Too vague: "I'll buy when RSI is low" → Not acceptable
- Specific enough: "Buy SPY when RSI_14 < 30 AND Close > EMA_20 on daily close,
  hold for 5 days, exit at market on day 5" → Acceptable

---

#### Block 4 — Next Week Preview & Close (9:20–9:30 PM) | 10 minutes

**Memorial Day reminder:** Monday May 25 class cancelled. Async package distributed.

**Next week structure:**
- Monday: ASYNC — Backtrader theory and backtesting best practices
- Wednesday: First full Backtrader session — backtest a live strategy
- Friday: Review backtest results against this week's actual market behavior

**Assign reading (for async AND for Wednesday prep):**
- Wiki Section 7.1 — Backtesting best practices (all 7 rules)
- Wiki Section 7.2 — Tools comparison
- Wiki Section 4.3 — Code Pattern 3 (Backtrader template)

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

---

# WEEK 7 — Backtesting & Strategy Logic
**Theme:** Testing your edge against history. Rigorously. Without lying to yourself.

---

## Monday, May 25, 2026 — ⚠️ MEMORIAL DAY — CLASS CANCELLED
### ASYNC FALLBACK PACKAGE — Week 7 Monday
**Original Session Date:** Monday, May 25, 2026
**Topic:** Backtesting Methodology & Best Practices
**Estimated Completion Time:** 90 minutes
**Due:** Monday May 25, 11:59 PM

---

#### Context
Tonight's session would have covered the most important methodological topic in quantitative
trading: how to run an honest backtest. A backtest that looks great on historical data
and fails live is not a strategy — it's a well-fitted memory. Tonight's async package
covers everything you need to know before Wednesday's live Backtrader session.

#### Required Reading
- Wiki Section 7.1 — Backtesting best practices (all 7 rules — read twice)
- Wiki Section 7.2 — Backtesting tools comparison
- Wiki Section 4.3 — Code Pattern 3 (Backtrader SMA crossover template)
- External resource: [QuantStart — "Basics of Statistical Mean Reversion Testing"](https://www.quantstart.com/articles/Basics-of-Statistical-Mean-Reversion-Testing/) (free article)

#### Guided Notes — Answer These in Writing

Use Cornell format. Answer each question thoughtfully.

1. "What is look-ahead bias? Give me an example in code — specifically, what line
   of Python would introduce look-ahead bias into a feature matrix?"

2. "What is walk-forward testing? Draw a diagram (on paper or in markdown) showing
   the train/test window progression over 3 years of data."

3. "We backtested the RSI strategy in Week 5 with statistics. How is running
   the same strategy through Backtrader different from the statistical test we ran?
   What does Backtrader add that the t-test doesn't capture?"

4. "Name the 3 most dangerous backtesting pitfalls. For each: what is it,
   how does it inflate results, and how do you protect against it?"

5. "You run a backtest and get a Sharpe of 2.1 with a max drawdown of −8%.
   The strategy has 15 free parameters you tuned on the same data.
   Should you trust this result? Why or why not?"

#### Self-Study Exercise
Read through Code Pattern 3 (Backtrader SMA crossover) from the curriculum wiki.
Without running it, trace through the logic manually:
- What does `__init__` set up?
- What does `next()` do on each bar?
- What is `cerebro`?
- What would happen if `sma_fast` period equaled `sma_slow` period?

Write your answers in a markdown file: `W07_async_monday_[initials].md`

#### Submission
- [ ] Cornell notes pushed to GitHub: `W07_async_monday_notes_[initials].md`
- [ ] Self-study exercise file: `W07_async_monday_[initials].md`

#### Questions?
Post in the course communication channel. Tag the instructor.
All async questions answered within 24 hours.

---

## Wednesday, May 27, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Observation Assignment:**
"Before tonight's class, review your Milestone 2 strategy hypothesis.
Find a period in the last 6 months of chart history where your strategy's entry
signal would have triggered. Write down: the date, the signal reading,
and what the stock did over the following 5 days. Bring it as a manual backtest data point."

---

### Wednesday, May 27, 2026 — Workshop Session
**Time:** 8:00–9:30 PM EST
**Topic:** First Full Backtrader Backtest — From Feature Matrix to Strategy
**Curriculum source:** Wiki Sections 7.1, 7.2, Code Pattern 3
**Notebook:** `W07_workshop_backtest_[initials].ipynb`

---

#### Block 1 — Framing & Context Bridge (8:00–8:10 PM) | 10 minutes

"Monday was async — you read about backtesting. Tonight we run one.

We're going to build a complete Backtrader strategy using the RSI signal
we statistically tested in Week 5. We'll apply the 7 best practices rules
from the async reading to make sure the backtest is honest.

At the end of tonight you'll have a real equity curve, a Sharpe ratio,
a max drawdown, and a benchmark comparison — all from code you wrote.
You'll also see exactly how easy it is to accidentally build a backtest that lies."

> **Resource:** FINN 9-Step Quant Workflow — `resources/infographics/ig_quant_workflow.html` — tonight covers Steps 5 (Backtest) and 6 (Risk/Position Sizing).

---

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 minutes

```python
import backtrader as bt
import yfinance as yf
import pandas as pd
import quantstats as qs
import warnings
warnings.filterwarnings('ignore')
```

**Step 1 — Load data into Backtrader format (5 min)**
```python
def get_bt_data(ticker, start='2021-01-01', end='2024-12-31'):
    """Fetch data and convert to Backtrader PandasData format."""
    raw = yf.download(ticker, start=start, end=end, auto_adjust=True)
    raw.columns = [c[0] if isinstance(c, tuple) else c for c in raw.columns]
    raw.index = pd.to_datetime(raw.index)

    data = bt.feeds.PandasData(
        dataname=raw,
        open='Open', high='High', low='Low',
        close='Close', volume='Volume', openinterest=-1
    )
    return data, raw

spy_data, spy_raw = get_bt_data('SPY', '2021-01-01', '2024-12-31')
print("Data loaded successfully for SPY: 2021–2024")
```

**Step 2 — Build the RSI Mean Reversion Strategy (15 min)**
```python
class RSIMeanReversionStrategy(bt.Strategy):
    """
    RSI Mean Reversion Strategy
    Entry: Close below EMA_20 AND RSI < threshold (oversold)
    Exit: RSI recovers above exit threshold OR after max_hold days
    """
    params = dict(
        rsi_period=14,
        rsi_entry=30,       # Buy when RSI drops below this
        rsi_exit=60,        # Sell when RSI recovers to this
        ema_period=20,      # Only buy when price is near/below EMA
        max_hold=10,        # Max holding period in days
        risk_pct=0.02,      # Risk 2% of portfolio per trade
        printlog=True
    )

    def __init__(self):
        # Indicators — these are computed on every bar automatically
        self.rsi       = bt.indicators.RSI(self.data.close,
                                            period=self.params.rsi_period)
        self.ema       = bt.indicators.EMA(self.data.close,
                                            period=self.params.ema_period)
        self.atr       = bt.indicators.ATR(self.data, period=14)

        # Trade tracking
        self.order      = None
        self.bar_in_trade = 0

    def log(self, txt, dt=None):
        if self.params.printlog:
            dt = dt or self.datas[0].datetime.date(0)
            print(f'{dt.isoformat()} | {txt}')

    def notify_order(self, order):
        if order.status in [order.Submitted, order.Accepted]:
            return
        if order.status == order.Completed:
            if order.isbuy():
                self.log(f'BUY  @ ${order.executed.price:.2f} | '
                         f'Size: {order.executed.size} | '
                         f'Value: ${order.executed.value:.2f}')
            elif order.issell():
                self.log(f'SELL @ ${order.executed.price:.2f} | '
                         f'PnL: ${order.executed.pnl:.2f}')
        self.order = None

    def next(self):
        # Skip if order is pending
        if self.order:
            return

        if not self.position:
            # ENTRY CONDITIONS
            rsi_oversold    = self.rsi[0] < self.params.rsi_entry
            price_near_ema  = self.data.close[0] <= self.ema[0] * 1.02

            if rsi_oversold and price_near_ema:
                # ATR-based position sizing: risk 2% of portfolio
                atr_stop   = self.atr[0] * 1.5
                risk_amt   = self.broker.getvalue() * self.params.risk_pct
                size       = int(risk_amt / atr_stop)
                size       = max(1, size)

                self.order = self.buy(size=size)
                self.bar_in_trade = 0

        else:
            self.bar_in_trade += 1

            # EXIT CONDITIONS
            rsi_recovered    = self.rsi[0] > self.params.rsi_exit
            max_hold_reached = self.bar_in_trade >= self.params.max_hold

            if rsi_recovered or max_hold_reached:
                exit_reason = "RSI recovered" if rsi_recovered else "Max hold reached"
                self.log(f'EXIT signal: {exit_reason}')
                self.order = self.close()
                self.bar_in_trade = 0
```
*Deliberate pause: "Look at the entry condition — `self.data.close[0]`.
The `[0]` means the CURRENT bar. `[-1]` means one bar ago. `[-2]` means two bars ago.
This is Backtrader's way of accessing the time series. If you accidentally use `[1]`
(positive index), you'd get the NEXT bar — look-ahead bias. Always `[0]` or negative."*

**Step 3 — Configure and run (10 min)**
```python
def run_backtest(strategy_class, data, starting_cash=10000,
                 commission=0.001, strategy_params={}):
    """Run a complete backtest with realistic settings."""
    cerebro = bt.Cerebro()

    # Add strategy
    cerebro.addstrategy(strategy_class, **strategy_params)

    # Add data
    cerebro.adddata(data)

    # Broker settings
    cerebro.broker.setcash(starting_cash)
    cerebro.broker.setcommission(commission=commission)  # 0.1% per trade
    cerebro.broker.set_slippage_perc(0.001)              # 0.1% slippage

    # Add analyzers
    cerebro.addanalyzer(bt.analyzers.SharpeRatio,
                        _name='sharpe', riskfreerate=0.05/252)
    cerebro.addanalyzer(bt.analyzers.DrawDown, _name='drawdown')
    cerebro.addanalyzer(bt.analyzers.TradeAnalyzer, _name='trades')
    cerebro.addanalyzer(bt.analyzers.Returns, _name='returns')
    cerebro.addanalyzer(bt.analyzers.PyFolio, _name='pyfolio')

    print(f'Starting Portfolio Value: ${cerebro.broker.getvalue():,.2f}')
    results = cerebro.run()
    strat = results[0]

    final_value = cerebro.broker.getvalue()
    print(f'Final Portfolio Value:    ${final_value:,.2f}')
    print(f'Total Return:             {(final_value/starting_cash - 1):.2%}')

    # Extract metrics
    sharpe = strat.analyzers.sharpe.get_analysis()
    dd     = strat.analyzers.drawdown.get_analysis()
    trades = strat.analyzers.trades.get_analysis()

    print(f"\n{'='*40}")
    print(f"BACKTEST RESULTS")
    print(f"{'='*40}")
    print(f"Sharpe Ratio:   {sharpe.get('sharperatio', 'N/A')}")
    if hasattr(dd, 'max'):
        print(f"Max Drawdown:   {dd.max.drawdown:.2f}%")
    if trades.get('total', {}).get('total'):
        total = trades['total']['total']
        won   = trades.get('won', {}).get('total', 0)
        print(f"Total Trades:   {total}")
        print(f"Win Rate:       {won/total:.1%}" if total > 0 else "Win Rate: N/A")

    return cerebro, results, strat

# Run the backtest
spy_data_fresh, spy_raw = get_bt_data('SPY', '2021-01-01', '2024-12-31')
cerebro, results, strat = run_backtest(
    RSIMeanReversionStrategy,
    spy_data_fresh,
    starting_cash=10000,
    strategy_params={'printlog': False}
)
```

**Step 4 — Compare to benchmark with QuantStats (10 min)**
```python
# Extract portfolio returns via PyFolio analyzer
portfolio_stats = strat.analyzers.pyfolio.get_analysis()
pf_returns = pd.Series(portfolio_stats['returns'])
pf_returns.index = pd.to_datetime(pf_returns.index)

# SPY benchmark returns
benchmark = spy_raw['Close'].pct_change().dropna()
benchmark.index = pd.to_datetime(benchmark.index)

# Align dates
common_dates = pf_returns.index.intersection(benchmark.index)
pf_aligned   = pf_returns[common_dates]
bm_aligned   = benchmark[common_dates]

# Quick comparison
print(f"\nSTRATEGY vs BENCHMARK")
print(f"{'─'*40}")
print(f"Strategy Annual Return: {qs.stats.cagr(pf_aligned):.2%}")
print(f"Benchmark Annual Return:{qs.stats.cagr(bm_aligned):.2%}")
print(f"Strategy Sharpe:        {qs.stats.sharpe(pf_aligned):.3f}")
print(f"Benchmark Sharpe:       {qs.stats.sharpe(bm_aligned):.3f}")
print(f"Strategy Max Drawdown:  {qs.stats.max_drawdown(pf_aligned):.2%}")
print(f"Benchmark Max Drawdown: {qs.stats.max_drawdown(bm_aligned):.2%}")

# Generate HTML tear sheet
qs.reports.html(pf_aligned, benchmark=bm_aligned, output='spy_rsi_tearsheet.html',
                title='RSI Mean Reversion — SPY Backtest')
print("\nTear sheet saved: spy_rsi_tearsheet.html")
```

---

#### Block 3 — Independent / Pair Work (8:50–9:15 PM) | 25 minutes

**Core Exercise:**
Modify `RSIMeanReversionStrategy` to test your own Milestone 2 strategy hypothesis.
Change at minimum:
- The ticker (use your own chosen asset)
- The entry and/or exit conditions (apply your own signal logic)
- The parameter values (different RSI thresholds or holding period)

Run it and record: Sharpe, max drawdown, win rate, total trades, total return vs. benchmark.

**Extension Challenge:**
Run the same strategy with 3 different RSI entry thresholds: 25, 30, 35.
Create a comparison table of results. Which threshold performs best?
Does optimizing for the best threshold create an overfitting risk? Explain.

---

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 minutes

**Share-out:** 2 students share their backtest results — especially if they underperformed
the benchmark. "Underperforming the benchmark is not failure. It is information.
Your job at Milestone 2 is to honestly interpret what the backtest found — not to
present a winning strategy. A well-analyzed losing backtest is worth more than a
poorly-analyzed winning one."

**Muddiest Point:**
> *"The muddiest point from tonight was ___."*

**Notebook submission:** `W07_workshop_backtest_[initials].ipynb` to GitHub.

---

## Friday, May 29, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

---

### Friday, May 29, 2026 — Review & Market Session
**Time:** 8:00–9:30 PM EST
**Topic:** Week 7 Review + Backtest vs. Live Market Reality + Milestone 2 Strategy Check

---

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 minutes

1. "Explain look-ahead bias. Show me — in code — specifically where it would
   appear if someone accidentally introduced it into the Backtrader strategy."

2. "We used `cerebro.broker.setcommission(0.001)` and slippage in the backtest.
   Why? What happens to a strategy's results if you run a backtest without
   modeling these costs?"

3. "Your backtest Sharpe was 0.9 over 4 years. Is that a promising result?
   How would you determine whether it's real alpha or data-fitted noise?"

4. "What is the difference between in-sample and out-of-sample performance?
   Why does an in-sample Sharpe of 1.8 mean almost nothing by itself?"

5. "Draw the walk-forward testing diagram on paper right now. Explain it out loud."

---

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 minutes

**Hypothesis Audit:** Close all Week 7 hypotheses.

**Backtest vs. Live Reality:**
"This week we ran backtests. This week the market also ran live.
Let's compare. What did our RSI strategy signal this week on SPY?
Pull up the TradingView RSI panel — was RSI below 30 at any point this week?
If so, would our strategy have entered? What happened after?

This is the most important exercise we do this month:
the backtest says the strategy works over 4 years.
This week is one data point of live performance. How do they align?"

Walk through SPY chart with RSI and MACD overlaid.
Compare to backtest entry/exit rules explicitly.

---

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 minutes

Standard checklist. Note any unusual options activity going into the final week
before Milestone 2. "Options expiration next week falls right in Milestone 2 week.
Watch for volatility around the presentations."

---

#### Block 4 — Milestone 2 Final Prep & Close (9:20–9:30 PM) | 10 minutes

"Milestone 2 presentations are next Friday, June 5 or Saturday June 6 if needed.
Wednesday is your last workshop session before it — use it well.

By end of this weekend, you should have:
- Your backtest running and producing results
- Your performance metrics calculated and charted
- A draft of your 6-section presentation structure (from Wiki Section 7.3)

We will not be teaching new material Monday. Monday is refinement and strategy polish."

**Assign reading for Monday:**
- Wiki Section 6.1 — AI/LLM in trading (full)
- Wiki Section 6.2 — Sentiment analysis pipeline and FinBERT

**Note:** Monday introduces AI/LLM integration as a conceptual layer.
Students who want to incorporate sentiment into their Milestone 2 presentation
may do so as an optional extension. It is not required for Milestone 2 pass criteria.

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

---

# WEEK 8 — AI Integration, Strategy Refinement & Milestone 2
**Theme:** Adding AI to the toolkit. Presenting your first complete quantitative strategy.

---

## Monday, June 1, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Find one financial news headline today.
Rate it yourself: Bullish, Bearish, Neutral and confidence 0–100.
Then go to huggingface.co, search for 'ProsusAI/finbert', and read the model card.
Bring the headline and your rating tonight. We'll run it through FinBERT."

---

### Monday, June 1, 2026 — Theory Session
**Time:** 8:00–9:30 PM EST
**Topic:** AI & LLM Integration in Trading — Sentiment as a Signal
**Curriculum source:** Wiki Sections 6.1, 6.2

#### Pre-Session Requirements
- [ ] Wiki Section 6.1 read — full AI/LLM overview
- [ ] Wiki Section 6.2 read — sentiment pipeline, FinBERT, LangChain template
- [ ] Milestone 2 backtest running with results
- [ ] News headline from DMB logged with personal sentiment rating

---

#### Block 1 — Day Review & Reading Check (8:00–8:15 PM) | 15 minutes

"Who has a headline? Read it. What did you rate it? Bullish, Bearish, Neutral?
What confidence? Now — 5 other people in this room might rate it differently.
That inconsistency is exactly the problem AI sentiment models solve.
They produce a consistent, reproducible, quantifiable score every time.

Tonight we understand the theory. Wednesday we build the pipeline."

Cold-call reading check:
- "What is FinBERT? Why was it trained specifically on financial data?"
- "What is the difference between VADER and FinBERT for sentiment analysis?"
- "Name 3 types of unstructured financial data that LLMs can process into signals."

---

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 minutes

**Topic A: Why AI Expands the Signal Universe (10 min)**

"Traditional quant signals come from price and volume. They are derived from
the same underlying data. Every quant in the world has access to the same prices.

AI expands the signal universe to unstructured data — text that carries meaning
that price alone doesn't capture until hours or days later:
- A Fed speech that hints at rate changes before the market reprices
- An earnings call where the CEO's language is unusually hedged
- A 10-K filing where the risk factors section doubled in length
- A Reddit thread where retail sentiment is building on an unknown small-cap

These signals are available in real time but require AI to extract them.
That's the structural edge that modern quant shops pursue."

**Topic B: The NLP Toolkit for Finance (15 min)**

Walk through Wiki Section 6.2 tool options table.

- **VADER:** "Rule-based, fast, good for social media. Doesn't understand financial context.
  'The company's debt is not bearish' — VADER might flag 'bearish' as negative.
  FinBERT understands the full sentence in financial context."

> **Resource:** Non-AI sentiment indicators — `resources/infographics/ig_sentiment_indicators.html` | Market reference handbook — `resources/handbook/FINN_HB_P6_MarketReference.md §6.4`

- **FinBERT:** "BERT architecture pre-trained on financial text — Reuters, SEC filings,
  earnings transcripts. Fine-tuned for three-class sentiment: Positive, Negative, Neutral.
  Outperforms VADER on financial text by a significant margin."

- **LLMs (GPT-4o-mini, Claude):** "For complex analysis — summarizing an earnings call,
  extracting structured data from an SEC filing, answering specific questions about
  company fundamentals. More powerful than FinBERT but slower and costs API tokens."

- **LangChain pipeline:** Walk through Wiki Section 6.2 LangChain template conceptually.
  "We define a prompt template, pass it a headline, get back a structured sentiment label
  and confidence score. This becomes a column in our feature matrix."

**Topic C: Sentiment as a Feature — The Integration (15 min)**

"Sentiment is not a standalone strategy. It is a feature.
You add it to the feature matrix alongside RSI, MACD, and ATR.
The combined model may outperform any single signal alone.

The research pipeline for sentiment:
1. Fetch headlines for your ticker using NewsAPI or Alpaca News
2. Run each headline through FinBERT — get Positive/Negative/Neutral + confidence
3. Aggregate daily sentiment: average score, % positive headlines, etc.
4. Align with OHLCV data by date
5. Test IC of sentiment feature vs. forward returns
6. Add to feature matrix and backtest"

Walk through Wiki Section 6.3 ML framework conceptually — emphasize time-series split.
"Never shuffle time-series data. NEVER. The past cannot leak into the future in training."

---

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 minutes

1. "If FinBERT is trained on historical financial text, what happens when the market
   starts using new terminology or jargon that FinBERT has never seen?
   How would you detect this degradation?"

2. "Devil's advocate: If every quant firm uses the same FinBERT model on the same
   public news, does the sentiment signal disappear the moment it's widely adopted?"
   *(Expected: Signal crowding is a real risk. The edge likely lies in speed of processing,
   quality of news sources beyond public headlines, or combining sentiment with proprietary signals.)*

3. "LLMs can hallucinate — produce confident-sounding wrong answers.
   In a trading context, what are the failure modes of an LLM-based signal?
   How do you build a system that catches hallucinations before they cause trades?"

---

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 minutes

**Wednesday workshop:**
"We build the FinBERT sentiment pipeline and integrate it into a feature matrix.
Starter notebook: `W08_workshop_sentiment_starter.ipynb`.
Have your HuggingFace account ready — model downloads automatically on first run.
Also: bring your Milestone 2 notebook. Last 15 minutes of Wednesday is strategy polish."

**Milestone 2 final reminder:**
"Presentations are Friday June 5. 15 minutes each + 5 minutes Q&A.
If class is large, overflow continues Saturday June 6 at the same time slot.
Slides are not required — a clean Jupyter notebook and clear explanation is sufficient."

---

## Wednesday, June 3, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Observation Assignment:**
"Find 5 financial headlines from today about any stock or index.
Write them down. Personally rate each as Bullish/Bearish/Neutral.
We'll compare your ratings to FinBERT's output tonight."

---

### Wednesday, June 3, 2026 — Workshop Session
**Time:** 8:00–9:30 PM EST
**Topic:** FinBERT Sentiment Pipeline + Milestone 2 Polish
**Curriculum source:** Wiki Section 6.2, 6.3
**Notebook:** `W08_workshop_sentiment_[initials].ipynb`

---

#### Block 1 — Framing & Context Bridge (8:00–8:10 PM) | 10 minutes

"Tonight has two parts.

Part 1 (first 60 min): We build the sentiment pipeline.
You'll run your 5 headlines through FinBERT and compare the model's output
to your own ratings. Then we'll discuss what it means when they disagree.

Part 2 (last 20 min): Strategy polish for Milestone 2.
Each of you works on your own presentation notebook while I circulate.
This is the last workshop before Friday."

---

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 minutes

**Part 1A — FinBERT Sentiment Pipeline (25 min)**

```python
from transformers import pipeline, AutoTokenizer, AutoModelForSequenceClassification
import torch
import pandas as pd
import numpy as np
import warnings
warnings.filterwarnings('ignore')

print("Loading FinBERT model... (downloads ~440MB on first run)")
# ProsusAI/finbert: fine-tuned BERT for financial sentiment
# Labels: positive, negative, neutral
finbert = pipeline(
    "sentiment-analysis",
    model="ProsusAI/finbert",
    tokenizer="ProsusAI/finbert",
    device=0 if torch.cuda.is_available() else -1  # Use GPU if available
)
print("FinBERT loaded successfully.")
```

```python
def analyze_sentiment_batch(headlines, model=finbert):
    """
    Run a batch of headlines through FinBERT.
    Returns a DataFrame with label, score, and normalized score.
    """
    results = model(headlines, truncation=True, max_length=512)

    rows = []
    for headline, result in zip(headlines, results):
        label = result['label']   # 'positive', 'negative', 'neutral'
        score = result['score']   # Confidence 0–1

        # Convert to numeric: positive=+1, negative=−1, neutral=0
        # Weighted by confidence
        label_map = {'positive': 1, 'negative': -1, 'neutral': 0}
        numeric = label_map[label] * score

        rows.append({
            'headline': headline[:80] + '...' if len(headline) > 80 else headline,
            'label':    label,
            'score':    round(score, 4),
            'numeric':  round(numeric, 4)
        })

    return pd.DataFrame(rows)

# Your 5 headlines from the DMB observation
test_headlines = [
    "Federal Reserve signals potential rate cut amid cooling inflation data",
    "Tesla misses Q2 earnings estimates by wide margin, shares fall premarket",
    "Apple reports record iPhone sales, beats analyst expectations",
    "Oil prices fall on concerns over global demand slowdown",
    "Job market shows resilience with stronger than expected employment report"
]

results_df = analyze_sentiment_batch(test_headlines)
print(results_df.to_string(index=False))
print(f"\nMean sentiment score: {results_df['numeric'].mean():.4f}")
```

```python
# Compare FinBERT to your own ratings from the DMB
your_ratings = {
    # Fill in with actual DMB headlines and your personal ratings
    'headline_1': {'your_label': 'Bullish', 'your_confidence': 80},
    # ... etc
}

print("\nComparison: Your Rating vs. FinBERT")
print("─" * 60)
for i, row in results_df.iterrows():
    finbert_label = row['label'].upper()
    finbert_conf  = f"{row['score']:.0%}"
    print(f"Headline: {row['headline']}")
    print(f"  FinBERT: {finbert_label} ({finbert_conf})")
    print(f"  You:     [compare manually]")
    print()
```

**Part 1B — Build a Daily Sentiment Aggregator (15 min)**

```python
import yfinance as yf
from datetime import datetime, timedelta

def build_sentiment_feature(headlines_by_date, ticker):
    """
    Aggregate daily sentiment scores and merge with price data.

    headlines_by_date: dict of {date_str: [list of headlines]}
    Returns DataFrame with sentiment columns merged with OHLCV
    """
    # Process each date's headlines
    sentiment_records = []
    for date_str, headlines in headlines_by_date.items():
        if not headlines:
            continue

        batch_results = analyze_sentiment_batch(headlines)

        sentiment_records.append({
            'date':          pd.to_datetime(date_str),
            'sent_mean':     batch_results['numeric'].mean(),
            'sent_pct_pos':  (batch_results['label'] == 'positive').mean(),
            'sent_pct_neg':  (batch_results['label'] == 'negative').mean(),
            'sent_count':    len(batch_results),
            'sent_max':      batch_results['numeric'].max(),
            'sent_min':      batch_results['numeric'].min()
        })

    sent_df = pd.DataFrame(sentiment_records).set_index('date')

    # Merge with price data
    price_df = yf.download(ticker, period="6mo", interval="1d")
    price_df.columns = [c[0] if isinstance(c, tuple) else c for c in price_df.columns]
    price_df['Return'] = price_df['Close'].pct_change()
    price_df['Fwd_5d_Return'] = price_df['Close'].pct_change(5).shift(-5)

    merged = price_df.join(sent_df, how='left')
    merged['sent_mean'] = merged['sent_mean'].fillna(0)  # Missing = neutral

    return merged

# Example with synthetic data (replace with real NewsAPI data in Month 6)
example_headlines = {
    '2026-01-15': ['Fed holds rates steady, signals patience', 'Jobs data beats expectations'],
    '2026-01-16': ['Inflation ticks up slightly', 'Tech stocks under pressure'],
    '2026-01-20': ['Markets rally on strong earnings', 'Consumer confidence rebounds'],
}

print("Sentiment aggregation pipeline built.")
print("In live trading: replace example_headlines with NewsAPI or Alpaca News feed.")
print("Full live integration covered in Month 5.")
```

---

#### Block 3 — Milestone 2 Polish (8:50–9:10 PM) | 20 minutes

Students work on their own Milestone 2 notebooks.
Instructor circulates. Key questions to ask each student:

- "Show me your backtest equity curve. Does it look reasonable?"
- "What is your Sharpe? Your max drawdown? Have you compared to SPY?"
- "Can you explain your entry and exit logic in plain English in under 60 seconds?"
- "What is the biggest weakness in your backtest? Have you addressed it?"
- "What would you do differently with 2 more weeks?"

---

#### Block 4 — Share-Out & Muddiest Point (9:10–9:30 PM) | 20 minutes

**Share-out (15 min):**
Two students walk through their Milestone 2 strategy in the 6-section format:
Hypothesis → Data & Features → Strategy Logic → Results → What Could Go Wrong → What I'd Do Differently

Class asks one question each after each presentation.
Treat this as a dry run for Friday.

**Muddiest Point (5 min):**
> *"The muddiest point from tonight — and from Month 2 overall — was ___."*

**Notebook submission:** `W08_workshop_sentiment_[initials].ipynb` to GitHub.

---

## Friday, June 5, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation
**Note:** Keep this brief efficient. Today is Milestone 2. Students need mental energy.

---

### Friday, June 5, 2026 — Milestone 2: Strategy Presentations
**Time:** 8:00–9:30 PM EST
**Format:** 15-minute presentations + 5 minutes Q&A per student
**Overflow:** Saturday June 6 at 8:00 PM EST if class size requires

---

#### Presentation Order
Randomize presentation order. Post the order in the course channel by Wednesday.
Each presenter has exactly 20 minutes total — 15 presentation, 5 Q&A.
Strict timing. This is a professional standard.

---

#### Presentation Assessment Rubric

| Criterion | Weight | 4 — Exceeds | 3 — Meets | 2 — Developing | 1 — Incomplete |
|-----------|--------|-------------|-----------|----------------|----------------|
| Hypothesis Quality | 15% | Specific, testable, causally motivated | Specific and testable | Somewhat specific | Vague or missing |
| Technical Execution | 25% | Clean code, reproducible, well-commented | Correct and runs | Minor errors | Broken or absent |
| Backtest Rigor | 20% | Walk-forward, costs modeled, benchmark compared | Honest results, costs included | Results without benchmark | No cost modeling |
| Limitations Analysis | 15% | Identifies overfitting risk, regime sensitivity | Identifies 2+ weaknesses | Identifies 1 weakness | No limitations |
| Self-Assessment | 15% | Honest about failures, clear next steps | Balanced, specific | Somewhat reflective | Defensive |
| Communication | 10% | Clear, confident, jargon-appropriate | Clear and organized | Somewhat unclear | Difficult to follow |

---

#### Q&A Question Bank (Instructor selects 1–2 per presentation)

```
On hypothesis:
  "What would falsify this strategy? What would convince you it doesn't work?"
  "Why do you think this edge exists? What market inefficiency are you exploiting?"

On backtesting:
  "How many free parameters did you optimize? Does that create overfitting risk?"
  "What would the results look like if you excluded the best 10 trading days?"

On risk:
  "What is the maximum drawdown your strategy experienced? Could you hold through that?"
  "Is your strategy correlated with the market? What happens in a 2020-style crash?"

On AI/sentiment (if used):
  "Is the sentiment signal statistically significant? What's its IC?"
  "What happens to your strategy if the news API goes down?"

On future work:
  "If you had 3 more months to develop this — what's the first thing you'd change?"
  "Would you trust this strategy with real money at this point? Why or why not?"
```

---

#### After Presentations — Month 2 Close (remaining time)

**Month 2 retrospective (10 min):**
"Looking back at Week 5 — what was the hardest concept this month?
What did you learn about your own strategy that surprised you?
What does your backtest tell you about the signal you chose?"

**Month 3 preview (5 min):**
"Next month we stop building strategies and start running them — live, on Webull paper trading.
Everything from Months 1 and 2 goes into action. Real market. Real time. Virtual money.
The journals start. The weekly review becomes a performance review.
It gets real next Monday."

**Pre-reading for Month 3, Week 1:**
- Wiki Section 8.1 — Webull platform overview (full)
- Wiki Section 8.2 — Getting started steps
- Wiki Section 8.3 — Python integration
- Wiki Section 8.4 — Trading journal requirements (memorize the fields)

**Monthly One-Liner:**
> *"Month 2 taught me ___, and Month 3 I want to ___."*

---

---

## Month 2 — Instructor Summary Notes

### Content Coverage Checklist

- [ ] Wiki Section 3.2 — Full statistics: hypothesis testing, stationarity, IC (Week 5)
- [ ] Wiki Section 4.3 — Code Patterns 2, 3, 4: indicators, backtest, tear sheet (Weeks 6–7)
- [ ] Wiki Section 5.1 — Technical indicators as features (Week 6)
- [ ] Wiki Section 5.2 — Candlestick pattern encoding (Week 6)
- [ ] Wiki Section 6.1 — AI/LLM in trading overview (Week 8)
- [ ] Wiki Section 6.2 — Sentiment pipeline, FinBERT, LangChain (Week 8)
- [ ] Wiki Section 7.1 — Backtesting best practices (Week 7 async + Wednesday)
- [ ] Wiki Section 7.2 — Backtesting tools (Week 7)
- [ ] Wiki Section 7.3 — Strategy templates: SMA crossover and RSI mean reversion completed

### Workshops Delivered

| Workshop | Notebook | Key Skills |
|---------|---------|-----------|
| W05 | `W05_workshop_statistics` | ADF test, t-test, IC, rolling IC — hypothesis validation |
| W06 | `W06_workshop_features` | Full feature matrix with pandas-ta, correlation analysis |
| W07 | `W07_workshop_backtest` | Backtrader strategy, analyzers, QuantStats tear sheet |
| W08 | `W08_workshop_sentiment` | FinBERT pipeline, sentiment aggregator, Milestone 2 polish |

### Memorial Day Async Package
Pre-built: `W07_async_monday_package` distributed Friday May 22.
Completion status should be verified before Wednesday May 27 workshop.

### Milestone 2 Results

Document each student's presentation outcome:
```
Student: [Name]
Date: June 5–6, 2026
Strategy: [Name/description]
Sharpe (backtest): ___
Max Drawdown: ___
Benchmark comparison: Beat / Under / Neutral
Strongest section: ___
Key weakness identified: ___
Recommendation for Month 3: ___
Notes: ___
```

### Notes for Month 3 Setup

Before Month 3 begins:
- [ ] All students have Webull paper trading accounts verified and working
- [ ] Webull Python SDK installed: `pip install webull`
- [ ] Each student has identified their Month 3 paper trading strategy
  (may be their Milestone 2 strategy, modified, or a new approach)
- [ ] Trading journal template distributed — review with students before first paper trade
- [ ] Hypothesis log Month 3 section opened

---

*FINN — Month 02 Lesson Plan*
*Quant Methods, AI Integration & Strategy Development*
*Dates: May 11 – June 6, 2026*
*Next: FINN_Month03.md — Paper Trading Phase I: Live Strategy Deployment*
