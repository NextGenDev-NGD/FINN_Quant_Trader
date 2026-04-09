# FINN — Week 22: Deep Execution + Full Analytics
## Capstone Execution, Final Analysis & Milestone 4 | Month 6: Capstone Execution
**Dates:** September 7–12, 2026
**Week Number:** 22 of 24

> **NOTE:** Monday September 7 is Labor Day (federal holiday). Class is cancelled.
> Async package distributed Friday September 4. See Monday section below.

---

## WEEK OVERVIEW

### Theme
Four months of paper trading data. Time to read what it actually says. The Monday async package forces a complete re-read of the entire trading journal. Wednesday builds the definitive analytics notebook — equity curve, attribution, rolling Sharpe, all months in one view. Friday reviews the findings and pushes students toward honest, evidence-based report writing.

### Learning Objectives
By the end of this week, students will be able to:
- Calculate full-period win rate, R:R, expectancy, and rule adherence across all 4 months of paper trading
- Produce a portfolio equity curve comparing the capstone strategy to the SPY benchmark
- Run a complete P&L attribution analysis: alpha vs. beta, rule-following vs. deviation, signal strength quartiles
- Generate a rolling 20-trade Sharpe ratio chart showing performance stability over time
- Draft Report Sections 2 and 3 (Strategy Design and Methodology)
- Articulate the single most important finding from re-reading the full journal

### Materials Needed
- `finnenv` environment — all prior packages
- Complete trade journal CSV — all trades from Months 3–6: `all_trades_[initials].csv`
- W11 monthly analytics notebook — extended to full dataset
- Capstone specification document — Sections 2, 3, and 4
- Starter notebook: `W22_workshop_full_analytics_starter.ipynb`
- Async package: `W22_async_monday_package.md` (distributed Friday W21)

### Pre-Week Checklist (Instructor)
- [ ] Push `W22_workshop_full_analytics_starter.ipynb` to GitHub before Wednesday
- [ ] Push `W22_async_monday_package.md` to GitHub by Friday September 4
- [ ] Email async package link to all students Friday evening
- [ ] Prepare W22 Wednesday framing around attribution analysis
- [ ] Review all student Section 1 drafts before Wednesday (flag structural issues)
- [ ] Assign DMB rotation for Wednesday and Friday (no Monday session)

---

## MONDAY — September 7, 2026
## LABOR DAY — CLASS CANCELLED
### ASYNC FALLBACK PACKAGE — Week 22 Monday
**Original Session Date:** Monday, September 7, 2026
**Topic:** 4-Month Performance Synthesis — What the Full Record Shows
**Estimated Completion Time:** 90 minutes
**Due:** Monday September 7, 11:59 PM

---

#### Context
Tonight's session would have introduced the full 4-month performance synthesis — the analytical foundation for capstone report Sections 2 and 3. Instead, we complete this through structured self-study.

By completing this package tonight, you arrive Wednesday ready to build the analytics notebook without needing to review the conceptual framework first.

#### Required Reading
- Re-read your entire trading journal — every entry from Month 3 to present
- Re-read your Month 3 summary report and Milestone 3 report
- Re-read the adaptation decision tree from W12 notes
- Re-read your capstone specification document Sections 4 and 5

#### Guided Notes — Answer These in Writing

1. "Looking at ALL paper trades across Months 3–5 (not just Month 6): what was your overall win rate? Your overall R:R? Calculate expectancy. Show the arithmetic."

2. "Identify the single best month (by Sharpe ratio or return) and the single worst month. What market regime characterized each? Does the pattern match your strategy's expected regime behavior?"

3. "Count the number of trades where you deviated from your rules across all months. What was the average P&L for rule-following trades vs. deviation trades across the full dataset? Has this relationship improved, stayed the same, or worsened across months?"

4. "What is the most important finding from re-reading your journal that you did not recognize when the trades were live? What only became visible in retrospect?"

