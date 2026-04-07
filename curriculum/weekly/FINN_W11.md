# FINN — Week 11: Reading Live Performance
## Paper Trading Phase I | Month 3: Paper Trading I
**Dates:** June 22–27, 2026
**Week Number:** 11 of 24

---

## WEEK OVERVIEW

### Theme
Three weeks of data. Not enough to judge a strategy, but enough to start asking the right questions.

### Learning Objectives
By the end of this week, students will be able to:
- Decompose portfolio returns into market contribution (beta) and strategy alpha
- Classify the current market regime using VIX, SMA, ADX, and momentum
- Identify whether strategy underperformance is driven by rule deviation, regime mismatch, or genuine edge loss
- Apply the three-question framework for evaluating strategy performance
- Build a Python function that performs P&L attribution and outputs alpha vs. SPY
- Interpret the statistical significance of estimated alpha given sample size

### Materials Needed
- `finnenv` environment — all previous packages plus `scipy`
- Webull paper account — minimum 3 weeks of active paper trading
- Starter notebook: `W11_workshop_analytics_starter.ipynb`
- Complete trading journal with all trades through Week 10
- Rule-adherence analysis (DMB assignment): rule-following trades vs. deviation trades separated and average P&L computed

### Pre-Week Checklist (Instructor)
- [ ] Push `W11_workshop_analytics_starter.ipynb` to GitHub
- [ ] Prepare regime detection discussion: what regime was the market in during June 8–22?
- [ ] Prepare for mid-month performance presentations (Friday retrospective format)
- [ ] Journal audit: before Wednesday, review each student's journal for completeness — missing post-trade reviews must be flagged

---

## MONDAY — June 22, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse (Block 1 — standing addition from Month 3):**
Three-week cumulative P&L. Beginning to see meaningful data.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Look at your trade journal for all trades placed so far. Group your trades into two categories: trades that followed your rules exactly, and trades where you deviated in any way. What is the average P&L for each group? Write it down and bring it tonight."

---

### EVENING: Theory Session (8:00–9:30 PM EST)
**Topic:** P&L Attribution, Regime Detection & Strategy vs. Market
**Curriculum Source:** Wiki Sections 3.3, 9.3 (applied), original FINN framework

#### Pre-Session Requirements
- [ ] Full trade journal updated — all 3 weeks of trades logged
- [ ] Rule-following vs. deviation analysis completed (DMB assignment)
- [ ] Portfolio dashboard run and current metrics noted

---

#### Block 1 — Day Review & Rule Adherence Check (8:00–8:15 PM) | 15 minutes

"Who completed the rule-following analysis from the DMB? What was the average P&L on rule-following trades versus deviations?

This is one of the most important data points you will generate in this course. If rule-following trades outperform deviations — the system works and your feelings don't. If deviations outperform — we need to analyze why. Is it a system flaw, or luck?"

---

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 minutes

**Topic A: P&L Attribution (15 min)**

"When your portfolio is up 2% over 3 weeks, what caused it? Was it the strategy? Market direction (beta)? A single lucky trade?

P&L attribution decomposes returns into components:
- **Market contribution (beta):** How much did the overall market rise/fall? If SPY was up 3% and you're up 2% — your strategy underperformed the market.
- **Strategy alpha:** Return above what the market alone would have given you. Alpha = Your Return − (Beta × Market Return)
- **Individual trade contribution:** Which specific trades drove the P&L? Are returns concentrated in 1–2 trades, or distributed across many?
- **Sizing contribution:** Did you make more on bigger positions? Did sizing work?

The goal of attribution is to understand WHETHER your strategy is generating edge — or whether you're just riding the market."

Whiteboard example:
```
Portfolio return: +2.4%
SPY return:       +3.1%
Portfolio beta:    0.7

Beta contribution = 0.7 × 3.1% = +2.17%
Alpha = 2.4% − 2.17% = +0.23%

Interpretation: Most of the gain came from market exposure (beta).
Strategy alpha was positive but small (+0.23%). Not enough data yet to know
if that's genuine alpha or noise.
```

**Topic B: Regime Detection (15 min)**

"Your backtest was likely run across multiple market regimes — trending markets, volatile markets, range-bound markets. Your strategy may work well in one regime and poorly in another.

Three primary regimes and their effect on common strategies:

| Regime | VIX Level | SPY Behavior | Trend-following | Mean-reversion |
|--------|-----------|-------------|-----------------|----------------|
| Bull/Low-vol | < 15 | Steady uptrend | Works well | Struggles |
| Choppy/Mid-vol | 15–25 | Range-bound | Generates losses | Works well |
| Bear/High-vol | > 25 | Sharp, fast moves | Mixed | Dangerous |

How do you know which regime you're in?
- VIX level and trend: rising VIX = changing regime
- ADX on SPY: > 25 = trending, < 20 = range-bound
- 200-day SMA: Price above = bull regime, below = bear

The critical question: was your strategy designed for the current regime? If your strategy is a mean-reversion system and SPY is in a strong trend — it will lose. That is not a broken strategy. That is a mismatched regime."

**Topic C: Strategy vs. Market — The Three Questions (10 min)**

When performance is disappointing, ask these three questions in order:

"**Question 1: Am I following my rules?**
If no — the performance data is contaminated. Fix rule adherence first. Evaluate performance only after you have 2+ consistent rule-following weeks.

**Question 2: Is the market in a regime my strategy works in?**
Check VIX, ADX, 200-SMA. If the regime is wrong for your strategy — reduce position sizes, wait for regime to change, or switch to a regime-appropriate strategy.

**Question 3: Is the strategy's edge still present?**
Run an updated version of Week 5's IC test on recent data (last 60 days). Has the IC declined? Is the signal still statistically meaningful? If IC has collapsed — the edge may be gone. Time to re-research.

Only reach Question 3 after Questions 1 and 2 are answered. Most underperformance is explained by 1 or 2. Very rarely is the strategy genuinely broken."

---

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 minutes

1. "After 3 weeks of paper trading with 12 trades, your Sharpe ratio is 0.6. Your backtest showed 1.4 over 4 years. Is the strategy underperforming? How many trades do you need before you can statistically compare the two?"
   *(Expected: 12 trades is nothing. Sharpe needs hundreds of observations to be stable. The Law of Large Numbers — 3 weeks of results tells you very little about the long-term expectation. Need at least 30–50 trades for preliminary signal.)*

2. "Your rule-following trades averaged +0.3% and your deviations averaged −0.8%. A student argues: 'This just means I deviated on the bad ones.' Is that a valid counter-argument? How would you test it?"
   *(Expected: Valid concern — selection bias. Need to check: did you deviate on setups that looked identical to rule-following setups? Or did you deviate specifically when the setup 'looked bad'? If the latter, your gut may be detecting genuine poor quality setups — but you need more data.)*

