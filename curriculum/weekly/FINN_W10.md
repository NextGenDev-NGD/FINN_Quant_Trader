# FINN — Week 10: Position Sizing & Portfolio Risk
## Paper Trading Phase I | Month 3: Paper Trading I
**Dates:** June 15–20, 2026
**Week Number:** 10 of 24

---

## WEEK OVERVIEW

### Theme
Sizing is not a detail. It is the difference between staying in the game and blowing up.

### Learning Objectives
By the end of this week, students will be able to:
- Explain all four position sizing models and select the appropriate one for a given trade
- Calculate Kelly fraction from their own live trade data and interpret the result
- Apply ATR-based sizing and explain why it auto-adjusts for volatility regimes
- Build and run a live portfolio risk dashboard in Python using Webull SDK
- Identify portfolio-level risk concentrations: beta, sector, correlation
- Interpret VaR and apply it as a daily risk monitoring tool

### Materials Needed
- `finnenv` environment — `paper_webull`, `yfinance`, `pandas`, `numpy`, `matplotlib`, `python-dotenv`, `scipy`
- Webull paper account — all trades from Week 9 logged
- Starter notebook: `W10_workshop_risk_dashboard_starter.ipynb`
- Trading journal fully updated through Week 9

### Pre-Week Checklist (Instructor)
- [ ] Push `W10_workshop_risk_dashboard_starter.ipynb` to GitHub
- [ ] Prepare opening portfolio pulse: have each student report current portfolio value vs. $1M start, number of trades placed, rule adherence rate
- [ ] Prepare Kelly Criterion worked example with concrete numbers (done in Block 2)
- [ ] Note: impulse log observation assignment for Wednesday DMB is important — debrief it Friday

---

## MONDAY — June 15, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse (Block 1 — standing addition from Month 3):**
Full account summary: total value vs. starting $1M, current drawdown %, open positions. "Let's see where everyone stands after Week 1 of live trading."

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Find two stocks in your watchlist with significantly different ATR values. Calculate 2% risk position size for each using our sizing formula, assuming entry at current price and a 1.5× ATR stop. Compare the results. What does ATR tell you about position sizing that a simple % stop doesn't?"

---

### EVENING: Theory Session (8:00–9:30 PM EST)
**Topic:** Position Sizing Models, Portfolio Risk & The Kelly Criterion
**Curriculum Source:** Wiki Sections 9.2, 9.3, 9.4

#### Pre-Session Requirements
- [ ] Wiki Section 9.2 — All 4 position sizing models read
- [ ] Wiki Section 9.3 — Daily risk metrics read
- [ ] Wiki Section 9.4 — VaR introduction read
- [ ] Trading journal updated with all Week 9 trades closed or noted

---

#### Block 1 — Day Review & Portfolio Pulse (8:00–8:15 PM) | 15 minutes

"Before reading check — portfolio review. Where is everyone? Who is up from starting value? Who is down? By how much?

I want to hear three things from each person in 30 seconds:
1. Your current portfolio value vs. $1,000,000 start
2. How many trades placed so far?
3. Did you follow your rules? Every time?"

Note: no judgment on P&L this early. Focus entirely on process adherence.
"A student down 1.5% who followed their rules perfectly is succeeding. A student up 2% who deviated from their rules got lucky. They are failing."

---

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 minutes

**Topic A: The Four Position Sizing Models (25 min)**

Walk through Wiki Section 9.2 in full. Use concrete numbers throughout.

- **Fixed % Risk:**
  "The simplest and most practical model for retail traders. Formula: `shares = (account × risk%) / stop_distance`. $1M portfolio, 2% risk, $2.50 stop distance = 8,000 shares. Scales automatically — as your portfolio grows, position sizes grow with it. As it shrinks, position sizes shrink. Protects capital during drawdowns."

