# FINN — Week 20: Capstone Strategy Design & Month 5 Close
## Optimization + Capstone Design | Month 5: Optimization, Deep AI & Capstone Strategy Design
**Dates:** August 24–29, 2026
**Week Number:** 20 of 24

---

## WEEK OVERVIEW

### Theme
Everything we've built points to this. Design the strategy you'll run in Month 6. This week translates five months of technical skill-building into a single, locked strategy specification. Monday stress-tests every capstone hypothesis in a round-table design review. Wednesday formalizes the specification document with IC validation. Friday presentations lock the hypothesis — no changes after Friday.

### Learning Objectives
By the end of this week, students will be able to:
- State a specific, testable, falsifiable one-sentence strategy hypothesis
- Identify and address the most common capstone design failure modes: too many free parameters, universe too broad, insufficient training data, undefined exit logic
- Produce a complete seven-section capstone specification document with IC evidence for each feature
- Validate the feature set against IC benchmarks using the training data period
- Present a 5-minute capstone hypothesis lock presentation to the class
- Describe the Month 6 paper trading plan in operational terms

### Materials Needed
- `finnenv` environment — `yfinance`, `pandas_ta`, `scipy`, `xgboost`, `pandas`
- Capstone hypothesis draft (all seven sections — written before Monday)
- W19 multi-signal comparison results
- W17 XGBoost model and feature set
- Starter notebook: `W20_workshop_capstone_spec_starter.ipynb`

### Pre-Week Checklist (Instructor)
- [ ] Push `W20_workshop_capstone_spec_starter.ipynb` to GitHub
- [ ] Share Milestone 4 presentation format with students before Monday
- [ ] Prepare the capstone design round-table structure for Monday Block 2
- [ ] Schedule Friday presentations with 5 min per student + 1 question
- [ ] Confirm all seven specification sections are distributed before Monday DMB
- [ ] Assign DMB rotation for Monday, Wednesday, Friday

---

## MONDAY — August 24, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** Month 5 Week 4. Full summary. Final trading week of Month 5.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Open your capstone strategy draft. Find the single weakest point in your design — the assumption you are least confident about. Write it down precisely. We'll address it tonight."

---

### EVENING: Theory Session (8:00–9:30 PM EST)
**Topic:** Capstone Strategy Architecture — Design Principles + Common Failure Modes
**Curriculum Source:** All prior content, synthesized

#### Pre-Session Setup
- [ ] Capstone strategy draft written — all 7 sections at least sketched
- [ ] W19 multi-signal comparison results reviewed
- [ ] Weakest assumption identified and written (from DMB observation)

#### Block 1 — Day Review & Draft Review (8:00–8:15 PM) | 15 min

"Who has a draft capstone? Let's hear the one-sentence hypothesis from each person. Just the hypothesis. Not the full plan. One sentence.

If you can't state it in one sentence — the strategy is not well-defined enough yet. We fix that tonight. But you can only fix a hypothesis that exists. If you don't have a draft — we start from scratch tonight, which means you'll need to work this week to catch up before Wednesday."

Go around the room. One sentence per student. Instructor notes: Is it specific? Is it testable? Does it name an asset class, a market inefficiency, and an approach?

#### Block 2 — Capstone Design Session (8:15–8:55 PM) | 40 min

Tonight is not a lecture — it is a structured design review. Instructor facilitates. Students present and critique each other.

**Round 1 — Hypothesis stress test (20 min):**

Each student reads their one-sentence hypothesis. Class asks: "What would falsify this? What market condition would break it? Is this testable with the tools we have?"

Instructor ensures every hypothesis is specific, testable, and falsifiable. Push back on:
- "I want to test a momentum strategy" — too vague. Which momentum? Which timeframe? Why does it persist?
- "I believe sentiment signals predict price moves" — too broad. Which sentiment? Which lag? Which asset class?
- "My RSI strategy will outperform SPY" — this is an expectation, not a hypothesis. What specific mechanism explains the edge?

