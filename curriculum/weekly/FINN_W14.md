# FINN — Week 14: Multi-Position Management
## Paper Trading Phase II | Month 4: Paper Trading II — Iteration, Automation & Milestone 3
**Dates:** July 13–18, 2026
**Week Number:** 14 of 24

---

## WEEK OVERVIEW

### Theme
Managing 3–5 concurrent positions is qualitatively different from managing one. Hidden correlations, portfolio-level beta, sector concentration, and capital allocation all become real problems simultaneously. This week teaches the discipline of managing a portfolio — not just a trade.

### Learning Objectives
By the end of this week, students will be able to:
- Calculate a live pairwise correlation matrix for their current open positions
- Identify positions with correlation > 0.70 and explain the portfolio risk they create
- Calculate net portfolio beta and interpret it in terms of market exposure
- Apply the five multi-position rules to every new entry decision
- Build a pre-trade clearance check in Python that gates new entries
- Explain how inverse ETFs (SH, PSQ) reduce portfolio beta as a hedging layer
- Run a complete portfolio dashboard showing beta, sector exposure, and correlation heat map

### Materials Needed
- `finnenv` environment — `yfinance`, `pandas`, `numpy`, `matplotlib`, `seaborn`, `scipy`
- Webull paper account — all current open positions accessible
- Starter notebook: `W14_workshop_portfolio_mgmt_starter.ipynb`
- Trading journal — current through Friday July 10

### Pre-Week Checklist (Instructor)
- [ ] Push `W14_workshop_portfolio_mgmt_starter.ipynb` to GitHub before Wednesday
- [ ] Prepare correlation matrix example (AAPL, MSFT, QQQ) to show in Block 2
- [ ] Prepare Kelly Criterion worked example with two position sizes for comparison
- [ ] Assign DMB rotation for Monday, Wednesday, Friday

---

## MONDAY — July 13, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse (Block 1 — standing addition):**
Current portfolio value, number of open positions, sector exposure breakdown.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Using your current open positions, calculate the pairwise correlation matrix for the last 30 trading days. Use yfinance to pull the data and `df.corr()`. Write down any pairs with correlation above 0.70. Bring the matrix to class."

---

### EVENING: Theory Session (8:00–9:30 PM EST)
**Topic:** Multi-Position Portfolio Management — Correlation, Hedging & Rebalancing
**Curriculum Source:** Wiki Section 9.3

#### Pre-Session Setup
- [ ] Pairwise correlation matrix for current positions — calculated and ready
- [ ] Wiki Section 9.3 read
- [ ] Webull paper account open — know exact open positions and sizes

#### Block 1 — Day Review & Correlation Check (8:00–8:15 PM) | 15 min

"Let's see the matrices. Who has pairs above 0.70?"

For each highly correlated pair: "What does this mean in practice? If both move together, are you actually diversified — or do you have a single bet wearing two hats?"

The key insight: high correlation between two positions doesn't double your risk — it concentrates it. A 5% drawdown in AAPL when you hold AAPL + MSFT + QQQ (all correlated) is not a 5% loss. It is potentially a 12–15% portfolio loss if all three move together.

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 min

**Topic A: The Multi-Position Challenge (10 min)**

Three hidden problems that appear only when managing multiple positions simultaneously:

- **Hidden Correlation:** Two positions look uncorrelated in isolation but correlate during market stress. This is the regime-change correlation problem — correlations spike toward 1.0 in drawdowns. The rule: stress-test your correlation matrix at periods of market stress, not just normal conditions.

- **Portfolio Delta:** The net sensitivity of your entire portfolio to a 1% move in the market. If you hold 5 positions all with beta > 1.2, your portfolio has effective beta of ~1.2 on the full capital. One bad market day is amplified.

- **Capital Allocation:** Adding a 5th position doesn't just add alpha — it dilutes capital from the 4 positions already running. The math of position sizing across a full portfolio is different from single-position sizing.

**Topic B: The Five Multi-Position Rules (15 min)**

These rules are non-negotiable for Month 4 and beyond:

