# FINN — Week 9: Going Live
## Paper Trading Phase I | Month 3: Paper Trading I
**Dates:** June 8–13, 2026
**Week Number:** 9 of 24

---

## WEEK OVERVIEW

### Theme
The backtest is over. The market is real. Every trade gets a journal entry.

### Learning Objectives
By the end of this week, students will be able to:
- Execute paper trades on Webull using their defined strategy rules without deviation
- Connect to Webull's Python SDK and query account state programmatically
- Calculate position size using fixed % risk before every trade
- Write a complete trading journal entry for every trade placed (or every no-trade decision)
- Explain the psychological differences between backtesting and live trading
- Apply the 6 non-negotiable risk rules to every trading decision

### Materials Needed
- `finnenv` environment — `paper_webull`, `yfinance`, `pandas`, `numpy`, `matplotlib`, `python-dotenv`
- Webull account with paper trading enabled — credentials verified before Week 9 starts
- `.env` file with `WEBULL_EMAIL`, `WEBULL_PASSWORD`, `WEBULL_TRADE_PIN`
- Starter notebook: `W09_workshop_live_trading_starter.ipynb`
- Trading journal template: `trading_journal_[initials].md` — set up in GitHub before Monday
- Milestone 2 strategy hypothesis — reviewed and adapted for live execution

### Pre-Week Checklist (Instructor)
- [ ] Verify every student has placed at least one test paper trade on Webull before June 8
- [ ] Push `W09_workshop_live_trading_starter.ipynb` to GitHub
- [ ] Confirm all students have `.env` files configured and NOT committed to GitHub
- [ ] Add Month 3 section header to hypothesis log template
- [ ] Prepare Portfolio Pulse as standing Block 1 addition for all Month 3 DMBs
- [ ] Brief: "A student with poor P&L but a rigorous journal is succeeding. A student with good P&L but no journal is failing."

### Month 3 Phase Note
Month 3 is the transition from building to doing. Students stop studying strategies and start running them. Every concept from Months 1 and 2 now has a live consequence — even if only virtual money is at stake.

- Monday theory sessions: strategy + market context — still conceptual, but grounded in what the market is actually doing
- Wednesday workshops: live trading sessions — code runs against real market data, paper trades are placed and logged
- Friday sessions: performance reviews — the journal is audited, P&L is discussed, and decisions are interrogated

Hold students accountable to their trading journals above all else.

---

## MONDAY — June 8, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

#### Block 1 — Pre-Market Scan (9:00–9:15 AM)
Standard checklist. **New standing item starting this month:**

- [ ] **Paper Portfolio Check:** Each student checks their Webull paper account. What positions are currently open (if any from testing)? What is total portfolio value?

This becomes a permanent addition to the DMB from Month 3 forward. The market brief now includes a brief portfolio pulse.

#### Block 2 — Student-Led Brief (9:15–9:35 AM)
Student presenter adds one new element to their brief starting this month:

```
[Existing brief template fields...]
Trade Idea:   [Based on your strategy — is there a setup forming in your watchlist today?]
Action Plan:  [If signal triggers today — what exactly would you do?]
```

This is not a prediction — it is a preparedness check. Students should know exactly what their strategy says to do before market open.

#### Block 3 — Hypothesis Setting (9:35–9:50 AM)
Add Month 3 section header to hypothesis log: `## Month 3 — Week 9`.

Begin encouraging trade-specific hypotheses:
"My strategy will signal an entry on [ticker] this week when [condition]. I expect the trade to [outcome] over [timeframe] because [reason]."

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "During market hours today, watch one stock that is in or near your strategy's signal zone. Write down every time the signal comes close to triggering — even if it doesn't. Note the price, the indicator reading, and what the stock does. Bring a written record to tonight's class."

---

### EVENING: Theory Session (8:00–9:30 PM EST)
**Topic:** Paper Trading Psychology, Risk Rules & Going Live
**Curriculum Source:** Wiki Sections 8.1–8.4, 9.1

#### Pre-Session Requirements
- [ ] Wiki Sections 8.1–8.4 read and understood
- [ ] Wiki Section 9.1 — Core risk rules memorized
- [ ] Webull paper account verified working — test trade placed
- [ ] Trading journal template set up in GitHub: `trading_journal_[initials].md`
- [ ] Milestone 2 strategy hypothesis reviewed and adapted for live execution

---

#### Block 1 — Day Review & Transition (8:00–8:15 PM) | 15 minutes

