# FINN — Week 19: Multi-Signal Architecture
## Optimization + Capstone Design | Month 5: Optimization, Deep AI & Capstone Strategy Design
**Dates:** August 17–22, 2026
**Week Number:** 19 of 24

---

## WEEK OVERVIEW

### Theme
No single signal is robust enough to trade alone. The edge lives in how signals combine. This week wires together the three components built over the past two weeks — the XGBoost ML model, the live FinBERT sentiment pipeline, and the rules-based technical signal — into a unified decision framework. Students implement the scoring architecture, run a backtest comparing the combined signal to each individual signal, and evaluate whether combination produces genuine IC improvement. The output of this week is the engine of the capstone strategy.

### Learning Objectives
By the end of this week, students will be able to:
- Describe and implement three signal combination architectures: hard gate, scoring system, and regime-conditional
- Compute a composite signal score from three independent signal components with defined weights
- Backtest a multi-signal strategy using a vectorized approach and compare it to individual signals by IC
- Explain why signal combination works only when the component signals are partially independent (low pairwise correlation)
- Identify when combination hurts performance and diagnose the reason
- Write a one-paragraph capstone strategy architecture description using the three-component framework
- Describe the multi-agent AI concept and map each pipeline component to an agent role

### Materials Needed
- `finnenv` environment — `xgboost`, `pandas_ta`, `scipy`, `matplotlib`, `yfinance`
- W17 XGBoost model (`xgb_model.pkl`) — loaded at session start
- W18 sentiment pipeline functions (saved as `sentiment_pipeline.py` or importable from notebook)
- W13 signal monitor configuration — watchlist and strategy params
- Starter notebook: `W19_workshop_multisignal_starter.ipynb`

### Pre-Week Checklist (Instructor)
- [ ] Push `W19_workshop_multisignal_starter.ipynb` to GitHub
- [ ] Confirm all students have `xgb_model.pkl` in their repo
- [ ] Confirm sentiment pipeline functions are importable
- [ ] Assign DMB rotation for Monday, Wednesday, Friday
- [ ] Brief capstone design preview for Friday Block 4 — Week 20 specifications shared tonight

---

## MONDAY — August 17, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** Standard. Add: note which signals (rules, ML, sentiment) have been most active this week in your pipeline. Have all three been firing?

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "During market hours, identify one trade where your rules signal said yes, your ML model said yes, and sentiment said yes. And one trade where they disagreed. Bring both examples to class tonight — note the specific values for each signal component."

---

### EVENING: Theory Session (8:00–9:30 PM EST)
**Topic:** Multi-Signal Strategy Architecture — Combining Signals Rigorously
**Curriculum Source:** Wiki Sections 6.3, 6.4

#### Pre-Session Setup
- [ ] W17 XGBoost and W18 sentiment notebooks reviewed
- [ ] Both pipelines running and producing output
- [ ] Signal agreement/disagreement examples from DMB ready

#### Block 1 — Day Review (8:00–8:15 PM) | 15 min

"Who found a day where all three signals agreed? Who found a day where they disagreed? Walk me through both examples. When signals disagree — what do you do? That is tonight's question."

Probe: "Did you take the trade when signals disagreed? What was your reasoning? Was it rule-based or intuitive?"

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 min

**Topic A: Why Signal Combination Works (10 min)**

"Each signal captures a different aspect of market behavior:
- Technical rules: price and volume patterns
- ML model: non-linear feature combinations
- Sentiment: news-driven information flow

These are partially independent. They are not perfectly correlated. When independent signals agree, the probability of a true positive increases significantly — this is the core logic of ensemble methods.

In machine learning this is called ensemble stacking. In quant trading it is called multi-factor alpha. The intuition is the same: combining signals that are each moderately predictive and somewhat independent produces a result stronger than any one alone.

The key word is 'somewhat independent.' If your three signals are all just variations of the same RSI calculation, they are highly correlated and combination adds nothing. The benefit requires genuine independence. We test this Wednesday."

**Topic B: Three Combination Architectures (25 min)**

Walk through three concrete architectures with code pseudocode:

**Architecture 1 — Hard Gate (Most Conservative)**
```
All conditions must be true to enter:
  tech_signal AND (ml_prob > 0.55) AND (sentiment > 0.0) → BUY

Outcome: Fewer signals, higher precision, lower recall.
Use when: capital preservation is the primary goal.
Risk: misses good trades where one signal lags the others.
Typical IC impact: high precision but low signal count.
```

**Architecture 2 — Scoring System (Balanced)**
```
Each signal contributes points. Enter above a threshold score.

  Signal Score = w1×tech_score + w2×ml_prob + w3×sentiment_norm
  where w1 + w2 + w3 = 1.0

  tech_score:     0 (no signal) or 1 (signal fires)
  ml_prob:        raw probability [0, 1]
  sentiment_norm: (sentiment + 1) / 2, normalized to [0, 1]

  Default weights: w1=0.35, w2=0.45, w3=0.20
  Enter if Signal_Score > 0.60

Outcome: Smooth signal, naturally handles partial agreement.
Risk: weight optimization on historical data → potential overfitting.
```

**Architecture 3 — Regime-Conditional (Most Sophisticated)**
```
Use different signals in different market regimes:

  If regime == 'TRENDING':
    Primary signal: ML model (trend features dominate)
    Filter: ADX > 25
    Sentiment: veto only for extreme negatives

  If regime == 'RANGING':
    Primary signal: RSI rule (mean reversion dominates)
    Filter: BB_Pct < 0.2
    Sentiment: full integration

  If regime == 'HIGH_VOL':
    No new entries. Risk reduction mode only.

Outcome: Adapts to market conditions.
Risk: regime misclassification creates abrupt strategy changes.
```

"We implement Architecture 2 (scoring system) Wednesday because it is the most flexible and most directly applicable to the capstone design. Architecture 3 is the Month 6 extension for students who want to go further."

> **Resource:** Multi-signal scoring framework (weighted composite — IC by component, veto logic, signal independence requirement) — `resources/infographics/ig_multi_signal.html`

**Topic C: The Multi-Agent AI Concept (10 min)**

Walk through Wiki Section 6.4 multi-agent framework.

"In a full production system, each of our signals becomes an agent:
- **Market Data Agent**: fetches and processes OHLCV, computes features
- **Technical Agent**: evaluates rules-based entry conditions
- **ML Agent**: runs XGBoost inference, outputs probability
- **Sentiment Agent**: fetches news, runs FinBERT, outputs sentiment score
- **Risk Agent**: checks position sizing, portfolio limits, pre-trade clearance
- **Supervisor Agent**: receives all agent outputs, makes final decision

Each agent is a Python function or class. The supervisor calls them in sequence and applies the combination architecture to make a final buy/no-buy decision.

The LangGraph multi-agent concept from the wiki is the production version of exactly this pattern. What we build Wednesday is a simplified but functionally equivalent implementation."

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 min

1. *"You backtest Architecture 1 (hard gate) and Architecture 2 (scoring). Architecture 2 has higher Sharpe (1.4 vs. 1.1) but 3× more trades. Which do you deploy and why? What additional information do you need?"*
   *(Expected: need OOS confirmation that the Sharpe difference holds. Also: max drawdown comparison, execution capacity for 3× more trades, and whether the Sharpe improvement persists across multiple OOS windows.)*

2. *"The weight optimization in Architecture 2 has 3 parameters (w1, w2, w3). That's a small optimization problem. Is overfitting a real concern here? How would you set the weights without optimizing on the trading data?"*
   *(Expected: Yes, overfitting concern even with 3 params is real. Options: use equal weights as default, use domain knowledge (IC of each signal as the weight), or optimize on training data and evaluate on OOS data that was never seen.)*