1. **Maximum 5 positions at any time.** Above 5, monitoring quality degrades. Capital allocation per position drops below meaningful levels.

2. **Maximum 30% portfolio weight in any single sector.** Sector concentration is the most common hidden correlation source. Check the Finviz heatmap — if tech is 40% of your open positions, you do not have a diversified portfolio.

3. **No new position if pairwise correlation with an existing position exceeds 0.70.** Run the check before entry, not after.

4. **Maintain 20–30% cash reserve at all times.** Cash is optionality. A portfolio at 100% invested cannot take advantage of new signals. It also has no buffer for simultaneous drawdowns.

5. **Weekly rebalancing check every Friday.** No position should exceed 25% of portfolio value due to appreciation. If it has — trim to 20%.

> **Resource:** Non-negotiable risk rules reference card (all 6 rules, including position limits and rebalancing) — `resources/infographics/ig_risk_rules.html`

**Topic C: Hedging with Inverse ETFs (15 min)**

When portfolio beta is too high and market conditions turn uncertain, inverse ETFs provide direct beta reduction without closing individual positions:

- **SH** — ProShares Short S&P 500 (inverse SPY). ~1× inverse daily return.
- **PSQ** — ProShares Short QQQ (inverse QQQ). ~1× inverse daily return.

Hedge ratio calculation:
```
Portfolio Beta = Σ (position_weight_i × beta_i)
Hedge needed  = (target_beta - current_beta) / inverse_etf_beta
Hedge size    = hedge_needed × portfolio_value
```

FINN's warning: inverse ETFs decay through rebalancing. They are a tactical hedge for 1–4 weeks, not a permanent portfolio component. Daily compounding makes them unsuitable for long-term holding.

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 min

1. *"I hold AAPL and MSFT. Their correlation is 0.75. Should I close one, reduce size, or leave both unchanged?"*
   *(Expected direction: Rule 3 says correlation > 0.70 blocks new entries, but existing positions aren't automatically closed. The question is whether the combined risk warrants reduction. Calculate portfolio beta first. If beta is acceptable, monitor but don't force a close.)*

2. *"I have 4 open positions and a strong signal fires on a 5th ticker. Pre-trade clearance passes — correlation is fine, sector is fine. But I'm at 80% invested. Do I take the trade?"*
   *(Expected direction: Rule 4 says maintain 20–30% cash. At 80% invested, adding a 5th position puts capital at ~85–90%. This is borderline acceptable — but only if the position size is small. Calculate first, decide second.)*

3. *"Why not just hold SPY and one position? That's truly diversified."*
   *(Expected direction: Diversification dilutes alpha. The whole point of a systematic strategy is to generate returns above SPY. If you hold SPY + 1 position, your alpha contribution is 10–20% of your capital. The rest tracks the benchmark.)*

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 min

**Wednesday workshop:** Build the portfolio correlation monitor and pre-trade clearance check in Python. Requires current open positions loaded from Webull or manual input.

**Pre-reading:** Wiki Section 9.3 — portfolio-level risk management.

---

## WEDNESDAY — July 15, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** Who checked correlation this week? Any pairs above 0.70 since Monday?

#### Block 4 — Observation Assignment (9:50–10:00 AM)
"Before tonight's workshop, export your current open positions: ticker, entry price, current price, shares held, and approximate beta (use a rough estimate from yfinance or TradingView). Have it ready in a Python dict or small CSV."

---

### EVENING: Workshop Session (8:00–9:30 PM EST)
**Workshop:** W14 — Portfolio Correlation Monitor + Pre-Trade Clearance
**Notebook:** `W14_workshop_portfolio_mgmt_[initials].ipynb`
**Curriculum Source:** Wiki Section 9.3

#### Block 1 — Framing (8:00–8:10 PM) | 10 min

"Tonight we build three things: a live position correlation matrix with heatmap, a portfolio beta and sector exposure calculator, and a pre-trade clearance function. By the end, you have a dashboard you run every morning before touching your account."

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 min