- **Kelly Criterion:**
  "The mathematically optimal fraction to risk given your edge. Formula: `f* = (b×p − q) / b` where b = win/loss ratio, p = win rate, q = loss rate. Example: 55% win rate, avg win $200, avg loss $100. b = 200/100 = 2. p = 0.55. q = 0.45. f* = (2×0.55 − 0.45) / 2 = (1.10 − 0.45)/2 = 0.325 = 32.5%. ALWAYS use half-Kelly in practice: 16.25%. Why half? Full Kelly maximizes long-term geometric growth but produces horrific short-term drawdowns. Half-Kelly captures most of the benefit with much less volatility."

  Walk through the Kelly code from Wiki Section 9.2:
  ```python
  def kelly_fraction(win_rate, avg_win, avg_loss):
      b = avg_win / avg_loss
      p = win_rate
      q = 1 - win_rate
      kelly = (b * p - q) / b
      return max(0, kelly / 2)  # Half-Kelly, never negative
  ```

- **ATR-Based Sizing:**
  "Instead of using a fixed dollar stop, we use ATR to set the stop dynamically. Stop distance = ATR × 1.5 (common multiplier — adjustable). Formula: `shares = (account × risk%) / (ATR × 1.5)`. In a high-volatility environment, ATR is larger — position size automatically shrinks. In a quiet market, ATR is smaller — position size grows. This means you naturally take smaller positions when the market is wild and larger ones when it's calm. That is correct behavior."

  "Example: SPY ATR = $3.20. Stop = 3.20 × 1.5 = $4.80. 2% risk on $1M = $20,000. Shares = 20,000 / 4.80 = 4,166 shares. Now compare to a quiet week: SPY ATR = $1.80. Stop = $2.70. Shares = 20,000 / 2.70 = 7,407 shares. 78% more shares in a calm market."

- **Equal Weight:**
  "Simplest diversification. Divide portfolio by number of positions. No signal about edge size, no volatility adjustment. Useful for portfolio strategies, not for directional trading. We use this as a baseline comparison — how do our sized strategies compare to simply equal-weighting positions?"

**Topic B: Portfolio-Level Risk Metrics (10 min)**

Walk through Wiki Section 9.3:

- **Beta management:** "If all your positions are high-beta tech stocks, your portfolio has amplified market exposure. In a market selloff, everything drops together. Target beta < 1.0 for a balanced portfolio."

- **Sector concentration:** "If 3 of your 5 positions are semiconductor stocks — you don't have 5 independent bets. You have 1 sector bet, expressed 3 ways. When semiconductors sell off, all 3 positions hurt simultaneously."

- **Correlation monitoring:** "Two positions can be in different sectors but still move together. NVDA and AVGO both benefit from AI spending — they're correlated even though one is in semis and one is in tech. Monitor correlations."

- **Rolling Sharpe:** "If your rolling 20-day Sharpe drops below 0.5, something changed. Either the market regime shifted, or your execution is inconsistent. Diagnose before adding new positions."

**Topic C: VaR Introduction (5 min)**

Walk through Wiki Section 9.4 VaR code:
"VaR answers: 'What is the most I expect to lose in a single day at 95% confidence?' Historical VaR on SPY over 2 years: roughly −1.5%. On a $1M portfolio, that's $15,000 per day at 95% confidence. This is not a ceiling — 5% of days will be worse than this."

---

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 minutes

1. "You run Kelly on your Milestone 2 backtest: 58% win rate, 1.8 R:R. Kelly gives you 30% — use half at 15%. But your backtest only has 47 trades over 3 years. Is 47 trades enough to trust the Kelly estimate? What's the risk?"
   *(Expected: small sample size means win rate and R:R estimates are noisy. Kelly applied to noisy estimates can still blow up. Need hundreds of trades for stable estimates. With small samples, use much more conservative sizing.)*

2. "ATR-based sizing means you take larger positions in calm markets. But the biggest moves happen after periods of low volatility — volatility clusters. Is ATR sizing dangerous precisely because it's largest before volatility spikes?"
   *(Expected: Yes — this is a real risk of ATR sizing. Sophisticated implementations use a volatility forecast rather than realized ATR, or cap position sizes during extended low-vol periods. Acknowledge the limitation.)*