3. *"Devil's advocate: Adding more signals adds complexity. More complexity = more failure modes. A simple 1-signal strategy that works is better than a complex 3-signal strategy that's fragile. Defend or refute this."*
   *(Expected: valid concern. Occam's razor applies. The combination is only justified if it provides meaningful IC improvement over the best single signal, on out-of-sample data. Complexity must earn its keep.)*

4. *"Your three signals have pairwise correlations of 0.85, 0.79, and 0.82. Does combining them help? Why or why not?"*
   *(Expected: No — highly correlated signals don't add information. The combination benefit requires LOW pairwise correlation. Check signal correlation before assuming combination helps.)*

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 min

**Wednesday workshop:**
"We implement Architecture 2 (scoring system) as a complete multi-signal strategy. Then we backtest it against each individual signal. IC comparison, mean forward return comparison, signal frequency comparison. Starter: `W19_workshop_multisignal_starter.ipynb`

Bring: your W17 XGBoost model object (as `xgb_model.pkl`), your W18 sentiment pipeline, and your W13 signal monitor config. We use all three directly."

**Closing reflection:**
*"The architecture I most want to test Wednesday is ___ because ___."*

---

## WEDNESDAY — August 19, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** Standard. Note any multi-signal confirmations this week.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
"Before tonight's workshop, load your XGBoost model and verify it produces predictions. Run: `import pickle; model = pickle.load(open('xgb_model.pkl','rb')); print(model)`. Bring the output. Students who cannot load their model will need to retrain during tonight's Block 3."

---

### EVENING: Workshop Session (8:00–9:30 PM EST)
**Workshop:** W19 — Multi-Signal Strategy Implementation + Backtest
**Notebook:** `W19_workshop_multisignal_[initials].ipynb`
**Curriculum Source:** Wiki Sections 6.3, 6.4

#### Block 1 — Framing & Context Bridge (8:00–8:10 PM) | 10 min

"Three weeks ago we trained XGBoost. Two weeks ago we connected live sentiment. Tonight we wire them together into a single decision framework.

One input goes in: today's market state.
One output comes out: enter, don't enter, score.

After building it, we evaluate whether combining signals improves on the best individual signal. If it does — we have the engine for the capstone strategy. If it doesn't — we learn why and adjust."

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 min

```python
import pickle
import pandas as pd
import numpy as np
import yfinance as yf
import pandas_ta as ta
import xgboost as xgb
from scipy.stats import spearmanr
import matplotlib.pyplot as plt
import warnings
warnings.filterwarnings('ignore')

# Load previously trained XGBoost model
try:
    with open('xgb_model.pkl', 'rb') as f:
        xgb_model = pickle.load(f)
    print("XGBoost model loaded.")
except FileNotFoundError:
    print("Model not found — retrain using W17 code before continuing.")
    xgb_model = None
```

**Step 1 — Signal scoring architecture (15 min)**
```python
def compute_signal_score(features_row, xgb_model,
                          sentiment_score, strategy_params):
    """
    Compute composite signal score from three independent signals.

    Returns:
        score:       float [0, 1] — higher = stronger buy signal
        components:  dict of individual signal contributions
        decision:    'BUY', 'WATCH', or 'PASS'
    """
    # ── SIGNAL 1: Technical Rules ─────────────────────────
    rsi_ok     = features_row.get('RSI_14', 100) < strategy_params['rsi_entry']
    ema_ok     = features_row.get('Close_EMA20', 0) > -strategy_params['ema_distance']
    vol_ok     = features_row.get('Vol_Ratio', 99) < strategy_params['vol_ratio_max']
    adx_ok     = features_row.get('ADX', 0) > strategy_params.get('adx_min', 0)

    tech_score = 1.0 if (rsi_ok and ema_ok and vol_ok and adx_ok) else \
                 0.5 if sum([rsi_ok, ema_ok, vol_ok]) >= 2 else 0.0

    # ── SIGNAL 2: XGBoost ML Probability ──────────────────
    if xgb_model is not None:
        feature_names = xgb_model.get_booster().feature_names
        row_values = np.array([
            features_row.get(f, 0) for f in feature_names
        ]).reshape(1, -1)
        ml_prob = float(xgb_model.predict_proba(row_values)[0, 1])
    else:
        ml_prob = 0.5  # Neutral if no model

    # ── SIGNAL 3: Sentiment ────────────────────────────────
    # Normalize sentiment from [-1, +1] to [0, 1]
    sent_norm  = (sentiment_score + 1) / 2

    # ── WEIGHTS (sum to 1.0) ───────────────────────────────
    W_TECH     = 0.35
    W_ML       = 0.45
    W_SENT     = 0.20

    composite  = (W_TECH * tech_score +
                  W_ML   * ml_prob +
                  W_SENT * sent_norm)

    # ── HARD VETO ─────────────────────────────────────────
    sent_veto  = sentiment_score < strategy_params.get('sentiment_veto', -0.40)

    if sent_veto:
        composite = 0.0
        decision  = 'PASS (sentiment veto)'
    elif composite >= 0.60:
        decision  = 'BUY'
    elif composite >= 0.45:
        decision  = 'WATCH'
    else:
        decision  = 'PASS'

    return {
        'composite_score': round(composite, 4),
        'tech_score':      round(tech_score, 4),
        'ml_prob':         round(ml_prob, 4),
        'sent_norm':       round(sent_norm, 4),
        'w_tech':          W_TECH,
        'w_ml':            W_ML,
        'w_sent':          W_SENT,
        'sent_veto':       sent_veto,
        'decision':        decision
    }

# Test on sample features
test_features = {'RSI_14': 28, 'Close_EMA20': -0.005,
                 'Vol_Ratio': 1.8, 'ADX': 28}
test_sentiment = 0.15
strategy_params = {'rsi_entry': 32, 'ema_distance': 0.02,
                   'vol_ratio_max': 2.5, 'adx_min': 20,
                   'sentiment_veto': -0.40}

result = compute_signal_score(test_features, xgb_model,
                               test_sentiment, strategy_params)
print("\nTest signal score:")
for k, v in result.items():
    print(f"  {k}: {v}")
```

**Step 2 — Backtest the multi-signal strategy (20 min)**
```python
def backtest_multisignal(ticker, xgb_model, strategy_params,
                          start='2024-01-01', end='2026-06-01',
                          starting_cash=10_000):
    """
    Backtest the multi-signal strategy and compare to individual signals.
    Uses vectorized approach for speed.
    """
    df = yf.download(ticker, start=start, end=end,
                      interval='1d', progress=False)
    df.columns = [c[0] if isinstance(c, tuple) else c for c in df.columns]

    df['RSI_14']    = ta.rsi(df['Close'], length=14)
    df['EMA_20']    = ta.ema(df['Close'], length=20)
    df['Close_EMA20'] = (df['Close'] - df['EMA_20']) / df['EMA_20']
    df['ATR']       = ta.atr(df['High'], df['Low'], df['Close'], length=14)
    df['Vol_Ratio'] = df['Volume'] / df['Volume'].rolling(20).mean()
    df['ADX']       = ta.adx(df['High'], df['Low'], df['Close'])['ADX_14']
    df['Ret_5d']    = df['Close'].pct_change(5).shift(-5)
    df.dropna(inplace=True)

    # Generate individual signals
    df['Tech_Signal']  = ((df['RSI_14'] < strategy_params['rsi_entry']) &
                          (df['Close_EMA20'] > -strategy_params['ema_distance']) &
                          (df['Vol_Ratio'] < strategy_params['vol_ratio_max'])
                         ).astype(int)

    # ML signal
    if xgb_model is not None:
        feature_names = xgb_model.get_booster().feature_names
        available     = [f for f in feature_names if f in df.columns]
        if len(available) == len(feature_names):
            ml_probs          = xgb_model.predict_proba(df[feature_names])[:, 1]
            df['ML_Prob']     = ml_probs
            df['ML_Signal']   = (ml_probs > 0.55).astype(int)
        else:
            df['ML_Prob']     = 0.5
            df['ML_Signal']   = 0
    else:
        df['ML_Prob']  = 0.5
        df['ML_Signal']= 0

    # Sentiment (static 0.5 normalized = neutral for backtest)
    df['Sent_Norm']     = 0.5
    df['Composite']     = (0.35 * df['Tech_Signal'] +
                           0.45 * df['ML_Prob'] +
                           0.20 * df['Sent_Norm'])
    df['Multi_Signal']  = (df['Composite'] > 0.60).astype(int)

    # Evaluate each signal
    def signal_stats(signal_col, label):
        signal_rows    = df[df[signal_col] == 1]
        signal_returns = signal_rows['Ret_5d']

        if len(signal_rows) < 5:
            return {'signal': label, 'n': 0, 'ic': 0, 'mean_ret': 0, 'win_rate': 0}

        ic, pval = spearmanr(df[signal_col], df['Ret_5d'])
        return {
            'signal':     label,
            'n_signals':  int(df[signal_col].sum()),
            'frequency':  round(df[signal_col].mean(), 4),
            'ic':         round(ic, 4),
            'ic_pval':    round(pval, 4),
            'mean_ret':   round(signal_returns.mean(), 5),
            'win_rate':   round((signal_returns > 0).mean(), 3),
        }

    comparison = pd.DataFrame([
        signal_stats('Tech_Signal',  'Technical Rules'),
        signal_stats('ML_Signal',    'XGBoost ML'),
        signal_stats('Multi_Signal', 'Multi-Signal Combined'),
    ])

    print(f"\n{'='*65}")
    print(f"MULTI-SIGNAL COMPARISON — {ticker} | {start} to {end}")
    print(f"{'='*65}")
    print(comparison.to_string(index=False))
    print(f"\nBaseline (all days) — mean 5d return: {df['Ret_5d'].mean():.5f}")

    # Signal correlation check
    print(f"\nSignal Pairwise Correlations:")
    sig_corr = df[['Tech_Signal', 'ML_Signal', 'Multi_Signal']].corr()
    print(sig_corr.round(3).to_string())
    print("\nNote: Low correlation between Tech_Signal and ML_Signal is desirable.")

    return df, comparison

df_bt, comparison = backtest_multisignal('SPY', xgb_model, strategy_params)
```

**Step 3 — Visualize signal combination benefit (5 min)**
```python
# Compare IC across all three signals
fig, axes = plt.subplots(1, 2, figsize=(14, 5))

# IC comparison
ic_values = comparison.set_index('signal')['ic']
colors = ['#2ecc71' if ic == ic_values.max() else '#95a5a6' for ic in ic_values]
axes[0].bar(ic_values.index, ic_values.values, color=colors)
axes[0].axhline(0, color='black', lw=0.8)
axes[0].set_title('IC Comparison: Individual vs. Combined Signal', fontsize=12)
axes[0].set_ylabel('Information Coefficient')
axes[0].set_ylim(bottom=min(0, ic_values.min() - 0.01))
axes[0].grid(True, alpha=0.3, axis='y')

# Signal frequency comparison
freq_values = comparison.set_index('signal')['frequency']
axes[1].bar(freq_values.index, freq_values.values * 100,
            color=['#3498db', '#e67e22', '#9b59b6'])
axes[1].set_title('Signal Frequency (%)', fontsize=12)
axes[1].set_ylabel('% of Days Signaling')
axes[1].grid(True, alpha=0.3, axis='y')

plt.suptitle('Multi-Signal Architecture Analysis', fontsize=14)
plt.tight_layout()
plt.savefig('multisignal_comparison.png', dpi=150, bbox_inches='tight')
plt.show()
print("Chart saved: multisignal_comparison.png")
```

#### Block 3 — Independent Work (8:50–9:15 PM) | 25 min

Run `backtest_multisignal()` on your personal target ticker. Answer in markdown:
1. Did the multi-signal strategy have a higher IC than the best single signal?
2. Did it have more or fewer signals than the rules-based strategy?
3. What was the pairwise correlation between your Tech_Signal and ML_Signal? Does combining them add information?
4. Is the multi-signal strategy suitable as the basis for your capstone? What would you change?
5. Write one paragraph describing your capstone strategy architecture using the three-component framework (tech + ML + sentiment). This paragraph belongs in your capstone specification document.

**Extension Challenge:**
Test Architecture 1 (hard gate) vs. Architecture 2 (scoring) on the same data:
```python
# Hard gate: all three signals must agree
df_bt['Hard_Gate'] = ((df_bt['Tech_Signal'] == 1) &
                       (df_bt['ML_Signal'] == 1)).astype(int)

hard_ic, _ = spearmanr(df_bt['Hard_Gate'], df_bt['Ret_5d'])
print(f"Hard Gate IC: {hard_ic:.4f} | n_signals: {df_bt['Hard_Gate'].sum()}")
print(f"Compare to Multi-Signal IC: {comparison.loc[comparison['signal']=='Multi-Signal Combined','ic'].values[0]:.4f}")
```
Which produces higher IC? Which produces higher mean forward return? Build the comparison table.

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 min

**Share-out:** Multi-signal comparison results. "Who had the combination beat both individual signals? Who found one signal dominated? What does that tell you about the information value each signal adds to your specific ticker?"

**Muddiest Point:**
> *"The muddiest point from tonight was ___."*

**Notebook submission:** `W19_workshop_multisignal_[initials].ipynb` to GitHub.

---

## FRIDAY — August 21, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** Standard. Note any multi-signal confirmations this week. Did the composite score provide any signals that single-signal approaches would have missed?

#### Block 4 — Observation Assignment (9:50–10:00 AM)
"Before tonight's session, draft a one-sentence capstone hypothesis. Not the strategy description — the hypothesis. 'I believe that [specific market edge] can be captured in [specific asset class] using [specific approach] because [specific reason].' The sentence must be falsifiable. Bring it tonight."

---

### EVENING: Review & Market Session (8:00–9:30 PM EST)

#### Pre-Session Setup
- [ ] Multi-signal comparison table complete
- [ ] IC comparison chart saved
- [ ] One-sentence capstone hypothesis drafted

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 min

1. "Explain the scoring system architecture in plain English. Walk me through a concrete example where the three signals disagree and show me what the score would be."

2. "In the backtest, sentiment was set to neutral (0.5 normalized). Why? And what does this mean for the multi-signal comparison result?"

3. "Your multi-signal IC was 0.062 vs. XGBoost-only IC of 0.071. The combination performs WORSE. What are the possible explanations? What do you do with this finding?"

4. "You have 3 signals, each with IC ~0.05. Their pairwise correlation is 0.85. Does combining them help? Why or why not?"
   *(Expected: No — highly correlated signals don't add information. The combination benefit requires LOW correlation between signal outputs. Check correlation between signal outputs before combining.)*

5. "Read your one-sentence capstone hypothesis. Does it name: a specific edge, a specific asset class, and a specific reason the edge persists? Is it falsifiable?"

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 min

"This week is also a dry run for the capstone. For each student: did the multi-signal pipeline fire this week? What did the composite score look like on Monday, Wednesday, Friday? Did you take any paper trades based on the combined signal? If yes — how did it perform?

Standard chart review: SPY, QQQ, VIX, sectors. Apply regime analysis: which regime was this week? Did your multi-signal strategy perform consistently with its expected behavior in that regime?"

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 min
Standard checklist.

#### Block 4 — Capstone Design Briefing & Close (9:20–9:30 PM) | 10 min

"Next week is Week 20 — the last week of Month 5. Monday is the capstone design session. Wednesday you build the specification document. Friday you present and lock the hypothesis.

The capstone specification must include:
1. Strategy name and one-sentence hypothesis
2. Target asset universe (which tickers, what market cap range)
3. Signal architecture: which of our three signals, how combined
4. Feature engineering plan: which features, which period, which model
5. Risk framework: position sizing model, stop logic, max positions
6. Paper trading plan for Month 6: minimum trades, review cadence
7. Success metrics: target Sharpe, win rate, alpha vs. SPY

Spend the weekend drafting this. Monday we discuss and refine. Wednesday we formalize. Friday we lock it. No changes after Friday."

**Assign reading:**
- Review all workshop notebooks from Months 4–5
- Review your Milestone 3 forward plan — your Month 5 goals stated there
- Think about what you want Month 6 to produce

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

## WEEKLY DELIVERABLES SUMMARY

| Deliverable | Due | Format |
|-------------|-----|--------|
| Multi-signal strategy notebook (W19) | Wednesday 11:59 PM | `.ipynb` pushed to GitHub |
| IC comparison chart | Wednesday 11:59 PM | `multisignal_comparison.png` in GitHub |
| Signal pairwise correlation analysis | Wednesday 11:59 PM | In notebook markdown |
| Capstone architecture paragraph | Wednesday 11:59 PM | In notebook markdown |
| Capstone hypothesis draft (1 sentence) | Friday before session | Posted in hypothesis log |
| Trading journal — all trades this week | Friday 11:59 PM | Updated `.md` or `.csv` in GitHub |

---

## INSTRUCTOR NOTES FOR WEEK 19

**The combination-doesn't-help case is the best teaching opportunity:** Students who find their multi-signal IC is lower than the best single signal often feel confused or disappointed. Reframe it: if the ML signal already captures most of what the rules capture, adding the rules doesn't add information — it adds noise. This is actually an important finding. The research question becomes: which signal component is genuinely additive and which is redundant?

**Signal pairwise correlation is the diagnostic tool:** Push students to check whether their Tech_Signal and ML_Signal are correlated before concluding the combination didn't help. If correlation is 0.85 — the combination can't help, by math. If correlation is 0.30 — there's room for combination benefit. This diagnostic turns a disappointing result into a productive finding.

**The capstone hypothesis standard is high:** "I want to test a momentum strategy" is not acceptable. "I hypothesize that RSI mean-reversion in large-cap tech stocks has higher IC when confirmed by positive FinBERT sentiment on earnings-adjacent days, because news sentiment captures information not yet reflected in price for high-attention stocks" — that's specific, testable, and causally motivated. Push for this level on Monday.

**Weekend capstone draft assignment is critical:** Students who arrive Monday without a draft will struggle to participate in the round-table format. The draft doesn't need to be polished — it needs to exist. The seven sections don't need to be complete — even sketched answers force thinking. Remind students explicitly on Friday that the Monday session only works if everyone comes prepared.

**Sentiment neutrality in backtest is honest, not lazy:** Students may question why sentiment was set to 0.5 (neutral) in the backtest. The answer is: you can't backtest historical sentiment with free NewsAPI data. Using neutral prevents false attribution — if you used fake sentiment data in the backtest, you couldn't trust the results. The honest approach is: sentiment adds to live paper trading from Week 18 forward; the backtest reflects technical + ML only.

---

## WEEKLY RESOURCES

> Resources are labeled **[Pre-session]** (review before class) or **[Homework]** (explore after). Week 19 completes the tool set — reading is synthesis-oriented.

---

### Monday — Signal Combination Theory

- **[Article | Pre-session]** [Multi-Factor Models in Quantitative Finance](https://blog.quantinsti.com/factor-investing/) — QuantInsti. Read the multi-factor combination section before Monday. The factor combination logic in equity investing is the same as the signal combination logic we implement — additive factors with low pairwise correlation produce diversification benefit.

- **[Article | Homework]** [Ensemble Methods in Machine Learning — Why They Work](https://scikit-learn.org/stable/modules/ensemble.html) — scikit-learn documentation. The theory behind ensemble learning (random forests, boosting) is the same theory behind multi-signal combination. Read the "Introduction" and "Why use ensemble methods" sections after Monday.

---

### Wednesday — Multi-Signal Build

- **[Reference | Pre-session]** Your W17 notebook (XGBoost), W18 notebook (sentiment), W13 signal monitor — Review all three before Wednesday. Know exactly what functions and objects you need to import. The build works from a clean start — students who haven't reviewed their prior notebooks will lose 15 minutes importing and debugging.

- **[Article | Reference]** [Building a Multi-Factor Trading Strategy in Python](https://www.pyquantnews.com/free-python-resources/guide-to-quantitative-trading-strategies-and-backtesting) — PyQuant News. The multi-factor section maps directly to tonight's Architecture 2 implementation. Keep open during the workshop as reference.

---

### Friday — Multi-Signal Review + Capstone Briefing

- **[Article | Pre-session]** [The Kelly Criterion and Portfolio Construction](https://blog.quantinsti.com/kelly-criterion/) — QuantInsti. Read before Friday. The IC of each signal has a direct relationship to optimal weight under the Kelly criterion — if your ML IC is higher than your rules IC, Kelly-optimal weights would put more weight on ML. This connects to the weight selection question in Architecture 2.

- **[Homework | Capstone prep]** [Designing Quantitative Trading Strategies — A Framework](https://www.hudson-thames.com/) — Hudson & Thames blog. Browse the strategy design section. The capstone specification template in Week 20 is structured around this professional framework.

---

*FINN Week 19 — Multi-Signal Architecture | Part of FINN_Month05.md*