**Step 1 — Live Position Correlation Matrix (15 min)**
```python
import yfinance as yf
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt

def compute_position_correlation(positions, period='3mo'):
    """
    Compute pairwise correlation matrix for a list of open positions.
    Flag pairs with |corr| >= 0.70.
    """
    tickers = list(positions.keys())
    prices = {}
    for t in tickers:
        df = yf.download(t, period=period, interval='1d', auto_adjust=True)
        prices[t] = df['Close'].pct_change().dropna()
    
    returns_df = pd.DataFrame(prices)
    corr_matrix = returns_df.corr()
    
    # Plot heatmap
    plt.figure(figsize=(8, 6))
    sns.heatmap(corr_matrix, annot=True, fmt='.2f', cmap='RdYlGn',
                center=0, vmin=-1, vmax=1)
    plt.title('Position Correlation Matrix (30-Day Returns)')
    plt.tight_layout()
    plt.show()
    
    # Flag high-correlation pairs
    high_corr = []
    for i in range(len(tickers)):
        for j in range(i+1, len(tickers)):
            c = abs(corr_matrix.iloc[i, j])
            if c >= 0.70:
                high_corr.append((tickers[i], tickers[j], round(c, 3)))
    
    if high_corr:
        print("\n⚠️  HIGH-CORRELATION PAIRS (|r| >= 0.70):")
        for t1, t2, c in high_corr:
            print(f"  {t1} — {t2}: {c}")
    else:
        print("\n✅ No pairs with |r| >= 0.70")
    
    return corr_matrix, high_corr

# Example usage
positions = {
    'AAPL': {'shares': 50, 'entry': 185.00, 'beta': 1.2},
    'MSFT': {'shares': 30, 'entry': 415.00, 'beta': 1.1},
    'QQQ':  {'shares': 20, 'entry': 475.00, 'beta': 1.15},
}
corr_matrix, flags = compute_position_correlation(positions)
```

**Step 2 — Portfolio Beta & Sector Exposure (15 min)**
```python
def portfolio_risk_summary(positions, portfolio_value=1_000_000):
    """Calculate net portfolio beta, sector weights, and concentration flags."""
    total_value = sum(pos['shares'] * pos['entry'] for pos in positions.values())
    cash_reserve = portfolio_value - total_value
    cash_pct = cash_reserve / portfolio_value
    
    weighted_beta = 0
    print("\n=== PORTFOLIO RISK SUMMARY ===")
    print(f"Total invested: ${total_value:,.0f} ({total_value/portfolio_value:.1%})")
    print(f"Cash reserve:   ${cash_reserve:,.0f} ({cash_pct:.1%})")
    if cash_pct < 0.20:
        print("  ⚠️  CASH RESERVE BELOW 20% — review before new entries")
    
    print("\nPosition breakdown:")
    for ticker, pos in positions.items():
        pos_value = pos['shares'] * pos['entry']
        weight = pos_value / portfolio_value
        weighted_beta += weight * pos['beta']
        print(f"  {ticker:6s} | ${pos_value:>10,.0f} | {weight:5.1%} | Beta: {pos['beta']:.2f}")
    
    print(f"\nNet portfolio beta: {weighted_beta:.3f}")
    if weighted_beta > 1.2:
        print("  ⚠️  HIGH BETA — consider SH/PSQ hedge if market outlook uncertain")
    
    return {'net_beta': weighted_beta, 'cash_pct': cash_pct}

risk = portfolio_risk_summary(positions)
```

