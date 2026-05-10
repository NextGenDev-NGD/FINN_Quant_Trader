# FINN — Week 5: Statistics for Quants
## Quant Methods Phase | Month 2: Quant Methods, AI Integration & Strategy Development
**Dates:** May 11–16, 2026
**Week Number:** 5 of 24

---

## WEEK OVERVIEW

### Theme
Moving from description to inference. Testing whether signals are real or noise. Students arrive having passed Milestone 1 — they understand markets and can build metrics. Now they learn to test whether a signal actually predicts anything. This week is the pivot from "measuring the past" to "testing hypotheses about the future."

### Learning Objectives
By the end of this week, students will be able to:
- Define null hypothesis and alternative hypothesis in market terms and construct a valid t-test
- Explain p-values in plain English and state the 5% significance threshold with appropriate caveats
- Describe the multiple testing problem and explain why testing 100 signals produces false positives
- Explain stationarity and run an ADF test — interpret the result correctly
- Explain autocorrelation and its relationship to momentum and mean-reversion strategies
- Calculate the Information Coefficient (IC) and interpret its magnitude (>0.05 modest, >0.10 strong)
- Implement ADF test, t-test, IC, and rolling IC in Python using scipy and statsmodels
- Explain Type I and Type II errors in a trading research context

### Materials Needed
- `finnenv` environment — `yfinance`, `pandas`, `numpy`, `matplotlib`, `scipy`, `statsmodels`, `pandas_ta` installed
- GitHub repo — starter notebook `W05_workshop_statistics_starter.ipynb`
- Hypothesis log — Month 2 section begins this week
- News headline from Monday morning DMB observation (one per student — real headline)

### Pre-Week Checklist (Instructor)
- [ ] Push `W05_workshop_statistics_starter.ipynb` to GitHub before Wednesday
- [ ] Verify `scipy` and `statsmodels` are in every student's `finnenv`
- [ ] Assign DMB rotation for Monday, Wednesday, Friday
- [ ] Prepare whiteboard explanation of ADF test null hypothesis
- [ ] Note: Month 2 starts this week — add `## Month 2 — Week 5` header to hypothesis log
- [ ] Review Milestone 1 results and note any students to watch especially closely this month

---

## MONDAY — May 11, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

#### Block 1 — Pre-Market Scan (9:00–9:15 AM)
Standard checklist. Flag any continuation from last week's market behavior. Reference: "We closed Month 1 with Milestone 1. What has the market done in the week since? Any regime shifts from last Friday's close?"

#### Block 2 — Student-Led Brief (9:15–9:35 AM)
Rotating student presenter. By Week 5, the student briefs should be noticeably sharper than Week 1. If they are not, give direct feedback before Block 3.

#### Block 3 — Hypothesis Setting (9:35–9:50 AM)
Reopen the hypothesis log. Note Month 2 starts here. Add a section header in the log: `## Month 2 — Week 5`.

First hypothesis of the month should reflect Month 2's statistical lens. Encourage students to frame hypotheses as testable statistical claims.

Example prompt: "Can someone frame a hypothesis that could be tested with a t-test? Something like: 'Days with VIX above 20 have lower average SPY returns than days with VIX below 20.' That's a statistical hypothesis."

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "During market hours, find any financial news headline about a company or index. Write the headline down word for word. Then personally rate it: Bullish, Bearish, or Neutral — and your confidence 0–100. Bring it tonight. We'll compare your rating to what we can compute."

---

### EVENING: Theory Session (8:00–9:30 PM EST)
**Topic:** Statistics for Quants — Hypothesis Testing, Stationarity & Time Series
**Curriculum Source:** Wiki Section 3.2 (full)

#### Pre-Session Setup
- [ ] Wiki Section 3.2 read in full — all four subsections
- [ ] Wiki Section 4.2 reviewed — especially scipy and statsmodels entries
- [ ] News headline from DMB observation logged with personal sentiment rating
- [ ] Whiteboard ready for ADF test explanation and stationarity diagrams

#### Block 1 — Day Review & Reading Check (8:00–8:15 PM) | 15 min

"Who found a news headline today? Read it aloud. What did you rate it? Bullish, Bearish, or Neutral — and why?

Now here's the question that will drive tonight and all of Month 2: How do you know if you're right? How do you test whether your intuition about a headline has any actual predictive value for the stock's price? That's what statistics lets you do. That's what tonight is about."

Cold-call reading check:
- "What is a null hypothesis? Give me an example in market terms."
- "What does a p-value of 0.03 mean in plain English?"
- "Name the three time series concepts from the reading."

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 min

