# FINN — Week 23: Analysis, Writing & Honest Assessment
## Capstone Execution, Final Analysis & Milestone 4 | Month 6: Capstone Execution
**Dates:** September 14–19, 2026
**Week Number:** 23 of 24

---

## WEEK OVERVIEW

### Theme
The hardest section to write is the one where you say what didn't work. This week is dedicated to the three sections of the capstone report that require the most intellectual honesty: AI contribution (Section 5), limitations (Section 6), and forward plan (Section 7). Monday is a guided writing workshop. Wednesday builds the five production-quality charts that form the visual backbone of the presentation. Friday is a peer review and draft critique session.

### Learning Objectives
By the end of this week, students will be able to:
- Quantify the AI component's contribution using IC comparison, sentiment veto accuracy, and ML probability quartile analysis
- Write a Section 6 limitations analysis with specific, quantified limitations — not vague disclaimers
- Produce a three-part forward plan with evidence basis for each improvement
- Build and save the five capstone report charts: equity curve, rolling Sharpe, monthly metrics, AI contribution, and regime overlay
- Peer-review a draft report section for precision of claims, honesty, and evidence quality
- Complete a draft of all seven report sections before Week 24

### Materials Needed
- `finnenv` environment — all prior packages plus `matplotlib.gridspec`
- Complete `all_trades_[initials].csv` — updated through current week
- W19 multi-signal comparison notebook — IC by component
- W17 feature importance chart — what drove the XGBoost model
- W18 sentiment correlation plots — was sentiment predictive?
- Report Sections 1–4 (drafted in W21–W22)
- Starter notebook: `W23_workshop_report_charts_starter.ipynb`

### Pre-Week Checklist (Instructor)
- [ ] Push `W23_workshop_report_charts_starter.ipynb` to GitHub
- [ ] Review all student Sections 1–4 before Monday — note specific evidence gaps
- [ ] Prepare Monday writing workshop — no slides required, instructor circulates
- [ ] Identify 2 students for Section 5/6 peer review on Monday
- [ ] Prepare Friday comparative review: pull up 2–3 student equity curves side-by-side
- [ ] Assign DMB rotation for Monday, Wednesday, Friday

---

## MONDAY — September 14, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** Three weeks of capstone trading.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Identify one specific trade from Month 6 where the AI component (ML or sentiment) was the decisive factor — either enabling a trade that worked or vetoing one that would have. Write down the date, ticker, component scores, and outcome. Bring it tonight."

---

### EVENING: Theory Session (8:00–9:30 PM EST)
**Topic:** Writing the Hard Sections — Limitations, AI Contribution & Honest Assessment
**Curriculum Source:** All prior content — evaluation focus

#### Pre-Session Setup
- [ ] Report Sections 1–4 accessible and in working draft state
- [ ] W19 IC comparison results pulled up
- [ ] W17 feature importance chart accessible
- [ ] One AI trade example prepared from the DMB observation

#### Block 1 — Day Review (8:00–8:15 PM) | 15 min

"Who has the AI trade example from the DMB? Walk me through it. Did the AI component add value or subtract it? How do you know?"

For each example: press the student on the mechanism. "The sentiment score was +0.42 and the trade won. Did the positive sentiment cause the win, or were both caused by something else? How would you test whether sentiment was causal?"

Then: "That question — was the AI causal or correlated? — is the core of Section 5. Tonight we write it with rigor."

#### Block 2 — Writing Workshop (8:15–8:55 PM) | 40 min

Tonight is a guided writing session, not a technical lecture. All content is delivered verbally while students draft simultaneously.

**Topic A: Writing Section 5 — AI Integration (15 min)**

"Section 5 answers one question: did the AI make your strategy better?

The honest answer requires evidence:
1. Compare IC of the combined signal vs. the rules-only signal (from W19 comparison notebook)
2. Count trades blocked by sentiment veto — how many were correct vetoes?
3. Count trades where ML probability was the decisive factor — what was the win rate on those?
4. If you had run rules-only: what would your Sharpe be? Compare to actual Sharpe with AI integration.

