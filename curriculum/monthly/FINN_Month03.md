# FINN — Month 03 Lesson Plan
## Financial Intelligence & Navigation Network
### Paper Trading Phase I — Live Strategy Deployment
**Dates:** June 8 – July 4, 2026
**Phase:** Month 3 of 6 — Paper Trading I
**Milestone:** M3 begins (Paper Trading Mid-Review at end of Month 4)

---

> **INSTRUCTOR NOTE**
> Month 3 is the transition from building to doing. Students stop studying strategies
> and start running them. Every concept from Months 1 and 2 now has a live consequence —
> even if only virtual money is at stake.
>
> The pedagogical shift this month is significant:
> - Monday theory sessions become **strategy + market context sessions** —
>   still conceptual, but now grounded in what the market is actually doing
> - Wednesday workshops become **live trading sessions** — code runs against
>   real market data, paper trades are placed and logged
> - Friday sessions become **performance reviews** — the journal is audited,
>   P&L is discussed, and decisions are interrogated
>
> Hold students accountable to their trading journals above all else.
> A student with poor P&L but a rigorous journal is succeeding.
> A student with good P&L but no journal is failing.
>
> **July 4 — Independence Day:** Falls on Saturday this year (2026).
> No class impact — Week 4 Friday is July 3. Flag it as a potential
> half-day market and lower-volume session. Pre-build async package
> for Week 4 Friday in case of early class cancellation.
>
> **Key setup requirement before Week 1:**
> Every student must have placed at least one test paper trade on Webull
> before June 8. Verify this during the onboarding check the week of June 1.

---

## Month 3 Overview

### Learning Objectives

By the end of Month 3, every student will be able to:

- Execute paper trades on Webull using their defined strategy rules without deviation
- Maintain a complete, honest trading journal for every trade placed
- Calculate and interpret their own live paper trading metrics: P&L, Sharpe, win rate,
  drawdown, and benchmark comparison against SPY
- Identify the psychological and behavioral differences between backtesting and live trading
- Explain position sizing decisions in terms of portfolio risk percentage and ATR
- Recognize when a strategy is underperforming due to a bad week versus a broken strategy
- Apply a structured weekly performance review process using real trade data
- Use Webull's Python SDK to query account positions and order history programmatically
- Connect daily DMB observations to live paper trading decisions and document the rationale

### Month 3 Curriculum Sources
*(from `FINN_Curriculum_Wiki.md`)*

- Section 8 — Paper Trading Phase: Webull (complete)
- Section 9 — Risk Management Framework (complete)
- Section 3.3 — Performance metrics in live context (revisited with real data)
- Section 8.4 — Trading journal requirements (operational this month)

### Month 3 at a Glance

| Week | Dates | Theme | Monday Topic | Wednesday Workshop | Friday Focus |
|------|-------|-------|-------------|-------------------|-------------|
| 9 | Jun 8–13 | Going Live | Paper trading psychology + risk rules | First live paper trades on Webull | Week 1 trade review + journal audit |
| 10 | Jun 15–20 | Position Sizing & Risk | Kelly Criterion, ATR sizing, portfolio exposure | Position sizing calculator + risk dashboard | Risk metrics on live positions |
| 11 | Jun 22–27 | Reading Live Performance | P&L attribution, strategy vs. market, regime | Live portfolio analytics notebook | Mid-month performance deep dive |
| 12 | Jun 29–Jul 4 | Iteration & Adaptation | When to adjust a strategy vs. when to hold | Strategy adjustment framework in Python | ⚠️ Jul 3 market + Month 3 close |

---

---

# WEEK 9 — Going Live
**Theme:** The backtest is over. The market is real. Every trade gets a journal entry.

---

## Monday, June 8, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

#### Block 1 — Pre-Market Scan (9:00–9:15 AM)
Standard checklist. Add a new standing item starting this month:

- [ ] **Paper Portfolio Check:** Each student checks their Webull paper account.
  What positions are currently open (if any from testing)? What is total portfolio value?

This becomes a permanent addition to the DMB from Month 3 forward.
The market brief now includes a brief portfolio pulse.

#### Block 2 — Student-Led Brief (9:15–9:35 AM)
Student presenter adds one new element to their brief starting this month:

```
[Existing brief template fields...]
Trade Idea:   [Based on your strategy — is there a setup forming in your watchlist today?]
Action Plan:  [If signal triggers today — what exactly would you do?]
```

This is not a prediction — it is a preparedness check. Students should know
exactly what their strategy says to do before market open.

#### Block 3 — Hypothesis Setting (9:35–9:50 AM)
Add Month 3 section header to hypothesis log: `## Month 3 — Week 9`.
Begin encouraging trade-specific hypotheses:
"My strategy will signal an entry on [ticker] this week when [condition].
I expect the trade to [outcome] over [timeframe] because [reason]."

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "During market hours today, watch one stock that is in or near
your strategy's signal zone. Write down every time the signal comes close to triggering —
even if it doesn't. Note the price, the indicator reading, and what the stock does.
Bring a written record to tonight's class."

---

### Monday, June 8, 2026 — Theory Session
**Time:** 8:00–9:30 PM EST
**Topic:** Paper Trading Psychology, Risk Rules & Going Live
**Curriculum source:** Wiki Sections 8.1–8.4, 9.1

#### Pre-Session Requirements
- [ ] Wiki Sections 8.1–8.4 read and understood
- [ ] Wiki Section 9.1 — Core risk rules memorized
- [ ] Webull paper account verified working — test trade placed
- [ ] Trading journal template set up in GitHub: `trading_journal_[initials].md`
- [ ] Milestone 2 strategy hypothesis reviewed and adapted for live execution

---

#### Block 1 — Day Review & Transition (8:00–8:15 PM) | 15 minutes

"Two months ago we opened Python for the first time and fetched market data.
Tonight we place our first intentional, rule-based paper trades.

Before we talk about the mechanics — let's talk about the shift that just happened.

In a backtest, you already know how every trade ends. You run it, see the result,
and assess it calmly. In paper trading, you don't know how the trade ends.
You enter, you wait, the market moves against you, and something psychological happens.

What happens? Doubt. The urge to override the rules. The temptation to exit early
when it moves against you or hold too long when it moves in your favor.

Tonight's theory session is about building the mental and operational framework
that keeps you trading the system — not your emotions.
This is where most retail traders lose their edge before it ever gets a chance to work."

Cold-call reading check:
- "Name the 6 core risk rules from the wiki. No notes."
- "What is paper trading, and what are its limitations compared to live trading?"
- "What is the single most important field in the trading journal, and why?"

---

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 minutes

**Topic A: The Psychology of Live Trading (15 min)**

"Here is the single biggest difference between backtesting and live trading:
in a backtest, you feel nothing. In live trading — even paper trading —
you feel everything. And feelings are the enemy of systematic trading.

The three emotions that destroy systematic traders:
1. **Fear of loss** — exits trades too early, cuts winners short
2. **Greed** — holds trades too long, turns winners into losers
3. **Revenge trading** — takes larger positions after losses to 'make it back'

The rule-based system you built is your protection against all three.
It tells you exactly when to enter, exactly when to exit, and exactly how large to be.
Your only job is to follow it. Any deviation is a data point — log it, study it,
understand why you deviated. But always trade the system."

"Paper trading is not immune to psychology. Even with no real money at risk,
you will still feel the pull to override your rules. Use that feeling.
It is training for when the money is real."

> **Resource:** Trading psychology primer — emotions (fear/greed/revenge), biases, and counter-strategies → `resources/infographics/ig_trading_psychology.html` + `resources/handbook/FINN_HB_P5_Psychology.md` §5.1–5.3

**Topic B: The 6 Non-Negotiable Risk Rules (15 min)**

Walk through Wiki Section 9.1 in full. For each rule, give a concrete scenario:

- **Rule 1 — Never risk more than 1–2% per trade:**
  "You have a $1,000,000 paper portfolio. Maximum risk per trade = $10,000–$20,000.
  Not position size — RISK. If your stop is $2 away and you risk $10,000,
  your position size is 5,000 shares. We calculate this every single trade."

- **Rule 2 — Define the stop BEFORE entry:**
  "You do not enter a trade without a stop level. Not a vague 'I'll exit if it goes against me.'
  A specific price. Written in the journal before the order is placed. No exceptions."

- **Rule 3 — 5% daily portfolio drawdown = stop trading for the day:**
  "On a $1,000,000 paper portfolio — if you lose $50,000 in a single day, you stop.
  No more trades until tomorrow's DMB. No revenge trades. No 'one more try.'
  Paper down $50K means your strategy or your execution is broken today."