**Topic A: Hypothesis Testing Applied to Markets (20 min)**

Start with first principles — do not assume prior statistics knowledge.

"A hypothesis test starts with a boring assumption: the null hypothesis. The null hypothesis is always 'nothing interesting is happening.' For us: 'This signal has no predictive relationship with returns.'

We collect data, compute a test statistic, and ask: how likely is this data if the null hypothesis is true? That probability is the p-value. If p < 0.05, we say: this result is unlikely enough by chance that we reject the null. The signal probably does something."

**Walk through a concrete market example on the board:**

"Hypothesis: 'Stocks with RSI below 30 outperform the market over the next 5 days.'
- H₀: There is no difference in 5-day forward returns between RSI<30 stocks and the market
- H₁: RSI<30 stocks have higher 5-day forward returns than the market
- We collect 3 years of data, find every RSI<30 instance, measure the 5-day return after
- We compute a t-test comparing those returns to the market's 5-day average return
- If p < 0.05, we have statistical evidence the RSI<30 signal works"

**The Information Coefficient (IC):**
"The IC is the correlation between your predicted rank and the actual return rank. IC of 0 = your model is random. IC of 1 = perfect. IC of 0.05 = modest but real edge. Professional quants consider IC > 0.05 meaningful. IC > 0.10 is strong."

> **Resource:** FINN quant workflow — Step 4 (Statistical Testing) to Step 5 (Model Building): IC benchmarks, signal quality gates, and the full 9-step pipeline from hypothesis to live trading → `resources/infographics/ig_quant_workflow.html`

**Type I and Type II errors:**
"Type I error: you think the signal is real but it's noise — you trade a fake edge. Type II error: you think the signal is noise but it's real — you miss a genuine edge. In trading, Type I errors cost money directly. Type II errors cost opportunity. Multiple testing makes Type I errors far more likely — the more signals you test, the more false positives you find by chance alone. This is why quants are skeptical."

**Topic B: Time Series Fundamentals (20 min)**

"Financial data is not like cross-sectional data. The order matters. Today's return is related to yesterday's return. This violates the independence assumption of standard statistics. We need different tools."

**Stationarity:**
"A stationary series has constant mean and variance over time — it doesn't trend. Most price series are NOT stationary. They trend up or down. Daily returns ARE stationary — because we've differenced the price series. Why does this matter? Most statistical models assume stationarity. If you run a regression on non-stationary data, your results are garbage — spurious correlation."

*Draw on whiteboard: AAPL price (non-stationary, trending up) vs. AAPL daily return (stationary, mean-reverting around zero).*

"The ADF test (Augmented Dickey-Fuller) formally tests for stationarity. p < 0.05 in an ADF test means the series IS stationary. We will run this Wednesday."

**Autocorrelation:**
"Does today's return predict tomorrow's return? If returns have positive autocorrelation — momentum. Yesterday's winner tends to win again. If returns have negative autocorrelation — mean reversion. Yesterday's winner tends to lose. Most daily equity returns have near-zero autocorrelation — close to random walk. But at weekly and monthly horizons, momentum factors emerge. This is why momentum works."

**Rolling statistics:**
"Rather than computing a single mean over all history, we compute it over a rolling window. A 20-day rolling mean gives you the average of the last 20 days, updated daily. This captures regime changes — periods when the market behaves differently."

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 min

1. "We run 100 tests on 100 different signals. 5 of them show p < 0.05. Should we trade those 5 signals? What's the problem?"
   *(Expected: multiple testing problem. With 100 tests at 5% threshold, we expect 5 false positives by chance alone. Need Bonferroni correction or out-of-sample validation.)*

2. "Devil's advocate: Isn't p < 0.05 arbitrary? Why not p < 0.10 or p < 0.01? Who decided 5% was the magic number?"
   *(Expected: it IS somewhat arbitrary — Fisher originally proposed it as a guideline. In finance with high noise, many argue p < 0.01 is more appropriate. The point is: a threshold is a tool, not a truth.)*