'The AI added value' is not a claim. 'The composite signal had IC 0.072 versus 0.041 for rules-only, a 0.031 improvement maintained OOS' is a claim. Write the claim with the numbers."

Students draft Section 5 while instructor circulates. Flag:
- Sentences that describe what the AI is without assessing whether it helped
- Missing IC or Sharpe comparison numbers
- Conclusions that are more positive than the data supports

**Topic B: Writing Section 6 — Limitations (15 min)**

"This is the section most students avoid writing honestly. That avoidance is visible in the final presentation and it costs points on the self-assessment criterion.

Every strategy has at least three meaningful limitations. For your capstone, they might include:

**Paper trading limitations:**
'Virtual execution does not capture real slippage on limit orders. The live bid-ask spread on low-volume entries was wider than the 0.1% modeled in the backtest, potentially reducing alpha.'

**Data limitations:**
'The sentiment pipeline uses free NewsAPI data with 100 requests/day limit. In live trading, this was insufficient to cover 8 tickers at intraday frequency. Missed sentiment signals during earnings weeks.'

**Model limitations:**
'The XGBoost model was trained on 4 years of data through 2025. Any structural market changes in 2026 (rate regime, AI disruption to market microstructure) are not captured in the training data. IC declined from 0.07 in training to 0.04 in live period — suggesting partial model decay.'

**Regime sensitivity:**
'The RSI mean-reversion component underperforms in strong trending markets (ADX > 35). Month 6 saw a sustained tech trend that reduced the strategy's signal frequency by 40% relative to the backtest average.'

Write these with precision. The limitation is not 'paper trading isn't real.' The limitation is the specific, quantifiable way the paper trading context differed from what the strategy assumed."

Students draft Section 6 while instructor circulates. Flag:
- Limitations that are too general to be meaningful
- Missing quantification ('this may have reduced alpha' vs. 'this reduced alpha by approximately X%')
- Defensive framing that softens real failures

**Topic C: Writing Section 7 — Forward Plan (10 min)**

"Section 7 answers: if you had 3 more months, what would you do?

Format: three specific, prioritized improvements with evidence.

**Improvement 1 (highest priority):**
What single change would most improve the strategy's performance? What evidence supports that choice? What would you test first?

**Improvement 2 (next priority):**
Second most impactful improvement. Different from #1 — don't optimize the same parameter twice.

**Improvement 3 (research direction):**
Something new — a signal type, a model architecture, or a data source you didn't have access to that would be worth exploring.

Each improvement must have: the change, the evidence basis, the test plan."

Students draft Section 7 while instructor circulates.

#### Block 3 — Peer Review (8:55–9:15 PM) | 20 min

Exchange draft Sections 5, 6, or 7 with a partner. Review partner's section against three criteria:
1. Are claims backed by specific numbers?
2. Is the analysis honest — does it acknowledge failures?
3. Is the writing clear enough that a non-student could understand it?

Give written feedback in the margin: one strength, two improvements. Return. Spend 5 minutes revising based on feedback.

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 min

**Wednesday workshop:**
"We build the six charts that belong in your capstone report: equity curve (production quality), rolling 20-trade Sharpe, monthly win rate and R:R, AI contribution visualization, regime map with performance overlay. Starter: `W23_workshop_report_charts_starter.ipynb`"

**Pre-session prep:** Export updated `all_trades_[initials].csv` including all Month 6 trades. Confirm `ml_prob` and `signal_composite` columns are present if you've been logging them.

**Closing reflection:**
*"The hardest thing to write honestly in my report is ___."*

---

## WEDNESDAY — September 16, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** Three weeks of capstone execution. State current return.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
"Before tonight, pull up your W18 sentiment correlation analysis. Was sentiment IC positive or negative in the live paper trading period compared to your training data? We use this finding in tonight's AI contribution chart."

---