Acceptable hypothesis example: "I hypothesize that RSI mean-reversion signals in S&P 500 large-cap technology stocks have meaningfully higher IC when confirmed by same-day positive FinBERT sentiment, because high-attention stocks price in technical oversold conditions faster when news sentiment is supportive."

**Round 2 — Architecture review (20 min):**

Each student states:
1. Which signal architecture they're using (gate / scoring / regime-conditional)
2. Which features they'll include in the ML model
3. What the sentiment integration looks like
4. The risk framework in two sentences

Class gives one challenge per student. Instructor flags common failure modes:

**Common failure modes to address tonight:**
- "Too many free parameters" — scoring weights + RSI threshold + ADX threshold + sentiment threshold = 4 optimization targets. Warn: optimize only on training data, lock everything before Month 6.
- "Universe too broad" — 'all S&P 500 stocks' requires data and compute infrastructure. Narrow to 20–30 tickers for Month 6 paper.
- "Backtest period too short" — less than 2 years of training data is insufficient for XGBoost. Flag and require minimum 3 years.
- "Exit logic not defined" — entry is clear but exit is vague. 'When the position looks bad' is not an exit rule. RSI exit threshold, max hold days, and ATR stop must all be specified.

#### Block 3 — Specification Requirements Walk-Through (8:55–9:15 PM) | 20 min

Walk through the Milestone 4 capstone deliverable format:

"The capstone specification document due Wednesday must contain:

**Section 1 — Strategy Identity:**
Name, version number, one-sentence hypothesis, edge statement (what market inefficiency are you exploiting and why does it persist?)

**Section 2 — Universe and Data:**
Target tickers (list them), data period, data sources, any alternative data (sentiment, macro, etc.)

**Section 3 — Feature Engineering:**
Complete list of features to be included in the ML model. Feature selection rationale — IC evidence for each. Any features removed from W06 matrix and why.

**Section 4 — Signal Architecture:**
Which architecture (gate/scoring/regime-conditional). Weights or thresholds for each signal component. How parameters were determined (IC-based, equal-weight, or backtested on specific training data period — state which).

**Section 5 — Risk Framework:**
Position sizing model and parameters. Stop loss logic. Maximum concurrent positions. Portfolio beta target. Drawdown circuit breakers.

**Section 6 — Month 6 Paper Trading Plan:**
Minimum trades per week. How signals will be monitored (automated pipeline). Journal entry requirements. Weekly review process.

**Section 7 — Success Metrics:**
Target Sharpe (minimum acceptable for Month 6). Target win rate. Target alpha vs. SPY. Criteria for concluding the strategy works or doesn't."

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 min

**Wednesday workshop:**
"Final capstone specification document workshop. Starter: `W20_workshop_capstone_spec_starter.ipynb`. This notebook generates a structured capstone document, runs a final IC validation on your chosen features, and produces the signal report configuration that will run in Month 6 Week 1.

Come with all 7 sections drafted in any format. Wednesday we formalize and validate."

**Closing reflection:**
*"After tonight's round-table, the change I need to make to my capstone design before Wednesday is ___."*

---

## WEDNESDAY — August 26, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** Penultimate session of Month 5.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
"Before tonight's workshop, finalize your capstone tickers and features. You need a list of 3–20 tickers and a list of features from the W06 matrix that you intend to use. The IC validation notebook runs on these — bring them ready to paste in."

---

### EVENING: Workshop Session (8:00–9:30 PM EST)
**Workshop:** W20 — Capstone Specification Document + Final Feature Validation
**Notebook:** `W20_workshop_capstone_spec_[initials].ipynb`
**Curriculum Source:** All Month 5 content

#### Block 1 — Framing (8:00–8:10 PM) | 10 min

"Tonight we do three things:
1. Generate the formal capstone specification document
2. Run a final IC validation on the chosen feature set
3. Produce the Month 6 signal pipeline configuration