- **Rule 4 — 10% total drawdown = reduce size by 50%:**
  "If your portfolio falls to $900,000 — cut all position sizes in half.
  You are in a drawdown. The strategy may be in a regime where it doesn't work.
  Smaller size preserves capital while you diagnose the problem."

- **Rule 5 — No averaging down without a plan:**
  "Adding to a losing position because 'it's even cheaper now' is one of the most
  dangerous behaviors in trading. It turns small losses into catastrophic ones.
  If you want to add to a position, write the rule before you enter — not during."

- **Rule 6 — Minimum 3 uncorrelated positions:**
  "If your entire portfolio is in one trade, you have no diversification.
  A single bad event wipes you out. Three uncorrelated positions means no single
  trade can kill your portfolio."

> **Resource:** Risk rules reference card — 6 non-negotiable rules with scenarios and alert thresholds → `resources/infographics/ig_risk_rules.html`

**Topic C: The Trading Journal — Non-Negotiable (10 min)**

Walk through Wiki Section 8.4 journal field by field:

"Every field exists for a reason:
- **Hypothesis**: If you can't write why you expect the trade to work,
  you have no business placing it.
- **Signal(s)**: What exactly triggered entry? RSI reading? MACD crossover?
  Be specific — '5.2% below EMA_20 with RSI at 28.4'
- **Stop Loss Level**: Written before entry. If you don't know your stop, you can't
  calculate your position size. If you can't calculate your size, you can't control your risk.
- **Post-trade review**: This is where learning happens. Not from winners.
  From the honest analysis of every trade — winner or loser."

Demonstrate a complete journal entry on the whiteboard:
```
Date/Time:     2026-06-08 14:23 EST
Ticker:        SPY
Direction:     Long
Hypothesis:    RSI touched 29 while price is within 1% of EMA_20 — mean reversion setup
Signal(s):     RSI_14 = 29.2, Close/EMA_20 ratio = 0.991, Volume_Ratio = 1.4x
Entry Price:   $538.20
Position Size: 50 shares (2% risk, $2.10 stop = $105 risk / $2.10 = 50 shares)
Stop Loss:     $536.10 (below recent 2-day low)
Target:        $542.50 (RSI > 60 or 5-day time stop)
Exit Price:    [TBD]
P&L:           [TBD]
Post-trade:    [TBD]
```

> **Resource:** Emotional journal fields — pre-trade checklist, impulse log, and post-trade review template → `resources/handbook/FINN_HB_P5_Psychology.md` §5.5

---

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 minutes

1. "A paper trade has no real money at risk. Can you develop real trading discipline
   through paper trading alone? What's missing that only live trading provides?"
   *(Expected: emotional stakes. Paper trading can approximate discipline but
   the visceral reality of real money loss is qualitatively different.
   The value of paper trading is system testing, not psychology training —
   though it helps with the latter.)*

2. "Your strategy signals an entry. You look at the chart and it 'looks wrong' —
   you don't feel good about it. Do you take the trade?
   What is the right framework for making this decision?"
   *(Expected: If the rules are triggered, you take the trade.
   Your feelings are a hypothesis — not a rule. If you consistently feel
   the setup 'looks wrong' and it consistently fails, that's data.
   Log the override, test whether your gut has signal. But don't
   habitually override the system based on undefined intuition.)*

3. "Devil's advocate: Why bother with a stop loss? If you believe in the trade,
   why cap your loss? Just hold until it comes back."
   *(Expected: Because it doesn't always come back. The stocks that 'never come back'
   are the ones that destroy accounts. Stops limit catastrophic loss and preserve
   capital for the next trade. Kelly Criterion assumes you can keep playing.
   A 100% loss ends the game.)*

4. "A student's paper portfolio is down 8% after 3 weeks. Their strategy's
   historical Sharpe was 1.4. Should they abandon the strategy?
   What information do they need to make that decision?"
   *(Expected: 3 weeks is not statistically meaningful. Need to ask: is the drawdown
   within the strategy's historical max drawdown? Is the market in a regime the strategy
   was not designed for? Is the student following the rules? 8% is concerning but
   not conclusive — context matters.)*

---

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 minutes

