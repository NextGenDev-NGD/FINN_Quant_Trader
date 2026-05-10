# FINN — Week 7: Backtesting & Strategy Logic
## Quant Methods Phase | Month 2: Quant Methods, AI Integration & Strategy Development
**Dates:** May 25–30, 2026
**Week Number:** 7 of 24

---

## WEEK OVERVIEW

### Theme
Testing your edge against history. Rigorously. Without lying to yourself. This is the most methodologically critical week of Month 2 — students learn both how to build a backtest and how to prevent it from lying to them. The Monday session is ASYNC due to Memorial Day.

### Learning Objectives
By the end of this week, students will be able to:
- Define and identify look-ahead bias in Python code and explain why it invalidates a backtest
- Explain walk-forward testing and draw the train/test window progression diagram
- Name the 7 backtesting best practices rules and apply them to a real strategy
- Distinguish between in-sample and out-of-sample performance
- Build a complete Backtrader strategy with entry/exit logic, position sizing, and realistic cost modeling
- Interpret a QuantStats tear sheet: CAGR, Sharpe, max drawdown, benchmark comparison
- Explain why a backtest with 15 tuned parameters and Sharpe > 2 is suspicious

### Materials Needed
- `finnenv` — `backtrader`, `quantstats`, `yfinance`, `pandas`, `pandas_ta` installed
- GitHub repo — starter notebook `W07_workshop_backtest_starter.ipynb`
- Milestone 2 strategy hypothesis (locked Friday May 22 — students reference this Wednesday)
- `W07_async_monday_package.md` — completed before Wednesday class (assigned May 22)

### Pre-Week Checklist (Instructor)
- [ ] **Monday May 25 is Memorial Day — no live class**
- [ ] Verify `W07_async_monday_package.md` was completed by Tuesday May 26 (track in GitHub)
- [ ] Push `W07_workshop_backtest_starter.ipynb` to GitHub before Wednesday
- [ ] Verify `backtrader` and `quantstats` are installed in `finnenv`
- [ ] Assign DMB rotation for Wednesday and Friday only
- [ ] Review student Milestone 2 hypotheses submitted Friday May 22 — prepare feedback
- [ ] Note: Wednesday workshop is the first Backtrader session — high complexity, allow extra Q&A time

---

## MONDAY — May 25, 2026 — MEMORIAL DAY — CLASS CANCELLED

### ASYNC FALLBACK PACKAGE — Week 7 Monday
**Original Session Date:** Monday, May 25, 2026
**Topic:** Backtesting Methodology & Best Practices
**Estimated Completion Time:** 90 minutes
**Due:** Tuesday May 26, 11:59 PM

---

#### Context
Tonight's session would have covered the most important methodological topic in quantitative trading: how to run an honest backtest. A backtest that looks great on historical data and fails live is not a strategy — it's a well-fitted memory. Tonight's async package covers everything you need to know before Wednesday's live Backtrader session.