At the end of tonight, every student will have a complete, locked specification document. Friday you present it. After Friday, no changes. Month 6 trades the capstone strategy as designed — not as revised."

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 min

```python
import pandas as pd
import numpy as np
import yfinance as yf
import pandas_ta as ta
from scipy.stats import spearmanr
from datetime import datetime
import json
import warnings
warnings.filterwarnings('ignore')
```

**Step 1 — Capstone configuration object (10 min)**
```python
# ── CAPSTONE STRATEGY CONFIGURATION ───────────────────────────
# Students fill this with their finalized strategy parameters.
# This object drives ALL Month 6 trading.
# Every field must be filled before Friday's lock.

CAPSTONE_CONFIG = {

    # Strategy Identity
    'strategy_name':        'Your Strategy Name Here',
    'version':              '1.0',
    'hypothesis':           'Your one-sentence hypothesis here',
    'edge_statement':       'The edge exists because ...',

    # Universe
    'tickers':              ['SPY', 'QQQ', 'AAPL'],  # Replace with your list (3–20 tickers)
    'benchmark':            'SPY',
    'universe_rationale':   'Chosen because ...',

    # Feature Engineering
    'features_to_use': [
        'RSI_14', 'MACD_Hist', 'Close_EMA20', 'BB_Pct',
        'ATR_Norm', 'Vol_Ratio', 'ADX', 'Ret_5d', 'Ret_20d'
    ],
    'label_days':           5,       # Forward return period
    'label_threshold':      0.005,   # > 0.5% = positive label

    # Signal Architecture
    'architecture':         'SCORING',   # 'GATE', 'SCORING', or 'REGIME'
    'w_technical':          0.35,
    'w_ml':                 0.45,
    'w_sentiment':          0.20,
    'entry_threshold':      0.60,        # Composite score to enter

    # Rules-based component
    'rsi_entry':            32,
    'ema_distance_pct':     0.02,
    'vol_ratio_max':        2.5,
    'adx_min':              20,

    # Sentiment
    'sentiment_veto':       -0.40,
    'news_quality_min':     'low',

    # Risk Framework
    'risk_pct_per_trade':   0.02,       # 2% of portfolio per trade
    'atr_stop_multiplier':  1.5,
    'max_positions':        4,
    'cash_reserve_pct':     0.25,
    'daily_drawdown_stop':  0.05,
    'total_drawdown_reduce':0.10,
    'portfolio_beta_max':   0.80,

    # Month 6 Paper Trading Plan
    'target_trades_per_week': 2,
    'min_trades_per_week':    1,
    'signal_check_time':      '08:00 EST',
    'journal_required':       True,
    'weekly_review_day':      'Friday',

    # Success Metrics
    'target_sharpe_min':    0.80,
    'target_win_rate_min':  0.50,
    'target_alpha_pct':     0.02,
    'evaluation_after_n_trades': 30,
}

print("Capstone configuration loaded.")
print(f"Strategy: {CAPSTONE_CONFIG['strategy_name']}")
print(f"Tickers:  {CAPSTONE_CONFIG['tickers']}")
print(f"Features: {len(CAPSTONE_CONFIG['features_to_use'])} features")
```