**Wednesday workshop:**
"Tonight we place our first structured paper trades in Webull.
Before Wednesday's class: open Webull, identify your first 1–2 trades
based on your strategy rules, and write the journal entries up to Entry Price
(leave Exit Price and P&L blank — we'll execute Wednesday).

Starter notebook: `W09_workshop_live_trading_starter.ipynb` —
covers Webull Python SDK connection and position management.
Have your Webull credentials ready."

**Weekly hypotheses:**
Frame at least 2 as trade-specific this week.

**Pre-reading:**
- Wiki Section 9.2 — Position Sizing Models (all four)
- Wiki Section 9.3 — Risk metrics to monitor daily

**Closing reflection:**
*"The most important thing I need to understand before placing my first paper trade is ___."*

---

## Wednesday, June 10, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Block 4 — Observation Assignment:**
"Before tonight's class, pre-fill your trading journal template for at least one trade
you want to place tonight. All fields except Exit Price, P&L, and Post-trade review.
If you don't have a setup, write in the journal why there is no signal today."

---

### Wednesday, June 10, 2026 — Workshop Session
**Time:** 8:00–9:30 PM EST
**Topic:** First Live Paper Trades — Webull Execution + Journal Entry
**Curriculum source:** Wiki Sections 8.2, 8.3, 8.4
**Notebook:** `W09_workshop_live_trading_[initials].ipynb`

---

#### Block 1 — Framing & Context Bridge (8:00–8:10 PM) | 10 minutes

"Tonight is different from every workshop we've run.
Every other Wednesday we built something and inspected the output.
Tonight the output is real — these paper trades will show up in your Webull account.
They will have P&L. You will track them until you close them.

Two things are happening simultaneously tonight:
1. We connect to Webull via Python and learn the SDK
2. We manually place our first strategy-based paper trades

If your strategy has no signal today — that is a valid outcome.
Write in the journal: 'No entry signal on [date]. Market conditions: [describe].
Monitoring: [which tickers are approaching signal zone].'
Not trading is also a trade decision. Document it."

---

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 minutes

**Step 1 — Webull SDK Connection (10 min)**
```python
# IMPORTANT: Use paper_webull for all paper trading
# Never use live webull class during class sessions
from webull import paper_webull
import pandas as pd
import yfinance as yf
from datetime import datetime

# Initialize paper trading connection
pwb = paper_webull()

# Login — use your Webull credentials
# Store credentials in .env file — never hardcode
import os
from dotenv import load_dotenv
load_dotenv()

email    = os.getenv('WEBULL_EMAIL')
password = os.getenv('WEBULL_PASSWORD')
trade_pin = os.getenv('WEBULL_TRADE_PIN')

pwb.login(email, password)
pwb.get_trade_token(trade_pin)
print("Connected to Webull Paper Trading ✓")
```

*Note: "If MFA is required, Webull will prompt you for a verification code.
This is normal — it's a security feature they added in 2020. Enter the code when prompted."*

> **Resource:** Webull paper trading setup and SDK guide → `resources/infographics/ig_platform_webull.html` + `resources/handbook/FINN_HB_P1_GettingStarted.md` §1.3

**Step 2 — Query current account state (10 min)**
```python
def get_paper_account_summary(pwb):
    """Get a clean summary of the current paper trading account."""
    account = pwb.get_account()

    summary = {
        'total_value':     float(account.get('netLiquidation', 0)),
        'cash_balance':    float(account.get('cashBalance', 0)),
        'buying_power':    float(account.get('buyingPower', 0)),
        'total_pnl':       float(account.get('unrealizedProfitLoss', 0)),
        'total_pnl_pct':   float(account.get('unrealizedProfitLossRate', 0)) * 100
    }

    print(f"\n{'='*40}")
    print(f"PAPER ACCOUNT SUMMARY")
    print(f"{'='*40}")
    for key, val in summary.items():
        if 'pct' in key:
            print(f"{key:20s}: {val:.2f}%")
        else:
            print(f"{key:20s}: ${val:,.2f}")
    return summary

account_summary = get_paper_account_summary(pwb)
```

**Step 3 — Check current positions (5 min)**
```python
def get_current_positions(pwb):
    """Get all current open paper positions."""
    positions = pwb.get_positions()
    if not positions:
        print("No open positions.")
        return pd.DataFrame()

    rows = []
    for p in positions:
        rows.append({
            'ticker':      p.get('ticker', {}).get('symbol', 'N/A'),
            'qty':         int(p.get('position', 0)),
            'avg_cost':    float(p.get('costPrice', 0)),
            'last_price':  float(p.get('lastPrice', 0)),
            'market_val':  float(p.get('marketValue', 0)),
            'unrealized_pnl': float(p.get('unrealizedProfitLoss', 0)),
            'unrealized_pct': float(p.get('unrealizedProfitLossRate', 0)) * 100
        })

    df = pd.DataFrame(rows)
    print(f"\nOpen Positions ({len(df)}):")
    print(df.to_string(index=False))
    return df

positions_df = get_current_positions(pwb)
```

**Step 4 — Position sizing calculation (8 min)**
```python
def calculate_position_size(account_value, risk_pct, entry_price, stop_price):
    """
    Calculate position size based on fixed % risk.

    Parameters:
        account_value: Current total portfolio value
        risk_pct: Maximum risk as fraction (0.02 = 2%)
        entry_price: Planned entry price
        stop_price: Stop loss price

    Returns:
        Dictionary with position sizing details
    """
    dollar_risk    = account_value * risk_pct
    stop_distance  = abs(entry_price - stop_price)

    if stop_distance == 0:
        print("Error: Stop distance is zero. Set a valid stop price.")
        return None

    shares         = int(dollar_risk / stop_distance)
    position_value = shares * entry_price
    pct_of_port    = position_value / account_value

    result = {
        'account_value':    account_value,
        'risk_pct':         risk_pct,
        'dollar_risk':      dollar_risk,
        'entry_price':      entry_price,
        'stop_price':       stop_price,
        'stop_distance':    stop_distance,
        'shares':           shares,
        'position_value':   position_value,
        'pct_of_portfolio': pct_of_port
    }

    print(f"\n{'='*40}")
    print(f"POSITION SIZING CALCULATION")
    print(f"{'='*40}")
    print(f"Account Value:      ${account_value:,.2f}")
    print(f"Risk (2%):          ${dollar_risk:,.2f}")
    print(f"Entry:              ${entry_price:.2f}")
    print(f"Stop:               ${stop_price:.2f}")
    print(f"Stop Distance:      ${stop_distance:.2f}")
    print(f"Shares:             {shares}")
    print(f"Position Value:     ${position_value:,.2f}")
    print(f"% of Portfolio:     {pct_of_port:.1%}")

    if pct_of_port > 0.25:
        print(f"\n⚠️  WARNING: Position is {pct_of_port:.1%} of portfolio.")
        print("   Consider reducing — max 25% in any single position recommended.")

    return result

# Example — student fills in their own actual values
example_sizing = calculate_position_size(
    account_value=1_000_000,
    risk_pct=0.02,
    entry_price=538.20,
    stop_price=536.10
)
```

**Step 5 — Place paper order (7 min)**
```python
def place_paper_trade(pwb, ticker, action, shares, order_type='MKT',
                      limit_price=None, dry_run=True):
    """
    Place a paper trade on Webull.

    Parameters:
        dry_run: If True, print details but don't actually place
                 Set to False to execute
    """
    if dry_run:
        print(f"\n[DRY RUN — No order placed]")
        print(f"Would place: {action} {shares} shares of {ticker}")
        print(f"Order type: {order_type}")
        if limit_price:
            print(f"Limit price: ${limit_price:.2f}")
        print("Set dry_run=False to execute.")
        return None

    order = pwb.place_order(
        stock=ticker,
        action=action,        # 'BUY' or 'SELL'
        orderType=order_type, # 'MKT' or 'LMT'
        quant=shares,
        price=limit_price or 0  # 0 = market order
    )

    print(f"\nOrder placed: {action} {shares} shares of {ticker}")
    print(f"Order details: {order}")
    return order

# Students place their own trades during independent work
# Instructor demonstrates one trade with dry_run=True first
place_paper_trade(pwb, 'SPY', 'BUY', 50, order_type='LMT',
                  limit_price=538.20, dry_run=True)
```

---

#### Block 3 — Independent Work — First Paper Trades (8:50–9:15 PM) | 25 minutes

**Each student:**

1. Reviews their pre-filled journal entry from the DMB assignment
2. Checks if signal conditions are still valid using live yfinance data
3. Calculates position size using `calculate_position_size()`
4. If signal is valid: places the paper trade using `place_paper_trade()` with `dry_run=False`
5. If no signal: documents "No trade" with reason in journal
6. Verifies trade appears in Webull account using `get_current_positions()`

**Journal entry must be complete before executing:**
All fields except Exit Price, P&L, and Post-trade review must be filled in.
Instructor spot-checks 2–3 students' journals before they execute.

**If no signal today:**
Run `build_feature_matrix()` on their watchlist tickers and identify
which ticker is closest to signaling. Document that analysis in the journal.

---

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 minutes

**Share-out (10 min):**
Each student briefly states:
- Did you place a trade tonight? Which ticker, direction, and why?
- Or: What prevented you from trading? What would need to change?

"No right or wrong answer. 'I found no valid signal tonight' is correct.
'I placed a trade because it felt right' without a journal entry is not."

**Muddiest Point (5 min):**
> *"The muddiest point from tonight was ___."*

**Notebook submission:** `W09_workshop_live_trading_[initials].ipynb` to GitHub.
**Journal submission:** `trading_journal_[initials].md` updated and pushed to GitHub.

---

## Friday, June 12, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Portfolio Pulse (added to Block 1 from this month):**
Every student opens their Webull paper account.
Report: current portfolio value, open positions, any fills since Wednesday.

**Block 4 — Observation Assignment:**
"Before tonight's class, update your trading journal.
For any open trades: what is the current P&L? Is the price approaching your stop?
Is the exit condition close to triggering?
Write a mid-trade note in the journal — not to close it, just to observe it."

---

### Friday, June 12, 2026 — Review & Market Session
**Time:** 8:00–9:30 PM EST
**Topic:** Week 9 Trade Review, Journal Audit & Market Autopsy

---

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 minutes

"Tonight's retrospective is different. Instead of concept questions,
we review decisions. Every person in this room either placed a trade or documented
why they didn't. We're going to talk through those decisions."

**Decision review format (10 min per 2–3 students):**
- "Walk me through your trade. Or your no-trade decision."
- "Show me your journal entry."
- "Was the entry in your pre-defined rules? Exactly?"
- "What is your current P&L on open positions?"
- "When does your exit condition trigger? Have you defined it precisely?"

**Concept questions (remaining time):**

1. "Rule 1: risk 2% per trade. On a $1M portfolio with an entry at $150
   and a stop at $147 — how many shares do you buy?"

2. "Your strategy signaled a buy. You entered. Price immediately dropped 0.5%.
   You feel like you made a mistake. What does your framework say to do?"

3. "Explain the difference between a time-based stop and a price-based stop.
   Which did you use this week? Why?"

---

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 minutes

**Step 1 — Trade Hypothesis Audit (10 min)**
Open the hypothesis log. For each trade placed this week:
- Did the thesis play out as expected?
- If a trade moved against you — what signal would have told you earlier?
- If a trade worked — was it the reason you expected, or something else?

"This is the most important habit you will build this month.
When a trade works, most people celebrate and don't analyze.
That is a mistake. Understanding WHY it worked is as important as the win."

**Step 2 — Chart Review with Open Positions (15 min)**

Pull up each student's open positions on TradingView.
For each position:
- "Where is price relative to the entry?"
- "Is the thesis still intact? Has anything changed since entry?"
- "Where is your stop? Is it still in the right place?"
- "What's the plan if price hits your target today?"

Walk through SPY overall:
- "What did the broader market do this week?"
- "Did market direction help or hurt your trades?"
- "If SPY had a strong directional week — did that create false signals in your strategy?"

**Step 3 — Sector Rotation (10 min)**
Standard checklist. Note: "From this month forward, sector rotation is relevant
not just academically — it affects your open positions. If you're long a tech stock
and tech is rotating out, your position faces a headwind beyond the stock itself."

---

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 minutes

Standard checklist. Add a new element this month:
"Put/call ratio and VIX are now relevant to your open positions.
Elevated VIX = wider bid-ask spreads, higher slippage, more volatile intraday moves.
Your paper trades execute differently in high-VIX environments.
Note the VIX level right now — is this a favorable or unfavorable environment
for your specific strategy?"

---

#### Block 4 — Next Week Preview & Close (9:20–9:30 PM) | 10 minutes

**Next week:** Position sizing deep-dive and risk dashboard.
We build a live portfolio risk monitor in Python.

**Assign reading:**
- Wiki Section 9.2 — All 4 position sizing models (full)
- Wiki Section 9.4 — VaR introduction

**Action item for the weekend:**
"Close any open trades that have hit their exit conditions by Friday close.
Update your journal with the full entry before Monday.
If a trade is still open, write a mid-trade note — is the thesis still valid?"

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

---

# WEEK 10 — Position Sizing & Portfolio Risk
**Theme:** Sizing is not a detail. It is the difference between staying in the game and blowing up.

---

## Monday, June 15, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Portfolio Pulse (Block 1 addition):**
Full account summary: total value vs. starting $1M, current drawdown %, open positions.
"Let's see where everyone stands after Week 1 of live trading."

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Find two stocks in your watchlist with significantly different
ATR values. Calculate 2% risk position size for each using our sizing formula,
assuming entry at current price and a 1.5× ATR stop. Compare the results.
What does ATR tell you about position sizing that a simple % stop doesn't?"

---

### Monday, June 15, 2026 — Theory Session
**Time:** 8:00–9:30 PM EST
**Topic:** Position Sizing Models, Portfolio Risk & The Kelly Criterion
**Curriculum source:** Wiki Sections 9.2, 9.3, 9.4

#### Pre-Session Requirements
- [ ] Wiki Section 9.2 — All 4 position sizing models read
- [ ] Wiki Section 9.3 — Daily risk metrics read
- [ ] Wiki Section 9.4 — VaR introduction read
- [ ] Trading journal updated with all Week 9 trades closed or noted

---

#### Block 1 — Day Review & Portfolio Pulse (8:00–8:15 PM) | 15 minutes

"Before reading check — portfolio review. Where is everyone?
Who is up from starting value? Who is down? By how much?

I want to hear three things from each person in 30 seconds:
1. Your current portfolio value vs. $1,000,000 start
2. How many trades placed so far?
3. Did you follow your rules? Every time?"

Note: no judgment on P&L this early. Focus entirely on process adherence.
"A student down 1.5% who followed their rules perfectly is succeeding.
A student up 2% who deviated from their rules got lucky. They are failing."

---

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 minutes

**Topic A: The Four Position Sizing Models (25 min)**

Walk through Wiki Section 9.2 in full. Use concrete numbers throughout.

- **Fixed % Risk:**
  "The simplest and most practical model for retail traders.
  Formula: `shares = (account × risk%) / stop_distance`
  $1M portfolio, 2% risk, $2.50 stop distance = 8,000 shares.
  Scales automatically — as your portfolio grows, position sizes grow with it.
  As it shrinks, position sizes shrink. Protects capital during drawdowns."

- **Kelly Criterion:**
  "The mathematically optimal fraction to risk given your edge.
  Formula: `f* = (b×p − q) / b` where b = win/loss ratio, p = win rate, q = loss rate.
  Example: 55% win rate, avg win $200, avg loss $100.
  b = 200/100 = 2. p = 0.55. q = 0.45.
  f* = (2×0.55 − 0.45) / 2 = (1.10 − 0.45)/2 = 0.325 = 32.5%
  ALWAYS use half-Kelly in practice: 16.25%.
  Why half? Full Kelly maximizes long-term geometric growth but produces
  horrific short-term drawdowns. Half-Kelly captures most of the benefit
  with much less volatility."

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
  "Instead of using a fixed dollar stop, we use ATR to set the stop dynamically.
  Stop distance = ATR × 1.5 (common multiplier — adjustable).
  Formula: `shares = (account × risk%) / (ATR × 1.5)`
  In a high-volatility environment, ATR is larger — position size automatically shrinks.
  In a quiet market, ATR is smaller — position size grows.
  This means you naturally take smaller positions when the market is wild
  and larger ones when it's calm. That is correct behavior."

  "Example: SPY ATR = $3.20. Stop = 3.20 × 1.5 = $4.80.
  2% risk on $1M = $20,000. Shares = 20,000 / 4.80 = 4,166 shares.
  Now compare to a quiet week: SPY ATR = $1.80. Stop = $2.70.
  Shares = 20,000 / 2.70 = 7,407 shares. 78% more shares in a calm market."

- **Equal Weight:**
  "Simplest diversification. Divide portfolio by number of positions.
  No signal about edge size, no volatility adjustment.
  Useful for portfolio strategies, not for directional trading.
  We use this as a baseline comparison — how do our sized strategies compare
  to simply equal-weighting positions?"

> **Resource:** Risk rules reference — 6 non-negotiable rules with ATR sizing logic and drawdown circuit breakers → `resources/infographics/ig_risk_rules.html`

**Topic B: Portfolio-Level Risk Metrics (10 min)**

Walk through Wiki Section 9.3:

- **Beta management:** "If all your positions are high-beta tech stocks,
  your portfolio has amplified market exposure. In a market selloff,
  everything drops together. Target beta < 1.0 for a balanced portfolio."

- **Sector concentration:** "If 3 of your 5 positions are semiconductor stocks —
  you don't have 5 independent bets. You have 1 sector bet, expressed 3 ways.
  When semiconductors sell off, all 3 positions hurt simultaneously."

- **Correlation monitoring:** "Two positions can be in different sectors but
  still move together. NVDA and AVGO both benefit from AI spending — they're
  correlated even though one is in semis and one is in tech. Monitor correlations."

- **Rolling Sharpe:** "If your rolling 20-day Sharpe drops below 0.5, something changed.
  Either the market regime shifted, or your execution is inconsistent.
  Diagnose before adding new positions."

> **Resource:** Performance metrics reference — Sharpe ratio, drawdown, win rate, and expectancy → `resources/infographics/ig_performance_metrics.html`

**Topic C: VaR Introduction (5 min)**

Walk through Wiki Section 9.4 VaR code:
"VaR answers: 'What is the most I expect to lose in a single day at 95% confidence?'
Historical VaR on SPY over 2 years: roughly −1.5%.
On a $1M portfolio, that's $15,000 per day at 95% confidence.
This is not a ceiling — 5% of days will be worse than this."

---

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 minutes

1. "You run Kelly on your Milestone 2 backtest: 58% win rate, 1.8 R:R.
   Kelly gives you 30% — use half at 15%.
   But your backtest only has 47 trades over 3 years.
   Is 47 trades enough to trust the Kelly estimate? What's the risk?"
   *(Expected: small sample size means win rate and R:R estimates are noisy.
   Kelly applied to noisy estimates can still blow up. Need hundreds of trades
   for stable estimates. With small samples, use much more conservative sizing.)*

2. "ATR-based sizing means you take larger positions in calm markets.
   But the biggest moves happen after periods of low volatility — volatility clusters.
   Is ATR sizing dangerous precisely because it's largest before volatility spikes?"
   *(Expected: Yes — this is a real risk of ATR sizing. Sophisticated implementations
   use a volatility forecast rather than realized ATR, or cap position sizes during
   extended low-vol periods. Acknowledge the limitation.)*

3. "Devil's advocate: Isn't 2% risk per trade extremely conservative?
   If you're right 60% of the time and risking 2%, you'll barely outperform a savings account."
   *(Expected: The 2% rule protects against ruin. A 50% drawdown requires a 100% gain
   to recover. With 2% sizing and a long losing streak (which WILL happen), you stay solvent.
   Ruin prevention is the first priority. Performance second.)*

---

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 minutes

**Wednesday workshop:**
"We build a live portfolio risk dashboard — a Python notebook that queries your
Webull paper account and computes: current drawdown, portfolio beta, sector exposure,
position-level VaR, and rolling Sharpe. Starter: `W10_workshop_risk_dashboard_starter.ipynb`"

**Pre-reading:**
- Review Wiki Section 3.3 performance metrics (refresh for live context)
- Wiki Section 9.3 daily risk metrics (re-read with live portfolio in mind)

**Closing reflection:**
*"The most important thing I need to understand about my position sizes before Wednesday is ___."*

---

## Wednesday, June 17, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Portfolio Pulse (Block 1):** Full account summary. Note any changes from Monday.

**Block 4 — Observation Assignment:**
"During market hours today, watch your open positions for 30 minutes.
Without acting on anything — observe: does the intraday price action make you want
to override your rules? Write down every impulse you feel and what triggered it.
Bring this honest log to tonight's class."

---

### Wednesday, June 17, 2026 — Workshop Session
**Time:** 8:00–9:30 PM EST
**Topic:** Live Portfolio Risk Dashboard — Real-Time Risk Monitoring in Python
**Curriculum source:** Wiki Sections 9.2, 9.3, 9.4
**Notebook:** `W10_workshop_risk_dashboard_[initials].ipynb`

---

#### Block 1 — Framing & Context Bridge (8:00–8:10 PM) | 10 minutes

"Monday we learned the risk rules and sizing models theoretically.
Tonight we build the instrument panel that makes those rules operational.

Professional traders and risk managers don't track portfolio risk in their heads.
They have dashboards. Real-time numbers. Alerts that fire when limits are breached.

Tonight's notebook becomes your permanent portfolio monitor for the rest of this course.
Every Friday before the review session, you run this dashboard.
It tells you exactly where you stand before you walk into the room."

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
Run the full dashboard on your own paper account.
Update the `sample_log` with your actual paper trading P&L from Week 9's trades.
Answer in markdown:
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

**Share-out:** 2 students share their dashboard output.
"What did the dashboard tell you that you didn't already know from looking at the account?"

**Muddiest Point:**
> *"The muddiest point from tonight was ___."*

**Notebook submission:** `W10_workshop_risk_dashboard_[initials].ipynb` to GitHub.

---

## Friday, June 19, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Portfolio Pulse (Block 1):** Full account summary. Two weeks into live trading.

---

### Friday, June 19, 2026 — Review & Market Session
**Time:** 8:00–9:30 PM EST
**Topic:** Week 10 Review + Risk Dashboard Live Review + Position Audit

---

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 minutes

1. "Walk me through the Kelly Criterion calculation for your trades this month.
   What fraction does it suggest? Are you above or below that?"

2. "ATR-based sizing — give me a scenario where it gives you a much smaller position
   than fixed-% risk would. Why is that a feature, not a bug?"

3. "You have 4 open positions. 3 are long tech stocks. 1 is long SPY.
   How correlated is this portfolio? What happens in a tech selloff?"

4. "From the impulse log in the DMB observation — what triggered the urge to override
   your rules today? How did you handle it? What does that tell you?"

5. "Rule 4: drawdown 10%, reduce size 50%. Why 50% specifically?
   Why not just stop trading entirely?"

---

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 minutes

**Portfolio Review Focus:**
"From this week forward, the Market Autopsy includes a portfolio review segment.
We look at the market AND we look at how the market affected our positions."

Walk through SPY and QQQ. Then for each student's open position:
- Is the underlying thesis still valid after this week's price action?
- Did any position approach its stop level? What happened?
- Were there any entry signals this week that students did or did not take?

"If you saw a valid signal and didn't take it — why not?
If it was hesitation or fear — that's data about your psychology.
If it was a legitimate market context override — was that pre-defined in your rules?"

**Sector Rotation + Position Impact:**
"How did this week's sector performance affect your holdings?
If you're long energy and energy rotated down this week — is that strategy failure
or market noise? How do you tell the difference?"

---

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 minutes

Standard checklist plus: "Note VIX right now. Compare to when you opened your positions.
Did VIX expansion or contraction affect your trade outcomes this week?"

---

#### Block 4 — Next Week Preview & Close (9:20–9:30 PM) | 10 minutes

**Next week:** Reading live performance — P&L attribution and regime analysis.
"We're going to learn how to distinguish between a strategy having a bad week
and a strategy being broken. That distinction is the hardest skill in trading."

**Assign reading:**
- Re-read Wiki Section 7.1 — Backtesting best practices (through the live trading lens)
- Re-read Wiki Section 3.3 — Performance metrics (now applied to real data)

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

---

# WEEK 11 — Reading Live Performance
**Theme:** Three weeks of data. Not enough to judge a strategy, but enough to start asking the right questions.

---

## Monday, June 22, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Portfolio Pulse:** Three-week cumulative P&L. Beginning to see meaningful data.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Look at your trade journal for all trades placed so far.
Group your trades into two categories: trades that followed your rules exactly,
and trades where you deviated in any way. What is the average P&L for each group?
Write it down and bring it tonight."

---

### Monday, June 22, 2026 — Theory Session
**Time:** 8:00–9:30 PM EST
**Topic:** P&L Attribution, Regime Detection & Strategy vs. Market
**Curriculum source:** Wiki Sections 3.3, 9.3 (applied), original FINN framework

#### Pre-Session Requirements
- [ ] Full trade journal updated — all 3 weeks of trades logged
- [ ] Rule-following vs. deviation analysis completed (DMB assignment)
- [ ] Portfolio dashboard run and current metrics noted

---

#### Block 1 — Day Review & Rule Adherence Check (8:00–8:15 PM) | 15 minutes

"Who completed the rule-following analysis from the DMB?
What was the average P&L on rule-following trades versus deviations?

This is one of the most important data points you will generate in this course.
If rule-following trades outperform deviations — the system works and your feelings don't.
If deviations outperform — we need to analyze why. Is it a system flaw, or luck?"

---

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 minutes

**Topic A: P&L Attribution (15 min)**

"When your portfolio is up 2% over 3 weeks, what caused it?
Was it the strategy? Market direction (beta)? A single lucky trade?

P&L attribution decomposes returns into components:
- **Market contribution (beta):** How much did the overall market rise/fall?
  If SPY was up 3% and you're up 2% — your strategy underperformed the market.
- **Strategy alpha:** Return above what the market alone would have given you.
  Alpha = Your Return − (Beta × Market Return)
- **Individual trade contribution:** Which specific trades drove the P&L?
  Are returns concentrated in 1–2 trades, or distributed across many?
- **Sizing contribution:** Did you make more on bigger positions? Did sizing work?

The goal of attribution is to understand WHETHER your strategy is generating edge —
or whether you're just riding the market."

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

"Your backtest was likely run across multiple market regimes — trending markets,
volatile markets, range-bound markets. Your strategy may work well in one regime
and poorly in another.

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

The critical question: was your strategy designed for the current regime?
If your strategy is a mean-reversion system and SPY is in a strong trend — it will lose.
That is not a broken strategy. That is a mismatched regime."

**Topic C: Strategy vs. Market — The Three Questions (10 min)**

When performance is disappointing, ask these three questions in order:

"**Question 1: Am I following my rules?**
If no — the performance data is contaminated. Fix rule adherence first.
Evaluate performance only after you have 2+ consistent rule-following weeks.

**Question 2: Is the market in a regime my strategy works in?**
Check VIX, ADX, 200-SMA. If the regime is wrong for your strategy —
reduce position sizes, wait for regime to change, or switch to a regime-appropriate strategy.

**Question 3: Is the strategy's edge still present?**
Run an updated version of Week 5's IC test on recent data (last 60 days).
Has the IC declined? Is the signal still statistically meaningful?
If IC has collapsed — the edge may be gone. Time to re-research.

Only reach Question 3 after Questions 1 and 2 are answered. Most underperformance
is explained by 1 or 2. Very rarely is the strategy genuinely broken."

> **Resource:** Multi-signal scoring — weighted composite and veto logic for evaluating whether your edge is still present across signals → `resources/infographics/ig_multi_signal.html`

---

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 minutes

1. "After 3 weeks of paper trading with 12 trades, your Sharpe ratio is 0.6.
   Your backtest showed 1.4 over 4 years. Is the strategy underperforming?
   How many trades do you need before you can statistically compare the two?"
   *(Expected: 12 trades is nothing. Sharpe needs hundreds of observations to be stable.
   The Law of Large Numbers — 3 weeks of results tells you very little about the
   long-term expectation. Need at least 30–50 trades for preliminary signal.)*

2. "Your rule-following trades averaged +0.3% and your deviations averaged −0.8%.
   A student argues: 'This just means I deviated on the bad ones.'
   Is that a valid counter-argument? How would you test it?"
   *(Expected: Valid concern — selection bias. Need to check: did you deviate
   on setups that looked identical to rule-following setups? Or did you deviate
   specifically when the setup 'looked bad'? If the latter, your gut may be
   detecting genuine poor quality setups — but you need more data.)*

3. "Devil's advocate: If your strategy only works in trending markets,
   and markets are only trending 30% of the time, is the strategy useful?
   Why not just buy SPY?"
   *(Expected: If the strategy generates strong alpha during its 30% active periods,
   it can still be worth running — especially if it's hedged or sized down during
   non-trending periods. Regime-conditional strategies are valid but need explicit
   regime filters built into the entry rules.)*

---

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 minutes

**Wednesday workshop:**
"We build a live portfolio analytics notebook that performs P&L attribution,
computes rolling alpha vs. SPY, and runs a regime detection filter.
Starter: `W11_workshop_analytics_starter.ipynb`
Bring your complete trade journal — we'll import it into the notebook."

**Pre-reading:** None this week — fully applied focus.

**Journal audit requirement:**
"Before Wednesday's class, audit your own journal.
Every trade must have all fields completed — including post-trade review
for any trade closed so far. Missing post-trade reviews must be written by Wednesday."

---

## Wednesday, June 24, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Portfolio Pulse:** Check for any regime shifts since Monday.

---

### Wednesday, June 24, 2026 — Workshop Session
**Time:** 8:00–9:30 PM EST
**Topic:** Live Portfolio Analytics — Attribution, Alpha, Regime Detection
**Curriculum source:** Wiki Sections 3.3, 9.3
**Notebook:** `W11_workshop_analytics_[initials].ipynb`

---

#### Block 1 — Framing & Context Bridge (8:00–8:10 PM) | 10 minutes

"Three weeks of live trading. Tonight we analyze what actually happened.
Not just P&L — but WHY. Where did the returns come from?
Was it skill, beta, luck, or a combination?

By the end of tonight you'll have a Python function that takes your trade journal
and produces a complete attribution analysis. This is the kind of analysis that
portfolio managers run monthly. We're running it on our third week of paper trading."

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
Import your real trade journal data and run all three functions.
Answer in markdown:
1. What is your portfolio's alpha vs. SPY? Is it statistically significant?
2. What is the average P&L for rule-following vs. deviation trades?
3. What is the current market regime? Does your strategy fit this regime?
4. Based on all three analyses — what is the single most important thing to change
   about your trading approach going into Week 12?

**Extension Challenge:**
Build a `weekly_report()` function that:
1. Runs `trade_summary()`
2. Runs `calculate_alpha_beta()`
3. Runs `detect_market_regime()`
4. Outputs a formatted markdown report saved to `weekly_report_[date].md`

This becomes your automated Friday pre-session report for Months 3–6.

---

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 minutes

**Share-out:** Focus on attribution results.
"How many of you found that most of your return came from beta, not alpha?
That's honest and normal at this stage. What does it tell you about what to do next?"

**Muddiest Point:**
> *"The muddiest point from tonight was ___."*

**Notebook submission:** `W11_workshop_analytics_[initials].ipynb` to GitHub.

---

## Friday, June 26, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Portfolio Pulse:** Three full weeks complete. Review all metrics.

---

### Friday, June 26, 2026 — Review & Market Session
**Time:** 8:00–9:30 PM EST
**Topic:** Week 11 Review + Month 3 Mid-Point Deep Dive

---

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 minutes

"Tonight's retrospective is a full mid-month performance review.
Every student presents their Week 11 analytics in 3 minutes:
1. Total P&L and return %
2. Alpha vs. beta finding
3. Rule adherence rate
4. Current market regime and strategy fit
5. One thing to change in Week 12"

After each student's brief: class asks one question.
Instructor gives one coaching point.

This format mirrors the Milestone 3 review that ends Month 4.
Practice it now.

---

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 minutes

Standard format plus deep regime analysis:
"What regime are we in right now? Pull up SPY with the 60-day SMA and ADX.
Is your strategy the right one for this environment?

For each student's position: Does the current regime support holding this trade?
If not — is there a rule in your strategy for regime-based exits?
If not, should there be? Would adding a regime filter improve or hurt your backtest?"

---

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 minutes

Standard checklist plus: "Month-end is approaching (June 30).
Historically, month-end brings institutional rebalancing flows.
Note VIX behavior and put/call ratio going into the final week of June.
How might month-end rebalancing affect your open positions?"

---

#### Block 4 — Next Week Preview & Close (9:20–9:30 PM) | 10 minutes

**Next week:** When to adapt a strategy versus when to hold it.
The most important and hardest decision in systematic trading.

**Assign reading:**
- Wiki Section 7.1 (re-read rule 6: avoid overfitting)
- Wiki Section 7.3 — Strategy templates (revisit adaptive strategy concept)

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

---

# WEEK 12 — Iteration, Adaptation & Month 3 Close
**Theme:** Knowing when to adjust, when to hold, and when to admit the strategy needs work.

---

## Monday, June 29, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Portfolio Pulse:** End of Month 3 approaching. Full account review.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Review your strategy's performance over all 4 weeks.
Identify one specific rule or parameter you think should be changed — and one you
think should stay exactly the same. Write the reasoning for each before class tonight."

---

### Monday, June 29, 2026 — Theory Session
**Time:** 8:00–9:30 PM EST
**Topic:** When to Adapt a Strategy — The Decision Framework
**Curriculum source:** Wiki Sections 7.1, 7.3, original FINN framework

#### Pre-Session Requirements
- [ ] Full Month 3 trade journal complete — all 4 weeks
- [ ] Strategy adaptation analysis from DMB observation written
- [ ] Week 11 analytics notebook results reviewed

---

#### Block 1 — Day Review (8:00–8:15 PM) | 15 minutes

"Who has a change they want to make to their strategy?
Walk me through it. What prompted the change?
Before you answer — tell me: how many trades are you basing this on?"

Frame the core tension immediately:
"The most dangerous thing in systematic trading is changing your strategy too soon.
The second most dangerous is holding a broken strategy too long.
Tonight we build the decision tree that separates the two."

---

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 minutes

**Topic A: The Adaptation Decision Tree (20 min)**

Draw and walk through this framework on the whiteboard:

```
START: Strategy is underperforming expectations
           │
           ▼
Q1: Am I following my rules consistently?
    NO → Fix rule adherence first. 
         Do not touch the strategy.
         Return to START after 2 consistent weeks.
    YES ↓
           ▼
Q2: Is the market in a regime my strategy was designed for?
    NO → Reduce position sizes 50%.
         Do NOT change strategy rules.
         Monitor for regime shift.
         Return to START when regime realigns.
    YES ↓
           ▼
Q3: Is the signal still statistically significant?
    Run IC test on last 60 days of data.
    IC still > 0.03 → Continue. 3–4 more weeks before re-evaluating.
    IC collapsed to ~0 → Edge may be gone. Research phase needed.
           ↓
Q4: How many trades are you basing this on?
    < 30 trades → Not enough data. Hold the strategy.
    30–100 trades → Preliminary evidence. Small parameter adjustment only.
    > 100 trades → Meaningful sample. Structured re-research permitted.
           ↓
ONLY IF all above point to genuine strategy failure:
    → Run updated backtest on recent data
    → Identify specific failure mode
    → Make minimum necessary change
    → Re-paper trade for 4 weeks before trusting the change
```

"Notice what this decision tree is protecting against: emotional changes.
'The market moved against me for 2 weeks' is not a reason to change the strategy.
'The IC collapsed on 60+ days of recent data AND we have 40+ trades showing
consistent underperformance AND the regime is correct' is a reason to investigate."

**Topic B: Types of Strategy Adjustments (15 min)**

"When adjustment IS warranted, there is a hierarchy of changes by risk:

**Level 1 — Safest: Regime filter**
Add a regime condition that prevents the strategy from trading in unfavorable environments.
Example: 'Only enter longs when price > 200 SMA and VIX < 25.'
This doesn't change the core signal — it adds a gating condition.
Retest the full backtest with this filter. Does it improve out-of-sample?

**Level 2 — Moderate: Exit rule adjustment**
Modify the exit condition — time stop, RSI recovery threshold, profit target.
These affect R:R and win rate but not the core entry logic.
Retest. Compare Sharpe and drawdown before and after.

**Level 3 — Higher risk: Entry signal adjustment**
Changing entry parameters (RSI threshold from 30 to 25, EMA period from 20 to 15).
This is parameter optimization — it has high overfitting risk.
If you adjust parameters, use a new out-of-sample test period.
Never optimize on the same data you're evaluating performance on.

**Level 4 — Start over: Signal replacement**
Abandoning the core signal for a new one.
This is effectively a new strategy. Paper trade it for 4 weeks before scaling.
Your current strategy continues at minimal size while the new one is validated."

**Topic C: The Overfitting Trap in Live Adjustment (5 min)**

"The most dangerous pattern in live trading adaptation:
1. Strategy has 5 losing trades in a row
2. Trader tweaks parameter to make those 5 trades winners in backtest
3. Trader feels better. Deploys 'improved' strategy.
4. Next 5 trades are different — the tweak helps nothing, may hurt.

This is live overfitting. You fit the model to recent noise.
The antidote: any parameter change must be tested on a completely separate
period that was not used to motivate the change."

---

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 minutes

1. "Your RSI mean reversion strategy has been losing for 3 weeks.
   You look back and notice that all 5 losing trades happened when ADX > 30 —
   strong trends. Is adding ADX < 25 as a filter a valid regime improvement,
   or is it overfitting to recent losses?"
   *(Expected: Potentially valid — ADX is a legitimate regime filter with
   theoretical basis. BUT — test it on the full backtest history, not just the
   3 losing weeks. If it improves performance over 3+ years, it's a regime filter.
   If it only 'fixes' the last 5 trades, it's overfitting.)*

2. "A student's strategy has a backtest Sharpe of 1.4 but live paper trading
   Sharpe of 0.3 over 6 weeks with 18 trades. Is the strategy broken?"
   *(Expected: Not necessarily. 18 trades is small. The difference could be:
   transaction costs not fully modeled, regime difference, small sample noise.
   Need at least 30 trades in the live regime to start comparing meaningfully.
   The right move: continue, monitor, don't change yet.)*

3. "Devil's advocate: Isn't the entire concept of a 'fixed strategy' wrong?
   The market is constantly evolving. Shouldn't the strategy evolve with it?"
   *(Expected: Yes — but on what timescale? Day-to-day changes are noise.
   The tension is between responsiveness and stability. Most professional
   systematic funds have quarterly review cycles. They don't change strategies
   on 3-week performance. The adaptation framework is the answer:
   systematic review with evidence requirements, not emotional reaction.)*

---

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 minutes

**Wednesday workshop:**
"We build the strategy adjustment framework in Python — a notebook that applies
the Q1–Q4 decision tree to your actual trade data and gives you a recommendation:
hold, adjust, or re-research. Starter: `W12_workshop_adaptation_starter.ipynb`"

**Pre-reading:** None — fully applied this week.

**Month 3 close preparation:**
"Friday is the last session of Month 3. We'll do a full month close:
complete portfolio review, journal audit, and preview of Month 4.
Before Friday, have your complete Month 3 trade journal ready — all trades,
all journal fields, all post-trade reviews."

---

## Wednesday, July 1, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Portfolio Pulse:** Month 3 penultimate day. Full account review.

**Note to instructor:** July 4th weekend approaching. Market closes July 3 at 1 PM EST
(early close). Mention this to students — Friday's paper trading may be affected
by thin, low-volume conditions.

---

### Wednesday, July 1, 2026 — Workshop Session
**Time:** 8:00–9:30 PM EST
**Topic:** Strategy Adaptation Framework + Month 3 Analytics Final Build
**Curriculum source:** Wiki Sections 7.1, 9.3
**Notebook:** `W12_workshop_adaptation_[initials].ipynb`

---

#### Block 1 — Framing & Context Bridge (8:00–8:10 PM) | 10 minutes

"Tonight we complete two things.

First: we implement the adaptation decision tree as a Python function.
You give it your trade log, your IC test results, and your regime data —
it tells you what to do.

Second: we build the final Month 3 analytics summary.
A clean, complete notebook that captures everything from Month 3 —
total return, attribution, rule adherence, regime analysis, and recommendation.
This becomes your Month 3 artifact for the Milestone 3 review at end of Month 4."

---

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 minutes

```python
import pandas as pd
import numpy as np
import yfinance as yf
from scipy.stats import spearmanr
import warnings
warnings.filterwarnings('ignore')
```

**Step 1 — Automated adaptation recommendation (20 min)**
```python
def strategy_adaptation_check(
    trades_df,
    signal_data_df,
    fwd_return_col='Fwd_5d_Return',
    signal_col='RSI_14',
    benchmark='SPY',
    starting_capital=1_000_000
):
    """
    Run the FINN adaptation decision tree on live trade data.
    Returns a recommendation: HOLD, ADJUST, or RESEARCH.
    """
    n_trades       = len(trades_df)
    rule_rate      = trades_df['rule_followed'].mean() if 'rule_followed' in trades_df else 1.0
    total_pnl      = trades_df['pnl'].sum()
    total_return   = total_pnl / starting_capital

    print(f"\n{'='*55}")
    print(f"STRATEGY ADAPTATION CHECK — FINN Framework")
    print(f"{'='*55}")
    print(f"Trades analyzed:     {n_trades}")
    print(f"Total P&L:           ${total_pnl:+,.2f} ({total_return:+.2%})")

    # ── Q1: Rule Adherence ──────────────────────────────────
    print(f"\n── Q1: Rule Adherence ──")
    print(f"Rule-following rate: {rule_rate:.1%}")
    if rule_rate < 0.85:
        print("FINDING: Rule adherence below 85%.")
        print("ACTION:  Fix rule adherence FIRST. Do not change strategy.")
        print("RECOMMENDATION: HOLD (address behavior, not strategy)")
        return "HOLD_FIX_BEHAVIOR"

    print("Q1 PASS: Rule adherence acceptable.")

    # ── Q2: Regime Check ────────────────────────────────────
    print(f"\n── Q2: Market Regime Check ──")
    df = yf.download(benchmark, period='3mo', interval='1d', progress=False)
    df.columns = [c[0] if isinstance(c, tuple) else c for c in df.columns]
    df['Ret']   = df['Close'].pct_change()
    df['SMA60'] = df['Close'].rolling(60).mean()

    above_sma   = df['Close'].iloc[-1] > df['SMA60'].iloc[-1]
    realized_vol = df['Ret'].rolling(21).std().iloc[-1] * np.sqrt(252)
    momentum    = df['Close'].iloc[-1] / df['Close'].iloc[-20] - 1

    print(f"Above SMA:           {'Yes' if above_sma else 'No'}")
    print(f"Realized vol:        {realized_vol:.1%}")
    print(f"20-day momentum:     {momentum:+.2%}")

    unfavorable_regime = realized_vol > 0.28 or (not above_sma and momentum < -0.03)
    if unfavorable_regime:
        print("FINDING: Market regime may be unfavorable for this strategy.")
        print("ACTION:  Reduce position sizes 50%. Do not change strategy rules.")
        print("RECOMMENDATION: HOLD_REDUCE_SIZE")
        return "HOLD_REDUCE_SIZE"

    print("Q2 PASS: Regime appears acceptable.")

    # ── Q3: Signal IC Check ─────────────────────────────────
    print(f"\n── Q3: Signal IC (last 60 days) ──")
    recent = signal_data_df.tail(60).dropna(subset=[signal_col, fwd_return_col])
    if len(recent) >= 20:
        ic, p_val = spearmanr(-recent[signal_col], recent[fwd_return_col])
        print(f"Recent IC (60d):     {ic:.4f}")
        print(f"p-value:             {p_val:.4f}")
        if abs(ic) < 0.02:
            print("FINDING: IC has collapsed. Signal may have lost edge.")
            print("ACTION:  Run extended IC analysis. Consider re-research.")
            print("RECOMMENDATION: RESEARCH")
            return "RESEARCH"
        print("Q3 PASS: Signal IC still present.")
    else:
        print("Insufficient recent data for IC test. Skipping Q3.")

    # ── Q4: Sample Size ─────────────────────────────────────
    print(f"\n── Q4: Sample Size Sufficiency ──")
    print(f"Total trades:        {n_trades}")
    if n_trades < 30:
        print("FINDING: Fewer than 30 trades. Statistically insufficient.")
        print("ACTION:  Continue current strategy. Do not change yet.")
        print("RECOMMENDATION: HOLD")
        return "HOLD"
    elif n_trades < 100:
        print("FINDING: Preliminary sample (30–100 trades). Limited changes only.")
        print("ACTION:  Level 1 adjustment (regime filter) permitted if supported.")
        print("RECOMMENDATION: ADJUST_CAUTIOUSLY")
        return "ADJUST_CAUTIOUSLY"
    else:
        print("FINDING: Sufficient sample (>100 trades) for structured adjustment.")
        print("ACTION:  Full re-research cycle permitted.")
        print("RECOMMENDATION: ADJUST_STRUCTURED")
        return "ADJUST_STRUCTURED"

# Load student's actual data here
# For workshop: use sample data
sample_trades = pd.DataFrame({
    'date':          pd.date_range('2026-06-10', periods=15, freq='B'),
    'pnl':           [195,-92,345,-125,111,88,-210,175,95,-45,210,-88,155,-30,175],
    'rule_followed': [True,True,True,False,True,True,True,False,True,True,True,True,True,False,True]
})
sample_signal = yf.download('SPY', period='3mo', progress=False)
sample_signal.columns = [c[0] if isinstance(c, tuple) else c for c in sample_signal.columns]
sample_signal['RSI_14'] = sample_signal['Close'].diff().clip(lower=0).rolling(14).mean() / \
                           abs(sample_signal['Close'].diff()).rolling(14).mean() * 100
sample_signal['Fwd_5d_Return'] = sample_signal['Close'].pct_change(5).shift(-5)

recommendation = strategy_adaptation_check(sample_trades, sample_signal)
print(f"\n{'═'*55}")
print(f"FINAL RECOMMENDATION: {recommendation}")
print(f"{'═'*55}")
```

**Step 2 — Month 3 summary report generator (20 min)**
```python
def generate_month3_summary(trades_df, starting_capital=1_000_000, save_file=True):
    """
    Generate a complete Month 3 performance summary as markdown.
    This becomes the Milestone 3 review artifact.
    """
    total_pnl      = trades_df['pnl'].sum()
    total_return   = total_pnl / starting_capital
    n_trades       = len(trades_df)
    wins           = trades_df[trades_df['pnl'] > 0]
    losses         = trades_df[trades_df['pnl'] < 0]
    win_rate       = len(wins) / n_trades if n_trades else 0
    avg_win        = wins['pnl'].mean() if len(wins) else 0
    avg_loss       = abs(losses['pnl'].mean()) if len(losses) else 0
    rr             = avg_win / avg_loss if avg_loss else 0
    rule_rate      = trades_df['rule_followed'].mean() if 'rule_followed' in trades_df else 1.0

    summary_md = f"""# Month 3 Summary Report
**Student:** [YOUR NAME]
**Period:** June 8 – July 3, 2026
**Generated:** {pd.Timestamp.now().strftime('%Y-%m-%d %H:%M')}

---

## Performance Overview

| Metric | Value |
|--------|-------|
| Starting Capital | $1,000,000.00 |
| Ending Value | ${starting_capital + total_pnl:,.2f} |
| Total P&L | ${total_pnl:+,.2f} |
| Total Return | {total_return:+.2%} |
| SPY Return (same period) | [FILL IN] |
| Alpha vs SPY | [FROM ANALYTICS NOTEBOOK] |

## Trade Statistics

| Metric | Value |
|--------|-------|
| Total Trades | {n_trades} |
| Win Rate | {win_rate:.1%} |
| Average Win | ${avg_win:,.2f} |
| Average Loss | ${avg_loss:,.2f} |
| Risk:Reward | {rr:.2f} |
| Rule Adherence Rate | {rule_rate:.1%} |

## Strategy Adaptation Check
**Recommendation:** [FROM adaptation_check FUNCTION]

## Key Lessons Learned
1. [What worked well this month]
2. [What didn't work — and why]
3. [One specific thing to change in Month 4]

## Month 4 Strategy Plan
[Describe any modifications to the strategy for Month 4,
based on the adaptation framework — with justification]
"""

    if save_file:
        filename = f"month3_summary_{pd.Timestamp.now().strftime('%Y%m%d')}.md"
        with open(filename, 'w') as f:
            f.write(summary_md)
        print(f"Month 3 summary saved: {filename}")

    print(summary_md)
    return summary_md

report = generate_month3_summary(sample_trades)
```

---

#### Block 3 — Independent / Pair Work (8:50–9:15 PM) | 25 minutes

**Core Exercise:**
Run `strategy_adaptation_check()` on your real trade data.
Fill in your real trade data replacing the sample.
Answer the recommendation question honestly:
- What did the decision tree recommend?
- Do you agree with the recommendation? Why or why not?
- Fill in `generate_month3_summary()` with your actual metrics.

**Extension Challenge:**
Add a 5th check to `strategy_adaptation_check()`:
Rule adherence by market regime — are you MORE likely to deviate in high-volatility environments?
Split the `rule_followed` column by VIX level. Is there a pattern?

---

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 minutes

**Share-out:** 2–3 students share their adaptation recommendations.
"What did the framework tell you? Does it match your intuition? Where do they diverge?"

**Muddiest Point:**
> *"The muddiest point from Month 3 overall was ___."*

**Notebook submission:** `W12_workshop_adaptation_[initials].ipynb` to GitHub.
**Month 3 Summary:** `month3_summary_[initials].md` pushed to GitHub.

---

## Friday, July 3, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**⚠️ NOTE:** Markets close early today at 1:00 PM EST (Independence Day eve).
Volume will be thin. Spreads may be wider than normal. No new positions today.
Use this session to review and close any open positions if needed.

**Portfolio Pulse:** Final account review for Month 3.

---

### Friday, July 3, 2026 — Review & Market Session + Month 3 Close
**Time:** 8:00–9:30 PM EST
**Topic:** Month 3 Complete Close — Full Performance Review & Month 4 Preview

---

#### Block 1 — Month 3 Retrospective (8:00–8:30 PM) | 30 minutes

"Month 3 is complete. We've been live for 4 weeks.
Tonight is the formal close — not just of a week, but of a phase.

Every student presents their Month 3 summary in 4 minutes:
1. Total return and P&L
2. Win rate and R:R
3. Rule adherence rate
4. Adaptation recommendation from the framework
5. One thing you're changing for Month 4 — with justification
6. One thing you're keeping exactly the same — with justification"

After each presentation, instructor gives one coaching point.
Class asks one question each.

---

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 minutes

**Full Month 3 Market Review:**
"Let's zoom out. Pull up SPY on a monthly view.
What did the market do during Month 3 (June 8 – July 3)?
Was it bullish, bearish, trending, or choppy?

Now compare that to your strategy's expected performance in that regime.
Is your result consistent with what your backtested regime analysis predicted?
If yes — the strategy is working as expected. If no — why not?"

Walk through sector rotation over the full month.
"Which sectors led Month 3? Did that create tailwinds or headwinds for your positions?"

---

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 minutes

Standard checklist. "July 4th weekend — how does a 4-day weekend affect VIX?
Does implied volatility typically rise or fall going into extended market closures?
Observe and log this for future reference."

---

#### Block 4 — Month 4 Preview & Close (9:20–9:30 PM) | 10 minutes

"Month 4 continues paper trading — but with a higher bar.
We add deeper AI automation, begin exploring Python-to-Webull automated signal alerts,
and build toward Milestone 3 at the end of Month 4: the paper trading mid-review.

Month 4 expectations:
- Minimum 2 trades per week (unless strategy has no signal — documented)
- Full journal entries for every trade
- Monthly analytics report generated each Friday
- Strategy must be the version you committed to at the end of Month 3

The Milestone 3 review will audit your entire Month 3 and Month 4 journal.
Quality of documentation matters as much as P&L."

**Pre-reading for Month 4, Week 1:**
- Wiki Section 6.3 — Full ML signal generation framework
- Wiki Section 6.4 — Multi-agent AI system concept
- Review your Month 3 summary report before Week 1 Monday

**Weekend assignment:**
"July 4th weekend is a rare no-market, no-class period. Use it well:
Complete your Month 3 summary report. Review all 4 weeks of journal entries.
Identify your 3 best and 3 worst decisions — not trades, decisions.
Come back Monday ready to talk about them."

**Monthly One-Liner:**
> *"Month 3 taught me ___, and Month 4 I want to ___."*

---

---

## Month 3 — Instructor Summary Notes

### Content Coverage Checklist

- [ ] Wiki Section 8.1–8.3 — Webull platform, setup, Python SDK (Week 9)
- [ ] Wiki Section 8.4 — Trading journal (Week 9 — operational from Week 9 forward)
- [ ] Wiki Section 9.1 — Core risk rules (Week 9)
- [ ] Wiki Section 9.2 — All 4 position sizing models (Week 10)
- [ ] Wiki Section 9.3 — Daily risk metrics (Week 10–11)
- [ ] Wiki Section 9.4 — VaR introduction (Week 10)
- [ ] P&L attribution framework (Week 11 — original FINN content)
- [ ] Regime detection framework (Week 11 — original FINN content)
- [ ] Strategy adaptation decision tree (Week 12 — original FINN content)

### Workshops Delivered

| Workshop | Notebook | Key Skills |
|---------|---------|-----------|
| W09 | `W09_workshop_live_trading` | Webull SDK, position sizing calc, first paper trades |
| W10 | `W10_workshop_risk_dashboard` | Live portfolio monitor, drawdown tracker, risk alerts |
| W11 | `W11_workshop_analytics` | P&L attribution, alpha/beta, regime detection |
| W12 | `W12_workshop_adaptation` | Strategy adaptation framework, Month 3 summary report |

### Month 3 Student Assessment

At end of Month 3, document each student:
```
Student: [Name]
Month 3 Period: June 8 – July 3, 2026
Total Return: ___% vs SPY ___% 
Total Trades: ___
Win Rate: ___
Rule Adherence Rate: ___
Adaptation Recommendation: HOLD / ADJUST / RESEARCH
Month 4 Strategy Change: [describe or None]
Journal Quality: Complete / Partial / Needs Work
Milestone 3 Readiness: On track / Needs attention
Notes: ___
```

### Milestone 3 Preparation Note

Milestone 3 (Paper Trading Mid-Review) occurs at end of Month 4.
The Milestone 3 assessment will cover:
- Full Month 3 + Month 4 trade journal audit
- P&L vs. SPY benchmark analysis
- Strategy adherence review
- Attribution analysis from W11 notebook
- Month 3 summary report quality

Begin flagging any students with:
- Rule adherence below 80% — coaching needed before Month 4
- Fewer than 8 trades across Month 3 — prompt for more active engagement
- Missing journal fields — require completion before Month 4 Week 1

### July 4th Weekend

No class July 4 (Saturday). July 3 is the final session of Month 3.
Market closes early July 3 — 1:00 PM EST. Note in DMB.
Month 4 begins Monday July 6, 2026.

---

*FINN — Month 03 Lesson Plan*
*Paper Trading Phase I: Live Strategy Deployment*
*Dates: June 8 – July 3, 2026*
*Next: FINN_Month04.md — Paper Trading Phase II: Iteration, Automation & Milestone 3*
