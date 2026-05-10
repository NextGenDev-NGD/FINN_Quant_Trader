# FINN — Day 14
## Wednesday · May 13, 2026 · Week 5 of 24
### Topic: Workshop — ADF Test, t-Test, IC & Rolling IC on Real Market Data

```
MORNING   9:00–10:00 AM EST   60 min   Student-led brief + unusual stock observation assignment
EVENING   8:00–9:30  PM EST   90 min   10 min framing · 40 min guided build · 25 min independent work · 15 min share-out & muddiest point
```

> **Prep:** `finnenv` running with `scipy` and `statsmodels` verified. Starter notebook `W05_workshop_statistics_starter.ipynb` pulled from GitHub. Monday notes reviewed. Confirm every student has `scipy` and `statsmodels` in their environment before the session starts.

---

# MORNING — Daily Market Brief
## 9:00–10:00 AM

---

**9:00 | PRE-MARKET SCAN** `15 min`

Standard checklist. "Notice anything statistically interesting this week? Any big moves, VIX spikes, volume surges? We'll be running real hypothesis tests tonight — keep your eyes open."

> **ES, NQ, YM Futures**
> **VIX** — level and direction vs. Monday
> **Macro calendar** — any events today?
> **Earnings calendar**
> **Finviz sector heatmap**
> **10-year yield**
> **Bitcoin**

---

**9:15 | STUDENT-LED BRIEF** `20 min`

Student rotation. Coaching feedback after the brief.

---

**9:35 | HYPOTHESIS SETTING** `15 min`

"Any new hypotheses should be statistically framed — something we could actually test with tonight's tools. If you added a statistical hypothesis Monday, check in on it."

---

**9:50 | OBSERVATION ASSIGNMENT** `10 min`

"Find a stock that had an unusual move this week. Mentally frame a statistical hypothesis about what caused it. Bring it tonight — we'll test the underlying idea."

---

---

# EVENING — Workshop Session
## 8:00–9:30 PM

```
8:00  Framing                                  10 min
8:10  Guided Build — Steps 1–5                 40 min
8:50  Independent Work                         25 min
9:15  Share-Out & Muddiest Point               15 min
```

---

**8:00 | FRAMING** `10 min`

"Monday we built the statistical vocabulary. Tonight we use it. Three tests:
1. ADF test — is our return series stationary?
2. t-test — does RSI < 30 actually predict higher forward returns?
3. Rolling correlation — does the relationship change over time?

Every line of code tonight maps directly to a concept from Monday. By the end you'll have run a real hypothesis test on a real signal. That is the beginning of quantitative research."

> **Resource:** [ig_quant_workflow.html](../../resources/infographics/ig_quant_workflow.html) — The 9-step FINN quant workflow — tonight's pipeline maps to signal identification (Step 2), hypothesis testing (Step 3), and IC measurement (Step 4).

---

**8:10 | GUIDED BUILD** `40 min`

```python
import yfinance as yf
import pandas as pd
import numpy as np
import pandas_ta as ta
import matplotlib.pyplot as plt
from scipy import stats
from statsmodels.tsa.stattools import adfuller
import warnings
warnings.filterwarnings('ignore')

ticker = "SPY"
df = yf.download(ticker, period="3y", interval="1d", progress=False)
df.columns = [c[0] if isinstance(c, tuple) else c for c in df.columns]
df['Return'] = df['Close'].pct_change()
df.dropna(inplace=True)
print(f"Dataset: {len(df)} trading days | {ticker}")
```

**Step 1 — ADF Stationarity Test (8 min)**
```python
def run_adf_test(series, series_name):
    result = adfuller(series.dropna())
    adf_stat = result[0]
    p_value = result[1]
    critical_values = result[4]
    print(f"\n{'='*50}")
    print(f"ADF Test: {series_name}")
    print(f"{'='*50}")
    print(f"ADF Statistic:  {adf_stat:.4f}")
    print(f"p-value:        {p_value:.4f}")
    for key, val in critical_values.items():
        print(f"  {key}: {val:.4f}")
    print(f"\nConclusion: Series is {'STATIONARY' if p_value < 0.05 else 'NON-STATIONARY'}")

run_adf_test(df['Close'], "SPY Closing Price")
run_adf_test(df['Return'], "SPY Daily Returns")
```
*"Price fails — non-stationary. Returns pass — stationary. This is why we always work with returns in statistical models."*