**Step 2 — Final IC validation on chosen features (15 min)**
```python
def validate_capstone_features(config, training_end='2025-12-31'):
    """
    Run IC validation on all features in the capstone config.
    Uses training data only — never the Month 6 live period.
    """
    tickers  = config['tickers']
    features = config['features_to_use']
    fwd_days = config['label_days']

    print(f"\nFeature IC Validation (training period through {training_end})")
    print("="*65)

    all_ic_results = []

    for ticker in tickers:
        df = yf.download(ticker, end=training_end, period='4y',
                          interval='1d', progress=False)
        df.columns = [c[0] if isinstance(c, tuple) else c for c in df.columns]

        # Compute features
        df['RSI_14']     = ta.rsi(df['Close'], length=14)
        df['RSI_7']      = ta.rsi(df['Close'], length=7)
        macd             = ta.macd(df['Close'])
        df['MACD_Hist']  = macd['MACDh_12_26_9']
        df['EMA_20']     = ta.ema(df['Close'], length=20)
        df['Close_EMA20']= (df['Close'] - df['EMA_20']) / df['EMA_20']
        df['ATR_14']     = ta.atr(df['High'], df['Low'], df['Close'], length=14)
        df['ATR_Norm']   = df['ATR_14'] / df['Close']
        bb               = ta.bbands(df['Close'], length=20, std=2)
        df['BB_Pct']     = bb['BBP_20_2.0']
        df['Vol_Ratio']  = df['Volume'] / df['Volume'].rolling(20).mean()
        adx              = ta.adx(df['High'], df['Low'], df['Close'], length=14)
        df['ADX']        = adx['ADX_14']
        df['Ret_5d']     = df['Close'].pct_change(5)
        df['Ret_20d']    = df['Close'].pct_change(20)

        # Forward return
        df['Fwd_Return'] = df['Close'].pct_change(fwd_days).shift(-fwd_days)
        df.dropna(inplace=True)

        for feat in features:
            if feat in df.columns:
                sign   = -1 if feat in ['RSI_14', 'RSI_7', 'Stoch_K'] else 1
                ic, pv = spearmanr(sign * df[feat], df['Fwd_Return'])
                all_ic_results.append({
                    'ticker': ticker, 'feature': feat,
                    'ic': ic, 'pval': pv,
                    'significant': pv < 0.05
                })

    ic_df = pd.DataFrame(all_ic_results)

    feat_summary = ic_df.groupby('feature').agg(
        mean_ic=('ic', 'mean'),
        std_ic=('ic', 'std'),
        n_significant=('significant', 'sum'),
        n_tickers=('ticker', 'count')
    ).round(4).sort_values('mean_ic', ascending=False)

    print(f"\n{'Feature':<20} {'Mean IC':>10} {'Std':>8} {'Sig/Total':>12}")
    print("─"*55)
    for feat, row in feat_summary.iterrows():
        flag = " Strong" if row['mean_ic'] > 0.04 else \
               " Marginal" if row['mean_ic'] > 0.02 else " Weak — consider removing"
        print(f"{feat:<20} {row['mean_ic']:>10.4f} {row['std_ic']:>8.4f} "
              f"{int(row['n_significant'])}/{int(row['n_tickers']):>8}{flag}")

    weak_features = feat_summary[feat_summary['mean_ic'] < 0.02].index.tolist()
    if weak_features:
        print(f"\nWeak features (mean IC < 0.02): {weak_features}")
        print("  Consider removing from capstone feature set.")

    return feat_summary

ic_summary = validate_capstone_features(CAPSTONE_CONFIG)
```

