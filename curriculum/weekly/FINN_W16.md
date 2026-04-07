# FINN — Week 16: Milestone 3 Preparation & Review
## Paper Trading Phase II | Month 4: Paper Trading II — Iteration, Automation & Milestone 3
**Dates:** July 27 – August 1, 2026
**Week Number:** 16 of 24

---

## WEEK OVERVIEW

### Theme
Two months of live trading. What did the data actually show? This week consolidates everything from Months 3 and 4 into a structured retrospective. Monday synthesizes the behavioral and quantitative story from the full trading record. Wednesday assembles the Milestone 3 package — journal audit, full analytics, attribution summary, and forward plan. Friday delivers the Milestone 3 individual reviews.

### Learning Objectives
By the end of this week, students will be able to:
- Articulate their full Month 3–4 performance data verbally, without notes
- Identify and explain the behavioral patterns visible across their complete trading journal
- Generate a complete Milestone 3 package: journal audit, analytics report, adaptation summary, and forward plan
- Present a structured performance review covering P&L, win rate, R:R, Sharpe, rule adherence, and attribution
- Distinguish between strategy underperformance (signal decay or regime mismatch) and execution failure (rule deviation)
- State a specific, evidence-backed Month 5 forward plan

### Materials Needed
- `finnenv` environment — `pandas`, `numpy`, `yfinance`, `matplotlib`, `backtrader`
- Complete trading journal for all Month 3–4 trades (as `.csv` or `.md`)
- Month 3 summary report (pushed to GitHub)
- Week 15 version comparison notebook results
- Week 11 analytics notebook — re-run on full Month 3–4 data
- Starter notebook: `W16_workshop_milestone3_prep_starter.ipynb`

### Pre-Week Checklist (Instructor)
- [ ] Push `W16_workshop_milestone3_prep_starter.ipynb` to GitHub
- [ ] Confirm all students have their Week 11 analytics notebook accessible
- [ ] Review Milestone 3 format with students Friday DMB — no surprises
- [ ] Schedule individual 30-minute review slots for Friday evening (30 min per student)
- [ ] If class > 3 students, pre-schedule Saturday August 2 overflow reviews
- [ ] Assign DMB rotation for Monday, Wednesday, Friday

---

## MONDAY — July 27, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** Final full-week review before Milestone 3. State current portfolio value, total Month 4 trade count, and any open positions.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Run the automated signal monitor and the portfolio management notebook. Generate a complete current-state snapshot: open positions, net beta, sector exposure, any signals in the queue. This is the starting point for Friday's Milestone 3 review. Screenshot and save the output."

---

### EVENING: Theory Session (8:00–9:30 PM EST)
**Topic:** Synthesizing Two Months of Paper Trading — What the Data Reveals
**Curriculum Source:** All prior Month 3–4 content (synthesis session — no new material)

#### Pre-Session Setup
- [ ] Complete trading journal for all Month 3–4 trades accessible
- [ ] Month 3 summary report reviewed
- [ ] Week 15 version comparison results available
- [ ] Strategy adaptation decision documented

#### Block 1 — Day Review & Milestone Prep Inventory (8:00–8:15 PM) | 15 min

"Let's do a quick inventory. Raise your hand when I call yours:
- Complete journal for all Month 3–4 trades?
- Run the attribution notebook on full Month 3–4 data?
- Written your forward plan for Month 5?
- Version comparison run and documented?

Anyone missing any of these — Wednesday workshop is your recovery time. Friday Milestone 3 requires all of them. If you have two of four today — that's recoverable. If you have zero — we have a problem, and we need to talk after tonight."

#### Block 2 — Synthesis Session (8:15–8:55 PM) | 40 min

No new content this block. This is a guided synthesis session. Instructor facilitates; students drive.

**Part 1 — The Data Story (15 min):**

"What does two months of paper trading tell you about your strategy? Not feelings — data. What are the numbers?

Walk me through:
- Total P&L and return %
- Win rate and R:R
- Sharpe ratio
- Max drawdown from the risk dashboard
- Alpha vs. SPY beta contribution
- Rule adherence rate
- Signal monitor effectiveness — did it improve your timing?"

Call on each student. They present their numbers verbally without notes. If they can't recall their own key metrics — that is itself feedback. Their numbers should be internalized by now, not just in a notebook.