**Step 3 — Pre-Trade Clearance Check (10 min)**
```python
def pre_trade_clearance(new_ticker, new_beta, positions, corr_matrix,
                        portfolio_value=1_000_000, sector_map=None):
    """
    Gate a new position entry through the 5 multi-position rules.
    Returns: (approved: bool, reasons: list)
    """
    reasons = []
    approved = True
    
    # Rule 1: Max 5 positions
    if len(positions) >= 5:
        approved = False
        reasons.append("❌ RULE 1: At maximum 5 positions. Close one before opening new.")
    
    # Rule 3: Correlation check
    if new_ticker in corr_matrix.columns:
        for existing in positions:
            if existing in corr_matrix.columns:
                corr = abs(corr_matrix.loc[new_ticker, existing])
                if corr >= 0.70:
                    approved = False
                    reasons.append(f"❌ RULE 3: {new_ticker} correlation with {existing} = {corr:.2f} (max 0.70)")
    
    # Rule 4: Cash reserve
    total_invested = sum(p['shares'] * p['entry'] for p in positions.values())
    cash_pct = (portfolio_value - total_invested) / portfolio_value
    if cash_pct < 0.20:
        approved = False
        reasons.append(f"❌ RULE 4: Cash reserve {cash_pct:.1%} below 20% minimum")
    
    if approved:
        reasons.append("✅ Pre-trade clearance PASSED. Entry approved.")
    
    print(f"\nPRE-TRADE CLEARANCE: {new_ticker}")
    for r in reasons:
        print(f"  {r}")
    
    return approved, reasons

approved, _ = pre_trade_clearance('NVDA', 1.4, positions, corr_matrix)
```

#### Block 3 — Independent Work (8:50–9:15 PM) | 25 min

Run the full dashboard on your actual open positions (or a realistic mock if positions are limited). Answer in markdown cells:
1. Is your net portfolio beta above 1.0, below 1.0, or approximately neutral? Is this appropriate for the current market regime?
2. Do you have any high-correlation pairs? If so — what is the portfolio risk they create?
3. Run the pre-trade clearance on your next potential signal. Does it pass or fail? On which rule?
4. What is your current cash reserve percentage? Is it within the 20–30% target?

**Extension:** Build a portfolio rebalancing suggester that identifies positions with weight > 25% (due to price appreciation since entry) and suggests a trim quantity.

#### Block 4 — Share-Out & Close (9:15–9:30 PM) | 15 min

Two students share their portfolio dashboards. Peer review: do the beta and correlation numbers make sense? Are the pre-trade clearance rules calibrated correctly?

---

## FRIDAY — July 17, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** Full account summary — portfolio value, sector exposure summary, net beta.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
"Before tonight: run your Week 13 signal monitor. If it fires a signal, run the Week 14 pre-trade clearance check on that signal. Write down the result of both. Bring both outputs."

---

### EVENING: Review & Market Session (8:00–9:30 PM EST)

#### Pre-Session Setup
- [ ] Portfolio dashboard output from this week — ready to share
- [ ] Signal monitor + pre-trade clearance outputs — ready
- [ ] TradingView: SPY weekly, QQQ, VIX, any signaled tickers

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 min

Five questions:
1. "What is your net portfolio beta right now? Is it intentional, or did it happen by accident?"
2. "If you hold three positions and they all open down 2% tomorrow — walk me through the math of the portfolio impact. What does 'diversification' actually protect you from in that scenario?"
3. "Walk me through the pre-trade clearance logic. Why does Rule 3 (correlation) gate *new* entries but not force closure of *existing* positions?"
4. "Why do we keep 20–30% cash? Give me two specific scenarios where having cash reserve is the difference between surviving a drawdown and being forced to close positions at the worst moment."
5. "If three signals fire simultaneously — which one do you take? Walk me through the prioritization framework."

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 min

**Week's performance vs. beta:**
"Your portfolio had a net beta of ___. SPY moved ___% this week. Expected portfolio move: ___%. Actual: ___%. The gap is alpha (positive) or tracking error (negative). What explains it?"

**Sector rotation this week:** Finviz heatmap — which sectors moved? Does your portfolio's sector exposure explain any of the performance?

**Standard chart review:** SPY (weekly), QQQ (daily), VIX.

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 min
Standard options observation.

#### Block 4 — Next Week Preview & Close (9:20–9:30 PM) | 10 min

**Week 15 topic:** Strategy evolution — running the adapted strategy live and comparing its performance to the original version.

**Pre-reading:** Week 12 adaptation decision tree. Review your Month 3 summary — what was your adaptation recommendation?