5. "Write one paragraph describing what your AI components (ML model and sentiment) contributed vs. what they failed to add. Be specific — cite at least two trades for each."

#### Self-Study Exercise
Draft Section 2 of the capstone report: Strategy Design.
This section must contain:
- Strategy name and architecture summary
- Feature list with IC evidence (from W20 validation)
- Signal combination logic with weights
- Risk framework summary
- One paragraph on what changed from the original Month 2 strategy to the final capstone version

Write this as a professional report section — not bullet points. Target: 400–600 words, data-backed, precise.

#### Submission
- [ ] Guided notes: `W22_async_monday_notes_[initials].md` → GitHub
- [ ] Report Section 2 draft: `capstone_report_sec2_[initials].md` → GitHub

---

## WEDNESDAY — September 9, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** Two weeks of capstone trading. Note cumulative P&L.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
"Before tonight, export all your trade data from Months 3–6 into a single CSV file: `all_trades_[initials].csv`. Required columns: `date`, `ticker`, `direction`, `entry_price`, `exit_price`, `shares`, `pnl`, `rule_followed`, `month`, `signal_composite`. We use this directly in tonight's notebook."

---

### EVENING: Workshop Session (8:00–9:30 PM EST)
**Workshop:** W22 — Full 4-Month Analytics Notebook
**Notebook:** `W22_workshop_full_analytics_[initials].ipynb`
**Curriculum Source:** W11, W12, W15 frameworks — extended to full dataset

#### Block 1 — Framing & Context Bridge (8:00–8:10 PM) | 10 min

"Tonight we run the definitive analysis of your trading performance. Not a week. Not a month. Four months. Every trade in one notebook.

This analysis becomes Sections 3 and 4 of your capstone report. The charts and numbers you generate tonight go directly into the report. Document everything carefully — label every chart, note every finding.

When you're done tonight, you will know — with precision — exactly what your strategy delivered and why."

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 min

```python
import pandas as pd
import numpy as np
import yfinance as yf
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
from scipy import stats
from scipy.stats import spearmanr
from datetime import datetime
import warnings
warnings.filterwarnings('ignore')

# ── LOAD FULL TRADE JOURNAL ───────────────────────────────────
# Students replace this with their actual trade CSV
# Required columns: date, ticker, direction, entry_price, exit_price,
#                   shares, pnl, rule_followed, month, signal_composite

trades = pd.read_csv('all_trades_[initials].csv', parse_dates=['date'])
trades = trades.sort_values('date').reset_index(drop=True)
print(f"Total trades loaded: {len(trades)}")
print(f"Date range: {trades['date'].min().date()} -> {trades['date'].max().date()}")
print(f"Tickers traded: {trades['ticker'].unique()}")
```

**Step 1 — Full period performance summary (10 min)**
```python
def full_performance_summary(trades, starting_capital=1_000_000):
    """Complete performance summary across all months."""
    total_pnl    = trades['pnl'].sum()
    total_return = total_pnl / starting_capital
    n            = len(trades)
    wins         = trades[trades['pnl'] > 0]
    losses       = trades[trades['pnl'] < 0]
    win_rate     = len(wins) / n
    avg_win      = wins['pnl'].mean()
    avg_loss     = abs(losses['pnl'].mean())
    rr           = avg_win / avg_loss
    expectancy   = (win_rate * avg_win) - ((1 - win_rate) * avg_loss)
    rule_rate    = trades['rule_followed'].mean() \
                   if 'rule_followed' in trades.columns else None

    if 'month' in trades.columns:
        monthly = trades.groupby('month').agg(
            trades=('pnl', 'count'),
            total_pnl=('pnl', 'sum'),
            win_rate=('pnl', lambda x: (x > 0).mean()),
        ).round(4)
    else:
        monthly = None

    print(f"\n{'='*60}")
    print(f"FULL PERIOD PERFORMANCE SUMMARY — Months 3–6")
    print(f"{'='*60}")
    print(f"Total Trades:       {n}")
    print(f"Total P&L:          ${total_pnl:+,.2f} ({total_return:+.2%})")
    print(f"Win Rate:           {win_rate:.1%}")
    print(f"Average Win:        ${avg_win:,.2f}")
    print(f"Average Loss:       ${avg_loss:,.2f}")
    print(f"Risk:Reward:        {rr:.2f}")
    print(f"Expectancy:         ${expectancy:+,.2f} per trade")
    if rule_rate is not None:
        print(f"Rule Adherence:     {rule_rate:.1%}")
    if monthly is not None:
        print(f"\nMonthly Breakdown:")
        print(monthly.to_string())

    return {
        'total_pnl': total_pnl, 'total_return': total_return,
        'win_rate': win_rate, 'rr': rr, 'expectancy': expectancy,
        'rule_adherence': rule_rate
    }

summary = full_performance_summary(trades)
```

