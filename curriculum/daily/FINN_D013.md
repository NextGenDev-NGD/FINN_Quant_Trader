# FINN — Day 13
## Monday · May 11, 2026 · Week 5 of 24
### Topic: Statistics for Quants — Hypothesis Testing, Stationarity & The IC

```
MORNING   9:00–10:00 AM EST   60 min   Student-led brief + headline observation assignment
EVENING   8:00–9:30  PM EST   90 min   15 min day review & reading check · 40 min concept delivery · 20 min Socratic discussion · 15 min Wednesday setup & close
```

> **Prep:** Wiki Section 3.2 read in full — all four subsections. Wiki Section 4.2 reviewed (scipy and statsmodels). Whiteboard ready for ADF test explanation and stationarity diagrams. Month 2 starts here — note in hypothesis log. Review M1 results from Friday and identify any students to watch especially closely this month.

---

# MORNING — Daily Market Brief
## 9:00–10:00 AM

---

**9:00 | PRE-MARKET SCAN** `15 min`

Standard checklist. "Month 2 begins today. We closed Month 1 with Milestone 1. What has the market done since Friday? Any regime shifts from last week's close?"

> **ES, NQ, YM Futures**
> **VIX** — where did it open relative to last Friday's close?
> **Macro calendar** — any events this week?
> **Earnings calendar**
> **Finviz sector heatmap**
> **10-year yield**
> **Bitcoin**

---

**9:15 | STUDENT-LED BRIEF** `20 min`

Student rotation. By Week 5 the briefs should be noticeably sharper than Week 1. If they are not, give direct feedback before Block 3. Name the specific improvement needed.

---

**9:35 | HYPOTHESIS SETTING** `15 min`

"Month 2 starts here. Add a section header in the hypothesis log: `## Month 2 — Week 5`."

First hypothesis of the month should reflect a statistical lens. "Can someone frame a hypothesis that could be tested with a t-test? Something like: 'Days with VIX above 20 have lower average SPY returns than days with VIX below 20.' That's a statistical hypothesis. Try to get there this week."

---

**9:50 | OBSERVATION ASSIGNMENT** `10 min`

"During market hours today — find any financial news headline about a company or index. Write it down word for word. Then personally rate it: Bullish, Bearish, or Neutral — and your confidence 0–100. Bring it tonight. We'll compare your rating to what we can compute."

---

---

# EVENING — Theory Session
## 8:00–9:30 PM

```
8:00  Day Review & Reading Check               15 min
8:15  Core Concept Delivery — Part A           20 min
8:35  Core Concept Delivery — Part B           20 min
8:55  Socratic Discussion                      20 min
9:15  Wednesday Setup & Close                  15 min
```

---

**8:00 | DAY REVIEW & READING CHECK** `15 min`

"Who found a news headline today? Read it aloud. What did you rate it? Bullish, Bearish, or Neutral — and why?

Now here's the question that will drive tonight and all of Month 2: How do you know if you're right? How do you test whether your intuition about a headline has any actual predictive value for the stock's price? That's what statistics lets you do. That's what tonight is about."

Cold-call reading check:
- "What is a null hypothesis? Give me an example in market terms."
- "What does a p-value of 0.03 mean in plain English?"
- "Name the three time series concepts from the reading."

---

**8:15 | CONCEPT DELIVERY — PART A: Hypothesis Testing Applied to Markets** `20 min`

Start with first principles — do not assume prior statistics knowledge.

"A hypothesis test starts with a boring assumption: the null hypothesis. The null is always 'nothing interesting is happening.' For us: 'This signal has no predictive relationship with returns.'

We collect data, compute a test statistic, and ask: how likely is this data if the null hypothesis is true? That probability is the p-value. If p < 0.05, we say: this result is unlikely enough by chance that we reject the null. The signal probably does something."

Walk through a concrete market example on the board:

"Hypothesis: 'Stocks with RSI below 30 outperform the market over the next 5 days.'
- H₀: No difference in 5-day forward returns between RSI<30 stocks and the market
- H₁: RSI<30 stocks have higher 5-day forward returns than the market
- Collect 3 years of data, find every RSI<30 instance, measure the 5-day return after
- Compute a t-test comparing those returns to the market's 5-day average
- If p < 0.05, we have statistical evidence the signal works"

**The Information Coefficient (IC):**
"The IC is the correlation between your predicted rank and the actual return rank. IC of 0 = your model is random. IC of 1 = perfect. IC of 0.05 = modest but real edge. Professional quants consider IC > 0.05 meaningful. IC > 0.10 is strong."

**Type I and Type II errors:**
"Type I error: you think the signal is real but it's noise — you trade a fake edge. Type II error: you think the signal is noise but it's real — you miss a genuine edge. In trading, Type I errors cost money directly. Type II errors cost opportunity. Multiple testing makes Type I errors far more likely — the more signals you test, the more false positives you find by chance alone. This is why quants are skeptical."

---

**8:35 | CONCEPT DELIVERY — PART B: Time Series Fundamentals** `20 min`

"Financial data is not like cross-sectional data. The order matters. Today's return is related to yesterday's return. This violates the independence assumption of standard statistics. We need different tools."

**Stationarity:**
"A stationary series has constant mean and variance over time — it doesn't trend. Most price series are NOT stationary. Daily returns ARE stationary — because we've differenced the price series. Why does this matter? Most statistical models assume stationarity. If you run a regression on non-stationary data, your results are garbage — spurious correlation."

*Draw on whiteboard: AAPL price (non-stationary, trending up) vs. AAPL daily return (stationary, mean-reverting around zero).*

"The ADF test (Augmented Dickey-Fuller) formally tests for stationarity. p < 0.05 in an ADF test means the series IS stationary. We run this Wednesday."

**Autocorrelation:**
"Does today's return predict tomorrow's return? Positive autocorrelation = momentum. Negative autocorrelation = mean reversion. Most daily equity returns have near-zero autocorrelation — close to random walk. But at weekly and monthly horizons, momentum factors emerge. This is why momentum works."

**Rolling statistics:**
"Rather than computing a single mean over all history, we compute it over a rolling window. A 20-day rolling mean gives you the average of the last 20 days, updated daily. This captures regime changes — periods when the market behaves differently."

---

**8:55 | SOCRATIC DISCUSSION** `20 min`

1. "We run 100 tests on 100 different signals. 5 of them show p < 0.05. Should we trade those 5? What's the problem?"

2. "Devil's advocate: Isn't p < 0.05 arbitrary? Why not p < 0.10 or p < 0.01? Who decided 5% was the magic number?"

3. "If stock prices are close to a random walk — near-zero autocorrelation — does that mean quantitative trading is impossible?"

4. "A signal worked from 2015–2020. You deploy it in 2021. It stops working. What are three possible statistical explanations?"

---

**9:15 | WEDNESDAY SETUP & CLOSE** `15 min`

"Wednesday we implement the ADF test, rolling statistics, and a proper t-test on a real market hypothesis. Starter notebook: `W05_workshop_statistics_starter.ipynb`. Come ready to run real hypothesis tests on real return data."

**Weekly hypotheses:** At least one this week must be framed as a statistical hypothesis (testable with a t-test or correlation measure).

**Pre-reading before Wednesday:**
- Wiki Section 5.1 — Technical indicators table (full read)
- Wiki Section 5.2 — Candlestick patterns as features

**Closing reflection:**
> *"The most important thing I need to understand before Wednesday is ___."*

---

## DELIVERABLES

| What | When |
|------|------|
| Reading Notes + 3 Hypotheses (at least one statistical) | Tonight 11:59 PM |

---

*Day 13 · Monday May 11, 2026 · Draws from `FINN_W05.md`*