3. "Devil's advocate: If your strategy only works in trending markets, and markets are only trending 30% of the time, is the strategy useful? Why not just buy SPY?"
   *(Expected: If the strategy generates strong alpha during its 30% active periods, it can still be worth running — especially if it's hedged or sized down during non-trending periods. Regime-conditional strategies are valid but need explicit regime filters built into the entry rules.)*

---

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 minutes

**Wednesday workshop:**
"We build a live portfolio analytics notebook that performs P&L attribution, computes rolling alpha vs. SPY, and runs a regime detection filter. Starter: `W11_workshop_analytics_starter.ipynb`. Bring your complete trade journal — we'll import it into the notebook."

**Pre-reading:** None this week — fully applied focus.

**Journal audit requirement:**
"Before Wednesday's class, audit your own journal. Every trade must have all fields completed — including post-trade review for any trade closed so far. Missing post-trade reviews must be written by Wednesday."

**Monday Deliverable:** Reading Notes + 3 Hypotheses by 11:59 PM

---

## WEDNESDAY — June 24, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse (Block 1):** Check for any regime shifts since Monday.

---

### EVENING: Workshop Session (8:00–9:30 PM EST)
**Workshop:** W11 — Live Portfolio Analytics — Attribution, Alpha, Regime Detection
**Notebook:** `W11_workshop_analytics_[initials].ipynb`
**Curriculum Source:** Wiki Sections 3.3, 9.3

#### Pre-Session Setup
- [ ] `finnenv` running, repo pulled
- [ ] Complete trade journal available (all trades Week 9–11)
- [ ] `W11_workshop_analytics_starter.ipynb` open
- [ ] Post-trade reviews written for all closed trades

---

#### Block 1 — Framing & Context Bridge (8:00–8:10 PM) | 10 minutes

"Three weeks of live trading. Tonight we analyze what actually happened. Not just P&L — but WHY. Where did the returns come from? Was it skill, beta, luck, or a combination?

By the end of tonight you'll have a Python function that takes your trade journal and produces a complete attribution analysis. This is the kind of analysis that portfolio managers run monthly. We're running it on our third week of paper trading."

---

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 minutes

```python
import pandas as pd
import numpy as np
import yfinance as yf
import matplotlib.pyplot as plt
from scipy import stats
import warnings
warnings.filterwarnings('ignore')

# Load trade journal from GitHub (or paste directly for workshop)
# Format: date, ticker, direction, entry, exit, shares, pnl, rule_followed
# Students import their own journal data here

# Sample journal data (replace with real data)
journal_data = {
    'date':          ['2026-06-10', '2026-06-11', '2026-06-15', '2026-06-17', '2026-06-22'],
    'ticker':        ['SPY',        'QQQ',         'AAPL',       'SPY',        'MSFT'],
    'direction':     ['Long',       'Long',        'Long',       'Long',       'Short'],
    'entry':         [538.20,       470.50,        195.30,       541.00,       432.80],
    'exit':          [542.10,       468.20,        198.75,       538.50,       429.10],
    'shares':        [50,           40,            100,          50,           30],
    'pnl':           [195.0,        -92.0,         345.0,        -125.0,       111.0],
    'rule_followed': [True,         True,          True,         False,        True]
}
trades_df = pd.DataFrame(journal_data)
trades_df['date'] = pd.to_datetime(trades_df['date'])
trades_df['return_pct'] = trades_df['pnl'] / (trades_df['entry'] * trades_df['shares'])
print("Trade journal loaded:")
print(trades_df[['date','ticker','direction','pnl','return_pct','rule_followed']].to_string())
```

**Step 1 — Basic P&L summary (8 min)**
```python
def trade_summary(trades_df, starting_capital=1_000_000):
    """Comprehensive trade summary statistics."""
    total_pnl      = trades_df['pnl'].sum()
    total_return   = total_pnl / starting_capital

    wins           = trades_df[trades_df['pnl'] > 0]
    losses         = trades_df[trades_df['pnl'] < 0]
    win_rate       = len(wins) / len(trades_df) if len(trades_df) > 0 else 0

    avg_win        = wins['pnl'].mean() if len(wins) > 0 else 0
    avg_loss       = abs(losses['pnl'].mean()) if len(losses) > 0 else 0
    rr_ratio       = avg_win / avg_loss if avg_loss > 0 else float('inf')
    expectancy     = (win_rate * avg_win) - ((1 - win_rate) * avg_loss)

    rule_trades    = trades_df[trades_df['rule_followed']]
    deviation_trades = trades_df[~trades_df['rule_followed']]
    rule_pnl_avg   = rule_trades['pnl'].mean() if len(rule_trades) > 0 else 0
    dev_pnl_avg    = deviation_trades['pnl'].mean() if len(deviation_trades) > 0 else 0

    print(f"\n{'='*50}")
    print(f"TRADE SUMMARY — Month 3 Week 11")
    print(f"{'='*50}")
    print(f"Total Trades:        {len(trades_df)}")
    print(f"Total P&L:           ${total_pnl:+,.2f} ({total_return:+.2%})")
    print(f"Win Rate:            {win_rate:.1%}")
    print(f"Avg Win:             ${avg_win:,.2f}")
    print(f"Avg Loss:            ${avg_loss:,.2f}")
    print(f"Risk:Reward:         {rr_ratio:.2f}")
    print(f"Expectancy:          ${expectancy:+,.2f} per trade")
    print(f"\n{'─'*30} RULE ADHERENCE {'─'*5}")
    print(f"Rule-following avg:  ${rule_pnl_avg:+,.2f} ({len(rule_trades)} trades)")
    print(f"Deviation avg:       ${dev_pnl_avg:+,.2f} ({len(deviation_trades)} trades)")

    return {
        'total_pnl': total_pnl, 'win_rate': win_rate,
        'rr_ratio': rr_ratio, 'expectancy': expectancy
    }

summary = trade_summary(trades_df)
```

**Step 2 — Alpha vs. Beta attribution (12 min)**
```python
def calculate_alpha_beta(trades_df, benchmark='SPY'):
    """
    Attribute portfolio returns to market (beta) vs. strategy (alpha).
    """
    # Get benchmark returns for same dates
    start = trades_df['date'].min()
    end   = trades_df['date'].max() + pd.Timedelta(days=1)
    bm    = yf.download(benchmark, start=start, end=end,
                         progress=False)['Close'].pct_change().dropna()
    bm.index = pd.to_datetime(bm.index.date)

    # Daily portfolio returns (simplified from trade P&L)
    daily_pnl = trades_df.groupby('date')['pnl'].sum()
    daily_ret = daily_pnl / 1_000_000

    # Align dates
    common = daily_ret.index.intersection(bm.index)
    if len(common) < 3:
        print("Not enough data for regression. Need at least 3 matched trading days.")
        return

    port_ret = daily_ret[common]
    bm_ret   = bm[common]

    # Regression: portfolio_return = alpha + beta × market_return
    slope, intercept, r_value, p_value, std_err = stats.linregress(bm_ret, port_ret)

    beta  = slope
    alpha = intercept * 252  # Annualized alpha

    print(f"\n{'='*50}")
    print(f"ALPHA/BETA ATTRIBUTION")
    print(f"{'='*50}")
    print(f"Portfolio Beta:      {beta:.3f}")
    print(f"Annualized Alpha:    {alpha:.2%}")
    print(f"R² (market explain): {r_value**2:.3f}")
    print(f"p-value (alpha):     {p_value:.4f}")
    print(f"\nInterpretation:")
    print(f"  {r_value**2:.1%} of returns explained by market movement")
    print(f"  {1-r_value**2:.1%} of returns from strategy (alpha + noise)")
    if p_value < 0.05:
        print(f"  Alpha is statistically significant ✓")
    else:
        print(f"  Alpha is NOT statistically significant yet (need more trades)")

    return {'beta': beta, 'alpha': alpha, 'r_squared': r_value**2}

attribution = calculate_alpha_beta(trades_df)
```

**Step 3 — Regime detection (10 min)**
```python
def detect_market_regime(benchmark='SPY', period='3mo'):
    """
    Classify current market regime for strategy selection.
    Returns regime label and key metrics.
    """
    df = yf.download(benchmark, period=period, interval='1d', progress=False)
    df.columns = [c[0] if isinstance(c, tuple) else c for c in df.columns]

    # Trend filter: price vs 200-day SMA (use 60-day for shorter period)
    df['SMA_60']   = df['Close'].rolling(60).mean()
    above_sma      = df['Close'].iloc[-1] > df['SMA_60'].iloc[-1]

    # Volatility: current VIX proxy (21-day realized vol annualized)
    df['Ret']      = df['Close'].pct_change()
    realized_vol   = df['Ret'].rolling(21).std().iloc[-1] * np.sqrt(252)

    # Momentum: 20-day price change
    momentum_20    = (df['Close'].iloc[-1] / df['Close'].iloc[-20] - 1)

    # ADX proxy: directional movement strength
    high_low       = df['High'] - df['Low']
    adx_proxy      = high_low.rolling(14).mean().iloc[-1] / df['Close'].iloc[-1]

    # Classify regime
    if above_sma and realized_vol < 0.18 and momentum_20 > 0.01:
        regime = "BULL_TRENDING"
        strategy_note = "Trend-following strategies favored. Mean reversion may underperform."
    elif above_sma and realized_vol < 0.18 and abs(momentum_20) < 0.01:
        regime = "BULL_RANGING"
        strategy_note = "Mean reversion strategies favored. Range-bound conditions."
    elif realized_vol > 0.25:
        regime = "HIGH_VOLATILITY"
        strategy_note = "Reduce position sizes by 50%. Both strategies struggle in chaos."
    elif not above_sma and momentum_20 < -0.01:
        regime = "BEAR_TRENDING"
        strategy_note = "Short-biased or hedged strategies only. Reduce long exposure."
    else:
        regime = "TRANSITIONAL"
        strategy_note = "Unclear regime. Reduce sizing, wait for clarity."

    print(f"\n{'='*50}")
    print(f"MARKET REGIME DETECTION — {benchmark}")
    print(f"{'='*50}")
    print(f"Regime:              {regime}")
    print(f"Above 60-day SMA:    {'Yes' if above_sma else 'No'}")
    print(f"Realized Vol (21d):  {realized_vol:.1%}")
    print(f"20-day Momentum:     {momentum_20:+.2%}")
    print(f"\nStrategy Implication:")
    print(f"  {strategy_note}")

    return regime

current_regime = detect_market_regime()
```

---

#### Block 3 — Independent / Pair Work (8:50–9:15 PM) | 25 minutes

**Core Exercise:**
Import your real trade journal data and run all three functions. Answer in markdown:
1. What is your portfolio's alpha vs. SPY? Is it statistically significant?
2. What is the average P&L for rule-following vs. deviation trades?
3. What is the current market regime? Does your strategy fit this regime?
4. Based on all three analyses — what is the single most important thing to change about your trading approach going into Week 12?

**Extension Challenge:**
Build a `weekly_report()` function that:
1. Runs `trade_summary()`
2. Runs `calculate_alpha_beta()`
3. Runs `detect_market_regime()`
4. Outputs a formatted markdown report saved to `weekly_report_[date].md`

This becomes your automated Friday pre-session report for Months 3–6.

---

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 minutes

**Share-out:** Focus on attribution results. "How many of you found that most of your return came from beta, not alpha? That's honest and normal at this stage. What does it tell you about what to do next?"

**Muddiest Point:**
> *"The muddiest point from tonight was ___."*

**Wednesday Deliverable:** `W11_workshop_analytics_[initials].ipynb` to GitHub by 11:59 PM

---

## FRIDAY — June 26, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse (Block 1):** Three full weeks complete. Review all metrics.

---

### EVENING: Review & Market Session (8:00–9:30 PM EST)
**Topic:** Week 11 Review + Month 3 Mid-Point Deep Dive

---

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 minutes

"Tonight's retrospective is a full mid-month performance review. Every student presents their Week 11 analytics in 3 minutes:
1. Total P&L and return %
2. Alpha vs. beta finding
3. Rule adherence rate
4. Current market regime and strategy fit
5. One thing to change in Week 12"

After each student's brief: class asks one question. Instructor gives one coaching point.

This format mirrors the Milestone 3 review that ends Month 4. Practice it now.

---

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 minutes

Standard format plus deep regime analysis:
"What regime are we in right now? Pull up SPY with the 60-day SMA and ADX. Is your strategy the right one for this environment?

For each student's position: Does the current regime support holding this trade? If not — is there a rule in your strategy for regime-based exits? If not, should there be? Would adding a regime filter improve or hurt your backtest?"

---

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 minutes

Standard checklist plus: "Month-end is approaching (June 30). Historically, month-end brings institutional rebalancing flows. Note VIX behavior and put/call ratio going into the final week of June. How might month-end rebalancing affect your open positions?"

---

#### Block 4 — Next Week Preview & Close (9:20–9:30 PM) | 10 minutes

**Next week:** When to adapt a strategy versus when to hold it. The most important and hardest decision in systematic trading.

**Assign reading:**
- Wiki Section 7.1 (re-read rule 6: avoid overfitting)
- Wiki Section 7.3 — Strategy templates (revisit adaptive strategy concept)

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

## WEEKLY DELIVERABLES SUMMARY

| Deliverable | Due | Format |
|-------------|-----|--------|
| Reading Notes + 3 Hypotheses | Monday 11:59 PM | Markdown in hypothesis log |
| Workshop Notebook (W11) | Wednesday 11:59 PM | `.ipynb` pushed to GitHub |
| Journal audit: all post-trade reviews complete | Wednesday 11:59 PM | `trading_journal_[initials].md` |
| Weekly Review Log | Friday 11:59 PM | Markdown |
| Hypothesis Outcome Record | Friday 11:59 PM | Appended to hypothesis log |

---

## INSTRUCTOR NOTES FOR WEEK 11

**Rule adherence as the lead metric:** Frame the DMB observation assignment (rule-following vs. deviation P&L comparison) as the most important analysis of the week. The result should almost always show rule-following trades outperforming deviations — but even when it doesn't, the framework for analyzing the result is the same.

**Mid-month presentation format:** The Friday retrospective format (3 min per student, 5 components) is a dry run for Milestone 3. Make the format feel professional and slightly elevated. Students should feel the expectation of preparation — have their notebook output ready, know their numbers cold, and be able to speak to the regime analysis without looking at notes.

**Alpha vs. beta reality check:** Most students at Week 11 will find that nearly all their return came from market beta. This is correct and expected — they have 2–3 weeks of data and have been long-biased (most strategies are directional). Do not frame this as failure. Frame it as diagnostic: "You haven't proven alpha yet. That's fine. Your job is to keep trading with discipline until you have enough data to make a real claim."

**Statistical significance of alpha:** At 5–12 trades, alpha p-values will universally be non-significant. Teach the concept anyway — the point is that students understand why small samples can't support strong conclusions, not that they achieve significance at Week 11.

**Regime detection utility:** The `detect_market_regime()` function uses realized volatility as a VIX proxy since VIX data requires a separate data source. If students ask about using the real VIX ticker (^VIX), yfinance supports it: `yf.download('^VIX', ...)`. This is a worthwhile enhancement if time permits.

**Preparation for Week 12:** Week 12 introduces the adaptation decision tree — the hardest conceptual content of Month 3. Plant the seed Friday: "Next week, every decision about whether to change your strategy must go through a formal framework. If you're already thinking about making changes, bring that specific change and your reasoning to Monday night."

---

## WEEKLY RESOURCES

> Resources are labeled **[Pre-session]** (review before class) or **[Homework]** (explore after). Three weeks of live data is thin — these resources help you ask the right questions about what you have.

---

### Monday — P&L Attribution: Alpha, Beta & What's Actually Happening

- **[Article | Pre-session]** [Volatility and Market Regimes: How Changing Risk Shapes Market Behavior (with Python)](https://medium.com/@trading.dude/volatility-and-market-regimes-how-changing-risk-shapes-market-behavior-with-python-examples-190de97917d8) — Medium / Trading Dude. Shows how to classify the market into regimes using VIX and rolling volatility — the classification system we use in Monday's Block 2. Read before class.

- **[Article | Pre-session]** [Regime-Adaptive Trading Using HMM and Random Forest](https://blog.quantinsti.com/regime-adaptive-trading-python/) — QuantInsti. More advanced treatment of regime detection with ML. You don't need to implement HMM at this stage — but reading the intro section gives you the conceptual vocabulary for "what is a market regime" at a level that goes beyond just VIX thresholds.

- **[Article | Homework]** [Portfolio Case Study for Alpha, Beta, Information Ratio and IC](https://medium.com/balaena-quant-insights/portfolio-case-study-for-alpha-beta-information-ratio-ir-and-information-coefficient-ic-fa3b907e9ff3) — Medium / Balaena Quant Insights. Real-world example decomposing a portfolio's returns into alpha and beta contributions. After Monday's session, use this to check whether your own understanding of the decomposition is correct.

---

### Wednesday — Analytics Workshop: Building the P&L Attribution Function

- **[Article | Pre-session]** [Factor Analysis in Python with Alphalens](https://quantscience.io/newsletter/b/stock-factor-analysis-alphalens) — QuantScience. Introduction to Alphalens — the library used for professional factor performance analysis. We build the attribution function from scratch in Wednesday's workshop, but understanding what Alphalens offers gives you context for where this work leads in Month 4.

- **[Article | Reference]** [Codearmo — Sharpe, Sortino and Calmar Ratios with Python](https://www.codearmo.com/blog/sharpe-sortino-and-calmar-ratios-python) — Codearmo (updated April 2026). Keep this open during Wednesday's workshop — the attribution function outputs Sharpe and alpha, and you'll need the formulas handy when debugging your implementation.

- **[YouTube | Homework]** Search YouTube for: *"portfolio attribution alpha beta python regression 2023"* — look for a video that runs OLS regression of portfolio returns against SPY returns and interprets alpha (intercept) and beta (slope). Target: 15–20 min. Understanding the regression visually makes the Python code in the workshop much clearer.

---

### Friday — Mid-Month Performance Reviews

> No new resources for Friday. The session is driven by your data — your journal, your P&L, your rule-adherence rate.

**Before Friday, complete this self-audit:**
- Group your trades: rule-following vs. any deviation. What is the average P&L for each group?
- What market regime was dominant during June 8–22? Does your strategy's design match that regime?
- If performance is poor: is it rule deviation, regime mismatch, or genuine edge loss? These require different responses.

---

*FINN Week 11 — Reading Live Performance | Part of FINN_Month03.md*