**Step 2 — Portfolio equity curve and drawdown (10 min)**
```python
def plot_equity_curve(trades, starting_capital=1_000_000, benchmark='SPY'):
    """Plot cumulative portfolio value vs benchmark."""
    trades_sorted = trades.sort_values('date').copy()
    trades_sorted['cum_pnl']     = trades_sorted['pnl'].cumsum()
    trades_sorted['port_value']  = starting_capital + trades_sorted['cum_pnl']
    trades_sorted['port_return'] = trades_sorted['port_value'] / starting_capital - 1

    start_date = trades_sorted['date'].min()
    end_date   = trades_sorted['date'].max()
    spy        = yf.download(benchmark, start=start_date, end=end_date,
                              progress=False)['Close']
    spy_return = spy / spy.iloc[0] - 1

    roll_max   = trades_sorted['port_value'].cummax()
    drawdown   = (trades_sorted['port_value'] - roll_max) / roll_max

    fig, axes  = plt.subplots(3, 1, figsize=(14, 12), sharex=False)

    axes[0].plot(trades_sorted['date'], trades_sorted['port_return'] * 100,
                 color='steelblue', lw=2, label='Capstone Strategy')
    axes[0].plot(spy_return.index, spy_return * 100,
                 color='gray', lw=1.5, linestyle='--', label='SPY Benchmark')
    axes[0].axhline(0, color='black', lw=0.8)
    axes[0].set_title('Capstone Strategy vs SPY — Months 3–6', fontsize=14)
    axes[0].set_ylabel('Return (%)')
    axes[0].legend(fontsize=11)
    axes[0].grid(True, alpha=0.3)

    if 'month' in trades_sorted.columns:
        monthly_pnl = trades_sorted.groupby('month')['pnl'].sum()
        colors = ['#2ecc71' if p > 0 else '#e74c3c' for p in monthly_pnl]
        axes[1].bar(monthly_pnl.index, monthly_pnl.values, color=colors)
        axes[1].axhline(0, color='black', lw=0.8)
        axes[1].set_title('Monthly P&L', fontsize=14)
        axes[1].set_ylabel('P&L ($)')
        axes[1].grid(True, alpha=0.3, axis='y')

    axes[2].fill_between(trades_sorted['date'], drawdown * 100, 0,
                          color='#e74c3c', alpha=0.4)
    axes[2].set_title('Portfolio Drawdown', fontsize=14)
    axes[2].set_ylabel('Drawdown (%)')
    axes[2].grid(True, alpha=0.3)

    plt.tight_layout()
    plt.savefig('capstone_equity_curve.png', dpi=150, bbox_inches='tight')
    plt.show()
    print("Chart saved: capstone_equity_curve.png")

plot_equity_curve(trades)
```

