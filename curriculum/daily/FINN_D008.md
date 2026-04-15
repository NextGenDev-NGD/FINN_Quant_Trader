# FINN — Day 8
## Wednesday · April 29, 2026 · Week 3 of 24
### Topic: Building Performance Metrics from Scratch in Python

```
MORNING   9:00–10:00 AM EST   60 min   Student-led brief
EVENING   8:00–9:30  PM EST   90 min   10 min framing · 40 min guided build · 25 min independent · 15 min share-out
```

> **Prep:** `W03_workshop_metrics_starter.ipynb` pulled and open. `finnenv` activated. Fund or ETF factsheet with published Sharpe and max drawdown from DMB observation ready to compare.

---

# MORNING — Daily Market Brief
## 9:00–10:00 AM

---

**9:00 | PRE-MARKET SCAN** `15 min`

Standard checklist.

> **ES, NQ, YM Futures**
> **VIX**
> **Macro calendar**
> **Earnings calendar**
> **Finviz sector heatmap**
> **10-year yield**
> **Bitcoin overnight**

---

**9:15 | STUDENT-LED BRIEF** `20 min`

Student rotation. Brief coaching feedback after.

---

**9:35 | HYPOTHESIS SETTING** `15 min`

Add Wednesday hypotheses. Reference Monday's entries.

---

**9:50 | OBSERVATION ASSIGNMENT** `10 min`

"Find a mutual fund or ETF that publishes its 3-year Sharpe ratio and maximum drawdown in its factsheet. Write both numbers down. Tonight you'll recalculate these figures from the data and see if they match."

---

---

# EVENING — Workshop Session
## 8:00–9:30 PM

```
8:00  Framing — why build from scratch     10 min
8:10  Guided build — Steps 1–5             40 min
8:50  Independent work — 3 assets          25 min
9:15  Share-out + Muddiest Point           15 min
```

---

**8:00 | FRAMING** `10 min`

"Monday we defined every performance metric. Tonight we implement them. There are libraries that compute these for you — `quantstats`, `pyfolio`. We are not using them tonight. We build from scratch first.

Why? If you use a library you don't understand, you don't know when it's wrong. And it will be wrong. Understanding the math behind the metric is the only way to catch errors and know what you're actually measuring.

By the end of tonight, you will have implemented total return, annualized return, annual volatility, Sharpe ratio, max drawdown, win rate, and expectancy from scratch in Python. Then you'll run them on real data and compare your numbers to a published fund factsheet."

---

**8:10 | GUIDED BUILD** `40 min`

```python
import yfinance as yf
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import warnings
warnings.filterwarnings('ignore')

df = yf.download("SPY", period="3y", interval="1d", progress=False)
df.columns = [c[0] if isinstance(c, tuple) else c for c in df.columns]
df['Return'] = df['Close'].pct_change()
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

print(f"Total Return:      {total_return(returns):.2%}")
print(f"Annualized Return: {annualized_return(returns):.2%}")
```

**Step 2 — Volatility (5 min)**
```python
def annual_volatility(returns, periods_per_year=252):
    """Annualized standard deviation of daily returns."""
    return returns.std() * np.sqrt(periods_per_year)

print(f"Annual Volatility: {annual_volatility(returns):.2%}")
```
*"Why multiply by sqrt(252)? Variance scales linearly with time. Standard deviation scales with the square root of time. 252 trading days per year — daily std × √252 = annual std. The math: daily variance 0.0001 × 252 = 0.0252 annual variance. √0.0252 = 15.9%. Daily std × √252 = 1% × 15.87 = 15.9%. Same answer. That's why the formula works."*

**Step 3 — Sharpe Ratio (8 min)**
```python
def sharpe_ratio(returns, risk_free_rate=0.05, periods_per_year=252):
    """
    Sharpe Ratio: excess return per unit of risk.
    risk_free_rate: annual rate — use current 3-month T-bill rate.
    """
    daily_rf = risk_free_rate / periods_per_year
    excess_returns = returns - daily_rf
    if excess_returns.std() == 0:
        return 0
    return (excess_returns.mean() / excess_returns.std()) * np.sqrt(periods_per_year)

sharpe = sharpe_ratio(returns)
print(f"Sharpe Ratio: {sharpe:.3f}")
if sharpe > 1.5:
    print("Interpretation: Excellent")
elif sharpe > 1.0:
    print("Interpretation: Good")
elif sharpe > 0.5:
    print("Interpretation: Acceptable")
else:
    print("Interpretation: Poor")
```

**Step 4 — Maximum Drawdown (12 min)**
```python
def max_drawdown(returns):
    """Maximum peak-to-trough decline. Returns negative percentage."""
    cumulative = (1 + returns).cumprod()
    rolling_max = cumulative.cummax()
    drawdown = (cumulative - rolling_max) / rolling_max
    return drawdown.min()

def drawdown_series(returns):
    """Full drawdown time series for visualization."""
    cumulative = (1 + returns).cumprod()
    rolling_max = cumulative.cummax()
    return (cumulative - rolling_max) / rolling_max

mdd = max_drawdown(returns)
print(f"Maximum Drawdown: {mdd:.2%}")

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
*"Read this chart together. Every time the equity curve makes a new high, the drawdown resets to zero. Every red period is a stretch when the strategy was underwater from a prior peak. How long was the longest drawdown period? That is what you'd be sitting through in live trading. Could you hold?"*

**Step 5 — Win Rate and Expectancy (10 min)**
```python
def expectancy(returns):
    """
    Expected value per period.
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

---

**8:50 | INDEPENDENT WORK** `25 min`

Run all 5 metric functions on 3 assets: SPY, QQQ, and one high-volatility stock of your choice. Answer in markdown cells:

```
1. Which asset had the best Sharpe? Does that surprise you?
2. Which had the worst max drawdown? When did the peak-to-trough occur?
3. Using the fund/ETF factsheet from the DMB observation — does your calculated Sharpe
   match the published figure? If not, why might they differ?
```

**Extension Challenge:** Wrap all metrics into a single `performance_summary()` function that takes a return series and prints a formatted report. Run it on all 3 assets and build a comparison DataFrame.

---

**9:15 | SHARE-OUT + MUDDIEST POINT** `15 min`

**Share-out (10 min):** Focus on Sharpe comparison across assets. "Which surprised you most? Did your calculated numbers match the published factsheet? If not — what does that tell you about trusting published numbers from a third party?"

**Muddiest Point (5 min):**
> *"The muddiest point from tonight was ___."*

"Notebook pushed to GitHub by 11:59 PM: `W03_workshop_metrics_[initials].ipynb`."

---

## DELIVERABLES

| What | When |
|------|------|
| Workshop notebook `W03_workshop_metrics_[initials].ipynb` | Tonight 11:59 PM |

---

*Day 8 · Wednesday April 29, 2026 · Draws from `FINN_W03.md`*