### EVENING: Workshop Session (8:00–9:30 PM EST)
**Workshop:** W23 — Capstone Report Charts + AI Contribution Visualization
**Notebook:** `W23_workshop_report_charts_[initials].ipynb`
**Curriculum Source:** W22 full analytics — visual layer

#### Block 1 — Framing (8:00–8:10 PM) | 10 min

"Tonight we build the five charts that belong in your capstone report. Each chart tells one part of the story. Together they form the visual narrative of your strategy's 4-month life.

These charts are not decorative. Each one must be referenced in the written report with a specific interpretation. Every chart gets one paragraph: 'Figure X shows ___. This indicates ___. In the context of the strategy, this means ___.' We draft those paragraphs tonight alongside the charts."

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 min

```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.gridspec as gridspec
import yfinance as yf
from scipy.stats import spearmanr
import warnings
warnings.filterwarnings('ignore')

# Unified color palette for all capstone charts
COLORS = {
    'primary':   '#2E86AB',
    'positive':  '#2ECC71',
    'negative':  '#E74C3C',
    'neutral':   '#95A5A6',
    'accent':    '#E67E22',
    'benchmark': '#7F8C8D',
}

trades = pd.read_csv('all_trades_[initials].csv', parse_dates=['date'])
trades = trades.sort_values('date').reset_index(drop=True)
```

**Chart 1 — Equity curve (production quality) (5 min)**
```python
# Rebuild the equity curve from W22 with final Month 6 data.
# Use the same plot_equity_curve() function.
# Save at print quality: dpi=200, bbox_inches='tight'.
# Label: 'Figure 1: Capstone Strategy Equity Curve vs SPY Benchmark, Months 3–6'
```

> **Resource:** Performance metrics reference card (Sharpe, drawdown, win rate, expectancy — use while interpreting your capstone charts) — `resources/infographics/ig_performance_metrics.html`

**Chart 2 — Rolling 20-trade Sharpe (7 min)**
```python
def plot_rolling_sharpe(trades, window=20, risk_free=0.05/252):
    """Rolling Sharpe ratio over all months."""
    ret_series   = trades.set_index('date')['pnl'] / 1_000_000
    rolling_mean = ret_series.rolling(window).mean()
    rolling_std  = ret_series.rolling(window).std()
    rolling_rf   = risk_free * window
    rolling_sh   = (rolling_mean - rolling_rf) / rolling_std * np.sqrt(252)

    fig, ax = plt.subplots(figsize=(14, 5))
    ax.plot(rolling_sh.index, rolling_sh.values,
            color=COLORS['primary'], lw=1.5)
    ax.axhline(1.0, color=COLORS['positive'], lw=1, linestyle='--',
               alpha=0.6, label='Sharpe = 1.0')
    ax.axhline(0, color='black', lw=0.8)
    ax.fill_between(rolling_sh.index, rolling_sh.values, 0,
                    where=rolling_sh > 0, alpha=0.2, color=COLORS['positive'])
    ax.fill_between(rolling_sh.index, rolling_sh.values, 0,
                    where=rolling_sh < 0, alpha=0.2, color=COLORS['negative'])
    ax.set_title(f'Rolling {window}-Trade Sharpe Ratio — Months 3–6', fontsize=13)
    ax.set_ylabel('Sharpe Ratio')
    ax.legend()
    ax.grid(True, alpha=0.3)
    plt.tight_layout()
    plt.savefig('chart_rolling_sharpe.png', dpi=150, bbox_inches='tight')
    plt.show()
    print("Saved: chart_rolling_sharpe.png")

plot_rolling_sharpe(trades)
```