**Part 2 — The Behavioral Story (15 min):**

"Numbers tell half the story. Behavior tells the rest.

For each student:
- When did you deviate from your rules? What triggered it?
- When did you feel the strongest urge to override the strategy? What happened when you did vs. when you didn't?
- When was your best decision this month? (Not best trade — best decision.)
- When was your worst decision? (Not worst trade — worst decision.)"

This distinction matters. A good decision that leads to a bad trade is still a good decision. A bad decision that leads to a good trade is still a bad decision. The process must be evaluated separately from the outcome.

**Part 3 — The Forward Story (10 min):**

"Month 5 adds more sophisticated AI tools and deeper automation. But it also continues paper trading with the same rigor.

What is the most important thing to change in Month 5?
What is the most important thing to keep exactly the same?

Spend 5 minutes writing these two answers right now. They become the core of your Milestone 3 forward plan."

Students write independently. Instructor circulates and reads.

#### Block 3 — Milestone 3 Q&A (8:55–9:15 PM) | 20 min

Open floor for questions about the Milestone 3 format, preparation requirements, and how to handle edge cases.

"Let me be clear about what Milestone 3 is and what it isn't.

It IS:
- A structured review of your documented work from Months 3–4
- An opportunity to articulate your learnings with data support
- A coaching session with feedback on what to strengthen in Months 5–6

It IS NOT:
- A judgment on P&L performance
- A test you can 'fail' by having losing trades
- An evaluation of whether you picked good stocks

A student who lost 3% but has a complete journal, honest attribution, and a rigorous forward plan passes with distinction.

A student who made 8% but has a sparse journal, no attribution work, and no forward plan is the one who should be concerned."

Common questions to address:
- "What if my journal has gaps?" — Fill them now with your best recollection and note it as reconstructed. Reconstructed is better than empty.
- "What if my adaptation underperformed?" — Present it honestly. The evidence decides, not the outcome preference.
- "How long should my forward plan be?" — One solid paragraph with specific, evidence-backed claims. Not a list of wishes.

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 min

**Wednesday workshop:**
"Final journal audit and Milestone 3 package assembly. Starter: `W16_workshop_milestone3_prep_starter.ipynb`

This notebook walks you through generating the complete Milestone 3 package in four sections:
1. Journal completeness audit — flags every missing field
2. Full performance analytics — trades summary, Sharpe, attribution
3. Strategy adaptation summary — version comparison output
4. Milestone 3 report generator — outputs the full review document

Come with your trade journal as a CSV or structured markdown. The notebook uses it directly."

**Pre-reading:** None tonight — preparation time only. Review your trading journal tonight instead.

**Closing reflection:**
*"The number from my trading record that I least expected to see is ___."*

---

## WEDNESDAY — July 29, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** Penultimate day of Month 4. Full account snapshot — total return, open positions, any pending signals.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
"Before tonight, run the full analytics notebook on your complete Month 3–4 trade data. Generate the performance summary table. Know your total P&L, win rate, Sharpe, and rule adherence. Bring the numbers — not the notebook — we will work from the numbers tonight."

---

### EVENING: Workshop Session (8:00–9:30 PM EST)
**Workshop:** W16 — Milestone 3 Package Assembly: Journal Audit + Full Analytics
**Notebook:** `W16_workshop_milestone3_prep_[initials].ipynb`
**Curriculum Source:** All Month 3–4 content

#### Block 1 — Framing (8:00–8:10 PM) | 10 min

"Tonight is preparation, not new content. By the end of this session, every student will have a complete Milestone 3 package: journal, analytics, attribution, forward plan.

If your journal has gaps — we fill them tonight.
If your attribution notebook hasn't been run — we run it tonight.
No one leaves this session unprepared for Friday."

This workshop is pure work time. No lecture after the framing. Instructor circulates with 1:1 coaching. Students work through the package builder step by step.

#### Block 2 — Milestone 3 Package Builder (8:10–9:10 PM) | 60 min

Students work through the following checklist independently while instructor circulates.

```python
# ── MILESTONE 3 PACKAGE GENERATOR ─────────────────────────────────────
# Run each section. Fix any gaps before Friday.
# Output: milestone3_package_[initials].md

import pandas as pd
import numpy as np
import yfinance as yf
import json
from datetime import datetime

print("MILESTONE 3 PACKAGE GENERATOR")
print("="*55)
print(f"Generated: {datetime.now().strftime('%Y-%m-%d %H:%M')}")
print()
```