**Step 3 — Generate and save capstone specification document (15 min)**
```python
def generate_capstone_document(config, ic_summary, student_name, save=True):
    """Generate complete capstone strategy specification as markdown."""

    doc = f"""# Capstone Strategy Specification
## {config['strategy_name']} — Version {config['version']}
**Student:** {student_name}
**Created:** {datetime.now().strftime('%Y-%m-%d')}
**Status:** LOCKED for Month 6 execution

---

## Section 1 — Strategy Identity

**Name:** {config['strategy_name']}
**Hypothesis:** {config['hypothesis']}
**Edge Statement:** {config['edge_statement']}
**Architecture:** {config['architecture']}

---

## Section 2 — Universe and Data

**Tickers:** {', '.join(config['tickers'])}
**Benchmark:** {config['benchmark']}
**Rationale:** {config['universe_rationale']}
**Data Source:** yfinance (daily OHLCV) + NewsAPI (sentiment)
**Training Period:** 2021–2025 | **Live Period:** Month 6 (Sept–Oct 2026)

---

## Section 3 — Feature Engineering

**Features Used ({len(config['features_to_use'])}):**

| Feature | Mean IC (training) | Status |
|---------|-------------------|--------|
"""

    for feat in config['features_to_use']:
        if feat in ic_summary.index:
            ic_val = ic_summary.loc[feat, 'mean_ic']
            status = "Strong" if ic_val > 0.04 else "Marginal" if ic_val > 0.02 else "Weak"
            doc   += f"| {feat} | {ic_val:.4f} | {status} |\n"
        else:
            doc   += f"| {feat} | N/A | Not validated |\n"

    doc += f"""
**Label:** Forward {config['label_days']}-day return > {config['label_threshold']:.1%}

---

## Section 4 — Signal Architecture

**Type:** {config['architecture']}
**Weights:** Technical={config['w_technical']:.2f} | ML={config['w_ml']:.2f} | Sentiment={config['w_sentiment']:.2f}
**Entry Threshold:** Composite score > {config['entry_threshold']}
**Sentiment Veto:** Block entry if sentiment < {config['sentiment_veto']}

**Technical Conditions:**
- RSI_14 < {config['rsi_entry']}
- Close within {config['ema_distance_pct']:.0%} of EMA_20
- Volume ratio < {config['vol_ratio_max']}x
- ADX > {config['adx_min']}

**Weight Rationale:**
[WRITE: Why these weights? Are they IC-based, equal-weight, or optimized?
State which period of data was used to set them and why.]

---

## Section 5 — Risk Framework

| Parameter | Value |
|-----------|-------|
| Risk per trade | {config['risk_pct_per_trade']:.0%} of portfolio |
| Stop loss | ATR x {config['atr_stop_multiplier']} |
| Max concurrent positions | {config['max_positions']} |
| Cash reserve | {config['cash_reserve_pct']:.0%} minimum |
| Daily drawdown halt | {config['daily_drawdown_stop']:.0%} |
| Total drawdown reduce | {config['total_drawdown_reduce']:.0%} — halve sizes |
| Portfolio beta max | {config['portfolio_beta_max']} |

---

## Section 6 — Month 6 Paper Trading Plan

- **Signal check time:** {config['signal_check_time']} daily (automated pipeline)
- **Minimum trades/week:** {config['min_trades_per_week']}
- **Target trades/week:** {config['target_trades_per_week']}
- **Journal:** Required for every trade — all fields before execution
- **Weekly review:** Every {config['weekly_review_day']}

---

## Section 7 — Success Metrics

| Metric | Minimum Acceptable | Target |
|--------|-------------------|--------|
| Sharpe Ratio | {config['target_sharpe_min']} | 1.2+ |
| Win Rate | {config['target_win_rate_min']:.0%} | 55%+ |
| Alpha vs SPY | {config['target_alpha_pct']:.0%} | 5%+ |
| Evaluation threshold | {config['evaluation_after_n_trades']} trades | — |

---

*FINN Capstone Strategy — Locked {datetime.now().strftime('%Y-%m-%d')}*
*No parameter changes after lock date. All changes require new version number.*
"""

    if save:
        filename = f"capstone_spec_{student_name.replace(' ','_')}.md"
        with open(filename, 'w') as f:
            f.write(doc)
        print(f"\nCapstone specification saved: {filename}")

    return doc

doc = generate_capstone_document(
    CAPSTONE_CONFIG, ic_summary,
    student_name="[YOUR NAME]"
)
```

#### Block 3 — Independent Work (8:50–9:10 PM) | 20 min

Students complete their own capstone config object and run feature IC validation. Instructor circulates with 1:1 review. Key coaching questions:
- "Any weak features flagged? Will you remove them or justify keeping them?"
- "Are your weights based on IC or arbitrary? Document your reasoning."
- "Is your exit logic fully specified in the config? Can I read the config and know exactly when you would exit a position?"
- "Can you run the Month 6 pipeline from this config alone, without needing to make any judgment calls?"

#### Block 4 — Pre-Lock Review & Submission (9:10–9:30 PM) | 20 min