**Chart 3 — Monthly win rate and R:R (7 min)**
```python
def plot_monthly_metrics(trades):
    """Win rate and R:R breakdown by month."""
    if 'month' not in trades.columns:
        trades['month'] = trades['date'].dt.to_period('M').astype(str)

    monthly = trades.groupby('month').apply(lambda x: pd.Series({
        'win_rate': (x['pnl'] > 0).mean(),
        'rr_ratio': abs(x[x['pnl'] > 0]['pnl'].mean() /
                        x[x['pnl'] < 0]['pnl'].mean())
                    if len(x[x['pnl'] < 0]) > 0 else 0,
        'n_trades': len(x),
    })).reset_index()

    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(14, 5))

    ax1.bar(monthly['month'], monthly['win_rate'] * 100,
            color=[COLORS['positive'] if w > 50 else COLORS['negative']
                   for w in monthly['win_rate']])
    ax1.axhline(50, color='black', lw=1, linestyle='--', label='50% line')
    ax1.set_title('Win Rate by Month (%)', fontsize=13)
    ax1.set_ylabel('Win Rate (%)')
    ax1.legend()
    ax1.grid(True, alpha=0.3, axis='y')

    ax2.bar(monthly['month'], monthly['rr_ratio'],
            color=[COLORS['positive'] if r > 1 else COLORS['negative']
                   for r in monthly['rr_ratio']])
    ax2.axhline(1.0, color='black', lw=1, linestyle='--', label='R:R = 1')
    ax2.set_title('Risk:Reward Ratio by Month', fontsize=13)
    ax2.set_ylabel('R:R Ratio')
    ax2.legend()
    ax2.grid(True, alpha=0.3, axis='y')

    plt.suptitle('Monthly Performance Metrics — Capstone Strategy', fontsize=14)
    plt.tight_layout()
    plt.savefig('chart_monthly_metrics.png', dpi=150, bbox_inches='tight')
    plt.show()
    print("Saved: chart_monthly_metrics.png")

plot_monthly_metrics(trades)
```

**Chart 4 — AI contribution visualization (12 min)**
```python
def plot_ai_contribution(trades):
    """
    Visualize ML and sentiment contribution to trade outcomes.
    Requires signal_composite and ml_prob columns in trades.
    """
    has_ai = all(c in trades.columns for c in ['signal_composite', 'ml_prob'])

    if not has_ai:
        print("AI contribution columns not found.")
        print("Ensure ml_prob and signal_composite were logged in the journal.")
        return

    fig = plt.figure(figsize=(14, 10))
    gs  = gridspec.GridSpec(2, 2, figure=fig)

    # Panel 1: P&L by signal strength quartile
    ax1 = fig.add_subplot(gs[0, 0])
    trades['strength_q'] = pd.qcut(
        trades['signal_composite'], q=4,
        labels=['Weak\n(Q1)', 'Fair\n(Q2)', 'Good\n(Q3)', 'Strong\n(Q4)']
    )
    quartile_pnl = trades.groupby('strength_q')['pnl'].mean()
    colors = [COLORS['negative'] if p < 0 else COLORS['positive']
              for p in quartile_pnl]
    ax1.bar(quartile_pnl.index, quartile_pnl.values, color=colors)
    ax1.axhline(0, color='black', lw=0.8)
    ax1.set_title('Avg P&L by Signal Strength', fontsize=11)
    ax1.set_ylabel('Avg P&L ($)')
    ax1.grid(True, alpha=0.3, axis='y')

    # Panel 2: ML probability distribution — winners vs losers
    ax2 = fig.add_subplot(gs[0, 1])
    winners = trades[trades['pnl'] > 0]['ml_prob']
    losers  = trades[trades['pnl'] < 0]['ml_prob']
    ax2.hist(winners, bins=15, alpha=0.6, color=COLORS['positive'],
             label=f'Winners (n={len(winners)})')
    ax2.hist(losers,  bins=15, alpha=0.6, color=COLORS['negative'],
             label=f'Losers (n={len(losers)})')
    ax2.set_title('ML Probability: Winners vs Losers', fontsize=11)
    ax2.set_xlabel('ML Probability at Entry')
    ax2.legend()
    ax2.grid(True, alpha=0.3)

    # Panel 3: Cumulative P&L — rule-following vs deviations
    ax3 = fig.add_subplot(gs[1, :])
    if 'rule_followed' in trades.columns:
        rule_trades = trades[trades['rule_followed'] == True].copy()
        dev_trades  = trades[trades['rule_followed'] == False].copy()
        ax3.plot(range(len(rule_trades)),
                 rule_trades['pnl'].cumsum(),
                 color=COLORS['positive'], lw=2,
                 label=f'Rule-Following ({len(rule_trades)} trades)')
        if len(dev_trades) > 0:
            ax3.plot(range(len(dev_trades)),
                     dev_trades['pnl'].cumsum(),
                     color=COLORS['negative'], lw=2, linestyle='--',
                     label=f'Deviations ({len(dev_trades)} trades)')
        ax3.axhline(0, color='black', lw=0.8)
        ax3.set_title('Cumulative P&L: Rule-Following vs Deviations', fontsize=11)
        ax3.set_xlabel('Trade Number')
        ax3.set_ylabel('Cumulative P&L ($)')
        ax3.legend()
        ax3.grid(True, alpha=0.3)

    plt.suptitle('AI Signal Contribution Analysis', fontsize=13)
    plt.tight_layout()
    plt.savefig('chart_ai_contribution.png', dpi=150, bbox_inches='tight')
    plt.show()
    print("Saved: chart_ai_contribution.png")

plot_ai_contribution(trades)
```