3. "Devil's advocate: Isn't 2% risk per trade extremely conservative? If you're right 60% of the time and risking 2%, you'll barely outperform a savings account."
   *(Expected: The 2% rule protects against ruin. A 50% drawdown requires a 100% gain to recover. With 2% sizing and a long losing streak (which WILL happen), you stay solvent. Ruin prevention is the first priority. Performance second.)*

---

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 minutes

**Wednesday workshop:**
"We build a live portfolio risk dashboard — a Python notebook that queries your Webull paper account and computes: current drawdown, portfolio beta, sector exposure, position-level VaR, and rolling Sharpe. Starter: `W10_workshop_risk_dashboard_starter.ipynb`"

**Pre-reading:**
- Review Wiki Section 3.3 performance metrics (refresh for live context)
- Wiki Section 9.3 daily risk metrics (re-read with live portfolio in mind)

**Closing reflection:**
*"The most important thing I need to understand about my position sizes before Wednesday is ___."*

**Monday Deliverable:** Reading Notes + 3 Hypotheses by 11:59 PM

---

## WEDNESDAY — June 17, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse (Block 1):** Full account summary. Note any changes from Monday.

**Block 4 — Observation Assignment:**
"During market hours today, watch your open positions for 30 minutes. Without acting on anything — observe: does the intraday price action make you want to override your rules? Write down every impulse you feel and what triggered it. Bring this honest log to tonight's class."

---

### EVENING: Workshop Session (8:00–9:30 PM EST)
**Workshop:** W10 — Live Portfolio Risk Dashboard — Real-Time Risk Monitoring in Python
**Notebook:** `W10_workshop_risk_dashboard_[initials].ipynb`
**Curriculum Source:** Wiki Sections 9.2, 9.3, 9.4

#### Pre-Session Setup
- [ ] `finnenv` running, repo pulled
- [ ] Webull paper account connected — positions from Week 9 active
- [ ] `W10_workshop_risk_dashboard_starter.ipynb` open
- [ ] Impulse log from DMB written and ready to share

---

#### Block 1 — Framing & Context Bridge (8:00–8:10 PM) | 10 minutes

"Monday we learned the risk rules and sizing models theoretically. Tonight we build the instrument panel that makes those rules operational.

Professional traders and risk managers don't track portfolio risk in their heads. They have dashboards. Real-time numbers. Alerts that fire when limits are breached.

Tonight's notebook becomes your permanent portfolio monitor for the rest of this course. Every Friday before the review session, you run this dashboard. It tells you exactly where you stand before you walk into the room."

---

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 minutes

```python
from webull import paper_webull
import yfinance as yf
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from datetime import datetime, timedelta
import os
from dotenv import load_dotenv
load_dotenv()

# Connect to paper account
pwb = paper_webull()
pwb.login(os.getenv('WEBULL_EMAIL'), os.getenv('WEBULL_PASSWORD'))
pwb.get_trade_token(os.getenv('WEBULL_TRADE_PIN'))
print(f"Connected to Webull Paper Trading | {datetime.now().strftime('%Y-%m-%d %H:%M')}")
```

**Step 1 — Portfolio snapshot function (8 min)**
```python
def get_portfolio_snapshot(pwb, starting_capital=1_000_000):
    """
    Full portfolio snapshot: value, drawdown, positions, P&L.
    """
    account  = pwb.get_account()
    positions = pwb.get_positions()

    total_value   = float(account.get('netLiquidation', starting_capital))
    cash          = float(account.get('cashBalance', 0))
    unrealized_pnl = float(account.get('unrealizedProfitLoss', 0))
    total_pnl     = total_value - starting_capital
    total_pnl_pct = total_pnl / starting_capital

    # Current drawdown from peak
    # Note: for proper tracking, maintain a running peak value in a file
    drawdown_pct  = min(0, total_pnl_pct)  # Simplified — negative = drawdown

    print(f"\n{'='*50}")
    print(f"PORTFOLIO SNAPSHOT — {datetime.now().strftime('%Y-%m-%d %H:%M EST')}")
    print(f"{'='*50}")
    print(f"Starting Capital:    ${starting_capital:>12,.2f}")
    print(f"Current Value:       ${total_value:>12,.2f}")
    print(f"Total P&L:           ${total_pnl:>+12,.2f} ({total_pnl_pct:>+.2%})")
    print(f"Unrealized P&L:      ${unrealized_pnl:>+12,.2f}")
    print(f"Cash Balance:        ${cash:>12,.2f}")
    print(f"Cash % of Portfolio: {cash/total_value:>11.1%}")

    if total_pnl_pct <= -0.05:
        print(f"\n⚠️  RULE 3 ALERT: Daily drawdown approaching 5% threshold")
    if total_pnl_pct <= -0.10:
        print(f"\n🚨 RULE 4 ALERT: 10% drawdown — reduce position sizes by 50%")

    return {
        'total_value': total_value,
        'cash': cash,
        'total_pnl': total_pnl,
        'total_pnl_pct': total_pnl_pct,
        'positions': positions
    }

snapshot = get_portfolio_snapshot(pwb)
```