**Step 3 — Attribution and rule adherence analysis (10 min)**
```python
def full_attribution_analysis(trades):
    """
    Full P&L attribution:
    - Rule-following vs. deviation performance
    - Signal strength quartile analysis
    - Best and worst trades
    """
    if 'rule_followed' in trades.columns:
        rule_df = trades.groupby('rule_followed')['pnl'].agg(
            ['count', 'mean', 'sum', lambda x: (x > 0).mean()]
        ).rename(columns={'<lambda_0>': 'win_rate'})
        rule_df.index = ['Deviation', 'Rule-Following']

        print(f"\nRule Adherence Attribution:")
        print(rule_df.round(2).to_string())

        rule_diff = (rule_df.loc['Rule-Following', 'mean'] -
                     rule_df.loc['Deviation', 'mean'])
        print(f"\nRule-following avg P&L advantage: ${rule_diff:+.2f} per trade")

    if 'signal_composite' in trades.columns:
        trades['composite_quartile'] = pd.qcut(
            trades['signal_composite'], q=4,
            labels=['Q1 Weak', 'Q2', 'Q3', 'Q4 Strong']
        )
        quartile_perf = trades.groupby('composite_quartile')['pnl'].agg(
            ['count', 'mean', lambda x: (x > 0).mean()]
        ).rename(columns={'<lambda_0>': 'win_rate'})

        print(f"\nPerformance by Signal Strength Quartile:")
        print(quartile_perf.round(4).to_string())
        print("\n(Higher quartile should show higher mean P&L if signal has value)")

    print(f"\nTop 5 Trades (by P&L):")
    print(trades.nlargest(5, 'pnl')[
        ['date', 'ticker', 'pnl', 'rule_followed']
    ].to_string())

    print(f"\nBottom 5 Trades (by P&L):")
    print(trades.nsmallest(5, 'pnl')[
        ['date', 'ticker', 'pnl', 'rule_followed']
    ].to_string())

full_attribution_analysis(trades)
```

**Step 4 — Generate analytics report sections (10 min)**
```python
def generate_capstone_analytics_report(trades, summary, student_name, save=True):
    """
    Generate structured analytics section for capstone report.
    Outputs Sections 3 and 4 in markdown format.
    """
    max_dd = ((trades['pnl'].cumsum() + 1_000_000).cummin() /
              (trades['pnl'].cumsum() + 1_000_000).cummax() - 1).min()

    report = f"""## Section 3 — Methodology

**Data Sources:**
- Equity OHLCV: Yahoo Finance via `yfinance` (daily bars)
- News sentiment: NewsAPI + ProsusAI/FinBERT
- ML model: XGBoost trained on 4 years of feature data
- Benchmark: SPY (S&P 500 ETF)

**Backtesting Approach:**
- Training period: 2021–2025 (4 years, ~1,000 trading days)
- Out-of-sample period: 2026 (withheld from all parameter optimization)
- Walk-forward validation: 5-fold TimeSeriesSplit
- Cost model: 0.1% commission + 0.1% slippage per trade

**Live Paper Trading:**
- Platform: Webull paper trading (virtual $1,000,000)
- Execution: Automated signal pipeline + manual confirmation
- Period: Months 3–6 ({trades['date'].min().date()} – {trades['date'].max().date()})

---

## Section 4 — Live Results

**Performance Summary:**

| Metric | Value | Benchmark (SPY) |
|--------|-------|-----------------|
| Total Return | {summary['total_return']:+.2%} | [Fill from data] |
| Total Trades | {len(trades)} | N/A |
| Win Rate | {summary['win_rate']:.1%} | N/A |
| Risk:Reward | {summary['rr']:.2f} | N/A |
| Expectancy | ${summary['expectancy']:+.2f}/trade | N/A |
| Max Drawdown | {max_dd:.2%} | [Fill from data] |
| Rule Adherence | {f"{summary['rule_adherence']:.1%}" if summary['rule_adherence'] is not None else 'N/A'} | N/A |

**Equity Curve:**
[See capstone_equity_curve.png]

**Key Observations:**
[WRITE: 3–4 specific observations from the data.
Each must reference a specific metric or time period.
Examples: 'Performance was concentrated in Month X due to Y regime.'
'The highest-returning trades clustered around earnings weeks.'
'Rule-following trades outperformed deviations by $X per trade.']

**Attribution:**
[WRITE: How much of the return came from beta vs. alpha?
Was the AI integration meaningful or marginal?
Reference the quartile analysis if signal_composite was logged.]
"""

    if save:
        filename = f"capstone_report_sec3_4_{student_name.replace(' ','_')}.md"
        with open(filename, 'w') as f:
            f.write(report)
        print(f"\nSections 3–4 saved: {filename}")
    return report

report_sec34 = generate_capstone_analytics_report(
    trades, summary, student_name="[YOUR NAME]"
)
```