3. "If stock prices are close to a random walk (near-zero autocorrelation), does that mean quantitative trading is impossible?"
   *(Expected: No. Even small departures from random walk — 0.05 IC — are exploitable at scale with enough trades. The edge doesn't have to be large, just consistent and real across enough observations.)*

4. "A signal worked from 2015–2020. You deploy it in 2021. It stops working. What are three possible statistical explanations?"
   *(Expected: Regime change. Overfitting — it was never real. Signal crowding — too many people found it and arbitraged it away.)*

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 min

**Wednesday workshop:**
"We'll implement the ADF test, rolling statistics, and a proper t-test on a real market hypothesis. Starter notebook: `W05_workshop_statistics_starter.ipynb`. Come ready to run real hypothesis tests on real return data."

**Weekly hypotheses:** At least one this week must be framed as a statistical hypothesis (testable with a t-test or correlation measure).

**Pre-reading:**
- Wiki Section 5.1 — Technical indicators table (full read)
- Wiki Section 5.2 — Candlestick patterns as features
- Begin reviewing Wiki Section 7.1 — Backtesting best practices

**Closing reflection:**
*"The most important thing I need to understand before Wednesday is ___."*

**Monday Deliverable:** Reading Notes + 3 Hypotheses (at least one statistical) by 11:59 PM

---

## WEDNESDAY — May 13, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Observation Assignment:** "Today, find a stock that had an unusual move this week. Mentally frame a statistical hypothesis about what caused it. Bring it tonight — we'll test the underlying idea."

---

### EVENING: Workshop Session (8:00–9:30 PM EST)
**Workshop:** W5 — Statistical Tests on Financial Data — ADF, t-tests, Rolling Stats, IC
**Notebook:** `W05_workshop_statistics_[initials].ipynb`
**Curriculum Source:** Wiki Section 3.2

#### Pre-Session Setup
- [ ] `finnenv` running with `scipy` and `statsmodels` verified
- [ ] Starter notebook pulled from GitHub
- [ ] Monday notes reviewed

#### Block 1 — Framing (8:00–8:10 PM) | 10 min

"Monday we built the statistical vocabulary. Tonight we use it. We will run three tests:
1. ADF test — is our return series stationary?
2. t-test — does RSI < 30 actually predict higher forward returns?
3. Rolling correlation — does the relationship change over time?

Every line of code tonight maps directly to a concept from Monday. By the end you'll have run a real hypothesis test on a real signal. That is the beginning of quantitative research."

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 min

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
    print(f"\nConclusion: Series is {'STATIONARY' if p_value < 0.05 else 'NON-STATIONARY'}")
    print(f"(p = {p_value:.4f} {'< 0.05 — reject H0' if p_value < 0.05 else '>= 0.05 — fail to reject H0'})")

# Test both price (non-stationary) and returns (stationary)
run_adf_test(df['Close'], "SPY Closing Price")
run_adf_test(df['Return'], "SPY Daily Returns")
```
*Pause: "Price fails the test — non-stationary. Returns pass — stationary. This is why we always work with returns, not prices, in statistical models."*

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
*Deliberate issue: note that `shift(-5)` uses future data — this is intentional for computing what happened after, but flag it: "In a backtest, never use shift(-N) as a feature input. Only use it to compute the label. This is a research step, not a live trading signal."*

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
    print(f"\nConclusion: Signal {'HAS' if p_value < 0.05 else 'DOES NOT HAVE'} "
          f"statistically significant predictive value")
    print(f"(at p < 0.05 threshold)")

    # Effect size (Cohen's d)
    pooled_std = np.sqrt((signal_returns.std()**2 + baseline_returns.std()**2) / 2)
    cohens_d = (signal_returns.mean() - baseline_returns.mean()) / pooled_std
    print(f"\nEffect size (Cohen's d): {cohens_d:.4f}")
    print(f"Practical significance: {'Large' if abs(cohens_d) > 0.8 else 'Medium' if abs(cohens_d) > 0.5 else 'Small'}")

test_signal_hypothesis(signal_returns, baseline_returns, "RSI < 30 -> 5-Day Forward Return")
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
    print(f"Signal quality: {'Strong' if abs(ic) > 0.10 else 'Modest' if abs(ic) > 0.05 else 'Weak'}")
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
*"This is regime analysis. If the IC is positive some years and negative others, the signal is regime-dependent — it only works in certain market conditions. That's crucial to know before you build a strategy around it."*

#### Block 3 — Independent Work (8:50–9:15 PM) | 25 min

**Core Exercise:**
Choose a different signal (RSI > 70 as overbought, MACD crossover, or volume surge ratio > 2) and run the full hypothesis testing pipeline:
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
Test the same signal on 3 different assets (e.g., SPY, QQQ, IWM). Does the statistical significance hold across all three? What does it mean if a signal is significant for SPY but not for small caps?

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 min

**Share-out:** Students share their signal test results. Focus discussion: "How many of you found a significant result? How many didn't? What does it mean if most signals we test are NOT significant?"
*(Answer: most ideas are wrong. That's science. The quant workflow filters them.)*

**Muddiest Point:**
> *"The muddiest point from tonight was ___."*

**Wednesday Deliverable:** Completed notebook `W05_workshop_statistics_[initials].ipynb` submitted to GitHub by 11:59 PM

---

## FRIDAY — May 15, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Observation Assignment:** "Review this week's price action for SPY. Using what we know about autocorrelation — did Monday's return direction predict Tuesday's? Did Wednesday's predict Thursday's? Build a simple table of daily returns and the next-day direction. Bring it tonight."

---

### EVENING: Review & Market Session (8:00–9:30 PM EST)

#### Pre-Session Setup
- [ ] Hypothesis log reviewed — all Week 5 hypotheses ready for audit
- [ ] TradingView with SPY daily chart loaded
- [ ] Autocorrelation observation table from DMB assignment ready

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 min

1. "Explain the null hypothesis. Give me a null hypothesis for a real trading signal you'd want to test — not RSI, something you came up with."

2. "What is the ADF test testing? Why do we run it on returns but not prices?"

3. "The IC of a signal is 0.03. p-value is 0.08. Should you trade it? Walk me through your reasoning — statistical significance AND practical significance."

4. "In Wednesday's notebook, we used `shift(-5)` to compute forward returns. Why is it absolutely forbidden to use `shift(-N)` as a feature in a live model?"

5. "What is the multiple testing problem? Give me a concrete example of how it produces false positives in trading research."

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 min

**Hypothesis Audit:** Close all Week 5 hypotheses. Focus specifically on any statistical hypotheses students framed Monday. "Did your statistical hypothesis hold up this week? Could we even test it with 5 days of data? What sample size would you actually need?"

**Chart Review — Statistical Lens:**
Pull up SPY daily chart. "What was the daily return each day this week? Let's compute the week's autocorrelation manually — did each day's direction predict the next?

If Monday was up 0.8%, what would a momentum hypothesis predict for Tuesday? What actually happened? Is one week enough data to draw conclusions? Why not?"

Walk through VIX behavior: "VIX moved from ___ to ___. If we had a hypothesis that 'weeks with VIX > 20 produce lower mean SPY returns' — where would we even start to test it? What data would we need? What's the right test?"

**Sector Rotation:** Apply statistical framing: "Which sectors outperformed this week? Is that consistent with what we'd predict given this week's macro backdrop? How would you test whether sector rotation is predictable?"

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 min

Standard derivatives checklist. Add statistical framing: "The put/call ratio this week averaged ___. Over the last 4 weeks it has been: ___, ___, ___, ___. Is there a pattern? Could we test whether elevated P/C ratio predicts next-week returns? What's the hypothesis?" *(Don't test it yet — plant the seed. This becomes a student Milestone 2 option.)*

#### Block 4 — Next Week Preview & Close (9:20–9:30 PM) | 10 min

**Next week:** Technical indicators as data features — the engine of our feature matrix. This is where we bridge from statistics to strategy building.

**Assign reading:**
- Wiki Section 5.1 — Full indicators table (all 10 indicators)
- Wiki Section 5.2 — Candlestick patterns as features
- Wiki Section 4.3 — Code Pattern 2 (pandas-ta indicator setup)

**DMB rotation:** Assign next week's leads.

**Note Memorial Day (May 25):** Mention now that Week 7 Monday is a holiday. Async package will be distributed in advance.

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

## WEEKLY DELIVERABLES SUMMARY

| Deliverable | Due | Format |
|-------------|-----|--------|
| Reading Notes + 3 Hypotheses | Monday 11:59 PM | Markdown in hypothesis log |
| Workshop Notebook (W05) | Wednesday 11:59 PM | `.ipynb` pushed to GitHub |
| Weekly Review Log | Friday 11:59 PM | Markdown |
| Hypothesis Outcome Record | Friday 11:59 PM | Appended to hypothesis log |

---

## INSTRUCTOR NOTES FOR WEEK 5

**The conceptual leap this week:** Students arrive having learned market mechanics and metrics. Statistics is a fundamentally different kind of thinking — probabilistic, inferential. The key challenge is preventing students from treating p-values as binary pass/fail signals. Emphasize repeatedly: "A p-value is the probability of seeing this data by chance if the null is true. It is not the probability that the signal is real."

**ADF test interpretation confusion:** Students frequently invert the ADF interpretation. "p < 0.05 means stationary" feels backwards because we normally say "reject the null when p is small." Make it explicit: the null IS non-stationarity. Rejecting it means the series IS stationary. This trips up even strong students.

**IC interpretation:** Students want to know "what IC is good?" Answer clearly: professional quants consider IC > 0.05 meaningful and IC > 0.10 strong. Anything below 0.02 is likely noise. Most retail signals have IC near zero — that's why this course takes statistical testing seriously.

**Rolling IC as regime insight:** The rolling IC chart is one of the most insight-generating exercises in Month 2. When students see that their signal's IC oscillates between positive and negative over different periods, the concept of "regime-conditional edge" clicks immediately. Make time for students to find at least one period where their signal's IC was strongly positive AND one where it was negative.

**The multiple testing warning:** Plant this seed firmly. In Month 2 backtesting, students will want to optimize every parameter. The multiple testing problem is why optimized backtests are almost always overfit. Reference this week's lesson explicitly when that temptation arises in Weeks 7–8.

---

## WEEKLY RESOURCES

> Resources are labeled **[Pre-session]** (review before class) or **[Homework]** (explore after). FINN covers every concept live — these are your scaffolding, not your syllabus.

---

### Monday — Hypothesis Testing, Stationarity & The Information Coefficient

- **[Article | Pre-session]** [Augmented Dickey-Fuller Test (ADF Test) — Must Read Guide](https://www.machinelearningplus.com/time-series/augmented-dickey-fuller-test/) — Machine Learning Plus (updated April 2022). Covers what the ADF test is, what the null hypothesis means (unit root = non-stationary), how to interpret the p-value, and how to run it in Python with statsmodels. Read before Monday — we run this live in class.

- **[Article | Pre-session]** [Augmented Dickey-Fuller Test in Python (With Example)](https://www.statology.org/dickey-fuller-test-python/) — Statology. Shorter, code-first version. Has the exact `adfuller()` function call and output interpretation. Useful as a quick reference alongside the MachineLearning Plus article.

- **[Article | Homework]** [Mastering the Information Coefficient: Your Key to Smarter Factor Investing](https://medium.com/coding-nexus/mastering-the-information-coefficient-your-key-to-smarter-factor-investing-244531e45538) — Medium / Coding Nexus (March 2026). Explains IC as a measure of how well a factor's predictions correlate with actual returns. Key benchmark to internalize: IC > 0.05 is modest, > 0.10 is strong — values FINN references throughout Month 2.

- **[Article | Homework]** [p-Hacking and Multiple Comparisons Bias](https://www.quantrocket.com/code/?repo=quant-finance-lectures&path=/codeload/quant-finance-lectures/quant_finance_lectures/Lecture23-p-Hacking-and-Multiple-Comparisons-Bias.ipynb.html) — QuantRocket Quant Finance Lectures. A Jupyter notebook lecture on exactly why testing 100 signals and keeping the 5 that hit p < 0.05 is statistically invalid. This is the multiple testing problem FINN describes on Monday — read it carefully.

- **[YouTube | Pre-session]** Search YouTube for: *"p-value explained statistics 2022 2023"* — look for a video under 15 min that explains p-values using plain English examples (not just formula derivations). The framing you want: "what does p < 0.05 actually mean in practice, and why is it not proof of anything?" Channels worth checking: **StatQuest with Josh Starmer** (search specifically for "p-value StatQuest").

---

### Wednesday — Python Statistics Workshop: ADF, t-Test, IC & Rolling IC

- **[Article | Pre-session]** [How to Check if Time Series Data is Stationary with Python](https://machinelearningmastery.com/time-series-data-stationary-python/) — Machine Learning Mastery. Shows multiple approaches to testing stationarity including ADF and visual inspection of rolling mean/variance. Preview before Wednesday's workshop — we run these tests on real return data.

- **[Article | Reference]** [Information Coefficient (IC) — How It Works](https://www.fe.training/free-resources/portfolio-management/information-coefficient-ic/) — FE Training. Clean reference explanation with the IC formula and interpretation table. Bookmark this — we calculate rolling IC in the workshop and you'll want this formula handy.

- **[YouTube | Homework]** Search YouTube for: *"StatQuest ADF stationarity time series"* OR *"time series stationarity explained python 2023"* — look for a video that shows the visual test (rolling mean stays flat = stationary) alongside the ADF test. Understanding the intuition before the code matters here.

---

### Friday — Statistics Applied to This Week's Market

- **[Article | Homework]** [Portfolio Case Study for Alpha, Beta, Information Ratio and Information Coefficient](https://medium.com/balaena-quant-insights/portfolio-case-study-for-alpha-beta-information-ratio-ir-and-information-coefficient-ic-fa3b907e9ff3) — Medium / Balaena Quant Insights. Real portfolio application of IC alongside Sharpe, alpha, and beta. Good synthesis read after Friday's session — shows how these metrics all interact when evaluating a real strategy.

---

*FINN Week 5 — Statistics for Quants | Part of FINN_Month02.md*