"Two months ago we opened Python for the first time and fetched market data. Tonight we place our first intentional, rule-based paper trades.

Before we talk about the mechanics — let's talk about the shift that just happened.

In a backtest, you already know how every trade ends. You run it, see the result, and assess it calmly. In paper trading, you don't know how the trade ends. You enter, you wait, the market moves against you, and something psychological happens.

What happens? Doubt. The urge to override the rules. The temptation to exit early when it moves against you or hold too long when it moves in your favor.

Tonight's theory session is about building the mental and operational framework that keeps you trading the system — not your emotions. This is where most retail traders lose their edge before it ever gets a chance to work."

**Cold-call reading check:**
- "Name the 6 core risk rules from the wiki. No notes."
- "What is paper trading, and what are its limitations compared to live trading?"
- "What is the single most important field in the trading journal, and why?"

---

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 minutes

**Topic A: The Psychology of Live Trading (15 min)**

"Here is the single biggest difference between backtesting and live trading: in a backtest, you feel nothing. In live trading — even paper trading — you feel everything. And feelings are the enemy of systematic trading.

The three emotions that destroy systematic traders:
1. **Fear of loss** — exits trades too early, cuts winners short
2. **Greed** — holds trades too long, turns winners into losers
3. **Revenge trading** — takes larger positions after losses to 'make it back'

The rule-based system you built is your protection against all three. It tells you exactly when to enter, exactly when to exit, and exactly how large to be. Your only job is to follow it. Any deviation is a data point — log it, study it, understand why you deviated. But always trade the system."

"Paper trading is not immune to psychology. Even with no real money at risk, you will still feel the pull to override your rules. Use that feeling. It is training for when the money is real."

**Topic B: The 6 Non-Negotiable Risk Rules (15 min)**

Walk through Wiki Section 9.1 in full. For each rule, give a concrete scenario:

- **Rule 1 — Never risk more than 1–2% per trade:**
  "You have a $1,000,000 paper portfolio. Maximum risk per trade = $10,000–$20,000. Not position size — RISK. If your stop is $2 away and you risk $10,000, your position size is 5,000 shares. We calculate this every single trade."

- **Rule 2 — Define the stop BEFORE entry:**
  "You do not enter a trade without a stop level. Not a vague 'I'll exit if it goes against me.' A specific price. Written in the journal before the order is placed. No exceptions."

- **Rule 3 — 5% daily portfolio drawdown = stop trading for the day:**
  "On a $1,000,000 paper portfolio — if you lose $50,000 in a single day, you stop. No more trades until tomorrow's DMB. No revenge trades. No 'one more try.' Paper down $50K means your strategy or your execution is broken today."

- **Rule 4 — 10% total drawdown = reduce size by 50%:**
  "If your portfolio falls to $900,000 — cut all position sizes in half. You are in a drawdown. The strategy may be in a regime where it doesn't work. Smaller size preserves capital while you diagnose the problem."

- **Rule 5 — No averaging down without a plan:**
  "Adding to a losing position because 'it's even cheaper now' is one of the most dangerous behaviors in trading. It turns small losses into catastrophic ones. If you want to add to a position, write the rule before you enter — not during."

- **Rule 6 — Minimum 3 uncorrelated positions:**
  "If your entire portfolio is in one trade, you have no diversification. A single bad event wipes you out. Three uncorrelated positions means no single trade can kill your portfolio."

**Topic C: The Trading Journal — Non-Negotiable (10 min)**

Walk through Wiki Section 8.4 journal field by field:

"Every field exists for a reason:
- **Hypothesis**: If you can't write why you expect the trade to work, you have no business placing it.
- **Signal(s)**: What exactly triggered entry? RSI reading? MACD crossover? Be specific — '5.2% below EMA_20 with RSI at 28.4'
- **Stop Loss Level**: Written before entry. If you don't know your stop, you can't calculate your position size. If you can't calculate your size, you can't control your risk.
- **Post-trade review**: This is where learning happens. Not from winners. From the honest analysis of every trade — winner or loser."

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

---

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 minutes

1. "A paper trade has no real money at risk. Can you develop real trading discipline through paper trading alone? What's missing that only live trading provides?"
   *(Expected: emotional stakes. Paper trading can approximate discipline but the visceral reality of real money loss is qualitatively different. The value of paper trading is system testing, not psychology training — though it helps with the latter.)*