---

## WEEKLY DELIVERABLES SUMMARY

| Deliverable | Due | Format |
|-------------|-----|--------|
| Correlation matrix for current positions | Monday 11:59 PM | In hypothesis log or notebook |
| Portfolio management notebook (W14) | Wednesday 11:59 PM | `.ipynb` pushed to GitHub |
| Trading journal — all trades this week | Friday 11:59 PM | Updated `.md` in GitHub |

---

## INSTRUCTOR NOTES FOR WEEK 14

**Correlation intuition:** Many students confuse low correlation with independence. Stress that correlation is regime-dependent — assets that show r = 0.3 in normal markets may show r = 0.9 in a crash. The rule (max 0.70) uses the normal-market correlation as a heuristic, but students should understand it is not a guarantee against simultaneous drawdowns.

**Cash reserve resistance:** Students who are running profitable positions will resist keeping 20–30% in cash — it "feels" like wasted capital. Address this directly: the cash reserve is not dead capital. It is the option to take your best signal when it appears, without having to close an existing position at a bad time. Options have value.

**Pre-trade clearance in practice:** The clearance check should become a pre-entry ritual by Month 5. Students who internalize the five rules will naturally run through them mentally before any trade. The code formalizes what should eventually become instinct.

---

## WEEKLY RESOURCES

> Resources are labeled **[Pre-session]** (review before class) or **[Homework]** (explore after). Week 14 is about portfolio-level risk — the math is straightforward but the discipline is hard.

---

### Monday — Portfolio Correlation & Multi-Position Management

- **[Article | Pre-session]** [Easily Visualize the Correlation of Your Portfolio in Python](https://alpaca.markets/learn/correlation-portfolio-python) — Alpaca Markets. Builds a portfolio correlation matrix and heatmap using Python and pandas — the exact workflow used in Wednesday's workshop. Read before Monday's session.

- **[Article | Pre-session]** [Creating a Diversified Portfolio with Correlation Matrix in Python](https://medium.com/codex/creating-a-diversified-portfolio-with-correlation-matrix-in-python-7d7825255a2d) — Medium / Nikhil Adithyan. Practical walkthrough of computing pairwise correlations and interpreting the result in portfolio construction terms. Good complement to the Alpaca article.

- **[Article | Homework]** [Hedging with Python: Creating and Backtesting Hedging Strategies for Portfolios](https://medium.com/@deepml1818/hedging-with-python-creating-and-backtesting-hedging-strategies-for-portfolios-23af0ec28d94) — Medium. Covers inverse ETF hedging with yfinance data — same SH/PSQ framework discussed in Monday's Block 2C. Read after class.

---

### Wednesday — Portfolio Risk Dashboard Build

- **[Article | Pre-session]** [Beta Estimation with Python](https://www.tidy-finance.org/python/beta-estimation.html) — Tidy Finance. Rolling beta estimation using OLS regression. Wednesday's `portfolio_risk_summary()` uses a simplified beta approach — this article shows the full regression method for students who want to calculate beta precisely from return data.

- **[Article | Reference]** [Asset Beta and Market Beta in Python](https://blog.quantinsti.com/asset-beta-market-beta-python/) — QuantInsti. Reference implementation for beta calculation used in the portfolio dashboard. Keep this open during Wednesday's build.

- **[YouTube | Homework]** Search YouTube for: *"portfolio correlation matrix python seaborn heatmap 2023"* — look for a short tutorial (under 15 min) that builds a seaborn heatmap from pairwise stock correlations. The visual output is exactly what Wednesday's workshop produces.

---

### Friday — Portfolio Review & Regime Assessment

- **[Article | Pre-session]** [A Better Understanding of Beta](https://medium.com/swlh/a-better-understanding-of-beta-8e20466f3f35) — Medium / J.P. Rinfret. Economic interpretation of beta — why a portfolio with beta > 1.2 "feels" different to manage in volatile markets. Read before Friday's market autopsy.

---

*FINN Week 14 — Multi-Position Management | Part of FINN_Month04.md*