**Chart 5 — Regime map with performance overlay (9 min)**
```python
def plot_regime_performance(trades, benchmark='SPY'):
    """Overlay trade outcomes on market regime map."""
    start_date = trades['date'].min()
    end_date   = trades['date'].max()

    spy  = yf.download(benchmark, start=start_date, end=end_date, progress=False)
    spy.columns = [c[0] if isinstance(c, tuple) else c for c in spy.columns]
    spy['SMA60']     = spy['Close'].rolling(60).mean()
    spy['VIX_proxy'] = spy['Close'].pct_change().rolling(21).std() * np.sqrt(252)
    spy['regime']    = np.where(spy['VIX_proxy'] > 0.25, 'High Vol',
                       np.where(spy['Close'] > spy['SMA60'], 'Bull', 'Bear/Range'))

    fig, ax = plt.subplots(figsize=(14, 6))

    regime_colors = {'Bull': '#D5F5E3', 'Bear/Range': '#FADBD8', 'High Vol': '#FEF9E7'}
    for regime, color in regime_colors.items():
        mask   = spy['regime'] == regime
        starts = spy.index[mask & ~mask.shift(1, fill_value=False)]
        ends   = spy.index[mask & ~mask.shift(-1, fill_value=False)]
        for s, e in zip(starts, ends):
            ax.axvspan(s, e, alpha=0.3, color=color)

    ax.plot(spy.index, spy['Close'], color='black', lw=1, alpha=0.7)

    for _, trade in trades.iterrows():
        color = COLORS['positive'] if trade['pnl'] > 0 else COLORS['negative']
        nearest = spy.loc[spy.index >= trade['date']]
        if not nearest.empty:
            ax.scatter(trade['date'], nearest.iloc[0]['Close'],
                      color=color, s=60, zorder=5, alpha=0.8)

    from matplotlib.patches import Patch
    legend_elements = [
        Patch(facecolor='#D5F5E3', alpha=0.5, label='Bull Regime'),
        Patch(facecolor='#FADBD8', alpha=0.5, label='Bear/Range Regime'),
        Patch(facecolor='#FEF9E7', alpha=0.5, label='High Vol Regime'),
        plt.scatter([], [], color=COLORS['positive'], s=60, label='Winning Trade'),
        plt.scatter([], [], color=COLORS['negative'], s=60, label='Losing Trade'),
    ]
    ax.legend(handles=legend_elements, loc='upper left', fontsize=9)
    ax.set_title(f'Trade Outcomes by Market Regime — {benchmark}', fontsize=13)
    ax.set_ylabel('Price ($)')
    ax.grid(True, alpha=0.3)
    plt.tight_layout()
    plt.savefig('chart_regime_overlay.png', dpi=150, bbox_inches='tight')
    plt.show()
    print("Saved: chart_regime_overlay.png")

plot_regime_performance(trades)
```