#### Block 3 — Independent / Pair Work (8:50–9:15 PM) | 25 min

Students run full analytics on their real trade data. Fill in all placeholder text in the generated report sections. Verify all numbers match the dashboard from W10. Save charts and push all report sections to GitHub.

Instructor circulates with coaching questions:
- "What does the attribution analysis tell you about rule adherence over time? Is it improving?"
- "Your equity curve shows a drawdown in Month X. What was the market regime? What does that tell you about your strategy's regime sensitivity?"
- "The quartile analysis shows Q1 and Q4 have similar mean P&L. What does that say about your signal?"

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 min

**Share-out:** Equity curve comparisons. Who beat SPY? Who underperformed?
"I want to hear from someone who underperformed. Walk us through why. What does the attribution analysis say?"

**Muddiest Point:**
> *"The finding from tonight's analysis that I least expected was ___."*

**Submissions:** Notebook + report sections 3–4 → GitHub.

---

## FRIDAY — September 11, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** Full account summary. Note cumulative return trend.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
"Before tonight, read Sections 1–3 of your report as if you are reading it for the first time. Write down one thing that is unclear to an outside reader and one claim that lacks a supporting number. Fix both before class."

---

### EVENING: Review & Market Session (8:00–9:30 PM EST)
**Topic:** Week 22 Review + Attribution Deep Dive + Report Sections 1–3 Review

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 min

"Tonight's retrospective is a report draft review. Each student has 3 minutes: walk us through what Sections 1–3 currently say. What is your hypothesis? What was your methodology? What do your results show?"

After each student: one critique from the class, one from the instructor. Focus on: precision of claims, presence of numbers, honest framing.

Common coaching prompts:
- "You said the strategy 'performed reasonably.' What does the equity curve say specifically?"
- "Section 3 says 'walk-forward validation was used.' Which folds? What was the OOS IC on each fold?"
- "Your Section 4 says rule-following outperformed deviations. By how much? That number belongs in the text."

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 min

Standard format. Extended focus on how this week's market compared to the capstone strategy's target regime.
"Was this week good for your strategy? Does your equity curve reflect that? If not — why not?"

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 min
Standard checklist.

#### Block 4 — Next Week Preview & Close (9:20–9:30 PM) | 10 min

**Next week:** Analysis and writing. The hardest sections: limitations, AI contribution, and forward plan.

**Assign reading:**
- Review W17 feature importance chart — what does it say?
- Review W18 sentiment correlation plots — was sentiment predictive?
- Think hard about: what specifically failed, and why?

**Report due Friday September 18:**
- Section 4 (live results): complete and polished
- Section 5 (AI integration): first draft

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

## WEEKLY DELIVERABLES SUMMARY