#### Required Reading
- Wiki Section 7.1 — Backtesting best practices (all 7 rules — read twice)
- Wiki Section 7.2 — Backtesting tools comparison
- Wiki Section 4.3 — Code Pattern 3 (Backtrader SMA crossover template)
- External resource: [QuantStart — "Basics of Statistical Mean Reversion Testing"](https://www.quantstart.com/articles/Basics-of-Statistical-Mean-Reversion-Testing/) (free article)

#### Guided Notes — Answer These in Writing

Use Cornell format. Answer each question thoughtfully.

1. "What is look-ahead bias? Give me an example in code — specifically, what line of Python would introduce look-ahead bias into a feature matrix?"

2. "What is walk-forward testing? Draw a diagram (on paper or in markdown) showing the train/test window progression over 3 years of data."

3. "We backtested the RSI strategy in Week 5 with statistics. How is running the same strategy through Backtrader different from the statistical test we ran? What does Backtrader add that the t-test doesn't capture?"

4. "Name the 3 most dangerous backtesting pitfalls. For each: what is it, how does it inflate results, and how do you protect against it?"

5. "You run a backtest and get a Sharpe of 2.1 with a max drawdown of −8%. The strategy has 15 free parameters you tuned on the same data. Should you trust this result? Why or why not?"

#### Self-Study Exercise
Read through Code Pattern 3 (Backtrader SMA crossover) from the curriculum wiki. Without running it, trace through the logic manually:
- What does `__init__` set up?
- What does `next()` do on each bar?
- What is `cerebro`?
- What would happen if `sma_fast` period equaled `sma_slow` period?

Write your answers in a markdown file: `W07_async_monday_[initials].md`

#### Submission
- [ ] Cornell notes pushed to GitHub: `W07_async_monday_notes_[initials].md`
- [ ] Self-study exercise file: `W07_async_monday_[initials].md`

#### Questions?
Post in the course communication channel. Tag the instructor. All async questions answered within 24 hours.

---

## WEDNESDAY — May 27, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** Not yet active — still pre-paper-trading.

**Observation Assignment:** "Before tonight's class, review your Milestone 2 strategy hypothesis. Find a period in the last 6 months of chart history where your strategy's entry signal would have triggered. Write down: the date, the signal reading, and what the stock did over the following 5 days. Bring it as a manual backtest data point."

---

### EVENING: Workshop Session (8:00–9:30 PM EST)
**Workshop:** W7 — First Full Backtrader Backtest — From Feature Matrix to Strategy
**Notebook:** `W07_workshop_backtest_[initials].ipynb`
**Curriculum Source:** Wiki Sections 7.1, 7.2, Code Pattern 3

#### Pre-Session Setup
- [ ] `backtrader` and `quantstats` verified in `finnenv`
- [ ] Async package completion verified for each student (check GitHub before class)
- [ ] Starter notebook pulled from GitHub
- [ ] Milestone 2 strategy hypothesis document open for reference during Block 3

#### Block 1 — Framing (8:00–8:10 PM) | 10 min

"Monday was async — you read about backtesting. Tonight we run one.

We're going to build a complete Backtrader strategy using the RSI signal we statistically tested in Week 5. We'll apply the 7 best practices rules from the async reading to make sure the backtest is honest.

At the end of tonight you'll have a real equity curve, a Sharpe ratio, a max drawdown, and a benchmark comparison — all from code you wrote. You'll also see exactly how easy it is to accidentally build a backtest that lies."

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 min

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
print("Data loaded successfully for SPY: 2021-2024")
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
*Deliberate pause: "Look at the entry condition — `self.data.close[0]`. The `[0]` means the CURRENT bar. `[-1]` means one bar ago. `[-2]` means two bars ago. This is Backtrader's way of accessing the time series. If you accidentally use `[1]` (positive index), you'd get the NEXT bar — look-ahead bias. Always `[0]` or negative."*

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

> **Resource:** Performance metrics reference — Sharpe, max drawdown, win rate, and expectancy — use to interpret the QuantStats tear sheet output and benchmark comparison produced in Step 4 → `resources/infographics/ig_performance_metrics.html`

#### Block 3 — Independent Work (8:50–9:15 PM) | 25 min

**Core Exercise:**
Modify `RSIMeanReversionStrategy` to test your own Milestone 2 strategy hypothesis. Change at minimum:
- The ticker (use your own chosen asset)
- The entry and/or exit conditions (apply your own signal logic)
- The parameter values (different RSI thresholds or holding period)

Run it and record: Sharpe, max drawdown, win rate, total trades, total return vs. benchmark.

**Extension Challenge:**
Run the same strategy with 3 different RSI entry thresholds: 25, 30, 35. Create a comparison table of results. Which threshold performs best? Does optimizing for the best threshold create an overfitting risk? Explain.

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 min

**Share-out:** 2 students share their backtest results — especially if they underperformed the benchmark. "Underperforming the benchmark is not failure. It is information. Your job at Milestone 2 is to honestly interpret what the backtest found — not to present a winning strategy. A well-analyzed losing backtest is worth more than a poorly-analyzed winning one."

**Muddiest Point:**
> *"The muddiest point from tonight was ___."*

**Wednesday Deliverable:** Completed notebook `W07_workshop_backtest_[initials].ipynb` submitted to GitHub by 11:59 PM

---

## FRIDAY — May 29, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** Not yet active — still pre-paper-trading.

---

### EVENING: Review & Market Session (8:00–9:30 PM EST)

#### Pre-Session Setup
- [ ] Hypothesis log reviewed — all Week 7 hypotheses for audit
- [ ] TradingView with SPY daily + RSI overlay ready
- [ ] Each student's backtest results accessible (from Wednesday notebook)

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 min

1. "Explain look-ahead bias. Show me — in code — specifically where it would appear if someone accidentally introduced it into the Backtrader strategy."

2. "We used `cerebro.broker.setcommission(0.001)` and slippage in the backtest. Why? What happens to a strategy's results if you run a backtest without modeling these costs?"

3. "Your backtest Sharpe was 0.9 over 4 years. Is that a promising result? How would you determine whether it's real alpha or data-fitted noise?"

4. "What is the difference between in-sample and out-of-sample performance? Why does an in-sample Sharpe of 1.8 mean almost nothing by itself?"

5. "Draw the walk-forward testing diagram on paper right now. Explain it out loud."

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 min

**Hypothesis Audit:** Close all Week 7 hypotheses.

**Backtest vs. Live Reality:**
"This week we ran backtests. This week the market also ran live. Let's compare. What did our RSI strategy signal this week on SPY? Pull up the TradingView RSI panel — was RSI below 30 at any point this week? If so, would our strategy have entered? What happened after?

This is the most important exercise we do this month: the backtest says the strategy works over 4 years. This week is one data point of live performance. How do they align?"

Walk through SPY chart with RSI and MACD overlaid. Compare to backtest entry/exit rules explicitly.

**Sector Rotation:** Standard Finviz heatmap review.

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 min

Standard checklist. Note any unusual options activity going into the final week before Milestone 2. "Options expiration next week falls right in Milestone 2 week. Watch for volatility around the presentations."

#### Block 4 — Milestone 2 Final Prep & Close (9:20–9:30 PM) | 10 min

"Milestone 2 presentations are next Friday, June 5. 15 minutes each + 5 minutes Q&A. If class is large, overflow continues Saturday June 6 at the same time slot. Slides are not required — a clean Jupyter notebook and clear explanation is sufficient.

By end of this weekend, you should have:
- Your backtest running and producing results
- Your performance metrics calculated and charted
- A draft of your 6-section presentation structure (from Wiki Section 7.3)

We will not be teaching new material Monday. Monday is refinement and strategy polish."

**Assign reading for Monday:**
- Wiki Section 6.1 — AI/LLM in trading (full)
- Wiki Section 6.2 — Sentiment analysis pipeline and FinBERT

Note: Monday introduces AI/LLM integration as a conceptual layer. Students who want to incorporate sentiment into their Milestone 2 presentation may do so as an optional extension. It is not required for Milestone 2 pass criteria.

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

## WEEKLY DELIVERABLES SUMMARY

| Deliverable | Due | Format |
|-------------|-----|--------|
| Async Monday Package | Tuesday 11:59 PM | Markdown pushed to GitHub |
| Reading Notes + 3 Hypotheses | Wednesday 11:59 PM | Markdown in hypothesis log |
| Workshop Notebook (W07) | Wednesday 11:59 PM | `.ipynb` pushed to GitHub |
| Weekly Review Log | Friday 11:59 PM | Markdown |
| Hypothesis Outcome Record | Friday 11:59 PM | Appended to hypothesis log |

---

## INSTRUCTOR NOTES FOR WEEK 7

**Async package follow-through:** Before Wednesday's class, check GitHub to confirm every student pushed their async notes. If someone didn't complete it — they enter the Backtrader session with incomplete conceptual prep. Give them 10 minutes at the start of class to read the async answers from a classmate before the guided build begins.

**Backtrader complexity management:** Backtrader has a steep learning curve. The `self.data.close[0]` vs. `self.data.close[-1]` indexing is confusing initially. The key insight to deliver: "Backtrader runs `next()` on every bar. Inside `next()`, index [0] = today, [-1] = yesterday. Positive indices are the future — never use them." Write this on the board and leave it there for the whole session.

**Look-ahead bias demonstration:** When explaining `self.data.close[1]` as look-ahead bias, demonstrate it by running a version of the strategy with and without the error. The "look-ahead" version will produce dramatically better results. That contrast — the same strategy, one honest and one accidentally cheating — is the most powerful demonstration of why this matters.

**Underperformance is a learning outcome:** Many students' first backtests will show they underperform SPY. This is NOT a failure — it's information. A student who understands WHY their strategy underperforms SPY demonstrates more genuine insight than one who has a suspiciously good result. Celebrate the honest analysis.

**Extension challenge warning:** The parameter optimization extension (testing 3 RSI thresholds) is designed to create a teaching moment. The student who "finds" that RSI < 25 produces the best results is demonstrating exactly the multiple testing / overfitting problem from Week 5. Connect it explicitly: "You just ran 3 tests. You're going to pick the best. That's data snooping."

---

## WEEKLY RESOURCES

> Resources are labeled **[Pre-session]** (review before class) or **[Homework]** (explore after). Monday this week is ASYNC (Memorial Day) — resources are the session.

---

### Monday — ASYNC: Backtesting Methodology & Bias Recognition

> **Memorial Day — No live class.** The async package replaces Monday's session. These resources are the backbone of that independent work.

- **[Article | Async Required]** [Backtrader for Backtesting (Python) — A Complete Guide](https://algotrading101.com/learn/backtrader-for-backtesting/) — AlgoTrading101. The most comprehensive English-language Backtrader guide available. Covers installation, creating a strategy class, adding indicators, setting position sizing, and interpreting results. Read sections 1–6 as part of the async package.

- **[Article | Async Required]** [Backtesting with Backtrader: Step-by-Step](https://www.pyquantnews.com/the-pyquant-newsletter/backtesting-with-backtrader-step-by-step) — PyQuant News (January 2023). Shorter, practitioner-focused walkthrough that focuses on the workflow rather than the full API. Pairs well with the AlgoTrading101 guide — read this second for a different angle on the same framework.

- **[Article | Async Required]** [Basics of Statistical Mean Reversion Testing](https://www.quantstart.com/articles/Basics-of-Statistical-Mean-Reversion-Testing/) — QuantStart. The strategy logic we build in Wednesday's workshop is a mean-reversion SMA strategy. Read this to understand the statistical foundation before building the code.

- **[Article | Homework]** [p-Hacking and Multiple Comparisons Bias](https://www.quantrocket.com/code/?repo=quant-finance-lectures&path=/codeload/quant-finance-lectures/quant_finance_lectures/Lecture23-p-Hacking-and-Multiple-Comparisons-Bias.ipynb.html) — QuantRocket. FINN's Monday async content covers the 7 backtesting best practices. This lecture is the mathematical backbone of Rule #1: don't test 50 variations and report only the best result. This is required context for understanding why overfitting is statistically inevitable without walk-forward testing.

---

### Wednesday — Backtrader Workshop: Building the Full Strategy

- **[Article | Pre-session]** [Creating and Backtesting Trading Strategies with Backtrader](https://www.pyquantnews.com/free-python-resources/creating-and-backtesting-trading-strategies-with-backtrader) — PyQuant News. Full implementation article — runs a complete SMA strategy with Backtrader and interprets the output. Preview before Wednesday's session so you're not reading API docs during class.

- **[Article | Reference]** [Backtrader Python Tutorial: Build, Backtest & Automate Trading Strategies](https://www.quantvps.com/blog/backtrader-tutorial) — QuantVPS (February 2026). More recent tutorial with specific coverage of walk-forward optimization and how to validate out-of-sample results. Use this for the walk-forward section of the workshop.

- **[YouTube | Pre-session]** Search YouTube for: *"backtrader python tutorial 2023 SMA strategy backtest"* — look for a video that builds a complete strategy: `__init__`, `next()`, position sizing, and then analyzes the output tear sheet. Target: 20–35 min. The more the video shows mistakes and corrections (look-ahead errors, wrong shift() usage), the better.

---

### Friday — Backtest Results vs. Live Week & Strategy Calibration

- **[Article | Pre-session]** [The Ultimate Guide to Backtesting Trading Strategies in Python](https://www.blog.brightcoding.dev/2025/12/02/the-ultimate-guide-to-backtesting-trading-strategies-in-python-from-zero-to-trading-hero/) — BrightCoding (December 2025). Comprehensive review article covering the full backtest process — good to read before Friday's session where we compare your backtest results against the actual market behavior this week.

- **[Article | Homework]** [Dangers of Backtesting — Portfolio Optimization](https://bookdown.org/palomar/portfoliooptimizationbook/8.3-dangers-backtesting.html) — Daniel Palomar / Bookdown. Academic-level treatment of backtesting pitfalls: look-ahead bias, survivorship bias, data-snooping. Read this weekend — it directly prepares you for Milestone 2 where FINN will ask: "what could make your backtest invalid?"

---

*FINN Week 7 — Backtesting & Strategy Logic | Part of FINN_Month02.md*