**Step 2 — Position-level risk analysis (12 min)**
```python
def analyze_positions(positions, account_value):
    """
    Analyze each open position: size, weight, P&L, ATR-based risk.
    """
    if not positions:
        print("No open positions.")
        return pd.DataFrame()

    rows = []
    tickers = [p.get('ticker', {}).get('symbol') for p in positions
               if p.get('ticker', {}).get('symbol')]

    # Fetch current ATR for each ticker
    atr_data = {}
    for ticker in tickers:
        try:
            df = yf.download(ticker, period="30d", interval="1d", progress=False)
            df.columns = [c[0] if isinstance(c, tuple) else c for c in df.columns]
            high_low  = df['High'] - df['Low']
            high_prev = abs(df['High'] - df['Close'].shift(1))
            low_prev  = abs(df['Low'] - df['Close'].shift(1))
            tr        = pd.concat([high_low, high_prev, low_prev], axis=1).max(axis=1)
            atr_data[ticker] = tr.rolling(14).mean().iloc[-1]
        except:
            atr_data[ticker] = None

    for p in positions:
        ticker     = p.get('ticker', {}).get('symbol', 'N/A')
        qty        = int(p.get('position', 0))
        cost       = float(p.get('costPrice', 0))
        last       = float(p.get('lastPrice', 0))
        mkt_val    = float(p.get('marketValue', 0))
        unr_pnl    = float(p.get('unrealizedProfitLoss', 0))
        unr_pct    = float(p.get('unrealizedProfitLossRate', 0)) * 100
        weight     = mkt_val / account_value * 100
        atr        = atr_data.get(ticker)
        atr_risk   = (atr * 1.5 * qty / account_value * 100) if atr else None

        rows.append({
            'Ticker':    ticker,
            'Qty':       qty,
            'Cost':      f"${cost:.2f}",
            'Last':      f"${last:.2f}",
            'Mkt Value': f"${mkt_val:,.0f}",
            'Unr P&L':   f"${unr_pnl:+,.0f}",
            'Unr %':     f"{unr_pct:+.1f}%",
            'Weight %':  f"{weight:.1f}%",
            'ATR Risk%': f"{atr_risk:.1f}%" if atr_risk else "N/A"
        })

    df_pos = pd.DataFrame(rows)
    print(f"\n{'POSITION ANALYSIS':^60}")
    print(df_pos.to_string(index=False))

    # Portfolio concentration warning
    weights = [float(r['Weight %'].strip('%')) for r in rows]
    if any(w > 25 for w in weights):
        heavy = [rows[i]['Ticker'] for i, w in enumerate(weights) if w > 25]
        print(f"\n⚠️  CONCENTRATION WARNING: {heavy} > 25% of portfolio")

    return df_pos

positions_df = analyze_positions(snapshot['positions'], snapshot['total_value'])
```

