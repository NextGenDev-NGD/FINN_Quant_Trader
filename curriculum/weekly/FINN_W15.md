# FINN — Week 15: Strategy Evolution
## Paper Trading Phase II | Month 4: Paper Trading II — Iteration, Automation & Milestone 3
**Dates:** July 20–25, 2026
**Week Number:** 15 of 24

---

## WEEK OVERVIEW

### Theme
Run your adaptation live. Compare it to the original. Measure the difference honestly. This week applies the Week 12 adaptation framework to a real before/after comparison — quantifying whether the change you made in Month 3 actually improved the strategy or just felt better.

### Learning Objectives
By the end of this week, students will be able to:
- Build and run a parameterized Backtrader strategy class with V1.0 and V1.1 versions
- Generate a side-by-side performance comparison: Sharpe, max drawdown, trades, win rate, expectancy
- Calculate IC for both strategy versions on out-of-sample 2025–2026 data
- Interpret results across four outcome categories: better, neutral, worse, insufficient data
- Implement a strategy version log in GitHub with full changelog documentation
- Explain when and how to revert to the original strategy if adaptation underperforms

### Materials Needed
- `finnenv` environment — `backtrader`, `yfinance`, `pandas`, `pandas_ta`, `scipy`
- GitHub repo with version history — strategy rules documented in `strategy_v1.md` and `strategy_v1_1.md`
- Starter notebook: `W15_workshop_strategy_evolution_starter.ipynb`
- Month 3 summary report — reference for original vs. adapted parameters
- Full out-of-sample data: 2025–2026 (1 year prior to current date)

### Pre-Week Checklist (Instructor)
- [ ] Push `W15_workshop_strategy_evolution_starter.ipynb` to GitHub
- [ ] Confirm `backtrader` is installed in `finnenv` (`pip install backtrader`)
- [ ] Ask students before Monday: have they implemented their Month 3 adaptation? How many trades since?
- [ ] Assign DMB rotation for Monday, Wednesday, Friday
- [ ] Prepare Milestone 3 preview content for Friday Block 4

---

## MONDAY — July 20, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** Current portfolio value. How many trades placed since implementing the adaptation?

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Review your Month 3 summary report and your current trading log. How many trades have you placed using the adapted strategy (V1.1) since Week 12? Write down: (a) total trades, (b) win rate so far, (c) whether the adaptation has been consistently applied or inconsistently. Bring it tonight."

---

### EVENING: Theory Session (8:00–9:30 PM EST)
**Topic:** Measuring Strategy Evolution — Before/After Comparison & Version Control
**Curriculum Source:** Wiki Section 7.4, 9.2

#### Pre-Session Setup
- [ ] Month 3 summary report accessible
- [ ] Both strategy versions defined: V1.0 (original) parameters and V1.1 (adapted) parameters
- [ ] Trade data from V1.1 implementation period available

#### Block 1 — Day Review & Adaptation Status (8:00–8:15 PM) | 15 min

"Let's hear the adaptation status. Who implemented their change? How many trades since? Who is still running the original?"

For students who changed: "How is it performing so far? Do you have enough trades to say anything meaningful?"

For students who held: "That's a valid decision — what evidence led you to hold? Or was it avoidance?" (No judgment in tone — genuine inquiry. The question is whether the decision was evidence-based.)

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 min

**Topic A: The Pre/Post-Adaptation Comparison Framework (20 min)**

The correct way to evaluate whether your adaptation improved the strategy:

1. **Split the sample:** V1.0 performance period (Months 3–Month 3 close) vs. V1.1 performance period (Week 13 onward). The split must be at the moment of the adaptation, not retroactively selected.

2. **Run the updated backtest:** Apply V1.1 rules to the same out-of-sample data period you tested V1.0 on originally. This is not in-sample optimization — it is asking: "Would V1.1 have outperformed V1.0 on the same historical data?"

3. **Calculate IC for both versions:** Run IC on the last 1 year of data for each version's signal. The signal with higher IC is generating more information.