**Section 1 — Journal Completeness Audit (15 min)**
```python
def audit_journal(journal_df):
    """
    Check journal completeness. Every field must be filled.
    """
    required_fields = [
        'date', 'ticker', 'direction', 'hypothesis', 'signal',
        'entry_price', 'position_size', 'stop_loss', 'target',
        'exit_price', 'pnl', 'rule_followed', 'post_trade_review'
    ]

    print("SECTION 1: JOURNAL AUDIT")
    print("─"*40)
    print(f"Total trades logged: {len(journal_df)}")

    missing_report = []
    for field in required_fields:
        if field not in journal_df.columns:
            missing_report.append(f"  Column missing: {field}")
        else:
            null_count = journal_df[field].isna().sum() + \
                        (journal_df[field] == '').sum() + \
                        (journal_df[field] == '[TBD]').sum()
            if null_count > 0:
                missing_report.append(
                    f"  WARNING {field}: {null_count} incomplete entries"
                )
            else:
                print(f"  OK  {field}: complete")

    if missing_report:
        print("\nINCOMPLETE FIELDS — MUST FIX BEFORE FRIDAY:")
        for item in missing_report:
            print(item)
        return False
    else:
        print("\nJournal is complete. All fields populated.")
        return True

# Students load their actual journal CSV here
# Minimum required columns listed above
journal_df = pd.read_csv('trading_journal_[initials].csv', parse_dates=['date'])
journal_complete = audit_journal(journal_df)
```

**Section 2 — Full Performance Analytics (15 min)**
```python
# (Reuse functions from W11 analytics notebook)
print("\nSECTION 2: PERFORMANCE ANALYTICS")
print("─"*40)

total_pnl   = journal_df['pnl'].sum()
total_ret   = total_pnl / 1_000_000
wins        = journal_df[journal_df['pnl'] > 0]
losses      = journal_df[journal_df['pnl'] < 0]
win_rate    = len(wins) / len(journal_df)
rule_rate   = journal_df['rule_followed'].mean()
avg_win     = wins['pnl'].mean()
avg_loss    = abs(losses['pnl'].mean())
rr          = avg_win / avg_loss if avg_loss > 0 else 0
expectancy  = (win_rate * avg_win) - ((1 - win_rate) * avg_loss)

print(f"Period:              Month 3 + Month 4")
print(f"Total Trades:        {len(journal_df)}")
print(f"Total P&L:           ${total_pnl:+,.2f} ({total_ret:+.2%})")
print(f"Win Rate:            {win_rate:.1%}")
print(f"Avg Win / Avg Loss:  ${avg_win:,.2f} / ${avg_loss:,.2f}")
print(f"R:R Ratio:           {rr:.2f}")
print(f"Expectancy:          ${expectancy:+,.2f} per trade")
print(f"Rule Adherence:      {rule_rate:.1%}")

# Students also run detect_market_regime() and calculate_alpha_beta()
# from W11 notebook — copy those functions here and run on full dataset
```

**Section 3 — Strategy Adaptation Summary (10 min)**
```python
print("\nSECTION 3: STRATEGY ADAPTATION SUMMARY")
print("─"*40)

# Students fill this with their actual adaptation results from W15
adaptation_summary = {
    'original_strategy':    '[Your strategy name] v1.0',
    'adaptation_made':      '[What you changed] — v1.1',
    'adaptation_rationale': '[Why you made the change — cite W12 decision tree]',
    'oos_comparison':       'V1.1 Sharpe: ___ vs V1.0 Sharpe: ___ (out-of-sample)',
    'ic_comparison':        'V1.1 IC: ___ vs V1.0 IC: ___',
    'live_result':          'V1.1 fired ___ signals vs V1.0 would have fired ___ (Month 4)',
    'recommendation':       '[Continue / Revert / Revise — state the evidence basis]',
    'month5_plan':          '[Specific Month 5 strategy direction]'
}

for key, value in adaptation_summary.items():
    print(f"{key.replace('_',' ').title():30s}: {value}")
```