**Step 3 — Rolling Sharpe and drawdown tracker (10 min)**
```python
def plot_portfolio_performance(trade_log_df, starting_capital=1_000_000,
                                benchmark_ticker='SPY'):
    """
    Plot rolling portfolio performance vs benchmark.
    trade_log_df: DataFrame with 'date' and 'portfolio_value' columns
                  (manually maintained from journal closes)
    """
    if trade_log_df.empty:
        print("No closed trade data yet. Run this after Week 2 of paper trading.")
        return

    trade_log_df = trade_log_df.set_index('date').sort_index()
    trade_log_df['return'] = trade_log_df['portfolio_value'].pct_change()

    # Fetch benchmark for comparison
    start_date = trade_log_df.index[0]
    benchmark  = yf.download(benchmark_ticker,
                              start=start_date, progress=False)['Close'].pct_change()

    # Rolling 10-day Sharpe (annualized)
    window = 10
    rolling_sharpe = (
        trade_log_df['return'].rolling(window).mean() /
        trade_log_df['return'].rolling(window).std() *
        np.sqrt(252)
    )

    # Drawdown
    cum_ret    = (1 + trade_log_df['return']).cumprod()
    roll_max   = cum_ret.cummax()
    drawdown   = (cum_ret - roll_max) / roll_max

    fig, axes = plt.subplots(3, 1, figsize=(14, 12), sharex=True)

    # Cumulative return vs benchmark
    cum_bm = (1 + benchmark.reindex(trade_log_df.index).fillna(0)).cumprod()
    axes[0].plot(cum_ret.index, cum_ret, label='My Strategy', color='steelblue', lw=2)
    axes[0].plot(cum_bm.index, cum_bm, label=benchmark_ticker, color='gray',
                 lw=1.5, linestyle='--')
    axes[0].set_title('Portfolio Performance vs Benchmark', fontsize=13)
    axes[0].legend()
    axes[0].grid(True, alpha=0.3)

    # Rolling Sharpe
    axes[1].plot(rolling_sharpe.index, rolling_sharpe, color='green', lw=1.5)
    axes[1].axhline(1.0, color='green', lw=1, linestyle='--', alpha=0.5, label='Sharpe = 1.0')
    axes[1].axhline(0, color='black', lw=0.8)
    axes[1].set_title(f'Rolling {window}-Day Sharpe Ratio', fontsize=13)
    axes[1].legend()
    axes[1].grid(True, alpha=0.3)

    # Drawdown
    axes[2].fill_between(drawdown.index, drawdown, 0, color='red', alpha=0.4)
    axes[2].set_title('Portfolio Drawdown', fontsize=13)
    axes[2].set_ylabel('Drawdown')
    axes[2].grid(True, alpha=0.3)

    plt.tight_layout()
    plt.savefig('portfolio_performance.png', dpi=150, bbox_inches='tight')
    plt.show()
    print("Chart saved: portfolio_performance.png")

# Create sample trade log (students fill this from their journal)
sample_log = pd.DataFrame({
    'date': pd.date_range('2026-06-10', periods=5, freq='B'),
    'portfolio_value': [1_000_000, 1_002_400, 999_800, 1_005_100, 1_008_700]
})
print("\nSample performance chart (replace with real journal data):")
plot_portfolio_performance(sample_log)
```

---

#### Block 3 — Independent / Pair Work (8:50–9:15 PM) | 25 minutes

**Core Exercise:**
Run the full dashboard on your own paper account. Update the `sample_log` with your actual paper trading P&L from Week 9's trades. Answer in markdown:
1. What is your current total P&L and % return?
2. What is your largest position as % of portfolio? Is it within limits?
3. Did any risk alerts fire? What would you do about them?
4. Calculate Kelly fraction for your Week 9 trades. What does it suggest about sizing?

**Extension Challenge:**
Build a daily portfolio tracker that:
1. Reads portfolio value from Webull each day
2. Appends it to a CSV file with date and value
3. Automatically produces the performance chart

This becomes your permanent Month 3–6 portfolio log.

---

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 minutes

**Share-out:** 2 students share their dashboard output. "What did the dashboard tell you that you didn't already know from looking at the account?"

**Muddiest Point:**
> *"The muddiest point from tonight was ___."*

**Wednesday Deliverable:** `W10_workshop_risk_dashboard_[initials].ipynb` to GitHub by 11:59 PM

---

