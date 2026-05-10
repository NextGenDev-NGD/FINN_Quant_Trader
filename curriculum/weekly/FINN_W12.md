# FINN — Week 12: Iteration, Adaptation & Month 3 Close
## Paper Trading Phase I | Month 3: Paper Trading I
**Dates:** June 29 – July 3, 2026
**Week Number:** 12 of 24

---

## WEEK OVERVIEW

### Theme
Knowing when to adjust a strategy, when to hold, and when to admit it needs real work. This is the final week of Month 3. Students have live paper trading data for the first time in their lives. The discipline now is: how do you read it without fooling yourself?

### Learning Objectives
By the end of this week, students will be able to:
- Apply the four-question Adaptation Decision Tree to their own live trading data
- Classify any proposed strategy change by risk level (Level 1–4)
- Explain the overfitting trap in live adjustment and give a concrete example
- Build a `strategy_adaptation_check()` function that automates the decision tree
- Generate a complete Month 3 summary report in Python
- Present a Month 3 retrospective in under 4 minutes with full numeric evidence

### Materials Needed
- `finnenv` environment — all Month 3 packages
- Webull paper account — full trade history through Week 11
- Trading journal — complete through Friday June 27
- Starter notebook: `W12_workshop_adaptation_starter.ipynb`
- Month 3 summary template

### Pre-Week Checklist (Instructor)
- [ ] Push `W12_workshop_adaptation_starter.ipynb` to GitHub before Wednesday
- [ ] Review each student's journal before Monday — flag any missing entries
- [ ] Note: July 3 markets close early at 1:00 PM EST — pre-plan Friday DMB accordingly
- [ ] Prepare Month 4 preview materials for Friday close
- [ ] Assign DMB rotation for Monday, Wednesday, Friday

---

## MONDAY — June 29, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse (Block 1 — standing addition):**
End-of-Month 3 portfolio check. Each student reports: current portfolio value vs. $1M start, number of trades placed this month, rule adherence rate.

#### Block 1 — Pre-Market Scan (9:00–9:15 AM)
Standard checklist plus end-of-month review framing.
- [ ] ES, NQ, YM futures
- [ ] VIX — compare to June 8 (Month 3 start)
- [ ] Macro calendar — any Q3 data releases this week?
- [ ] Earnings calendar
- [ ] Finviz sector heatmap — how did June close out?
- [ ] 10-year yield, BTC/ETH

#### Block 2 — Student-Led Brief (9:15–9:35 AM)
Standard rotation. Presenter adds Month 3 close framing:
```
Trade Idea:    [Is there a setup today based on your strategy?]
Month 3 Note:  [One thing your live data has shown that the backtest didn't predict]
```

#### Block 3 — Hypothesis Setting (9:35–9:50 AM)
Add this week's hypotheses. Reference Month 3 hypothesis log section — review outcomes from the past month.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Review your Month 3 trading journal. Identify one parameter in your strategy that you want to change — and one that you want to keep. Write down the specific evidence (trade data, IC, journal notes) that supports each decision. Bring both to tonight's class."

---

### EVENING: Theory Session (8:00–9:30 PM EST)
**Topic:** When to Adapt a Strategy — The Decision Tree
**Curriculum Source:** Wiki Section 8.4, 9.2

#### Pre-Session Setup
- [ ] Trading journal — all entries complete through today
- [ ] Month 3 performance data accessible (win rate, R:R, rule adherence)
- [ ] Adaptation decision — one parameter to change, one to keep — written and ready

#### Block 1 — Day Review & Adaptation Discussion (8:00–8:15 PM) | 15 min

"Let's hear what people brought. Who found a parameter they want to change, and who found one they want to keep? Walk me through the evidence."

Call on 3–4 students. For each one: Is this evidence-based or emotion-based? Are they changing because the data says so, or because the last week felt bad?

"This is the central discipline of Month 3 closing: how do you know when your strategy is broken versus when the market is just in a regime your strategy wasn't designed for? Tonight we build the framework."

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 min

**Topic A: The Adaptation Decision Tree (20 min)**

Four questions. Answer them in order. The answer to each determines whether you adapt, wait, or revert.

**Q1 — Rule Adherence:** "Have I followed my strategy rules exactly over the last 20+ trades?"
- If NO: The performance data is noise. You haven't tested your strategy — you've tested your discipline. Fix the discipline first. No changes.
- If YES: Continue to Q2.

**Q2 — Market Regime:** "Is the market currently in the regime my strategy was designed for?"
- Identify the regime at backtest time. Compare to current regime (VIX, SMA slope, ADX).
- If NO: Strategy underperformance may be regime mismatch, not signal failure. Wait for regime alignment. No structural changes.
- If YES: Continue to Q3.