2. "Your strategy signals an entry. You look at the chart and it 'looks wrong' — you don't feel good about it. Do you take the trade? What is the right framework for making this decision?"
   *(Expected: If the rules are triggered, you take the trade. Your feelings are a hypothesis — not a rule. If you consistently feel the setup 'looks wrong' and it consistently fails, that's data. Log the override, test whether your gut has signal. But don't habitually override the system based on undefined intuition.)*

3. "Devil's advocate: Why bother with a stop loss? If you believe in the trade, why cap your loss? Just hold until it comes back."
   *(Expected: Because it doesn't always come back. The stocks that 'never come back' are the ones that destroy accounts. Stops limit catastrophic loss and preserve capital for the next trade. Kelly Criterion assumes you can keep playing. A 100% loss ends the game.)*

4. "A student's paper portfolio is down 8% after 3 weeks. Their strategy's historical Sharpe was 1.4. Should they abandon the strategy? What information do they need to make that decision?"
   *(Expected: 3 weeks is not statistically meaningful. Need to ask: is the drawdown within the strategy's historical max drawdown? Is the market in a regime the strategy was not designed for? Is the student following the rules? 8% is concerning but not conclusive — context matters.)*

---

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 minutes

**Wednesday workshop:**
"Tonight we place our first structured paper trades in Webull. Before Wednesday's class: open Webull, identify your first 1–2 trades based on your strategy rules, and write the journal entries up to Entry Price (leave Exit Price and P&L blank — we'll execute Wednesday).

Starter notebook: `W09_workshop_live_trading_starter.ipynb` — covers Webull Python SDK connection and position management. Have your Webull credentials ready."

**Weekly hypotheses:**
Frame at least 2 as trade-specific this week.

**Pre-reading:**
- Wiki Section 9.2 — Position Sizing Models (all four)
- Wiki Section 9.3 — Risk metrics to monitor daily

**Closing reflection:**
*"The most important thing I need to understand before placing my first paper trade is ___."*

**Monday Deliverable:** Reading Notes + 3 Hypotheses (at least 2 trade-specific) by 11:59 PM

---

## WEDNESDAY — June 10, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse (Block 1):** Each student checks their Webull paper account. Report current portfolio value and any positions.

**Block 4 — Observation Assignment:**
"Before tonight's class, pre-fill your trading journal template for at least one trade you want to place tonight. All fields except Exit Price, P&L, and Post-trade review. If you don't have a setup, write in the journal why there is no signal today."

---

### EVENING: Workshop Session (8:00–9:30 PM EST)
**Workshop:** W9 — First Live Paper Trades — Webull Execution + Journal Entry
**Notebook:** `W09_workshop_live_trading_[initials].ipynb`
**Curriculum Source:** Wiki Sections 8.2, 8.3, 8.4

#### Pre-Session Setup
- [ ] `finnenv` running, repo pulled
- [ ] `.env` file loaded — credentials confirmed
- [ ] Journal entry pre-filled for at least one candidate trade
- [ ] `W09_workshop_live_trading_starter.ipynb` open

---

#### Block 1 — Framing & Context Bridge (8:00–8:10 PM) | 10 minutes

"Tonight is different from every workshop we've run. Every other Wednesday we built something and inspected the output. Tonight the output is real — these paper trades will show up in your Webull account. They will have P&L. You will track them until you close them.

Two things are happening simultaneously tonight:
1. We connect to Webull via Python and learn the SDK
2. We manually place our first strategy-based paper trades

If your strategy has no signal today — that is a valid outcome. Write in the journal: 'No entry signal on [date]. Market conditions: [describe]. Monitoring: [which tickers are approaching signal zone].' Not trading is also a trade decision. Document it."

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

*Note: "If MFA is required, Webull will prompt you for a verification code. This is normal — it's a security feature they added in 2020. Enter the code when prompted."*

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
All fields except Exit Price, P&L, and Post-trade review must be filled in. Instructor spot-checks 2–3 students' journals before they execute.

**If no signal today:**
Run `build_feature_matrix()` on their watchlist tickers and identify which ticker is closest to signaling. Document that analysis in the journal.

---

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 minutes

**Share-out (10 min):**
Each student briefly states:
- Did you place a trade tonight? Which ticker, direction, and why?
- Or: What prevented you from trading? What would need to change?

"No right or wrong answer. 'I found no valid signal tonight' is correct. 'I placed a trade because it felt right' without a journal entry is not."

**Muddiest Point (5 min):**
> *"The muddiest point from tonight was ___."*

**Wednesday Deliverables:**
- Notebook `W09_workshop_live_trading_[initials].ipynb` to GitHub by 11:59 PM
- Journal `trading_journal_[initials].md` updated and pushed to GitHub

---

## FRIDAY — June 12, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse (Block 1):**
Every student opens their Webull paper account. Report: current portfolio value, open positions, any fills since Wednesday.

**Block 4 — Observation Assignment:**
"Before tonight's class, update your trading journal. For any open trades: what is the current P&L? Is the price approaching your stop? Is the exit condition close to triggering? Write a mid-trade note in the journal — not to close it, just to observe it."

---

### EVENING: Review & Market Session (8:00–9:30 PM EST)
**Topic:** Week 9 Trade Review, Journal Audit & Market Autopsy

---

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 minutes

"Tonight's retrospective is different. Instead of concept questions, we review decisions. Every person in this room either placed a trade or documented why they didn't. We're going to talk through those decisions."

**Decision review format (10 min per 2–3 students):**
- "Walk me through your trade. Or your no-trade decision."
- "Show me your journal entry."
- "Was the entry in your pre-defined rules? Exactly?"
- "What is your current P&L on open positions?"
- "When does your exit condition trigger? Have you defined it precisely?"

**Concept questions (remaining time):**

1. "Rule 1: risk 2% per trade. On a $1M portfolio with an entry at $150 and a stop at $147 — how many shares do you buy?"

2. "Your strategy signaled a buy. You entered. Price immediately dropped 0.5%. You feel like you made a mistake. What does your framework say to do?"

3. "Explain the difference between a time-based stop and a price-based stop. Which did you use this week? Why?"

---

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 minutes

**Step 1 — Trade Hypothesis Audit (10 min)**
Open the hypothesis log. For each trade placed this week:
- Did the thesis play out as expected?
- If a trade moved against you — what signal would have told you earlier?
- If a trade worked — was it the reason you expected, or something else?

"This is the most important habit you will build this month. When a trade works, most people celebrate and don't analyze. That is a mistake. Understanding WHY it worked is as important as the win."

**Step 2 — Chart Review with Open Positions (15 min)**

Pull up each student's open positions on TradingView. For each position:
- "Where is price relative to the entry?"
- "Is the thesis still intact? Has anything changed since entry?"
- "Where is your stop? Is it still in the right place?"
- "What's the plan if price hits your target today?"

Walk through SPY overall:
- "What did the broader market do this week?"
- "Did market direction help or hurt your trades?"
- "If SPY had a strong directional week — did that create false signals in your strategy?"

**Step 3 — Sector Rotation (10 min)**
Standard checklist. Note: "From this month forward, sector rotation is relevant not just academically — it affects your open positions. If you're long a tech stock and tech is rotating out, your position faces a headwind beyond the stock itself."

---

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 minutes

Standard checklist. Add a new element this month:
"Put/call ratio and VIX are now relevant to your open positions. Elevated VIX = wider bid-ask spreads, higher slippage, more volatile intraday moves. Your paper trades execute differently in high-VIX environments. Note the VIX level right now — is this a favorable or unfavorable environment for your specific strategy?"

---

#### Block 4 — Next Week Preview & Close (9:20–9:30 PM) | 10 minutes

**Next week:** Position sizing deep-dive and risk dashboard. We build a live portfolio risk monitor in Python.

**Assign reading:**
- Wiki Section 9.2 — All 4 position sizing models (full)
- Wiki Section 9.4 — VaR introduction

**Action item for the weekend:**
"Close any open trades that have hit their exit conditions by Friday close. Update your journal with the full entry before Monday. If a trade is still open, write a mid-trade note — is the thesis still valid?"

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

## WEEKLY DELIVERABLES SUMMARY

| Deliverable | Due | Format |
|-------------|-----|--------|
| Reading Notes + 3 Hypotheses (2 trade-specific) | Monday 11:59 PM | Markdown in hypothesis log |
| Workshop Notebook (W09) | Wednesday 11:59 PM | `.ipynb` pushed to GitHub |
| Trading Journal Entry | Wednesday 11:59 PM | `trading_journal_[initials].md` |
| Weekly Review Log | Friday 11:59 PM | Markdown |
| Hypothesis Outcome Record | Friday 11:59 PM | Appended to hypothesis log |

---

## INSTRUCTOR NOTES FOR WEEK 9

**The transition moment:** The shift from Months 1–2 to Month 3 is the most significant pedagogical moment in the course. Students who excelled at analytical work may struggle with the discipline of live execution. Students who struggled with statistical content may thrive here. Be alert to this inversion and name it explicitly.

**Journal accountability:** The trading journal is the primary accountability mechanism for Months 3–6. Establish the norm this week. Any student who executes a trade without a complete prior journal entry must do the post-trade review in front of the class on Friday. This creates immediate social accountability without punishing P&L outcomes.

**"No trade" is valid:** Explicitly celebrate and validate "no signal" decisions. Students who wait for proper setups rather than forcing trades are demonstrating the right behavior. Praise this out loud. The class culture should normalize patience.

**SDK variability:** The Webull Python SDK (`paper_webull`) has periodic API changes. If the login or order placement fails, have students:
1. Try re-running login
2. Check that `.env` credentials are correct
3. Fall back to manually placing trades in the Webull app while documenting in the journal

**Dry run before live:** Always demonstrate with `dry_run=True` before any student switches to `dry_run=False`. This prevents accidental order placement at incorrect sizes.

**Rule deviation logging:** When a student deviates from their rules — even if the deviation worked — make the deviation visible. "That trade made money. But you didn't follow your rules. What does that tell you?" The correct answer is: nothing. One data point is noise.

---

## WEEKLY RESOURCES

> Resources are labeled **[Pre-session]** (review before class) or **[Homework]** (explore after). Month 3 shifts the emphasis: less reading, more doing. Resources here are lean by design.

---

### Monday — Going Live: Webull, Risk Rules & the Trading Journal

- **[Article | Pre-session]** [Paper Trading on Webull: How to Get Started](https://www.newtrading.io/paper-trading-webull/) — NewTrading.io. Step-by-step on setting up and navigating Webull's paper trading interface. Read before Monday if you have not placed a paper trade yet — we assume the interface is familiar from Week 9's first live session.

- **[Article | Pre-session]** [How to Use the Webull Package in Python](https://www.pythonpool.com/webull-package-in-python/) — Python Pool (July 2022). Tutorial on the `webull` Python package including `paper_webull` — the same library used in Wednesday's workshop to connect to your account programmatically.

- **[Article | Pre-session]** [Trading Journal Psychology: Track Emotions & Build Discipline](https://daytradingtoolkit.com/psychology-and-risk/trading-journal-psychological-insights/) — DayTradingToolkit. The case for treating your journal as a data source, not a diary. FINN's rule: every trade, every no-trade decision. This article explains why the emotional section is as important as the price section.

- **[Article | Homework]** [Trading Journal: Example of a Trading Log and Diary](https://www.quantifiedstrategies.com/trading-journal/) — Quantified Strategies. Practitioner-focused explanation of what makes a journal actionable for systematic improvement. Includes the key insight: your journal is only useful if you actually review it.

- **[YouTube | Homework]** Search YouTube for: *"trading psychology discipline rules journal 2023 2024"* — look for a short video (under 20 min) from a practitioner who discusses following rules mechanically rather than emotionally. Avoid motivational content — look for a quant or systematic trader's perspective. Channels worth checking: **SMB Capital**, **Chat With Traders**.

---

### Wednesday — Python + Webull SDK Workshop

- **[Reference | Pre-session]** [webull on PyPI](https://pypi.org/project/webull/) — PyPI. The official package page. Confirm your installed version before Wednesday. The `paper_webull` class is what we use to query your paper account state programmatically.

- **[Reference | Pre-session]** [Webull OpenAPI Python SDK — GitHub](https://github.com/webull-inc/openapi-python-sdk) — Webull Inc. Official Webull OpenAPI SDK. If you're using the newer official API rather than the unofficial `webull` package, start here.

- **[YouTube | Pre-session]** Search YouTube for: *"webull python API paper trading 2022 2023"* — look for a short tutorial that demonstrates account query: getting positions, checking P&L, and submitting a paper order programmatically. Even a 10-min demo is enough for the Wednesday workshop context.

---

### Friday — First Week Review: Rules, Journal Audit & What's Working

- **[Article | Pre-session]** [Trading Psychology Journal: How to Track Emotions & Quantify Discipline](https://www.tradesviz.com/blog/trading-journal-psychology-tracking/) — TradesViz. Explains how to convert emotional journal notes into measurable data (e.g., tracking rule adherence rate over time). Directly relevant to Friday's journal audit session.

---

*FINN Week 9 — Going Live | Part of FINN_Month03.md*