**Section 4 — Generate Final Milestone 3 Report (10 min)**
```python
def generate_milestone3_report(journal_df, adaptation_summary,
                                 student_name, save=True):
    """Generate complete Milestone 3 markdown report."""
    total_pnl = journal_df['pnl'].sum()
    total_ret = total_pnl / 1_000_000
    wins      = journal_df[journal_df['pnl'] > 0]
    losses    = journal_df[journal_df['pnl'] < 0]
    win_rate  = len(wins) / len(journal_df)
    rule_rate = journal_df['rule_followed'].mean()
    avg_win   = wins['pnl'].mean() if len(wins) > 0 else 0
    avg_loss  = abs(losses['pnl'].mean()) if len(losses) > 0 else 0
    rr        = avg_win / avg_loss if avg_loss > 0 else 0
    expectancy = (win_rate * avg_win) - ((1 - win_rate) * avg_loss)

    report = f"""# Milestone 3 — Paper Trading Mid-Review
## {student_name}
**Period:** Month 3 (June 8) — Month 4 (August 1, 2026)
**Generated:** {datetime.now().strftime('%Y-%m-%d %H:%M')}

---

## 1. Performance Summary

| Metric | Value |
|--------|-------|
| Starting Capital | $1,000,000.00 |
| Ending Value | ${1_000_000 + total_pnl:,.2f} |
| Total P&L | ${total_pnl:+,.2f} |
| Total Return | {total_ret:+.2%} |
| SPY Benchmark Return | [FILL FROM W11 ANALYTICS] |
| Alpha vs SPY | [FROM W11 NOTEBOOK] |
| Total Trades | {len(journal_df)} |
| Win Rate | {win_rate:.1%} |
| Avg Win / Avg Loss | ${avg_win:,.2f} / ${avg_loss:,.2f} |
| Risk:Reward | {rr:.2f} |
| Expectancy | ${expectancy:+,.2f} per trade |
| Rule Adherence | {rule_rate:.1%} |
| Max Drawdown | [FROM RISK DASHBOARD] |
| Sharpe Ratio | [FROM W11 ANALYTICS] |

## 2. Strategy Adaptation

**Original Strategy:** {adaptation_summary['original_strategy']}
**Adaptation Applied:** {adaptation_summary['adaptation_made']}
**Rationale:** {adaptation_summary['adaptation_rationale']}

**Evidence:**
- {adaptation_summary['oos_comparison']}
- {adaptation_summary['ic_comparison']}
- {adaptation_summary['live_result']}

**Recommendation:** {adaptation_summary['recommendation']}

## 3. Key Behavioral Findings

[WRITE: When did you deviate? What triggered it?
What pattern is visible across all deviations?
Was it fear, impatience, boredom, or overconfidence?
Be specific — cite 2–3 examples.]

## 4. Best and Worst Decisions

**Best decision (not trade):**
[Describe the decision and why it was correct regardless of outcome.
Example: 'Held my stop discipline on [date] when [ticker] dipped to
my stop before reversing. I exited as planned and avoided the temptation
to remove the stop. The trade closed at a loss but the decision was correct.']

**Worst decision (not trade):**
[Describe the decision and what you would do differently.
Example: 'Entered [ticker] on [date] without a complete signal —
RSI was at threshold but EMA condition was not met. I rationalized
it as 'close enough.' The trade lost. The decision was wrong.']

## 5. Month 5 Forward Plan

**Strategy version for Month 5:** {adaptation_summary['month5_plan']}
**Primary focus for Month 5:** [What skill or analysis area most needs development?]
**Risk management adjustment:** [Any changes to sizing or stop methodology?]
**Target metrics for Month 5:**
- Win rate target: ___
- Sharpe target: ___
- Rule adherence target: ___

---
*FINN Month 4 Milestone 3 Report*
"""

    if save:
        filename = f"milestone3_report_{student_name.replace(' ','_')}.md"
        with open(filename, 'w') as f:
            f.write(report)
        print(f"\nMilestone 3 report saved: {filename}")

    return report

report = generate_milestone3_report(
    journal_df, adaptation_summary,
    student_name="[YOUR NAME]"
)
print("\nMilestone 3 package complete.")
```

#### Block 3 — Share-Out & Pre-Milestone Check-In (9:10–9:30 PM) | 20 min

**Pre-milestone check-in (15 min):**
"Who still has incomplete journal entries? Name the trades — not the count, the actual trades. Who is missing post-trade reviews? Write them tonight — not tomorrow.