**Q3 — Signal IC:** "Is my signal IC still positive over the last 20 trades?"
- Calculate the rolling IC on the last 20 trades. Threshold: IC > 0.03.
- If YES: Signal is generating information. May be execution issue or regime issue. Minor adjustments only.
- If NO and Q1 + Q2 both YES: Signal edge may be decaying. Move to Q4.

**Q4 — Sample Size:** "Do I have enough trades to conclude the signal is broken?"
- Minimum: 30 trades with consistent rule adherence to draw a signal-failure conclusion.
- If NO: The data is insufficient. Document and continue trading. Do not change.
- If YES: Adaptation is justified. Choose level carefully.

**Topic B: Levels of Adaptation (15 min)**

Adaptations are classified by how much they change the strategy's core logic:

- **Level 1 — Regime Filter:** Add a market-condition gate. Example: "Only trade when ADX > 20." Changes when strategy trades, not what it trades.
- **Level 2 — Exit Rule:** Adjust stop distance or profit target. Example: "Tighten stop from 2×ATR to 1.5×ATR in low-volatility months." Changes execution, not signal.
- **Level 3 — Entry Parameter:** Adjust an indicator threshold. Example: "RSI entry from <35 to <30." Changes when signals fire.
- **Level 4 — Signal Replacement:** Remove or replace a core signal. Example: "Replace RSI with MACD as primary trigger." Highest risk of overfitting. Requires full new backtest before deployment.

Rule: "The higher the level, the more evidence you need. Level 4 changes are Month 5 territory — not Week 12."

**Topic C: The Live-Adjustment Overfitting Trap (5 min)**

"If you make a different adjustment every two weeks based on recent performance, you are no longer running a strategy. You are manually curve-fitting to recent data in real time. The adjustment itself becomes the noise.

The journal's job is to catch this pattern. If your journal shows three different rule changes in four weeks — stop. You are chasing performance, not testing a hypothesis."

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 min

Three scenarios. For each: which question fails first in the decision tree? What is the appropriate response?

1. *"My strategy had a great backtest Sharpe of 1.8. After 15 live trades, my win rate is 38% vs. 55% backtest. I want to change the entry rule."*
   *(Expected direction: Q4 fails first — 15 trades is insufficient sample. Continue trading. Document.)*

2. *"I've followed every rule perfectly for 25 trades. My IC is 0.02. The market has been trending all month and my mean-reversion strategy was designed for range-bound markets."*
   *(Expected direction: Q2 fails — regime mismatch. Wait for range conditions. No changes.)*

3. *"I changed my exit rule two weeks ago based on one bad loss. Now I want to change the entry rule because last week was poor."*
   *(Expected direction: This is the overfitting trap. Two changes in two weeks. Stop adapting. Revert to original and run it consistently for 30 trades before evaluating again.)*

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 min

**Wednesday workshop:** Build `strategy_adaptation_check()` — the automated decision tree applied to real trade data — and `generate_month3_summary()`.

**Pre-reading:** Review your full Month 3 journal before Wednesday. Have your trade data exported and accessible.

**Closing reflection:**
*"Based on the decision tree: what is the right action for my strategy right now — adapt, wait, or revert? What is my evidence?"*

---

## WEDNESDAY — July 1, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** Full account snapshot. Note: July 4 weekend begins Thursday. Markets close early Friday July 3 at 1:00 PM EST.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Before tonight, export your full Month 3 trade history to CSV. Include: date, ticker, entry price, exit price, P&L, rule adherence (Y/N), and post-trade notes. Have it clean and loaded in pandas before class."

---

### EVENING: Workshop Session (8:00–9:30 PM EST)
**Workshop:** W12 — Strategy Adaptation Framework + Month 3 Analytics Final
**Notebook:** `W12_workshop_adaptation_[initials].ipynb`
**Curriculum Source:** Wiki Sections 8.4, 9.2

#### Block 1 — Framing (8:00–8:10 PM) | 10 min

"Tonight we build two things. First: the automated decision tree — a function that takes your trade data and outputs an adaptation recommendation using the four-question framework from Monday. Second: the Month 3 summary report — your complete Month 3 record in a single exportable document. This is the foundation of your Milestone 3 package."

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 min