4. **Honest outcome categories:**
   - *Better:* V1.1 shows higher Sharpe, lower drawdown, stable IC. Confirmed improvement.
   - *Neutral:* No meaningful difference in any metric. The adaptation changed nothing — which is information.
   - *Worse:* V1.1 shows lower Sharpe or higher drawdown. Adaptation hurt performance. Revert.
   - *Insufficient data:* Fewer than 20 trades on V1.1. Cannot conclude anything. Continue and revisit at Week 16.

> **Resource:** Performance metrics reference (Sharpe, max drawdown, win rate, expectancy — the four metrics in the V1.0/V1.1 comparison table) — `resources/infographics/ig_performance_metrics.html`

**Topic B: Versioning Your Strategy (15 min)**

Every adaptation deserves a version number, a changelog, and a permanent record.

GitHub commit format:
```
strategy v1.1 — added ADX filter (adx_min > 20)

Rationale: Week 12 decision tree showed Q2 failure (regime mismatch)
during June trending market. ADX filter limits entries to trending
conditions matching strategy design.

Backtest comparison (OOS 2025-2026): 
  V1.0: Sharpe 0.82, MaxDD -8.3%, Win 52%
  V1.1: Sharpe 1.04, MaxDD -5.7%, Win 54%
IC comparison: V1.0: 0.042 | V1.1: 0.058
Recommendation: Deploy V1.1 for Month 4.
```

This documentation is part of the Milestone 3 package. A strategy that cannot be version-controlled cannot be evaluated honestly.

**Topic C: When the Original Beats the Adaptation (5 min)**

Signs the adaptation failed:
- Sharpe lower, drawdown higher — clear reversal
- IC dropped from V1.0 to V1.1
- Fewer trades with no improvement in win rate (lower signal frequency without precision improvement)
- Adaptation was cosmetic — adjusted a threshold by 2 points with no theoretical justification

If adaptation failed: revert to V1.0. Document it. A failed adaptation is not a failure — it is a data point. The failure becomes the rationale for Month 5's ML approach: "My rules-based adaptation didn't work. Let the model find the threshold."

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 min

1. *"I added an ADX filter. Signal frequency dropped by 60% — fewer entries per month. But the average win rate went from 50% to 58%. Is this a successful adaptation?"*
   *(Expected direction: Depends on expectancy, not just win rate. If average win is the same but trades are fewer, expectancy may be similar. Calculate: win_rate × avg_win - (1-win_rate) × avg_loss for both versions. Does the math support the change?)*

2. *"My V1.1 backtest was run on the same 2023-2025 data I used to design V1.1. It shows 20% improvement. Should I trust this result?"*
   *(Expected direction: No. This is in-sample testing of an adaptation designed using that same data. Overfitting. Run on a separate OOS period or use strict walk-forward methodology.)*