**Step 2 — RSI Signal & Forward Returns (10 min)**
```python
df['RSI'] = ta.rsi(df['Close'], length=14)
df['RSI_Oversold'] = df['RSI'] < 30
df['Fwd_5d_Return'] = df['Close'].pct_change(5).shift(-5)

df_clean = df[['RSI', 'RSI_Oversold', 'Return', 'Fwd_5d_Return']].dropna()

signal_returns = df_clean.loc[df_clean['RSI_Oversold'], 'Fwd_5d_Return']
baseline_returns = df_clean.loc[~df_clean['RSI_Oversold'], 'Fwd_5d_Return']

print(f"RSI < 30 instances: {len(signal_returns)}")
print(f"Signal group mean 5d return:   {signal_returns.mean():.4%}")
print(f"Baseline group mean 5d return: {baseline_returns.mean():.4%}")
```
*Flag: "`shift(-5)` uses future data — intentional for computing the label, never use as a live feature input."*

**Step 3 — t-Test (8 min)**
```python
def test_signal_hypothesis(signal_returns, baseline_returns, signal_name):
    t_stat, p_value = stats.ttest_ind(signal_returns, baseline_returns,
                                       alternative='greater')
    print(f"\n{'='*50}")
    print(f"T-Test: {signal_name}")
    print(f"{'='*50}")
    print(f"t-statistic:  {t_stat:.4f}")
    print(f"p-value:      {p_value:.4f}")
    print(f"\nConclusion: Signal {'HAS' if p_value < 0.05 else 'DOES NOT HAVE'} "
          f"statistically significant predictive value")
    pooled_std = np.sqrt((signal_returns.std()**2 + baseline_returns.std()**2) / 2)
    cohens_d = (signal_returns.mean() - baseline_returns.mean()) / pooled_std
    print(f"Effect size (Cohen's d): {cohens_d:.4f}")
    print(f"Practical significance: {'Large' if abs(cohens_d) > 0.8 else 'Medium' if abs(cohens_d) > 0.5 else 'Small'}")

test_signal_hypothesis(signal_returns, baseline_returns, "RSI < 30 -> 5-Day Forward Return")
```

**Step 4 — Information Coefficient (7 min)**
```python
from scipy.stats import spearmanr

def information_coefficient(predictions, actuals):
    ic, p_value = spearmanr(predictions, actuals)
    print(f"\nIC: {ic:.4f}")
    print(f"p-value: {p_value:.4f}")
    print(f"Signal quality: {'Strong' if abs(ic) > 0.10 else 'Modest' if abs(ic) > 0.05 else 'Weak'}")
    return ic

ic = information_coefficient(-df_clean['RSI'], df_clean['Fwd_5d_Return'])
```

> **Resource:** [ig_performance_metrics.html](../../resources/infographics/ig_performance_metrics.html) — IC thresholds and all 9 performance metrics — reference while interpreting your IC output.

**Step 5 — Rolling 90-Day IC (7 min)**
```python
window = 90
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
plt.title('Rolling 90-Day IC: RSI Signal vs. 5-Day Forward Return', fontsize=13)
plt.ylabel('Information Coefficient')
plt.legend()
plt.grid(True, alpha=0.3)
plt.tight_layout()
plt.show()

print(f"Mean rolling IC: {rolling_ic_series.mean():.4f}")
print(f"IC positive {(rolling_ic_series > 0).mean():.1%} of the time")
```
*"If the IC is positive some years and negative others, the signal is regime-dependent. That's crucial to know before building a strategy around it."*

---

**8:50 | INDEPENDENT WORK** `25 min`

Choose a different signal (RSI > 70 overbought, MACD crossover, or volume surge ratio > 2) and run the full pipeline:
1. ADF test on the return series
2. Split signal vs. baseline returns
3. t-test with p-value interpretation
4. IC calculation
5. Rolling IC chart

Answer in markdown:
1. Is your signal statistically significant? What does the p-value say?
2. Is the effect size practically meaningful? (Cohen's d)
3. Does the IC hold up over time, or does it decay?
4. Would you trust this signal enough to build a strategy around it? Why or why not?

**Extension Challenge:** Test the same signal on 3 assets (SPY, QQQ, IWM). Does significance hold across all three?

---

**9:15 | SHARE-OUT & MUDDIEST POINT** `15 min`

**Share-out:** Students share their signal test results. "How many found a significant result? How many didn't? What does it mean if most signals we test are NOT significant?"
*(Answer: most ideas are wrong. That's science. The quant workflow filters them.)*

**Muddiest Point:**
> *"The muddiest point from tonight was ___."*

---

## DELIVERABLES

| What | When |
|------|------|
| Completed notebook `W05_workshop_statistics_[initials].ipynb` pushed to GitHub | Tonight 11:59 PM |

---

*Day 14 · Wednesday May 13, 2026 · Draws from `FINN_W05.md`*