#### Block 3 — Independent / Pair Work (8:50–9:15 PM) | 25 min

Students run all five chart functions on their real trade data. Save all charts to a `/charts` folder in their repo. Begin writing the chart interpretation paragraph for each:

"Figure X shows ___. This indicates ___. In the context of the strategy, this means ___."

Instructor circulates with coaching questions:
- "The Q1 and Q4 quartile P&L are nearly identical. What does that say about your signal's ability to discriminate trade quality?"
- "Your regime overlay shows most losing trades in high-vol periods. Is your strategy designed for high-vol? What does your spec say?"
- "The rolling Sharpe shows a sharp decline in Month 5. What happened that month? Is that visible in your journal?"

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 min

**Share-out:** AI contribution chart results.
"Who found the ML component was genuinely valuable — by the quartile data? Who found it was neutral? Who found it may have hurt?"

After share-out: "Whatever your chart shows — that is what Section 5 must say. Not what you hoped it would show."

**Muddiest Point:**
> *"The hardest thing to write honestly in my report is ___."*

**Submissions:** Charts notebook + draft report Sections 5–6 → GitHub.

---

## FRIDAY — September 19, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** Full account summary. Three weeks remaining in paper trading.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
"Before tonight, complete a full draft of all seven report sections — even if some sections are rough. We need something to review tonight. A bullet-point placeholder is better than a missing section."

---

### EVENING: Review & Market Session (8:00–9:30 PM EST)
**Topic:** Week 23 Review + Draft Report Critique + Strategy Comparison Session

#### Block 1 — Retrospective + Draft Review (8:00–8:30 PM) | 30 min

"Tonight's retrospective is a draft review session. Every student shares one section from their draft report — the section they find hardest to write. No prepared statements — just read what you have and tell us what's incomplete."

After each: class gives one critique focused on honesty and specificity. Instructor gives one coaching point on structure or evidence quality.

Common coaching prompts:
- "You wrote 'the AI component was somewhat effective.' Is that a finding? What number supports it?"
- "Your Section 6 says 'paper trading is not real trading.' That's a truism, not a limitation. What specifically about your paper trading environment differed from live and what did that difference cost you?"
- "Your forward plan says 'I would improve the model.' That's a direction, not a plan. What feature would you add, what IC would you need to see to justify adding it, and on what data would you test it?"

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 min

Standard format. Added focus: "Pull up your regime overlay chart (Chart 5). Does this week fit the same regime pattern as your historically best-performing weeks? What does that suggest about your expected performance for the final week of paper trading?"

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 min
Standard checklist. Final full week before paper trading closes.

#### Block 4 — Next Week Preview & Close (9:20–9:30 PM) | 10 min

"Week 24 is the final week of the course. Monday: strategy synthesis and presentation preparation. Wednesday: full dress rehearsal. Friday: Milestone 4 capstone presentations.

Between now and Monday:
1. Complete all report sections (1–7)
2. Create presentation slides or notebook structure
3. Rehearse the presentation — time yourself at 20 minutes

The presentation is not a reading of the report. The presentation tells the story. The report is the evidence. Know the difference."

**Report deadlines:**
- All sections complete draft: Wednesday September 23 by 8:00 PM
- Final polished report: Friday September 25 by 12:00 PM

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

## WEEKLY DELIVERABLES SUMMARY

| Deliverable | Due | Format |
|-------------|-----|--------|
| Report Section 5 — AI Integration draft | Wednesday 11:59 PM | `capstone_report_sec5_[initials].md` |
| Report Section 6 — Limitations draft | Wednesday 11:59 PM | `capstone_report_sec6_[initials].md` |
| Report Section 7 — Forward Plan draft | Wednesday 11:59 PM | `capstone_report_sec7_[initials].md` |
| Report charts notebook (W23) | Wednesday 11:59 PM | `.ipynb` pushed to GitHub |
| Five capstone charts (PNG) | Wednesday 11:59 PM | `/charts` folder in GitHub repo |
| Report Section 4 — polished version | Friday 11:59 PM | Updated in GitHub |
| Trading journal — all Week 23 entries | Friday 11:59 PM | Updated `.csv` or `.md` |