The Milestone 3 review is in 48 hours. The package is due before Friday DMB."

Instructor collects muddiest point:

**Final muddiest point for Month 4:**
> *"Going into Milestone 3, the thing I am least confident about is ___."*

**Notebook submission:** `W16_workshop_milestone3_prep_[initials].ipynb` to GitHub.
**Milestone 3 report:** `milestone3_report_[initials].md` pushed to GitHub before Friday DMB.

---

## FRIDAY — August 1, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Note:** Keep this DMB efficient. Milestone 3 reviews begin at 8:00 PM. Students should be reviewing their packages, not adding new trades today.

**Portfolio Pulse:** Final Month 4 account snapshot. State total return for the month, cumulative Month 3–4 return, and current open positions if any.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
"Use the time between the DMB and tonight's session to review your complete Milestone 3 package one final time. Know your numbers. Practice stating your forward plan out loud. You should be able to present your key findings in under 3 minutes without looking at notes."

---

### EVENING: Milestone 3 — Paper Trading Mid-Review (8:00–9:30 PM EST)
**Format:** Individual reviews — 30 minutes per student

#### Milestone 3 Review Format

Reviews run sequentially. Other students continue independent work (review their own packages, finish Month 5 pre-reading, or work on the W15 version comparison if incomplete) while waiting.

If class size exceeds 3 students, overflow sessions are scheduled for Saturday August 2 at the same time slot.

---

**Part 1 — Journal Audit (8 min)**

Instructor reviews the student's journal notebook or markdown file live.
Checks: all fields complete, post-trade reviews present, honest self-assessment.

Questions during audit:
- "Walk me through your worst trade in terms of journal quality. What's missing? Why?"
- "Your post-trade review on this trade says 'it went up.' That is description, not analysis. What should it say?"
- "Show me one post-trade review you are genuinely proud of. What makes it good?"
- "How many post-trade reviews mention a rule deviation? Was that number a surprise?"

---

**Part 2 — Performance Review (10 min)**

Student presents key metrics verbally without reading from screen:
- Total return vs. SPY (state the benchmark comparison)
- Win rate, R:R, expectancy
- Attribution: alpha vs. beta contribution (from W11 notebook)
- Rule adherence rate

Instructor questions:
- "Your Sharpe was [X]. Your backtest showed [Y]. Walk me through three possible explanations for the gap."
- "Your rule adherence was [X]%. What was happening in the [100-X]% of trades where you deviated? Is there a pattern?"
- "What is your portfolio beta right now and is it appropriate for the current market regime?"
- "Which month had better performance — Month 3 or Month 4? What explains the difference?"

---

**Part 3 — Strategy Adaptation Review (7 min)**

Student presents version comparison findings from W15.

Instructor questions:
- "Your adaptation improved OOS Sharpe by [X]. Is that sufficient evidence to trust it for Month 5? What would make you MORE confident?"
- "If the OOS comparison had shown V1.0 winning — what would you do? Walk me through the exact decision process."
- "Your adaptation was [specific change]. In hindsight, was the rationale sound? What would you have done differently in the decision?"

---

**Part 4 — Month 5 Forward Plan (5 min)**

Student presents their Month 5 plan verbally.
Instructor gives one specific coaching point and one question to carry into Month 5.

---

#### After Reviews — Month 4 Close (remaining time)

**Month 4 group retrospective (10 min):**
"Looking back at Week 9 — the first week you placed live paper trades — what feels completely automated now that felt overwhelming then? What is the hardest thing about systematic trading that you didn't anticipate when you started Month 3?"

**Month 5 preview (5 min):**
"Month 5 adds deeper AI integration — multi-agent pipelines, live NewsAPI sentiment, and the beginning of capstone strategy design. We also bring in more sophisticated ML: XGBoost on the live feature matrix. The pace increases. The standards for your trading journal and analytics do not drop — they rise.

The capstone strategy you design at the end of Month 5 is what you will run for all of Month 6 and present at Milestone 4. That design decision begins next week."

**Pre-reading for Month 5, Week 1:**
- Wiki Section 6.3 — Full ML framework (re-read with 2 months of live context)
- Wiki Section 6.4 — Multi-agent AI (conceptual to applied)
- Review Week 8 FinBERT notebook — we extend it significantly in Month 5