**Capstone spec review (15 min):**
2 students walk through their specification document verbally — one section at a time. Class checks: is every section complete? Is the hypothesis falsifiable? Is the risk framework operational? Is the exit logic specified?

After each review: class gives one improvement suggestion. Student commits to the change before Friday.

**Muddiest Point (5 min):**
> *"The weakest point in my capstone design as of tonight is ___."*

**Submissions:**
- `W20_workshop_capstone_spec_[initials].ipynb` → GitHub
- `capstone_spec_[initials].md` → GitHub (due before Friday DMB)

---

## FRIDAY — August 28, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation
**Note:** Keep efficient. Capstone presentations tonight.

**Portfolio Pulse:** Final Month 5 account snapshot. State total return for Month 5, cumulative return for the course, and any open positions.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
"Before tonight, review your capstone specification document one final time. Know your hypothesis, your architecture, your feature count, your IC evidence, and your success metrics without looking. You have a 5-minute presentation tonight. Practice it once before you arrive."

---

### EVENING: Capstone Hypothesis Lock + Month 5 Close (8:00–9:30 PM EST)
**Format:** Capstone presentations (5 min each) + Month 5 close

#### Capstone Hypothesis Lock Presentations (8:00–8:50 PM)

Each student has 5 minutes (strict) to present their capstone:
1. Strategy name and one-sentence hypothesis (30 sec)
2. Architecture and key signals — which three components, which architecture type (1 min)
3. Feature set and IC evidence — top 3 features and their IC (1 min)
4. Risk framework summary — sizing rule, stop logic, max positions (30 sec)
5. Month 6 plan and success metrics — trades/week, Sharpe target (1 min)

After each presentation: instructor and class ask ONE question. No more. This is not the full Milestone 4 — it is hypothesis lock.

Instructor confirms or requests revision before locking:
- Hypothesis must be specific and falsifiable
- Architecture must be implementable with our tools
- Risk framework must follow all 6 rules from Month 3
- Success metrics must be measurable and defined

Once confirmed: **hypothesis is LOCKED. No changes without a new version number.**

---

#### Month 5 Close (8:50–9:30 PM)

**Month 5 retrospective (20 min):**

"XGBoost. Live sentiment. Multi-signal architecture. Capstone design. That's 4 weeks of work at a professional level.

What was the single hardest technical concept from Month 5?
What surprised you most about combining signals — did the combination help, and if not, why not?
What do you wish you had understood earlier in the course that would have changed how you designed your capstone?"

One answer per student. Instructor takes notes — these inform what to reinforce in Month 6's early sessions.

**Month 6 preview (10 min):**

"Month 6 is the capstone in motion. You trade your capstone strategy every week. You build the final written report simultaneously. At the end of Month 6: the Milestone 4 capstone presentation.

Everything from the last 5 months has been preparation for that. The strategy is locked. The tools are built. The only variable is you — whether you follow the rules, maintain the journal, and analyze honestly.

Month 6 standards are the highest of the course:
- No undocumented trades
- No parameter changes without a new version and a backtest
- Weekly analytics report due every Friday before the session
- Capstone report draft sections due on schedule — not the night before

**Pre-reading for Month 6, Week 1:**
- Re-read capstone specification document — know every parameter
- Re-read Wiki Section 8 (paper trading) and Section 9 (risk management)
- Review Week 13 signal monitor — we extend it in Week 21 into the Capstone Pipeline v2.0"

**Monthly One-Liner:**
> *"Month 5 taught me ___, and Month 6 I want to ___."*

---

## WEEKLY DELIVERABLES SUMMARY

| Deliverable | Due | Format |
|-------------|-----|--------|
| Capstone specification notebook (W20) | Wednesday 11:59 PM | `.ipynb` pushed to GitHub |
| Feature IC validation table | Wednesday 11:59 PM | In notebook output |
| Capstone specification document | Friday before DMB | `capstone_spec_[initials].md` in GitHub |
| Capstone lock confirmed | Friday presentation | Verbal confirmation in session |
| Trading journal — all Month 5 trades | Friday 11:59 PM | Updated `.csv` or `.md` in GitHub |