3. *"My strategy was built for trending markets. The market has been ranging all of Month 4. My IC dropped from 0.06 to 0.01. Should I adapt the signal or wait for the regime to change?"*
   *(Expected direction: This is the Q2 question from Week 12's tree. Regime mismatch is not signal failure. Wait for the regime to return to your designed conditions — OR add a regime filter as a Level 1 adaptation that prevents entries in non-trending markets.)*

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 min

**Wednesday workshop:** Parameterized Backtrader strategy class with V1.0 and V1.1 running on the same OOS data period — full side-by-side output.

**Before Wednesday:** Write your V1.0 parameters and V1.1 parameters in a single dict each. Know your exact rule changes.

---

## WEDNESDAY — July 22, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** V1.1 live trade count. How many signals has the adapted strategy fired this month?

#### Block 4 — Observation Assignment (9:50–10:00 AM)
"Before tonight, write your V1.0 and V1.1 strategy parameters as Python dicts. Every parameter that changed should be clear. This is the foundation of tonight's notebook."

---

### EVENING: Workshop Session (8:00–9:30 PM EST)
**Workshop:** W15 — Before/After Strategy Comparison + Version Control
**Notebook:** `W15_workshop_strategy_evolution_[initials].ipynb`
**Curriculum Source:** Wiki Section 7.4

#### Block 1 — Framing (8:00–8:10 PM) | 10 min

"Tonight we answer the question every trader who adapts a strategy must answer: did the change actually help, or did it just feel like it should help? We use code, not intuition, to answer it."

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 min

**Step 1 — Define Both Strategy Versions (8 min)**
```python
import backtrader as bt
import yfinance as yf
import pandas as pd
from scipy.stats import spearmanr

# Version parameters — customize to your strategy
V1_0 = {
    'rsi_entry':    35,
    'rsi_exit':     65,
    'ema_period':   20,
    'stop_atr_mult': 2.0,
    'adx_filter':   False,   # No ADX filter in original
    'adx_min':      0,
}

V1_1 = {
    'rsi_entry':    35,
    'rsi_exit':     65,
    'ema_period':   20,
    'stop_atr_mult': 1.5,    # Tightened stop
    'adx_filter':   True,    # Added ADX filter (adaptation)
    'adx_min':      20,
}
```

**Step 2 — Parameterized Backtrader Strategy (15 min)**
```python
class EvolvingStrategy(bt.Strategy):
    params = dict(
        rsi_entry=35, rsi_exit=65, ema_period=20,
        stop_atr_mult=2.0, adx_filter=False, adx_min=20,
        risk_pct=0.01,
    )
    
    def __init__(self):
        self.rsi  = bt.indicators.RSI(period=14)
        self.ema  = bt.indicators.EMA(period=self.p.ema_period)
        self.atr  = bt.indicators.AverageTrueRange(period=14)
        self.adx  = bt.indicators.AverageDirectionalMovementIndex(period=14)
        self.order = None
        self.stop  = None
    
    def next(self):
        if self.order:
            return
        
        regime_ok = (not self.p.adx_filter) or (self.adx.lines.dix[0] > self.p.adx_min)
        
        if not self.position:
            if (self.rsi[0] < self.p.rsi_entry and
                self.data.close[0] > self.ema[0] and
                regime_ok):
                size = int(self.broker.cash * self.p.risk_pct /
                          (self.atr[0] * self.p.stop_atr_mult))
                self.order = self.buy(size=size)
                self.stop  = self.data.close[0] - self.atr[0] * self.p.stop_atr_mult
        else:
            if (self.data.close[0] < self.stop or
                self.rsi[0] > self.p.rsi_exit):
                self.order = self.sell()

def run_backtest(params, ticker='SPY', start='2025-01-01', end='2026-06-30'):
    """Run backtest with given params. Returns Sharpe, MaxDD, trades, win rate."""
    df = yf.download(ticker, start=start, end=end, auto_adjust=True)
    data = bt.feeds.PandasData(dataname=df)
    
    cerebro = bt.Cerebro()
    cerebro.adddata(data)
    cerebro.addstrategy(EvolvingStrategy, **params)
    cerebro.broker.setcash(1_000_000)
    cerebro.broker.setcommission(commission=0.001)
    cerebro.addanalyzer(bt.analyzers.SharpeRatio, _name='sharpe')
    cerebro.addanalyzer(bt.analyzers.DrawDown, _name='drawdown')
    cerebro.addanalyzer(bt.analyzers.TradeAnalyzer, _name='trades')
    
    results = cerebro.run()
    strat = results[0]
    
    sharpe = strat.analyzers.sharpe.get_analysis().get('sharperatio', 0) or 0
    maxdd  = strat.analyzers.drawdown.get_analysis().get('max', {}).get('drawdown', 0)
    ta = strat.analyzers.trades.get_analysis()
    total_trades = ta.get('total', {}).get('closed', 0)
    wins = ta.get('won', {}).get('total', 0)
    win_rate = wins / total_trades if total_trades > 0 else 0
    
    return {'sharpe': round(sharpe, 3), 'maxdd': round(maxdd, 2),
            'trades': total_trades, 'win_rate': round(win_rate, 3)}
```

**Step 3 — Side-by-Side Comparison (7 min)**
```python
results_v1 = run_backtest(V1_0)
results_v2 = run_backtest(V1_1)

comparison = pd.DataFrame({
    'Metric': ['Sharpe Ratio', 'Max Drawdown (%)', 'Total Trades', 'Win Rate'],
    'V1.0 (Original)': [results_v1['sharpe'], results_v1['maxdd'],
                         results_v1['trades'], f"{results_v1['win_rate']:.1%}"],
    'V1.1 (Adapted)':  [results_v2['sharpe'], results_v2['maxdd'],
                         results_v2['trades'], f"{results_v2['win_rate']:.1%}"],
})
print(comparison.to_string(index=False))

verdict = "V1.1 BETTER" if results_v2['sharpe'] > results_v1['sharpe'] else "INCONCLUSIVE or REVERT"
print(f"\nVerdict: {verdict}")
```

**Step 4 — IC Comparison (10 min)**
```python
def compute_ic(ticker, params, period='1y'):
    """Compute IC for a strategy version on recent data."""
    df = yf.download(ticker, period=period, interval='1d', auto_adjust=True)
    df.ta.rsi(length=14, append=True)
    df.ta.ema(length=params['ema_period'], append=True)
    df['Forward_Return'] = df['Close'].shift(-5).pct_change(5)
    
    col = f"EMA_{params['ema_period']}"
    df['Signal'] = (
        (df['RSI_14'] < params['rsi_entry']) &
        (df['Close'] > df[col])
    ).astype(float)
    
    clean = df[['Signal', 'Forward_Return']].dropna()
    ic, p = spearmanr(clean['Signal'], clean['Forward_Return'])
    return round(ic, 4), p

ic_v1, _ = compute_ic('SPY', V1_0)
ic_v2, _ = compute_ic('SPY', V1_1)
print(f"\nIC Comparison:\n  V1.0: {ic_v1}\n  V1.1: {ic_v2}")
print("IC improvement:", round(ic_v2 - ic_v1, 4))
```

#### Block 3 — Independent Work (8:50–9:15 PM) | 25 min

Run with your own V1.0 and V1.1 on your primary trading ticker. Answer:
1. Did your adaptation improve Sharpe and reduce drawdown? State the numbers.
2. Did IC improve? By how much?
3. Which outcome category applies: better, neutral, worse, or insufficient data?
4. What is your Month 5 recommendation based on this evidence?

**Extension:** Test a V1.2 — a third version with an additional modification. Does adding another layer help, hurt, or show diminishing returns?

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 min

Two students present their comparison tables. Class votes: does the evidence support the adaptation?

---

## FRIDAY — July 24, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** Three weeks of Month 4 data. V1.1 live results summary.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
"Run the full comparison: your V1.0 backtest vs. V1.1 backtest vs. your actual Month 3–4 live results. Are the three numbers consistent? If not — what explains the gap between backtest and live?"

---

### EVENING: Review & Market Session (8:00–9:30 PM EST)

#### Pre-Session Setup
- [ ] Version comparison table complete
- [ ] IC comparison computed
- [ ] Month 4 forward plan drafted (one paragraph)

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 min

Each student presents their version comparison in under 3 minutes: V1.0 vs. V1.1 Sharpe, drawdown, IC, and verdict. Then one sentence: Month 5 recommendation.

FINN's framing: "The evidence decides. Not confidence. Not intuition."

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 min

Pull up the OOS comparison period (2025–2026) on TradingView. Walk through the out-of-sample data period that both strategy versions were tested on:
- What was the dominant market regime during that period?
- Does V1.1's improvement make sense given that regime?
- Would V1.0 have caught any trades that V1.1 filtered out (due to ADX, etc.)?

Standard chart review: SPY (daily/weekly), VIX.

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 min
Standard options observation.

#### Block 4 — Milestone 3 Preview & Close (9:20–9:30 PM) | 10 min

**Milestone 3 is August 1 (Week 16 Friday).**

Format: Individual 30-minute reviews covering:
- Journal audit: completeness, quality
- P&L vs. SPY attribution
- Strategy adherence rate
- Adaptation review: was the change evidence-based?
- Month 5 forward plan

**Pre-reading for Week 16:** Re-read your full trading journal for Months 3–4 before Monday. Have your complete Month 4 analytics run. Pull your total return, win rate, and rule adherence across both months.

---

## WEEKLY DELIVERABLES SUMMARY

| Deliverable | Due | Format |
|-------------|-----|--------|
| V1.0 and V1.1 parameters documented | Monday 11:59 PM | `strategy_v1.md` in GitHub |
| Strategy evolution notebook (W15) | Wednesday 11:59 PM | `.ipynb` pushed to GitHub |
| Version comparison table + IC comparison | Wednesday 11:59 PM | In notebook markdown |
| Trading journal — all trades this week | Friday 11:59 PM | Updated `.md` in GitHub |

---

## INSTRUCTOR NOTES FOR WEEK 15

**The honest comparison:** Students may want to report that their adaptation worked regardless of the data. When the numbers don't support it — name it directly: "The evidence says neutral. That is a valid finding. It tells you the adaptation didn't help, which narrows the search space for Month 5." Frame neutral results as data, not failure.

**OOS data period:** Emphasize that the comparison must use out-of-sample data. Students who run V1.1 on the same data they used to design V1.1 are doing in-sample testing and will see false improvements. The OOS period should be data not used in any previous design or optimization.

**Version control as discipline:** The GitHub commit format taught in Block 2 is professional practice — quant teams document strategy changes with this level of rigor. Students who treat their strategy as informal notes are not building the habit. Push this as a standards expectation.

---

## WEEKLY RESOURCES

> Resources are labeled **[Pre-session]** (review before class) or **[Homework]** (explore after). Week 15 returns to backtesting fundamentals — now applied to a real adaptation comparison.

---

### Monday — Strategy Evolution Framework

- **[Article | Pre-session]** [Dangers of Backtesting — Portfolio Optimization](https://bookdown.org/palomar/portfoliooptimizationbook/8.3-dangers-backtesting.html) — Palomar / Bookdown. Re-read with the adaptation comparison in mind. Section 8.3's data-snooping warning applies directly to running V1.1 on the same data you designed it on. Read before Monday.

- **[Article | Homework]** [Guide to Quantitative Trading Strategies and Backtesting](https://www.pyquantnews.com/free-python-resources/guide-to-quantitative-trading-strategies-and-backtesting) — PyQuant News. The "evaluation methodology" section covers walk-forward testing — the gold standard for strategy comparison. Read after Monday's session.

---

### Wednesday — Before/After Backtest Build

- **[Article | Pre-session]** [Backtrader for Backtesting (Python) — A Complete Guide](https://algotrading101.com/learn/backtrader-for-backtesting/) — AlgoTrading101. Refresher on the Backtrader framework used in Wednesday's build. Specifically: review the analyzers section — SharpeRatio and DrawDown analyzers are used in the comparison.

- **[Article | Reference]** [Creating and Backtesting Trading Strategies with Backtrader](https://www.pyquantnews.com/free-python-resources/creating-and-backtesting-trading-strategies-with-backtrader) — PyQuant News. Keep open during Wednesday's workshop as a code reference.

- **[Article | Homework]** [Implement Walk-Forward Optimization with XGBoost for Stock Price Prediction](https://blog.quantinsti.com/walk-forward-optimization-python-xgboost-stock-prediction/) — QuantInsti. Preview of Month 5's ML approach — the walk-forward methodology here is the rigorous version of the comparison we build today with rules-based strategies.

---

### Friday — Version Comparison & Milestone 3 Preview

- **[Article | Pre-session]** [Information Coefficient (IC) — How It Works](https://www.fe.training/free-resources/portfolio-management/information-coefficient-ic/) — FE Training. Quick refresh on the IC formula used in Step 4 of the workshop. Useful before Friday's retrospective.

---

*FINN Week 15 — Strategy Evolution | Part of FINN_Month04.md*