| Deliverable | Due | Format |
|-------------|-----|--------|
| Async Monday notes | Monday September 7, 11:59 PM | `W22_async_monday_notes_[initials].md` |
| Report Section 2 — Strategy Design draft | Monday September 7, 11:59 PM | `capstone_report_sec2_[initials].md` |
| Full analytics notebook (W22) | Wednesday 11:59 PM | `.ipynb` pushed to GitHub |
| Report Sections 3–4 (generated + filled) | Wednesday 11:59 PM | `capstone_report_sec3_4_[initials].md` |
| Capstone equity curve chart | Wednesday 11:59 PM | `capstone_equity_curve.png` |
| Trading journal — all Week 22 entries | Friday 11:59 PM | Updated `.csv` or `.md` |

---

## INSTRUCTOR NOTES FOR WEEK 22

**Labor Day is a real risk for momentum loss:** Some students will use the long weekend to avoid engaging with their journals. The async package is designed to force re-engagement — but only if you hold the deadline. Wednesday, verify completion before moving to the workshop. A student who didn't do the async will not have their trade CSV ready. Don't let them skip it — give them 15 minutes at the start of Wednesday to do the minimum.

**The attribution analysis reveals what students don't want to see:** Most students will find that deviation trades underperformed rule-following trades. Some will find the margin is small — which is honest and fine. A few will find the opposite. Those cases are the most interesting. Don't let the inverse case go unexamined: if deviations outperformed, was that consistent or driven by 1–2 lucky trades? What does the sample size say?

**Quartile analysis interpretation requires care:** If signal_composite was not logged in the journal (many students won't have it), the quartile analysis can't run. Flag this before Wednesday: "If you haven't been logging the composite score in your journal entries — start now. We can only run this analysis on the remaining weeks." Don't let students feel that missing this column invalidates the analytics — it doesn't. But make the point that this is why documentation standards exist.

**Report writing momentum:** By Friday, every student should have a draft of Sections 1–4. The most common failure mode is students who have clean analytics output but haven't converted it to report prose. Push this explicitly on Friday: "Having a chart is not the same as having a Section 4. The section explains what the chart shows, why it matters, and what it means for the strategy's validity."

**9/11 acknowledgment:** Friday September 11 is the 25th anniversary of 9/11. Keep this in mind for the tone of the DMB. Standard brief format is fine — no need to interrupt the curriculum — but be aware of the date if it comes up.

---

## WEEKLY RESOURCES

> Resources are labeled **[Pre-session]** (review before class) or **[Homework]** (explore after).

---

### Monday (Async) — 4-Month Synthesis

- **[Reference | Pre-session]** Your complete trading journal — every entry, all months. The async guided notes require you to calculate full-period statistics. Have the CSV open before you start. If your journal is in multiple files, consolidate them first.

- **[Article | Homework]** [How to Evaluate a Quantitative Trading Strategy](https://www.quantstart.com/articles/How-to-Evaluate-the-Performance-of-a-Systematic-Trading-Strategy/) — QuantStart. The evaluation framework described here (Sharpe, drawdown, win rate, rule adherence, benchmark comparison) is exactly the framework the capstone report Section 4 must follow.

---

### Wednesday — Analytics Build

- **[Reference | Pre-session]** Your W11 monthly analytics notebook — We extend its architecture tonight to cover all 4 months. Review the `generate_month3_summary()` function. Tonight's `full_performance_summary()` builds directly on it.

- **[Article | Reference]** [Portfolio Performance Attribution](https://corporatefinanceinstitute.com/resources/career-map/sell-side/capital-markets/portfolio-attribution/) — CFI. The alpha vs. beta attribution section maps directly to the professional standard for Section 4. Read before Wednesday to understand what the decomposition is actually measuring.

---

### Friday — Report Review

- **[Book | Pre-session]** [The Elements of Style — Strunk & White](https://www.gutenberg.org/files/37134/37134-h/37134-h.htm) — Free on Project Gutenberg. Rules 13–17 (active voice, omit needless words, use definite language). The three most common report writing failures in FINN capstones violate these four rules. Read them before Friday.

---

*FINN Week 22 — Deep Execution + Full Analytics | Part of FINN_Month06.md*