**Monthly One-Liner:**
> *"Month 4 taught me ___, and Month 5 I want to ___."*

---

## WEEKLY DELIVERABLES SUMMARY

| Deliverable | Due | Format |
|-------------|-----|--------|
| Milestone 3 preparation notebook (W16) | Wednesday 11:59 PM | `.ipynb` pushed to GitHub |
| Journal completeness audit — all gaps resolved | Wednesday 11:59 PM | Updated journal CSV/md in GitHub |
| Milestone 3 report package | Friday before DMB | `milestone3_report_[initials].md` in GitHub |
| Trading journal — all Month 4 trades complete | Friday before DMB | Updated `.csv` or `.md` in GitHub |

---

## INSTRUCTOR NOTES FOR WEEK 16

**What Milestone 3 is actually for:** The review is not a grade — it is a structured forcing function for honest self-assessment. Students who have been avoiding looking at their results directly are confronted with them in a supportive, evidence-focused setting. The most valuable moment is often when a student's verbal description of their strategy doesn't match what the journal actually shows. Point to that discrepancy without judgment. It is the most important learning of the month.

**The "I made money but don't know why" problem:** Some students will have positive returns but cannot explain them through attribution. That is not a success — it is uncertainty. Push them to decompose: how much was market beta? How much was genuine alpha? A student up 3% while SPY was up 4% with a portfolio beta of 1.1 actually underperformed. Make sure they understand this calculation.

**The forward plan should be specific:** Vague forward plans ("I want to trade better in Month 5") are a signal that the student hasn't internalized the lessons. Acceptable: "Month 5 I will improve my IC by at least 0.02 by testing an XGBoost model on my feature matrix — my rules-based IC was 0.04 on recent data and the model should do better." That specificity is what Months 5 and 6 need to build on.

**Journal gaps are not disqualifying:** Students who reconstructed trades or have thin post-trade reviews should not feel penalized — they should leave the review with a clear standard for what complete documentation looks like. Show them a strong example from another student (with permission) or from a demonstration journal.

**Month 5 setup:** Before Week 17 begins, confirm that every student has their NewsAPI key and that XGBoost and scikit-learn are installed in `finnenv`. Month 5 workshop sessions require these on day one.

---

## WEEKLY RESOURCES

> Resources this week are entirely review and preparation oriented. No new material to consume before Milestone 3 — focus on your own data.

---

### Monday — Synthesis Preparation

- **[Reference | Pre-session]** Your complete trading journal (Months 3–4) — Read every entry before Monday's session. Not skimming — reading. The goal is to notice patterns you didn't see in real time.

- **[Article | Homework]** [Guide to Quantitative Trading Strategies and Backtesting](https://www.pyquantnews.com/free-python-resources/guide-to-quantitative-trading-strategies-and-backtesting) — PyQuant News. Re-read the "evaluation methodology" section. Now that you have real trading data, the concepts of live vs. backtest comparison will read differently than they did in Month 2.

---

### Wednesday — Milestone 3 Package Build

- **[Reference | Pre-session]** Week 11 Analytics Notebook — Run it on the full Month 3–4 dataset before Wednesday. Generate the attribution table and Sharpe calculation. Bring the output.

- **[Reference | Pre-session]** Week 15 Version Comparison Notebook — Have your V1.0 vs. V1.1 comparison results accessible. The adaptation summary in Section 3 of the Milestone 3 report pulls directly from this output.

---

### Friday — Milestone 3 Review

- **[Article | Pre-reading]** [Dangers of Backtesting — Portfolio Optimization](https://bookdown.org/palomar/portfoliooptimizationbook/8.3-dangers-backtesting.html) — Palomar / Bookdown. Re-read Section 8.3 one final time before the review. The live vs. backtest gap in your results is the central question of Part 2 of the Milestone 3 review.

- **[Homework | Post-milestone]** [Implement Walk-Forward Optimization with XGBoost for Stock Price Prediction](https://blog.quantinsti.com/walk-forward-optimization-python-xgboost-stock-prediction/) — QuantInsti. Month 5 Week 1 preview. The walk-forward methodology described here is the gold standard for the XGBoost evaluation we run in Week 17.

---

*FINN Week 16 — Milestone 3 Preparation & Review | Part of FINN_Month04.md*