**Step 1 — strategy_adaptation_check() (20 min)**
```python
def strategy_adaptation_check(trades_df, signal_col='signal', 
                               return_col='pnl', rule_col='rule_followed',
                               lookback=20, ic_threshold=0.03):
    """
    Apply the 4-question adaptation decision tree to live trade data.
    Returns: recommendation string + evidence dict
    """
    recent = trades_df.tail(lookback).copy()
    total  = len(trades_df)
    
    # Q1 — Rule Adherence
    adherence = recent[rule_col].mean()
    if adherence < 0.85:
        return "HOLD — Fix rule adherence first. Adherence rate: {:.0%}".format(adherence), {
            'q1_adherence': adherence, 'passed': 'Q1'}
    
    # Q3 — Signal IC (Q2 requires manual regime assessment)
    from scipy.stats import spearmanr
    if signal_col in recent.columns:
        ic, _ = spearmanr(recent[signal_col], recent[return_col])
    else:
        ic = 0.0
    if ic > ic_threshold:
        return "HOLD — Signal IC positive ({:.3f}). No structural change needed.".format(ic), {
            'q1_adherence': adherence, 'q3_ic': ic, 'passed': 'Q3'}
    
    # Q4 — Sample size
    if total < 30:
        return "HOLD — Insufficient sample ({} trades). Need 30+ with adherence.".format(total), {
            'q1_adherence': adherence, 'q3_ic': ic, 'total_trades': total, 'passed': 'Q4'}
    
    return "ADAPT — Evidence supports Level 1–2 adjustment. Document and backtest.", {
        'q1_adherence': adherence, 'q3_ic': ic, 'total_trades': total, 'recommendation': 'adapt'}
```

**Step 2 — generate_month3_summary() (20 min)**
```python
def generate_month3_summary(trades_df, return_col='pnl', rule_col='rule_followed'):
    """Generate a complete Month 3 performance summary."""
    import numpy as np
    
    total_trades = len(trades_df)
    total_pnl    = trades_df[return_col].sum()
    win_rate     = (trades_df[return_col] > 0).mean()
    wins         = trades_df[trades_df[return_col] > 0][return_col]
    losses       = trades_df[trades_df[return_col] < 0][return_col]
    avg_win      = wins.mean() if len(wins) > 0 else 0
    avg_loss     = losses.mean() if len(losses) > 0 else 0
    rr           = abs(avg_win / avg_loss) if avg_loss != 0 else 0
    expectancy   = (win_rate * avg_win) + ((1 - win_rate) * avg_loss)
    adherence    = trades_df[rule_col].mean()
    
    summary = f"""
=== MONTH 3 PERFORMANCE SUMMARY ===
Period:           June 8 – July 3, 2026
Total Trades:     {total_trades}
Total P&L:        ${total_pnl:,.2f}
Win Rate:         {win_rate:.1%}
Avg Win:          ${avg_win:,.2f}
Avg Loss:         ${avg_loss:,.2f}
Risk/Reward:      {rr:.2f}
Expectancy:       ${expectancy:,.2f} per trade
Rule Adherence:   {adherence:.1%}

ADAPTATION RECOMMENDATION:
{strategy_adaptation_check(trades_df)[0]}
"""
    print(summary)
    return summary
```

> **Resource:** Performance metrics reference (win rate, R:R, expectancy — the numbers your Month 3 summary must justify) — `resources/infographics/ig_performance_metrics.html`

#### Block 3 — Independent Work (8:50–9:15 PM) | 25 min

Run both functions on your own Month 3 data. Answer in markdown cells:
1. What did the decision tree recommend for your strategy? Do you agree?
2. What does your rule adherence rate reveal about your Month 3 discipline?
3. Is your R:R ratio better or worse than your backtest predicted? What explains the gap?
4. What is the one number from the Month 3 summary that surprises you most?

**Extension:** Add a fifth check to `strategy_adaptation_check()` that segments rule-adherent trades vs. deviation trades and calculates average P&L for each group.

#### Block 4 — Share-Out & Close (9:15–9:30 PM) | 15 min

Two students share Month 3 summaries. Focus: does the summary tell an honest story, or is it written to look good? FINN's framing: "The summary is not a grade — it is evidence."

**Wednesday Deliverable:** Completed notebook + Month 3 summary output pushed to GitHub by midnight.

---

## FRIDAY — July 3, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Note:** Markets close early today at 1:00 PM EST. Keep DMB efficient.

**Portfolio Pulse:** Final Month 3 account summary. Record end-of-month portfolio value for the Milestone 3 package.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
"Final observation of Month 3: What was the single most important thing you learned about yourself as a trader this month? Write one sentence. Bring it to class."

---

### EVENING: Review & Month 3 Close (8:00–9:30 PM EST)

#### Pre-Session Setup
- [ ] Month 3 summary report complete and printed/accessible
- [ ] Adaptation decision written and ready to present
- [ ] Trading journal complete through today
- [ ] TradingView open: SPY monthly chart, VIX, sector heatmap

#### Block 1 — Month 3 Retrospective (8:00–8:30 PM) | 30 min

**Each student presents in under 4 minutes:**
1. Total return vs. $1M start (in % and dollars)
2. Win rate, R:R, rule adherence rate
3. What the adaptation decision tree recommended — and what they're actually doing
4. One thing changing for Month 4. One thing staying the same.

FINN's framing after each: "What does the data say? Not what you felt."

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 min

**SPY — Monthly chart:**
"How did June behave as a month? Trend, range, or chop? How did this compare to the regime your strategy was designed for?"