---

## INSTRUCTOR NOTES FOR WEEK 23

**The AI contribution section is where intellectual dishonesty concentrates:** Most students will want to claim their AI components "added value" because they worked hard building them. The chart and the IC data will often tell a different story — marginal improvement, or neutral contribution, or even degradation due to overfitting. This is not a failure. It is an empirical finding. Push students hard: "What does the IC comparison from W19 say? What does the quartile chart say? Write that. If the AI added marginal value — that is the finding."

**Limitations that are specific earn the most credit:** A vague limitation ("paper trading is not like live trading") is worth nothing on the rubric. A precise limitation ("the NewsAPI free tier's 100 request/day limit meant I could not query sentiment during earnings announcement windows, which are exactly the high-movement periods where sentiment should be most predictive — this may have understated the sentiment component's value") is worth maximum points. The difference is quantification and causal reasoning. Push for both.

**The forward plan reveals strategic thinking quality:** Weak forward plans optimize existing parameters ("I would tune the RSI threshold"). Strong forward plans identify structural improvements with evidence basis ("The IC analysis shows the strategy underperforms in high-ADX environments. I would test a regime-conditional signal that activates momentum signals when ADX > 30 instead of mean-reversion signals"). The evidence basis is what separates the two.

**Chart 4 (AI contribution) works only with good journal data:** If students didn't log `ml_prob` and `signal_composite` in their journal, the AI contribution visualization can't run. This is a real consequence of documentation failures. Don't soften this — let them feel the cost of missing data. But give them a path forward: "You can't produce Chart 4 from missing data. Instead, write the text equivalent of what Chart 4 would have shown, based on your subjective recollection of signal scores. Note in the report that the data was not systematically logged."

**Friday is the last full critique session:** Use it. Every student who arrives with a partial draft will struggle with the Monday synthesis session. The peer critique on Friday is designed to surface the remaining gaps. Make the feedback specific and actionable — not "this section needs more detail" but "Section 6 needs a quantified estimate of the slippage cost on limit orders in low-volume names."

---

## WEEKLY RESOURCES

> Resources are labeled **[Pre-session]** (review before class) or **[Homework]** (explore after).

---

### Monday — Writing Hard Sections

- **[Reference | Pre-session]** Your W19 multi-signal comparison table — This is the primary evidence source for Section 5. Know your IC values by component (rules-only vs. ML vs. combined) before Monday. If you can't answer "did the ML improve the IC?" without looking — review W19 first.

- **[Article | Homework]** [How Professional Quants Write Research Reports](https://www.cqfinstitute.org/quantitative-research-report-guidelines/) — CQF Institute. The section on limitations and self-assessment maps directly to Sections 6 and 7. The professional standard for intellectual honesty in quantitative research is higher than most students expect.

---

### Wednesday — Report Charts

- **[Reference | Pre-session]** Your W17 feature importance chart — What drove your XGBoost model's predictions? The feature importance output is the evidence for Section 5's ML discussion. If feature importance is not saved, regenerate it from the W17 notebook before Wednesday.

- **[Article | Reference]** [Data Visualization Best Practices for Finance](https://blog.datawrapper.de/how-to-visualize-financial-data/) — Datawrapper Blog. The chart formatting principles apply directly to the five capstone charts. Every axis must be labeled. Every chart must have a title. Use the COLORS palette defined in tonight's notebook for consistency across all five figures.

---

### Friday — Draft Review

- **[Book | Pre-session]** [Writing Well — William Zinsser](https://www.amazon.com/Writing-Well-Classic-Guide-Nonfiction/dp/0060891548) — Chapter 4 (Clutter). Read the chapter. Then re-read Sections 5–7 of your report draft and cut everything that is not a finding, an evidence citation, or a specific claim. What remains is what belongs.

---

*FINN Week 23 — Analysis, Writing & Honest Assessment | Part of FINN_Month06.md*