## FRIDAY — June 19, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse (Block 1):** Full account summary. Two weeks into live trading.

---

### EVENING: Review & Market Session (8:00–9:30 PM EST)
**Topic:** Week 10 Review + Risk Dashboard Live Review + Position Audit

---

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 minutes

1. "Walk me through the Kelly Criterion calculation for your trades this month. What fraction does it suggest? Are you above or below that?"

2. "ATR-based sizing — give me a scenario where it gives you a much smaller position than fixed-% risk would. Why is that a feature, not a bug?"

3. "You have 4 open positions. 3 are long tech stocks. 1 is long SPY. How correlated is this portfolio? What happens in a tech selloff?"

4. "From the impulse log in the DMB observation — what triggered the urge to override your rules today? How did you handle it? What does that tell you?"

5. "Rule 4: drawdown 10%, reduce size 50%. Why 50% specifically? Why not just stop trading entirely?"

---

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 minutes

**Portfolio Review Focus:**
"From this week forward, the Market Autopsy includes a portfolio review segment. We look at the market AND we look at how the market affected our positions."

Walk through SPY and QQQ. Then for each student's open position:
- Is the underlying thesis still valid after this week's price action?
- Did any position approach its stop level? What happened?
- Were there any entry signals this week that students did or did not take?

"If you saw a valid signal and didn't take it — why not? If it was hesitation or fear — that's data about your psychology. If it was a legitimate market context override — was that pre-defined in your rules?"

**Sector Rotation + Position Impact:**
"How did this week's sector performance affect your holdings? If you're long energy and energy rotated down this week — is that strategy failure or market noise? How do you tell the difference?"

---

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 minutes

Standard checklist plus: "Note VIX right now. Compare to when you opened your positions. Did VIX expansion or contraction affect your trade outcomes this week?"

---

#### Block 4 — Next Week Preview & Close (9:20–9:30 PM) | 10 minutes

**Next week:** Reading live performance — P&L attribution and regime analysis. "We're going to learn how to distinguish between a strategy having a bad week and a strategy being broken. That distinction is the hardest skill in trading."

**Assign reading:**
- Re-read Wiki Section 7.1 — Backtesting best practices (through the live trading lens)
- Re-read Wiki Section 3.3 — Performance metrics (now applied to real data)

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

## WEEKLY DELIVERABLES SUMMARY

| Deliverable | Due | Format |
|-------------|-----|--------|
| Reading Notes + 3 Hypotheses | Monday 11:59 PM | Markdown in hypothesis log |
| Workshop Notebook (W10) | Wednesday 11:59 PM | `.ipynb` pushed to GitHub |
| Trading Journal Update | Wednesday 11:59 PM | `trading_journal_[initials].md` |
| Weekly Review Log | Friday 11:59 PM | Markdown |
| Hypothesis Outcome Record | Friday 11:59 PM | Appended to hypothesis log |

---

## INSTRUCTOR NOTES FOR WEEK 10

**Portfolio Pulse as the opening ritual:** By Week 10 this should feel routine. If students are not opening Webull before DMB, address it directly. The Portfolio Pulse is not optional — it mirrors how professional traders start every morning.

**Kelly Criterion with 5–10 trades:** Students will want to run Kelly on their Week 9 trades. Emphasize loudly that 5–10 trades produces completely unstable Kelly estimates. The point of this exercise is to build the habit and understand the formula — not to trust the output. An honest win rate estimate requires 50+ trades minimum.

**ATR sizing discussion:** The Socratic question about ATR being largest before volatility spikes is genuinely hard. Do not resolve it too quickly. The correct answer is nuanced — ATR sizing is better than fixed % on average, but it has this specific vulnerability. Sophisticated solutions exist (VIX-based vol adjustment, hard position caps) but those are Month 5 content.

**Impulse log debrief:** The observation assignment asking students to log every impulse they felt during market hours is one of the most psychologically valuable exercises in the course. When you debrief it Friday, create space for honesty. If students felt the urge to override their rules, that is normal and expected. The goal is awareness, not elimination.