**Sector rotation — June:**
"Which sectors won in June? Which lost? Does this match what you expected coming into the month based on macro context?"

**VIX — June trajectory:**
"Where did VIX open June 1 and where does it close today? What does that regime shift mean for momentum vs. mean-reversion strategies?"

#### Block 3 — Derivatives Window (9:05–9:15 PM) | 10 min

Standard options observation. Note July 4 weekend context — options market often prices in holiday-week volatility compression.

#### Block 4 — Month 4 Preview & Close (9:15–9:30 PM) | 15 min

**Month 4 additions:**
- Automated signal alerts — Python pipelines that notify when conditions are met
- AI sentiment integration into live workflow
- Milestone 3 at the end of Month 4: full journal audit, P&L attribution, strategy adherence review

**Pre-reading for Month 4:**
- Wiki Section 6.3 (ML signal framework overview)
- Wiki Section 6.4 (Multi-agent AI — conceptual intro)
- Review your Month 3 summary report this weekend

**Closing reflection — Month 3 Final:**
*"This month I learned ___, and it changed the way I think about ___."*

---

## WEEKLY DELIVERABLES SUMMARY

| Deliverable | Due | Format |
|-------------|-----|--------|
| Adaptation decision + evidence | Monday 11:59 PM | Written in hypothesis log |
| Workshop notebook (W12) | Wednesday 11:59 PM | `.ipynb` pushed to GitHub |
| Month 3 summary report output | Wednesday 11:59 PM | Markdown/text, pushed to GitHub |
| Month 3 retrospective presentation | Friday in class | Verbal + data |
| Full trading journal (Month 3 complete) | Friday 11:59 PM | `.md` in GitHub |

---

## INSTRUCTOR NOTES FOR WEEK 12

**The adaptation trap:** The most common error this week is students who change something because the last two weeks were bad. The decision tree is designed to catch this. Enforce it rigorously — if a student can't pass Q1 (rule adherence), they are not allowed to make changes. Full stop.

**Honest retrospectives:** Block 1 on Friday is the most important 30 minutes of Month 3. Students who cannot state their win rate, R:R, and adherence rate from memory are not ready for Month 4. They are using vague language to avoid confronting their data. Name this directly.

**July 3 logistics:** Friday's market closes at 1 PM. The DMB should be brief and focused on Month 3 close. The evening session is a retrospective, not a market analysis session — structure accordingly.

**Month 3 summary quality:** Wednesday's workshop output is the foundation of the Milestone 3 package. Notebooks with vague markdown answers ("it went okay") are not acceptable. Every claim must be backed by a number.

---

## WEEKLY RESOURCES

> Resources are labeled **[Pre-session]** (review before class) or **[Homework]** (explore after). Week 12 is light on new reading — the primary work is with your own data.

---

### Monday — Strategy Adaptation Decision Framework

- **[Article | Pre-session]** [Guide to Quantitative Trading Strategies and Backtesting](https://www.pyquantnews.com/free-python-resources/guide-to-quantitative-trading-strategies-and-backtesting) — PyQuant News. Re-read the "when to stop a strategy" section with your Month 3 data in hand. The framework here mirrors the decision tree FINN uses. Read before Monday's theory session.

- **[Article | Pre-session]** [Dangers of Backtesting — Portfolio Optimization](https://bookdown.org/palomar/portfoliooptimizationbook/8.3-dangers-backtesting.html) — Daniel Palomar / Bookdown. The live-adjustment overfitting trap is a real-time version of the backtesting data-snooping problem. Reading this before Monday makes the connection explicit.

- **[Article | Homework]** [Trading Journal: Example of a Trading Log and Diary](https://www.quantifiedstrategies.com/trading-journal/) — Quantified Strategies. After Monday's session, re-read your own journal with the four-question framework in mind. This article shows what a useful post-trade review actually contains.

---

### Wednesday — Adaptation Notebook & Month 3 Analytics

- **[Article | Reference]** [Risk-Adjusted Performance Metrics Calculation in Python](https://www.wenvenn.com/20240306/risk-adjusted-performance-metrics-calculation-in-python/) — Wenvenn (March 2024). Keep this open during Wednesday's workshop — the `generate_month3_summary()` function outputs win rate, R:R, and expectancy. The formulas here match exactly.

- **[YouTube | Homework]** Search YouTube for: *"pandas trade journal analysis python 2023 2024"* — look for a short tutorial (10–15 min) that loads a CSV of trades and calculates basic performance metrics. The code pattern is the same as Wednesday's workshop.

---

### Friday — Month 3 Retrospective

> No new resources for Friday. Your data is the resource. Come prepared to present it clearly and honestly.

---

*FINN Week 12 — Iteration, Adaptation & Month 3 Close | Part of FINN_Month03.md*