---

## INSTRUCTOR NOTES FOR WEEK 20

**The hypothesis lock is a real commitment:** Make it clear before Friday that "locked" means locked. A student who decides after Friday's presentation that they want to change their entry RSI from 32 to 28 must create Version 1.1, document it, and justify it with evidence. The lock disciplines Month 6 execution. Without it, students will constantly tinker and never get clean evaluation data.

**Weak features in the IC validation create a useful decision:** When a feature like `Stoch_K` shows mean IC of 0.01, students face a real choice: remove it for a cleaner model, or keep it and justify why. There is no single right answer — the point is that the decision is made consciously and documented. Students who remove weak features without discussing why are pattern-matching without thinking. Push for reasoning.

**Common round-table failure mode — defensive hypothesis:** Some students will respond to class challenges with "well it depends on the market conditions." That response reveals that the hypothesis is not falsifiable. A falsifiable hypothesis specifies what market conditions it applies to. If the strategy only works in trending markets — say "in trending markets (ADX > 25), RSI oversold signals have higher IC." That is specific.

**The 5-minute presentation is a preparation exercise for Milestone 4:** Students who struggle to present their capstone in 5 minutes will struggle even more in the 20-minute Milestone 4 format. The main issue is usually talking about the strategy description instead of the hypothesis and evidence. Note this for each student and give it as coaching before Milestone 4.

**IC evidence for weights:** Push students to base their Architecture 2 weights on IC ratios. If Technical IC = 0.04, ML IC = 0.07, Sentiment IC = 0.03 — IC-proportional weights would be approximately 0.29/0.50/0.21. This is more defensible than "I guessed 0.35/0.45/0.20." Equal weights are also defensible. Optimization on training data is acceptable if clearly documented. But weights with no stated basis are a flag.

---

## WEEKLY RESOURCES

> Resources are labeled **[Pre-session]** (review before class) or **[Homework]** (explore after). Week 20 is synthesis and design — reading supports the specification writing process.

---

### Monday — Capstone Design Principles

- **[Article | Pre-session]** [How to Design a Quantitative Trading Strategy](https://blog.quantinsti.com/quantitative-trading-strategy/) — QuantInsti. Read the "strategy design framework" section before Monday's round-table. The seven-section capstone spec maps directly to this professional framework.

- **[Article | Homework]** [Strategy Failure Modes in Systematic Trading](https://www.pyquantnews.com/free-python-resources/guide-to-quantitative-trading-strategies-and-backtesting) — PyQuant News. Read the failure modes section after Monday. The four failure modes flagged in tonight's session (too many parameters, universe too broad, insufficient data, undefined exit) are the most common reasons live strategies underperform their backtests.

---

### Wednesday — Specification Build

- **[Reference | Pre-session]** Your W19 multi-signal comparison table — Know your IC values for each signal component before Wednesday. The feature IC validation in tonight's workshop builds directly on those results. Come with numbers, not impressions.

- **[Article | Reference]** [Feature Engineering for Financial Machine Learning](https://ml4trading.io/chapters/04-alpha-factor-research/) — ML for Trading textbook companion. The feature selection rationale section applies directly to Section 3 of the capstone specification. Use it to justify your feature choices beyond "I included it in W06."

---

### Friday — Capstone Lock + Month 5 Close

- **[Book | Homework]** [Advances in Financial Machine Learning — Lopez de Prado](https://www.wiley.com/en-us/Advances+in+Financial+Machine+Learning-p-9781119482086) — The professional reference for everything we covered in Month 5. Chapters 3 (labeling) and 5 (features) are directly relevant to the capstone feature engineering choices. The book is dense — read the introductions to each chapter and the conclusions. The methodology we built is a simplified version of what Lopez de Prado formalizes here.

---

*FINN Week 20 — Capstone Strategy Design & Month 5 Close | Part of FINN_Month05.md*