**Dashboard extension challenge:** The daily portfolio tracker extension challenge is worth extra time if the class is moving well. A CSV-based portfolio log that auto-generates charts is the foundation of the Month 4 automation work. Encourage early completion.

**Rule 4 — 50% size reduction:** Students often ask why 50% rather than 75% or 25%. The honest answer is that 50% is a conventional choice that preserves meaningful engagement while significantly reducing risk. The exact threshold is less important than the principle: reduce size when in drawdown, not increase it.

---

## WEEKLY RESOURCES

> Resources are labeled **[Pre-session]** (review before class) or **[Homework]** (explore after). Position sizing is the most underrated skill in trading — these resources make the case for why.

---

### Monday — Position Sizing Models: Fixed %, Kelly, ATR-Based

- **[Article | Pre-session]** [How to Size Your Trades: Fixed, Percent, Fractional, and Kelly Position Sizing Explained](https://pyquantlab.medium.com/how-to-size-your-trades-fixed-percent-fractional-and-kelly-position-sizing-explained-3695b443ecfc) — PyQuantLab / Medium. Covers all four sizing models with Python code examples using `backtrader`. Read before Monday — we walk through exactly these four models in Block 2.

- **[Article | Pre-session]** [Position Sizing in Trading: Strategies, Techniques, and Formula](https://blog.quantinsti.com/position-sizing/) — QuantInsti. More detailed treatment of each sizing method including the math and risk implications. Good complement to the PyQuantLab article — read both to see two different explanations of the same concepts.

- **[Article | Homework]** [Use the Kelly Criterion for Optimal Position Sizing](https://www.pyquantnews.com/the-pyquant-newsletter/use-kelly-criterion-optimal-position-sizing) — PyQuant News. Shows how to calculate the Kelly fraction from your own trade history using Python. FINN's caveat: always apply half-Kelly or less in practice. This article makes the mathematical case for why.

- **[YouTube | Pre-session]** Search YouTube for: *"Kelly criterion position sizing trading explained 2022 2023"* — look for a video that shows the math with a concrete example (win rate × payoff ratio), then discusses why using full Kelly in practice is dangerous. Target: 10–20 min. FINN's warning applies here: a Kelly fraction > 1.0 means the math suggests leverage — ignore that result until you have 100+ trades of validated data.

---

### Wednesday — Portfolio Risk Dashboard: Beta, VaR & Correlation

- **[Article | Pre-session]** [Asset Beta and Market Beta in Python](https://blog.quantinsti.com/asset-beta-market-beta-python/) — QuantInsti. Step-by-step Python implementation of beta calculation using OLS regression against SPY. This is the calculation behind Wednesday's portfolio risk dashboard — preview the code before class.

- **[Article | Pre-session]** [Beta Estimation with Python](https://www.tidy-finance.org/python/beta-estimation.html) — Tidy Finance. Cleaner, more academic implementation using rolling windows. Shows how beta changes over time — which is the version we build in the dashboard.

- **[Article | Homework]** [Optimize Your Trading Strategy With Python and the Kelly Criterion](https://raposa.trade/blog/optimize-your-trading-strategy-with-python-and-the-kelly-criterion/) — Raposa (2022). Goes deeper into comparing Kelly sizing against fixed allocation strategies — shows the performance gap over time. Read after Wednesday when you've seen the Kelly formula in action.

- **[YouTube | Homework]** Search YouTube for: *"Value at Risk VaR python pandas tutorial 2022 2023"* — look for a video that implements VaR from daily return data (either historical simulation or parametric). Target: 15–20 min. Understanding VaR as a daily monitoring number (not a guarantee) is what the workshop builds toward.

---

### Friday — Risk Review & Impulse Log Debrief

- **[Article | Pre-session]** [A Better Understanding of Beta](https://medium.com/swlh/a-better-understanding-of-beta-8e20466f3f35) — Medium / J.P. Rinfret. Explains what beta means economically, not just mathematically — why a high-beta portfolio feels different to trade. Good to read before Friday when we debrief the impulse log and connect psychology to risk exposure.

---

*FINN Week 10 — Position Sizing & Portfolio Risk | Part of FINN_Month03.md*
