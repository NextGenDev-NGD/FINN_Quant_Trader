# FINN — Month 05 Lesson Plan
## Financial Intelligence & Navigation Network
### Optimization, Deep AI & Capstone Strategy Design
**Dates:** August 3 – August 29, 2026
**Phase:** Month 5 of 6 — Optimization + Capstone Design
**Milestone:** Capstone strategy hypothesis locked (end of Week 20)

---

> **INSTRUCTOR NOTE**
> Month 5 is the most technically demanding month of the course.
> Students arrive with 2 months of live paper trading behind them,
> a validated (or honestly assessed) strategy, and enough operational
> experience to handle more sophisticated tooling.
>
> Three major additions this month:
>
> 1. **XGBoost on the live feature matrix** — students move from
>    rules-based strategies to ML-driven signal generation, trained
>    on real data, evaluated with rigorous out-of-sample methodology
>
> 2. **Live NewsAPI sentiment integration** — the FinBERT pipeline
>    from Month 2 and the simulated sentiment from Month 4 now
>    connects to real financial news feeds, giving students a live
>    unstructured data signal for the first time
>
> 3. **Capstone strategy design** — by end of Week 20, every student
>    must have their Milestone 4 capstone strategy hypothesis locked,
>    with a full design specification. Month 6 executes it.
>
> **Instructor role shift:** Month 5 is where the instructor becomes
> primarily a reviewer and challenger, not a teacher. Students are
> expected to drive the content direction based on their live trading
> experience. The Monday theory sessions this month are heavily
> student-driven — the instructor facilitates rigorous analysis,
> not lecture.
>
> **Calendar note:** Labor Day falls Monday September 7 — that is
> Month 6 territory, not Month 5. No holiday impact this month.
> However, late August is back-to-school season — expect 1–2
> individual absences. Pre-build the Week 17 Monday async package
> as a precaution.

---

## Month 5 Overview

### Learning Objectives

By the end of Month 5, every student will be able to:

- Train, evaluate, and deploy an XGBoost classification model on a
  live financial feature matrix with proper time-series cross-validation
- Interpret XGBoost feature importance to identify which signals
  drive model predictions
- Connect the NewsAPI or Alpaca News feed to the FinBERT pipeline
  and produce a live daily sentiment score for any ticker
- Evaluate whether the ML signal outperforms the rules-based signal
  using IC, Sharpe, and out-of-sample comparison
- Architect a multi-signal strategy that combines ML predictions,
  sentiment scores, and technical filters in a single decision framework
- Design a complete capstone strategy specification: hypothesis,
  data sources, feature engineering plan, ML architecture, risk rules,
  and success metrics
- Explain the concept of model degradation and describe a monitoring
  plan to detect when a deployed ML model needs retraining
- Apply all Month 5 tools within the live paper trading workflow
  without breaking the risk management framework

### Month 5 Curriculum Sources
*(from `FINN_Curriculum_Wiki.md`)*

- Section 6.3 — ML signal generation (applied in full depth)
- Section 6.4 — Multi-agent AI (implemented, not just conceptual)
- Section 4.2 — alpaca-py and pandas-ta (live data integration)
- All prior content synthesized into capstone design framework

### Month 5 at a Glance

| Week | Dates | Theme | Monday Topic | Wednesday Workshop | Friday Focus |
|------|-------|-------|-------------|-------------------|-------------|
| 17 | Aug 3–8 | ML Signals | XGBoost on feature matrix — theory + design | Train first XGBoost signal model | ML signal vs. rules-based signal comparison |
| 18 | Aug 10–15 | Live Sentiment | Live NewsAPI + FinBERT pipeline operational | Full live sentiment + ML pipeline integration | Combined signal audit on real week |
| 19 | Aug 17–22 | Multi-Signal Architecture | Combining signals into a single decision framework | Multi-signal strategy backtest | Combined strategy vs. individual signals |
| 20 | Aug 24–29 | Capstone Design | Capstone strategy architecture + specification | Capstone design document workshop | Capstone hypothesis lock + Month 5 close |

---

---

# WEEK 17 — ML Signals: XGBoost on the Feature Matrix
**Theme:** Rules-based signals set a threshold and act. ML signals learn the threshold from data. Both are hypotheses. Only evidence decides.

---

## Monday, August 3, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

#### Block 1 — Pre-Market Scan (9:00–9:15 AM)
Standard checklist plus Portfolio Pulse.
"Welcome to Month 5. Before we open the books — how did the market
behave over the last week of July? Any macro developments from the
end of Month 4 that carry into today?"

#### Block 2 — Student-Led Brief (9:15–9:35 AM)
Rotating student presenter. By Month 5 the briefs should be
genuinely fluent — connect pre-market data, watchlist condition,
and signal report into a coherent 5-minute narrative.
If a brief is still fragmented or superficial, give direct feedback.

#### Block 3 — Hypothesis Setting (9:35–9:50 AM)
Add Month 5 header: `## Month 5 — Week 17`.
Encourage ML-framed hypotheses this month:
"Can you frame a hypothesis that compares a model's prediction to
a rules-based threshold? That tension is the core of this month."

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Think about your current rules-based strategy.
Write down its entry condition as a decision rule:
'If [feature A] and [feature B] and [feature C] then BUY.'
Now ask yourself: what if the relationship between A, B, C and
future returns is NOT linear and NOT fixed? What kind of tool
would you need to capture a more complex relationship?
Bring your answer tonight."

---

### Monday, August 3, 2026 — Theory Session
**Time:** 8:00–9:30 PM EST
**Topic:** Machine Learning Signals — XGBoost, Feature Importance & Model Evaluation
**Curriculum source:** Wiki Section 6.3 (full depth)

#### Pre-Session Requirements
- [ ] Wiki Section 6.3 read in full — all five subsections
- [ ] Milestone 3 report reviewed and any feedback from instructor noted
- [ ] Month 5 strategy version (from Milestone 3 forward plan) confirmed
- [ ] DMB observation completed and written

---

#### Block 1 — Day Review & Milestone 3 Debrief (8:00–8:15 PM) | 15 minutes

"Before we move into Month 5 content — quick Milestone 3 debrief.
What was the single most surprising finding from your mid-review?
Not P&L — something you genuinely didn't expect to discover
about yourself or your strategy."

Go around the room. One sentence per student.
Then: "Keep that finding visible. Everything we build this month
should address whatever you discovered at Milestone 3."

Reading check:
- "Name the 5 ML model types from the wiki. For each — one sentence
  on when you'd choose it over the others."
- "What is time-series cross-validation and why is shuffling
  a time-series dataset before splitting catastrophically wrong?"

---

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 minutes

**Topic A: Why Rules Break and Models Learn (10 min)**

"Your rules-based strategy says: 'RSI < 30 and price > EMA_20 → BUY.'
That rule assumes:
1. RSI < 30 is always the right threshold
2. The relationship between RSI and future returns is fixed over time
3. The same threshold works across different market regimes

None of those assumptions are fully correct.

A machine learning model doesn't make those assumptions.
It learns the relationship between features and outcomes from data.
If the relationship between RSI and returns changes in different
volatility regimes — a model with regime features can learn that.
If the interaction between RSI and volume surge is more predictive
than either alone — a model finds that interaction automatically.

This is not magic. It is pattern recognition applied to features
you design. The model is only as good as your feature matrix.
'Garbage in, garbage out' applies absolutely."

**Topic B: XGBoost — Why Quants Use It (15 min)**

"XGBoost (eXtreme Gradient Boosting) is the dominant model in
systematic trading for several reasons:

1. **Handles non-linear relationships** — unlike linear regression,
   XGBoost captures complex interactions between features
2. **Built-in feature importance** — tells you which features
   drive predictions. This is research insight, not just a black box.
3. **Robust to noise** — tree-based models don't overfit on correlated
   features as badly as linear models do
4. **Fast** — can retrain nightly on updated data
5. **Interpretable enough** — SHAP values give per-prediction
   feature attribution (we cover this Wednesday)

The workflow:
- Input: feature matrix rows (each = one trading day)
- Label: 1 if next 5-day return > threshold, 0 otherwise
- Training: learn which feature combinations predict label = 1
- Prediction: for today's features, output probability of label = 1
- Signal: if probability > threshold (e.g., 0.55), generate entry signal"

"The model does NOT replace the strategy framework.
It replaces the entry rule. Risk management, position sizing, and
exit logic remain exactly as before. The only thing that changes
is what triggers entry: a rules threshold → a model probability."

**Topic C: Model Evaluation for Trading (15 min)**

"Standard ML metrics (accuracy, F1) are not sufficient for trading.
We need trading-specific evaluation:

**IC (Information Coefficient):**
Correlation between model probability and actual forward return.
IC > 0.05 = the model has genuine predictive value.
IC is the primary quality gate for any ML signal.

**Precision at threshold:**
Of all days where model probability > 0.55,
what fraction were actually profitable over the next 5 days?
This is the win rate of the model's confident predictions.

**Calibration:**
Does a 70% probability actually mean 70% of those days went up?
Poorly calibrated models say 70% but only deliver 52% — they are overconfident.
`sklearn.calibration.CalibratedClassifierCV` fixes this.

**Out-of-sample Sharpe:**
Backtest the strategy using only the model's signals (not rules).
Compare Sharpe to the rules-based version on the same OOS data.
If the model doesn't beat the rules on OOS data — the rules win.

**Decay analysis:**
Retrain monthly. Track if IC declines over time.
Model decay = the signal the model learned has diminished in the market.
When IC drops below 0.02 consistently — retrain or replace."

---

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 minutes

1. "Your XGBoost model has 94% training accuracy and 53% test accuracy.
   What happened? What is the technical term and what does it tell you
   about the feature matrix?"
   *(Expected: severe overfitting. The model memorized the training data.
   In financial ML, overfitting is the norm without strict prevention:
   time-series split, max_depth limits, early stopping, fewer trees,
   feature selection before training.)*

2. "Feature importance shows that Volume_Ratio is the most predictive
   feature in your model by a large margin. Why might this be both
   exciting and suspicious?"
   *(Expected: exciting — volume surge is a known precursor to price moves.
   Suspicious — volume data can be noisy, and if volume surge correlates
   with specific event types that don't repeat, this could be a spurious
   correlation. Need to test volume signal standalone for IC.)*

3. "Devil's advocate: If XGBoost learns patterns from historical data
   and markets are not fully stationary, isn't every trained model
   already stale the moment you deploy it?"
   *(Expected: Yes — this is the fundamental challenge of ML in finance.
   The answer is rolling retraining (retrain weekly or monthly on most
   recent N months of data), decay monitoring, and never treating a
   model as permanent. Models are hypotheses with expiry dates.)*

4. "A rules-based strategy is fully explainable: 'I bought because RSI
   was 28.' An XGBoost model says 'I bought because the model output was
   0.67.' Which is better for learning? Which is better for live trading?
   Are these the same question?"
   *(Expected: Not the same question. For learning — rules are more
   instructive because you understand exactly what fired. For performance —
   the model may be better. SHAP values partially bridge this gap
   by giving feature-level attribution per prediction.)*

---

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 minutes

**Wednesday workshop:**
"We train our first XGBoost model on the live feature matrix.
We evaluate it with IC, precision, and OOS Sharpe.
We compare it to the rules-based strategy on the same data.
Starter: `W17_workshop_xgboost_signal_starter.ipynb`

Bring: your feature matrix (W06 notebook output), your strategy's
target ticker and time period, and your rules-based entry conditions.
We use the same ticker and period for both models so the comparison is fair."

**Weekly hypotheses:**
"Frame this week's hypotheses at the model level:
'The XGBoost model will outperform the RSI rule on OOS data because ___.'
That's a falsifiable ML hypothesis. Test it Wednesday."

**Pre-reading:**
- Wiki Section 4.2 — scikit-learn and XGBoost entries (re-read)
- Skim: XGBoost documentation at xgboost.readthedocs.io — especially
  the `XGBClassifier` parameter reference

**Closing reflection:**
*"The feature I most expect to be important in my XGBoost model is ___,
because ___."*

---

## Wednesday, August 5, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Portfolio Pulse:** Full account summary. Note whether any positions
are being held while we shift to ML signal testing.

**Block 4 — Observation Assignment:**
"Before tonight's class, run `build_feature_matrix()` from W06
on your target ticker with 3 years of data. Verify it runs cleanly.
Note the number of rows and the number of features. We use this
directly in tonight's workshop."

---

### Wednesday, August 5, 2026 — Workshop Session
**Time:** 8:00–9:30 PM EST
**Topic:** Training Your First XGBoost Signal Model
**Curriculum source:** Wiki Section 6.3
**Notebook:** `W17_workshop_xgboost_signal_[initials].ipynb`

---

#### Block 1 — Framing & Context Bridge (8:00–8:10 PM) | 10 minutes

"Tonight we train a machine learning model on financial data for the first time.
Not a toy dataset. Not MNIST. Real OHLCV-derived features on real tickers.

Three things we will know by the end of tonight that we don't know now:
1. Does XGBoost improve on the rules-based signal for our ticker?
2. Which features drive the model's predictions?
3. Is the improvement real or an artifact of overfitting?

The answer to all three might be disappointing.
That is not failure — that is quantitative research done honestly."

---

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 minutes

```python
import yfinance as yf
import pandas as pd
import numpy as np
import pandas_ta as ta
import xgboost as xgb
from sklearn.model_selection import TimeSeriesSplit
from sklearn.metrics import classification_report, precision_score
from sklearn.calibration import CalibratedClassifierCV
from scipy.stats import spearmanr
import matplotlib.pyplot as plt
import warnings
warnings.filterwarnings('ignore')

print("XGBoost Signal Training Pipeline")
print("="*55)
```

**Step 1 — Build feature matrix with label (10 min)**
```python
def build_ml_feature_matrix(ticker, period='4y', interval='1d',
                              forward_days=5, return_threshold=0.005):
    """
    Build feature matrix suitable for ML training.
    Label: 1 if forward N-day return > threshold, else 0.
    """
    df = yf.download(ticker, period=period, interval=interval, progress=False)
    df.columns = [c[0] if isinstance(c, tuple) else c for c in df.columns]
    df.dropna(inplace=True)

    # ── FEATURES ──────────────────────────────────────────────
    # Momentum
    df['RSI_14']      = ta.rsi(df['Close'], length=14)
    df['RSI_7']       = ta.rsi(df['Close'], length=7)
    macd              = ta.macd(df['Close'])
    df['MACD_Hist']   = macd['MACDh_12_26_9']
    df['MACD_Cross']  = (macd['MACD_12_26_9'] >
                         macd['MACDs_12_26_9']).astype(int)
    stoch             = ta.stoch(df['High'], df['Low'], df['Close'])
    df['Stoch_K']     = stoch['STOCHk_14_3_3']

    # Trend
    df['EMA_9']       = ta.ema(df['Close'], length=9)
    df['EMA_20']      = ta.ema(df['Close'], length=20)
    df['SMA_50']      = ta.sma(df['Close'], length=50)
    df['SMA_200']     = ta.sma(df['Close'], length=200)
    df['EMA9_EMA20']  = (df['EMA_9'] - df['EMA_20']) / df['EMA_20']
    df['Close_EMA20'] = (df['Close'] - df['EMA_20']) / df['EMA_20']
    df['Close_SMA200']= (df['Close'] - df['SMA_200']) / df['SMA_200']

    # Volatility
    df['ATR_14']      = ta.atr(df['High'], df['Low'], df['Close'], length=14)
    df['ATR_Norm']    = df['ATR_14'] / df['Close']
    bb                = ta.bbands(df['Close'], length=20, std=2)
    df['BB_Pct']      = bb['BBP_20_2.0']
    df['BB_Width']    = (bb['BBU_20_2.0'] - bb['BBL_20_2.0']) / df['Close']
    df['Vol_20d']     = df['Close'].pct_change().rolling(20).std() * np.sqrt(252)
    df['HL_Pct']      = (df['High'] - df['Low']) / df['Close']

    # Volume
    df['Vol_Ratio']   = df['Volume'] / df['Volume'].rolling(20).mean()
    df['OBV']         = ta.obv(df['Close'], df['Volume'])
    df['OBV_Chg5']    = df['OBV'].pct_change(5)

    # Trend strength
    adx               = ta.adx(df['High'], df['Low'], df['Close'], length=14)
    df['ADX']         = adx['ADX_14']

    # Return lags (momentum lookbacks)
    df['Ret_1d']      = df['Close'].pct_change(1)
    df['Ret_5d']      = df['Close'].pct_change(5)
    df['Ret_20d']     = df['Close'].pct_change(20)

    # ── LABEL ─────────────────────────────────────────────────
    fwd_return        = df['Close'].pct_change(forward_days).shift(-forward_days)
    df['Label']       = (fwd_return > return_threshold).astype(int)

    df.dropna(inplace=True)

    feature_cols = [
        'RSI_14', 'RSI_7', 'MACD_Hist', 'MACD_Cross', 'Stoch_K',
        'EMA9_EMA20', 'Close_EMA20', 'Close_SMA200',
        'ATR_Norm', 'BB_Pct', 'BB_Width', 'Vol_20d', 'HL_Pct',
        'Vol_Ratio', 'OBV_Chg5', 'ADX',
        'Ret_1d', 'Ret_5d', 'Ret_20d'
    ]

    X = df[feature_cols]
    y = df['Label']

    print(f"Feature matrix: {X.shape[0]} rows × {X.shape[1]} features")
    print(f"Label distribution: {y.mean():.1%} positive ({y.sum()} of {len(y)})")
    print(f"Date range: {df.index[0].date()} → {df.index[-1].date()}")

    return X, y, df, feature_cols

TICKER = 'SPY'  # Replace with your target ticker
X, y, df_full, FEATURES = build_ml_feature_matrix(TICKER, period='4y')
```

**Step 2 — Time-series cross-validation (10 min)**
```python
def evaluate_with_tscv(X, y, n_splits=5):
    """
    Evaluate XGBoost with TimeSeriesSplit — never shuffle.
    Returns per-fold and aggregate metrics.
    """
    tscv    = TimeSeriesSplit(n_splits=n_splits)
    results = []

    model_params = {
        'n_estimators':      200,
        'max_depth':         4,       # Shallow trees reduce overfitting
        'learning_rate':     0.05,
        'subsample':         0.8,     # Use 80% of rows per tree
        'colsample_bytree':  0.8,     # Use 80% of features per tree
        'min_child_weight':  5,       # Minimum observations per leaf
        'scale_pos_weight':  (y==0).sum() / (y==1).sum(),  # Handle imbalance
        'eval_metric':       'logloss',
        'use_label_encoder': False,
        'random_state':      42,
        'verbosity':         0
    }

    print(f"\nTime-Series CV ({n_splits} folds)")
    print("─"*55)

    fold_ics = []
    for fold, (train_idx, test_idx) in enumerate(tscv.split(X)):
        X_train, X_test = X.iloc[train_idx], X.iloc[test_idx]
        y_train, y_test = y.iloc[train_idx], y.iloc[test_idx]

        model = xgb.XGBClassifier(**model_params)
        model.fit(X_train, y_train,
                  eval_set=[(X_test, y_test)],
                  verbose=False)

        proba     = model.predict_proba(X_test)[:, 1]

        # IC: correlation between model probability and actual label
        ic, p_val = spearmanr(proba, y_test)

        # Precision at threshold
        high_conf = proba > 0.55
        if high_conf.sum() > 0:
            precision = (y_test[high_conf] == 1).mean()
        else:
            precision = np.nan

        fold_ics.append(ic)
        results.append({
            'fold':         fold + 1,
            'train_size':   len(train_idx),
            'test_size':    len(test_idx),
            'ic':           round(ic, 4),
            'ic_pval':      round(p_val, 4),
            'precision_55': round(precision, 4) if not np.isnan(precision) else 'N/A',
            'n_confident':  int(high_conf.sum())
        })

        print(f"Fold {fold+1}: IC={ic:.4f} (p={p_val:.3f}) | "
              f"Precision@0.55={precision:.1%} | "
              f"Confident signals={high_conf.sum()}")

    results_df = pd.DataFrame(results)
    mean_ic    = np.mean(fold_ics)
    std_ic     = np.std(fold_ics)

    print(f"\n{'─'*55}")
    print(f"Mean IC across folds: {mean_ic:.4f} ± {std_ic:.4f}")
    print(f"IC Stability: {'Stable ✓' if std_ic < 0.05 else 'Variable ⚠️'}")
    print(f"Signal Quality: {'Strong ✓' if mean_ic > 0.08 else 'Moderate' if mean_ic > 0.04 else 'Weak ✗'}")

    return results_df, mean_ic

cv_results, mean_ic = evaluate_with_tscv(X, y)
```

**Step 3 — Final model training and feature importance (12 min)**
```python
def train_final_model(X, y, train_pct=0.80):
    """
    Train final model on most recent N% of data.
    Evaluate on held-out last 20%.
    """
    split = int(len(X) * train_pct)
    X_train, X_oos = X.iloc[:split], X.iloc[split:]
    y_train, y_oos = y.iloc[:split], y.iloc[split:]

    print(f"\nFinal Model Training")
    print(f"Train: {X_train.shape[0]} rows "
          f"({X_train.index[0].date()} → {X_train.index[-1].date()})")
    print(f"OOS:   {X_oos.shape[0]} rows "
          f"({X_oos.index[0].date()} → {X_oos.index[-1].date()})")

    model = xgb.XGBClassifier(
        n_estimators=300,
        max_depth=4,
        learning_rate=0.03,
        subsample=0.8,
        colsample_bytree=0.8,
        min_child_weight=5,
        scale_pos_weight=(y_train==0).sum() / (y_train==1).sum(),
        use_label_encoder=False,
        verbosity=0,
        random_state=42
    )
    model.fit(X_train, y_train)

    # OOS evaluation
    oos_proba  = model.predict_proba(X_oos)[:, 1]
    oos_ic, _  = spearmanr(oos_proba, y_oos)
    high_conf  = oos_proba > 0.55
    precision  = (y_oos[high_conf] == 1).mean() if high_conf.sum() > 0 else np.nan

    print(f"\nOOS Results:")
    print(f"  IC:              {oos_ic:.4f}")
    print(f"  Precision@0.55:  {precision:.1%}" if not np.isnan(precision) else "  Precision: N/A")
    print(f"  Confident days:  {high_conf.sum()} of {len(oos_proba)}")

    # Feature importance plot
    importance = pd.Series(model.feature_importances_, index=X.columns)
    importance = importance.sort_values(ascending=True)

    fig, ax = plt.subplots(figsize=(10, 8))
    colors  = ['#2ecc71' if imp > importance.median() else '#95a5a6'
               for imp in importance]
    importance.plot(kind='barh', ax=ax, color=colors)
    ax.set_title(f'XGBoost Feature Importance — {TICKER}', fontsize=13)
    ax.set_xlabel('Importance Score')
    ax.axvline(importance.median(), color='red', linestyle='--',
               alpha=0.5, label='Median')
    ax.legend()
    plt.tight_layout()
    plt.savefig('xgboost_feature_importance.png', dpi=150, bbox_inches='tight')
    plt.show()

    print(f"\nTop 5 features:")
    for feat, imp in importance.tail(5)[::-1].items():
        print(f"  {feat:20s}: {imp:.4f}")

    return model, X_oos, y_oos, oos_proba

model, X_oos, y_oos, oos_proba = train_final_model(X, y)
```

**Step 4 — ML signal vs. rules-based comparison (8 min)**
```python
def compare_ml_vs_rules(df_full, oos_proba, X_oos,
                          rules_rsi_threshold=30,
                          ml_threshold=0.55,
                          forward_days=5):
    """
    Compare ML signal to rules-based RSI signal on same OOS period.
    """
    oos_df = df_full.loc[X_oos.index].copy()
    oos_df['Fwd_Return'] = oos_df['Close'].pct_change(
                            forward_days).shift(-forward_days)
    oos_df['ML_Prob']   = oos_proba
    oos_df['ML_Signal'] = (oos_proba > ml_threshold).astype(int)
    oos_df['RSI_Signal']= (oos_df['RSI_14'] < rules_rsi_threshold).astype(int)
    oos_df.dropna(subset=['Fwd_Return'], inplace=True)

    # Compare IC of each signal
    ml_ic,   _  = spearmanr(oos_df['ML_Prob'],   oos_df['Fwd_Return'])
    rsi_ic,  _  = spearmanr(-oos_df['RSI_14'],   oos_df['Fwd_Return'])

    ml_returns  = oos_df.loc[oos_df['ML_Signal']==1,  'Fwd_Return']
    rsi_returns = oos_df.loc[oos_df['RSI_Signal']==1, 'Fwd_Return']
    base_returns = oos_df['Fwd_Return']

    print(f"\n{'='*55}")
    print(f"ML vs RULES-BASED COMPARISON — OOS Period")
    print(f"{'='*55}")
    print(f"{'Metric':<25} {'ML Signal':>14} {'RSI Rule':>14} {'Baseline':>14}")
    print(f"{'─'*55}")
    print(f"{'IC':<25} {ml_ic:>14.4f} {rsi_ic:>14.4f} {'N/A':>14}")
    print(f"{'Mean fwd return':<25} "
          f"{ml_returns.mean():>14.4%} "
          f"{rsi_returns.mean():>14.4%} "
          f"{base_returns.mean():>14.4%}")
    print(f"{'Signal frequency':<25} "
          f"{oos_df['ML_Signal'].mean():>14.1%} "
          f"{oos_df['RSI_Signal'].mean():>14.1%} "
          f"{'100%':>14}")
    print(f"{'Win rate':<25} "
          f"{(ml_returns > 0).mean():>14.1%} "
          f"{(rsi_returns > 0).mean():>14.1%} "
          f"{(base_returns > 0).mean():>14.1%}")
    print(f"{'─'*55}")

    winner = "ML" if ml_ic > rsi_ic else "RSI Rule"
    print(f"\nOOS winner by IC: {winner}")
    print(f"IC improvement: {ml_ic - rsi_ic:+.4f}")

    return oos_df

comparison_df = compare_ml_vs_rules(df_full, oos_proba, X_oos)
```

---

#### Block 3 — Independent / Pair Work (8:50–9:15 PM) | 25 minutes

**Core Exercise:**
Run the full pipeline on YOUR target ticker.
Answer in markdown:
1. What was your model's mean CV IC? Is it above the 0.05 threshold?
2. Which feature had the highest importance? Does that match your intuition?
3. Did the ML signal outperform your RSI rule on OOS data by IC?
4. By how much did signal frequency change — more or fewer signals?
5. Based purely on the evidence: should you use the ML signal,
   the RSI rule, or a combination for Month 6? Justify with numbers.

**Extension Challenge:**
Implement early stopping to prevent overfitting:
```python
model.fit(X_train, y_train,
          eval_set=[(X_train, y_train), (X_test, y_test)],
          early_stopping_rounds=20,
          verbose=False)
print(f"Best iteration: {model.best_iteration}")
```
Does early stopping change the feature importance ranking?

---

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 minutes

**Share-out:** Who had ML beat the rules? Who had rules beat ML?
"More interesting than who won: what did the feature importance plot
tell you about your market? What did you learn about your own strategy?"

**Muddiest Point:**
> *"The muddiest point from tonight was ___."*

**Notebook submission:** `W17_workshop_xgboost_signal_[initials].ipynb` to GitHub.

---

## Friday, August 7, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Portfolio Pulse:** Full account summary. Note any impact of ML signal
on this week's trade decisions — did the ML model agree with the rules?

---

### Friday, August 7, 2026 — Review & Market Session
**Time:** 8:00–9:30 PM EST
**Topic:** Week 17 Review + ML Signal Behavior on This Week's Market

---

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 minutes

1. "Explain overfitting in the context of your XGBoost model.
   What specific hyperparameter choices reduce it? Why does each help?"

2. "Your model's CV IC was 0.07 but OOS IC was 0.03. What does this
   gap tell you? Is the model deployable?"

3. "Feature importance showed RSI_14 as most important.
   But RSI_7 was number two. These are highly correlated.
   Does having both improve the model or create redundancy?"

4. "Why is TimeSeriesSplit non-negotiable for financial ML?
   Give me a concrete example of what goes wrong with random split."

5. "Your ML signal fires on 15% of trading days.
   Your RSI rule fires on 8%. More signals — is that better or worse?"
   *(Expected: depends on precision. More low-quality signals reduce
   the Sharpe. Fewer high-quality signals can be better.
   Evaluate by IC and win rate at threshold, not raw signal count.)*

---

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 minutes

**ML Signal Audit:**
"Pull up your target ticker. Run your feature matrix on this week's data.
What was the ML model probability on Monday? Wednesday? Friday?
Where it exceeded 0.55 — what did price do next?
Where the RSI rule triggered — did the model agree or disagree?
When they disagreed — which was right?"

Standard chart review: SPY, QQQ, VIX, sectors.

---

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 minutes
Standard checklist.

---

#### Block 4 — Next Week Preview & Close (9:20–9:30 PM) | 10 minutes

**Next week:** Live NewsAPI + FinBERT integration.
The sentiment pipeline becomes operational — real headlines, real scores, live.

**Assign reading:**
- NewsAPI documentation: newsapi.org/docs
- Alpaca news endpoint: docs.alpaca.markets/reference/news-1
- Wiki Section 6.2 — Re-read FinBERT section

**Action items:**
- Obtain NewsAPI key if not yet done (free tier at newsapi.org)
- Verify Alpaca account has news access enabled

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

---

# WEEK 18 — Live Sentiment Integration
**Theme:** The market reacts to language before it reacts to price. Make the language readable.

---

## Monday, August 10, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Portfolio Pulse:** Standard. Note any ML model signals that fired this week.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Find a financial headline published today
about any company or index. Write it down verbatim.
Then: manually score it Bullish/Bearish/Neutral with confidence 0–100.
Note what specific words or phrases drove your rating.
Those words are exactly what FinBERT is trained to recognize.
Bring it tonight."

---

### Monday, August 10, 2026 — Theory Session
**Time:** 8:00–9:30 PM EST
**Topic:** Live Sentiment Architecture — NewsAPI, FinBERT & Signal Quality
**Curriculum source:** Wiki Section 6.2 (applied, live)

#### Pre-Session Requirements
- [ ] NewsAPI account and key obtained
- [ ] Alpaca account with news access confirmed
- [ ] Week 17 XGBoost results reviewed — model IC noted
- [ ] Headline from DMB observation written and rated

---

#### Block 1 — Day Review & Sentiment Context (8:00–8:15 PM) | 15 minutes

"Who has their headline from this morning? Read it aloud.
What did you rate it and why? What specific words influenced you?

Now here's the problem at scale:
You have 500 stocks in your universe.
Each generates 5–10 headlines per day.
That's 2,500–5,000 headlines daily.
You cannot manually score them. FinBERT can score all of them
in minutes. That's the operational case for NLP in trading.

Tonight we connect the data source (NewsAPI) to the model (FinBERT)
and validate the output quality. Wednesday we make it live."

Reading check:
- "What is the difference between VADER and FinBERT for financial text?"
- "What does IC > 0.05 mean when applied to a sentiment signal?
  What are you actually measuring?"
- "Name two failure modes of news-based sentiment signals."

---

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 minutes

**Topic A: The Live Sentiment Architecture (15 min)**

"The production pipeline we're building tonight and Wednesday:

```
STEP 1 — DATA SOURCE (NewsAPI or Alpaca News)
  ↓  Fetch headlines for each watchlist ticker
  ↓  Filter: last 24 hours, English language, financial sources

STEP 2 — PREPROCESSING
  ↓  Clean text: remove HTML, special chars, truncate to 512 tokens
  ↓  Deduplicate: same story from multiple sources = count once

STEP 3 — FINBERT SCORING
  ↓  Run each headline through FinBERT
  ↓  Output: label (positive/negative/neutral) + confidence score
  ↓  Convert to numeric: +1×confidence, -1×confidence, 0

STEP 4 — DAILY AGGREGATION
  ↓  For each ticker, aggregate all today's scores:
     → mean_sentiment, pct_positive, pct_negative, news_volume
  ↓  Apply rolling: 3-day sentiment moving average

STEP 5 — SIGNAL INTEGRATION
  ↓  Merge sentiment features with OHLCV feature matrix
  ↓  Use as additional input to XGBoost model OR as veto rule:
     If mean_sentiment < -0.30 → block long entry
     If mean_sentiment > +0.30 and ML_prob > 0.55 → confirm entry

STEP 6 — OUTPUT
  ↓  Updated signal report includes sentiment column
  ↓  Flag tickers with strongly negative/positive sentiment for DMB
```

"This is not a toy pipeline. Versions of this run at every major
systematic fund that uses alt data. The sophistication level here
is commercially relevant."

**Topic B: Evaluating Sentiment Signal Quality (15 min)**

"Before integrating sentiment into trading decisions, we evaluate it
the same way we evaluate any other signal:

**IC Test:**
Compute daily sentiment score for a ticker over 6+ months.
Compute forward 5-day return for the same period.
IC = Spearmanr(sentiment_score, fwd_return).
Sentiment IC > 0.04 = genuine predictive value.
Most studies find IC of 0.03–0.07 for quality news sentiment.
Social media sentiment (Reddit, Twitter) tends to be noisier: 0.01–0.04.

**Lead-lag analysis:**
Does same-day sentiment predict same-day return?
Or does yesterday's sentiment predict today's return (1-day lag)?
Or does the sentiment of the last 3 days predict next 5 days?
The lag that maximizes IC tells you HOW the market processes sentiment.
Fast-moving stocks may price in sentiment same-day.
Slower-moving ones may have a 1–2 day lag.

**News volume as a feature:**
The number of headlines is as important as their tone.
High news volume + negative sentiment = confirmed negative signal.
High news volume + positive sentiment = confirmed positive signal.
Low news volume + any sentiment = unreliable — thin data.

**Reversal at extremes:**
Extreme negative sentiment (bottom 5% historically) often precedes
a bounce — capitulation signal. This is the contrarian use case
we discussed Monday of Week 13. Build this detection in Wednesday."

**Topic C: Combining Sentiment with ML (10 min)**

"Three architectures for combining ML predictions and sentiment:

**Architecture 1 — Feature integration (cleanest):**
Add sentiment features directly to the XGBoost feature matrix.
Let the model learn the optimal combination weight.
The model discovers whether sentiment improves IC by itself.
Run IC with vs. without sentiment features.

**Architecture 2 — Signal confirmation (most conservative):**
Keep ML signal and sentiment as separate systems.
Only trade when BOTH agree: ML_prob > 0.55 AND sentiment > 0.
Reduces false positives but also reduces signal frequency.

**Architecture 3 — Weighted combination:**
Final_Score = w1 × ML_prob + w2 × sentiment_norm
where w1 + w2 = 1. Backtest-optimize the weights.
Risk: additional optimization parameter → overfitting risk."

---

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 minutes

1. "NewsAPI free tier gives 100 requests per day and a 1-month
   lookback limit. What are the implications for backtesting a
   sentiment signal? How would you build a historical sentiment
   dataset given these constraints?"
   *(Expected: you can't easily backtest historical sentiment with
   the free tier. Options: use Alpaca news which has better history,
   screen-scrape and store locally (legal gray area), use a proxy
   like GDELT (free but coarser), or accept that sentiment signal
   backtesting requires paid data. In Month 5 we paper trade with
   live sentiment going forward — no historical backtest needed.)*

2. "A pharmaceutical stock gets 50 negative headlines about a
   failed drug trial. FinBERT scores all 50 as 'negative.'
   Is the aggregate score meaningful, or are all 50 headlines
   the same story counted 50 times?"
   *(Expected: deduplication matters enormously. 50 headlines about
   one event = 1 news event repeated 50 times, not 50 independent
   negative signals. Deduplication by source + time window is essential.)*

3. "Devil's advocate: Retail traders can access sentiment signals
   from free tools like StockTwits and social media scrapers.
   If everyone has the same sentiment data, is there still an edge?"
   *(Expected: the edge is in speed, quality, and integration.
   Manual StockTwits scanning vs. automated FinBERT scoring on
   structured news — the systematic approach is more consistent,
   faster, and integrated with other signals. The edge is in
   the pipeline, not just the data.)*

---

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 minutes

**Wednesday workshop:**
"We build the live sentiment pipeline end to end —
NewsAPI fetch, FinBERT scoring, daily aggregation, signal report integration.
Starter: `W18_workshop_live_sentiment_starter.ipynb`
Have your NewsAPI key in `.env` before class."

**Pre-reading:**
- NewsAPI Python quickstart: newsapi.org/docs
  (`pip install newsapi-python`)

**Closing reflection:**
*"The ticker I most want to run live sentiment on — and why — is ___."*

---

## Wednesday, August 12, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Block 4 — Observation Assignment:**
"Before tonight's class, manually find 3 headlines from today
about your primary trading ticker. Write them down.
Then note: what do you expect FinBERT to score each one?
We'll compare your prediction to the model's output tonight."

---

### Wednesday, August 12, 2026 — Workshop Session
**Time:** 8:00–9:30 PM EST
**Topic:** Live NewsAPI + FinBERT Sentiment Pipeline — Production Build
**Curriculum source:** Wiki Section 6.2
**Notebook:** `W18_workshop_live_sentiment_[initials].ipynb`

---

#### Block 1 — Framing & Context Bridge (8:00–8:10 PM) | 10 minutes

"In Month 2, we ran FinBERT on hardcoded headlines.
In Month 4, we used simulated sentiment.
Tonight we connect to the live internet.
Real headlines. Real companies. Real scores. Today's data.

The output of tonight's session is a production-ready function
that you run every morning alongside the signal monitor.
It takes a ticker, fetches today's news, scores it, and returns
a number you can act on. That function does not exist yet.
By 9:30 PM it will."

---

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 minutes

```python
from newsapi import NewsApiClient
from transformers import pipeline
import pandas as pd
import numpy as np
import yfinance as yf
from datetime import datetime, timedelta
import os
import re
import hashlib
from dotenv import load_dotenv
load_dotenv()

# Initialize NewsAPI
newsapi = NewsApiClient(api_key=os.getenv('NEWSAPI_KEY'))

# Initialize FinBERT (cached after first load)
print("Loading FinBERT... (first run downloads model)")
finbert = pipeline(
    "sentiment-analysis",
    model="ProsusAI/finbert",
    tokenizer="ProsusAI/finbert",
    truncation=True,
    max_length=512
)
print("FinBERT ready ✓")
```

**Step 1 — News fetcher with deduplication (12 min)**
```python
def fetch_ticker_news(ticker, company_name=None,
                       hours_back=24, max_articles=20):
    """
    Fetch recent news headlines for a ticker via NewsAPI.
    Deduplicates by content hash to avoid counting same story multiple times.
    """
    # Build query: ticker symbol + optional company name
    query_parts = [ticker]
    if company_name:
        query_parts.append(company_name)
    query = ' OR '.join(f'"{q}"' for q in query_parts)

    since = (datetime.now() - timedelta(hours=hours_back)).strftime('%Y-%m-%dT%H:%M:%S')

    try:
        response = newsapi.get_everything(
            q=query,
            language='en',
            sort_by='publishedAt',
            from_param=since,
            page_size=min(max_articles, 100)
        )
        articles = response.get('articles', [])
    except Exception as e:
        print(f"NewsAPI error for {ticker}: {e}")
        return []

    # Deduplicate by content hash
    seen_hashes = set()
    unique_articles = []

    for article in articles:
        title   = article.get('title', '') or ''
        desc    = article.get('description', '') or ''
        content = (title + desc).lower().strip()

        # Hash first 200 chars for deduplication
        content_hash = hashlib.md5(content[:200].encode()).hexdigest()

        if content_hash not in seen_hashes and len(content) > 20:
            seen_hashes.add(content_hash)
            unique_articles.append({
                'ticker':       ticker,
                'title':        title,
                'description':  desc[:300] if desc else '',
                'source':       article.get('source', {}).get('name', 'Unknown'),
                'published_at': article.get('publishedAt', ''),
                'text':         f"{title}. {desc[:200]}" if desc else title
            })

    print(f"  {ticker}: {len(articles)} raw → {len(unique_articles)} unique headlines")
    return unique_articles

# Test with a few tickers
test_tickers = ['SPY', 'AAPL', 'NVDA']
all_news = {}
print("\nFetching live news...")
for ticker in test_tickers:
    all_news[ticker] = fetch_ticker_news(ticker, hours_back=24)
```

**Step 2 — FinBERT scoring with batch efficiency (10 min)**
```python
def score_headlines_finbert(articles, model=finbert):
    """
    Score a list of article dicts through FinBERT.
    Returns articles with sentiment label, confidence, and numeric score.
    """
    if not articles:
        return []

    texts  = [a['text'] for a in articles]
    scores = model(texts)

    label_map = {'positive': 1, 'negative': -1, 'neutral': 0}
    scored    = []

    for article, result in zip(articles, scores):
        label   = result['label']
        conf    = result['score']
        numeric = label_map[label] * conf

        scored.append({
            **article,
            'sentiment_label':   label,
            'sentiment_conf':    round(conf, 4),
            'sentiment_numeric': round(numeric, 4)
        })

    return scored

# Score all fetched news
print("\nScoring headlines with FinBERT...")
scored_news = {}
for ticker, articles in all_news.items():
    if articles:
        scored_news[ticker] = score_headlines_finbert(articles)
        scores = [a['sentiment_numeric'] for a in scored_news[ticker]]
        print(f"  {ticker}: mean={np.mean(scores):+.3f} | "
              f"pos={sum(1 for s in scores if s>0.1)} | "
              f"neg={sum(1 for s in scores if s<-0.1)} | "
              f"n={len(scores)}")
    else:
        scored_news[ticker] = []
        print(f"  {ticker}: no news today")
```

**Step 3 — Daily aggregation function (10 min)**
```python
def aggregate_daily_sentiment(scored_articles):
    """
    Aggregate scored articles into daily sentiment features.
    Returns a dict of sentiment metrics for one ticker/day.
    """
    if not scored_articles:
        return {
            'sent_mean':        0.0,
            'sent_pct_pos':     0.0,
            'sent_pct_neg':     0.0,
            'sent_volatility':  0.0,
            'news_volume':      0,
            'sent_extreme_neg': False,
            'sent_extreme_pos': False,
            'data_quality':     'no_news'
        }

    scores  = [a['sentiment_numeric'] for a in scored_articles]
    labels  = [a['sentiment_label'] for a in scored_articles]
    n       = len(scores)
    mean    = np.mean(scores)
    pct_pos = sum(1 for l in labels if l == 'positive') / n
    pct_neg = sum(1 for l in labels if l == 'negative') / n
    vol     = np.std(scores)

    return {
        'sent_mean':        round(mean, 4),
        'sent_pct_pos':     round(pct_pos, 4),
        'sent_pct_neg':     round(pct_neg, 4),
        'sent_volatility':  round(vol, 4),
        'news_volume':      n,
        'sent_extreme_neg': mean < -0.40,   # Potential capitulation
        'sent_extreme_pos': mean > +0.40,   # Potential euphoria
        'data_quality':     'high' if n >= 5 else 'low' if n >= 2 else 'minimal'
    }

# Aggregate for all tickers
print("\nDaily Sentiment Summary:")
print("─"*60)
sentiment_features = {}
for ticker, articles in scored_news.items():
    features = aggregate_daily_sentiment(articles)
    sentiment_features[ticker] = features
    print(f"{ticker:6s} | mean={features['sent_mean']:+.3f} | "
          f"pos={features['sent_pct_pos']:.0%} neg={features['sent_pct_neg']:.0%} | "
          f"n={features['news_volume']:3d} | quality={features['data_quality']}")
    if features['sent_extreme_neg']:
        print(f"  ⚠️  EXTREME NEGATIVE — potential capitulation signal")
    if features['sent_extreme_pos']:
        print(f"  ⚠️  EXTREME POSITIVE — potential euphoria / fade signal")
```

**Step 4 — Integrate with signal monitor (8 min)**
```python
def run_full_signal_pipeline(watchlist, strategy_params, finbert_model=None):
    """
    Complete pipeline: features + ML + sentiment → signal report.
    Extends the W13 signal monitor with live sentiment.
    """
    print(f"\n{'='*60}")
    print(f"FULL SIGNAL PIPELINE — {datetime.now().strftime('%Y-%m-%d %H:%M')}")
    print(f"{'='*60}")

    results = []

    for ticker in watchlist:
        print(f"\n── {ticker} ──")

        # 1. Technical features
        features = compute_features(ticker)  # From W13
        if not features:
            continue

        # 2. Rules-based signal check
        rules_signal = evaluate_signal(features, strategy_params)  # From W13
        if not rules_signal:
            continue

        # 3. Live sentiment
        articles  = fetch_ticker_news(ticker, hours_back=24)
        if articles and finbert_model:
            scored    = score_headlines_finbert(articles, finbert_model)
        else:
            scored    = []
        sentiment = aggregate_daily_sentiment(scored)

        # 4. Combined decision
        tech_signal  = rules_signal['signal_fired']
        sent_score   = sentiment['sent_mean']
        sent_veto    = sent_score < strategy_params.get('sentiment_veto', -0.30)
        news_quality = sentiment['data_quality']

        final_signal = tech_signal and not sent_veto
        confidence   = 'HIGH' if (tech_signal and sent_score > 0.10
                                   and news_quality == 'high') else \
                       'MEDIUM' if tech_signal and not sent_veto else \
                       'LOW'

        results.append({
            'ticker':        ticker,
            'tech_signal':   tech_signal,
            'sent_score':    round(sent_score, 4),
            'sent_quality':  news_quality,
            'sent_veto':     sent_veto,
            'final_signal':  final_signal,
            'confidence':    confidence,
            'n_articles':    sentiment['news_volume'],
            'extreme_neg':   sentiment['sent_extreme_neg'],
        })

        status = "🔔 SIGNAL" if final_signal else \
                 "🚫 VETOED" if (tech_signal and sent_veto) else \
                 f"  {rules_signal['conditions_met']}/{rules_signal['conditions_total']} cond"
        print(f"  {status} | sent={sent_score:+.3f} | n_articles={sentiment['news_volume']}")

    results_df = pd.DataFrame(results)

    confirmed = results_df[results_df['final_signal']]
    print(f"\n{'─'*60}")
    print(f"Final confirmed signals: {len(confirmed)}/{len(results_df)}")

    return results_df

# Run the full pipeline
WATCHLIST = ['SPY', 'QQQ', 'AAPL', 'MSFT', 'NVDA']
STRATEGY_PARAMS = {
    'rsi_entry': 32, 'ema_distance': 0.02,
    'vol_ratio_max': 2.5, 'sentiment_veto': -0.30,
    'portfolio_value': 1_000_000
}

signal_df = run_full_signal_pipeline(
    WATCHLIST, STRATEGY_PARAMS, finbert_model=finbert
)
```

---

#### Block 3 — Independent / Pair Work (8:50–9:15 PM) | 25 minutes

**Core Exercise:**
Run the full pipeline on your personal watchlist.
Compare your pre-class headline predictions to FinBERT's actual scores.
Answer in markdown:
1. Which headlines did FinBERT score differently from your expectation?
   Why do you think the model scored them that way?
2. Did any tickers get a sentiment veto that your rules would have entered?
   In retrospect — was the veto correct?
3. For your primary trading ticker: what is today's sentiment score?
   How does it compare to last week's trading behavior?

**Extension Challenge:**
Build a 5-day rolling sentiment tracker:
Fetch news for the last 5 trading days for one ticker.
Plot the rolling mean sentiment score vs. price.
Is there a visible lead-lag relationship?

---

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 minutes

**Share-out:** Headline comparison — where did students disagree with FinBERT?
"These disagreements are the most interesting data points.
They reveal either FinBERT's limitations or your own cognitive biases.
Both are worth understanding."

**Muddiest Point:**
> *"The muddiest point from tonight was ___."*

**Notebook submission:** `W18_workshop_live_sentiment_[initials].ipynb` to GitHub.

---

## Friday, August 14, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Portfolio Pulse:** Full account summary.
"Who ran the live sentiment pipeline this morning before the DMB?
What did it flag?"

---

### Friday, August 14, 2026 — Review & Market Session
**Time:** 8:00–9:30 PM EST
**Topic:** Week 18 Review + Combined Signal Audit on This Week's Market

---

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 minutes

1. "Explain the deduplication step in the news pipeline.
   Why is it essential? Give an example of what happens without it."

2. "The sentiment pipeline returned a score of -0.42 for NVDA today.
   The technical signal fired. What do you do?
   Walk me through the decision tree."

3. "News volume is a feature in the pipeline.
   'Low volume + negative sentiment' vs. 'high volume + negative sentiment'
   — which is a stronger signal and why?"

4. "What is the lead-lag relationship in sentiment? Give an example
   of a case where same-day sentiment is the wrong lag to use."

5. "Your pipeline takes 4 minutes to run for 10 tickers.
   At scale — 500 tickers — that's 200 minutes.
   How would you architect this to run in under 5 minutes total?"
   *(Expected: parallelization with Python's concurrent.futures or
   asyncio, batch FinBERT processing, caching previously scored articles
   by hash, running only on tickers with new articles since last scan.)*

---

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 minutes

**Sentiment retrospective:**
"Pull up each ticker that had a sentiment signal this week.
What did the score say? What did price do?
Were there any cases where extreme negative sentiment preceded a bounce?
Were there cases where the veto would have blocked a winning trade?"

Standard chart review: SPY, QQQ, VIX, sectors.

---

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 minutes
Standard checklist.

---

#### Block 4 — Next Week Preview & Close (9:20–9:30 PM) | 10 minutes

**Next week:** Multi-signal architecture —
combining XGBoost + sentiment + technical in a single decision framework.
This is the capstone strategy's engine.

**Assign reading:**
- Wiki Section 6.4 — Multi-agent AI (re-read, now applied context)
- Review W17 XGBoost notebook and W18 sentiment notebook —
  we connect them next week

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

---

# WEEK 19 — Multi-Signal Architecture
**Theme:** No single signal is robust enough to trade alone. The edge lives in how signals combine.

---

## Monday, August 17, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Portfolio Pulse:** Standard. Add: note which signals (rules, ML, sentiment)
have been most active this week in your pipeline.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "During market hours, identify one trade where
your rules signal said yes, your ML model said yes, and sentiment said yes.
And one trade where they disagreed. Bring both to class tonight."

---

### Monday, August 17, 2026 — Theory Session
**Time:** 8:00–9:30 PM EST
**Topic:** Multi-Signal Strategy Architecture — Combining Signals Rigorously
**Curriculum source:** Wiki Sections 6.3, 6.4

#### Pre-Session Requirements
- [ ] W17 XGBoost and W18 sentiment notebooks reviewed
- [ ] Both pipelines running and producing output

---

#### Block 1 — Day Review (8:00–8:15 PM) | 15 minutes

"Who found a day where all three signals agreed?
Who found a day where they disagreed? Walk me through both.
When signals disagree — what do you do? That's tonight's question."

---

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 minutes

**Topic A: Why Signal Combination Works (10 min)**

"Each signal captures a different aspect of market behavior:
- Technical rules: price and volume patterns
- ML model: non-linear feature combinations
- Sentiment: news-driven information flow

These are partially independent. They are not perfectly correlated.
When independent signals agree, the probability of a true positive
increases significantly — this is the core logic of ensemble methods.

In machine learning this is called ensemble stacking.
In quant trading it is called multi-factor alpha.
The intuition is the same: combining signals that are each
moderately predictive and somewhat independent produces a result
stronger than any one alone."

**Topic B: Three Combination Architectures (25 min)**

Walk through three concrete architectures with code pseudocode:

**Architecture 1 — Hard Gate (Most Conservative)**
```
All conditions must be true to enter:
  tech_signal AND (ml_prob > 0.55) AND (sentiment > 0.0) → BUY

Outcome: Fewer signals, higher precision, lower recall.
Use when: capital preservation is the primary goal.
Risk: misses good trades where one signal lags the others.
```

**Architecture 2 — Scoring System (Balanced)**
```
Each signal contributes points. Enter above a threshold score.

  Signal Score = w1×tech_score + w2×ml_prob + w3×sentiment_norm
  where w1 + w2 + w3 = 1.0

  tech_score:     0 (no signal) or 1 (signal fires) × 0.35
  ml_prob:        raw probability × 0.45
  sentiment_norm: (sentiment + 1) / 2, normalized to [0,1] × 0.20

  Enter if Signal_Score > 0.55

Outcome: Smooth signal, naturally handles partial agreement.
Use when: want to capture more opportunities with moderate risk tolerance.
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

Outcome: Adapts to market conditions. Strategy switches between modes.
Use when: you have high confidence in regime detection.
Risk: regime misclassification creates abrupt strategy changes.
```

**Topic C: The Multi-Agent AI Concept (10 min)**

Walk through Wiki Section 6.4 multi-agent framework.

"In a full production system, each of our signals becomes an agent:
- **Market Data Agent**: fetches and processes OHLCV, computes features
- **Technical Agent**: evaluates rules-based entry conditions
- **ML Agent**: runs XGBoost inference, outputs probability
- **Sentiment Agent**: fetches news, runs FinBERT, outputs sentiment score
- **Risk Agent**: checks position sizing, portfolio limits, pre-trade clearance
- **Supervisor Agent**: receives all agent outputs, makes final decision

Each agent is a Python function. The supervisor calls them in sequence
and applies the combination architecture to make a final buy/no-buy decision.

This is not theoretical — we implement a simplified version Wednesday.
The LangGraph multi-agent concept from the wiki is the production version
of exactly this pattern."

---

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 minutes

1. "You backtest Architecture 1 (hard gate) and Architecture 2 (scoring).
   Architecture 2 has higher Sharpe (1.4 vs. 1.1) but 3× more trades.
   Which do you deploy and why? What additional information do you need?"
   *(Expected: need to know execution capacity — can you actually
   execute 3× more trades without excessive market impact?
   Also: is the Sharpe improvement on OOS data or just in-sample?
   And: what is max drawdown for each? Higher Sharpe with much worse
   drawdown may not be worth it.)*

2. "The weight optimization in Architecture 2 has 3 parameters (w1, w2, w3).
   That's a small optimization problem. Is overfitting a real concern here?
   How would you set the weights without optimizing on the trading data?"
   *(Expected: Yes, overfitting concern even with 3 params is real.
   Options: use equal weights as default, use domain knowledge
   (IC of each signal as the weight), or optimize on training data
   and evaluate on OOS data that was never seen. Never optimize
   and evaluate on the same data.)*

3. "Devil's advocate: Adding more signals adds complexity.
   More complexity = more failure modes. A simple 1-signal strategy
   that works is better than a complex 3-signal strategy that's fragile.
   Defend or refute this."
   *(Expected: valid concern. Occam's razor applies in quant.
   The combination is only justified if it provides meaningful IC improvement
   over the best single signal, on out-of-sample data. If signal combination
   adds <0.01 IC but doubles the code complexity — don't combine.
   Complexity must earn its keep in the data.)*

---

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 minutes

**Wednesday workshop:**
"We implement Architecture 2 (scoring system) as a complete multi-signal
strategy. Then we backtest it against each individual signal.
IC comparison, Sharpe comparison, signal frequency comparison.
Starter: `W19_workshop_multisignal_starter.ipynb`

Bring: your W17 XGBoost model object (save it as a pickle file),
your W18 sentiment pipeline, and your W13 signal monitor config."

**Closing reflection:**
*"The architecture I most want to test Wednesday is ___ because ___."*

---

## Wednesday, August 19, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Portfolio Pulse:** Standard.

---

### Wednesday, August 19, 2026 — Workshop Session
**Time:** 8:00–9:30 PM EST
**Topic:** Multi-Signal Strategy Implementation + Backtest
**Curriculum source:** Wiki Sections 6.3, 6.4
**Notebook:** `W19_workshop_multisignal_[initials].ipynb`

---

#### Block 1 — Framing & Context Bridge (8:00–8:10 PM) | 10 minutes

"Three weeks ago we trained XGBoost.
Two weeks ago we connected live sentiment.
Tonight we wire them together into a single decision framework.

One input goes in: today's market state.
One output comes out: enter, don't enter, score.

After building it, we evaluate whether combining signals improves
on the best individual signal. If it does — we have the engine
for the capstone strategy. If it doesn't — we learn why and adjust."

---

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 minutes

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
# (Students save their W17 model: pickle.dump(model, open('xgb_model.pkl','wb')))
try:
    with open('xgb_model.pkl', 'rb') as f:
        xgb_model = pickle.load(f)
    print("XGBoost model loaded ✓")
except FileNotFoundError:
    print("Model not found — will retrain inline")
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
    # Extreme negative sentiment always overrides
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
        'sent_veto':       sent_veto,
        'decision':        decision
    }

# Test on current features
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
    # Build feature matrix on OOS period
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

    # ML signal (using model on feature matrix subset)
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

    # Sentiment (static 0 for backtest — live in paper trading)
    df['Sent_Norm']     = 0.5   # Neutral assumption for historical
    df['Composite']     = (0.35 * df['Tech_Signal'] +
                           0.45 * df['ML_Prob'] +
                           0.20 * df['Sent_Norm'])
    df['Multi_Signal']  = (df['Composite'] > 0.60).astype(int)

    # Evaluate each signal by IC and mean forward return
    def signal_stats(signal_col, label):
        signal_rows    = df[df[signal_col] == 1]
        baseline       = df['Ret_5d']
        signal_returns = signal_rows['Ret_5d']

        if len(signal_rows) < 5:
            return {'signal': label, 'n': 0, 'ic': 0, 'mean_ret': 0, 'win_rate': 0}

        ic, pval = spearmanr(df[signal_col], df['Ret_5d'])
        return {
            'signal':     label,
            'n_signals':  int(df[signal_col].sum()),
            'frequency':  df[signal_col].mean(),
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
    print(f"MULTI-SIGNAL COMPARISON — {ticker} | {start} → {end}")
    print(f"{'='*65}")
    print(comparison.to_string(index=False))
    print(f"\nBaseline (all days) — mean 5d return: {df['Ret_5d'].mean():.5f}")

    return df, comparison

df_bt, comparison = backtest_multisignal('SPY', xgb_model, strategy_params)
```

---

#### Block 3 — Independent / Pair Work (8:50–9:15 PM) | 25 minutes

**Core Exercise:**
Run `backtest_multisignal()` on your personal target ticker.
Answer in markdown:
1. Did the multi-signal strategy have a higher IC than the best single signal?
2. Did it have more or fewer signals than the rules-based strategy?
3. Is the multi-signal strategy suitable as the basis for your capstone?
   What would you change?
4. Write one paragraph describing your capstone strategy architecture
   using the three-component framework (tech + ML + sentiment).

**Extension Challenge:**
Test Architecture 1 (hard gate) vs. Architecture 2 (scoring) on the same data.
Which produces higher IC? Which produces higher mean forward return?
Build a comparison table.

---

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 minutes

**Share-out:** Multi-signal comparison results.
"Who had the combination beat both individual signals?
Who found one signal dominated? What does that tell you
about the information value each signal adds?"

**Muddiest Point:**
> *"The muddiest point from tonight was ___."*

**Notebook submission:** `W19_workshop_multisignal_[initials].ipynb` to GitHub.

---

## Friday, August 21, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Portfolio Pulse:** Standard. Note any multi-signal confirmations this week.

---

### Friday, August 21, 2026 — Review & Market Session
**Time:** 8:00–9:30 PM EST
**Topic:** Week 19 Review + Multi-Signal Live Audit + Capstone Design Briefing

---

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 minutes

1. "Explain the scoring system architecture in plain English.
   Walk me through a concrete example where the three signals disagree
   and show me what the score would be."

2. "In the backtest, sentiment was set to neutral (0.5).
   Why? And what does this mean for the multi-signal comparison result?"

3. "Your multi-signal IC was 0.062 vs. XGBoost-only IC of 0.071.
   The combination performs WORSE. What are the possible explanations?
   What do you do with this finding?"

4. "You have 3 signals, each with IC ~0.05. Their pairwise correlation
   is 0.85. Does combining them help? Why or why not?"
   *(Expected: No — highly correlated signals don't add information.
   The combination benefit comes from LOW correlation between signals.
   Check correlation between signal outputs before combining.)*

5. "Describe your capstone strategy architecture in one sentence —
   not the indicators, the ARCHITECTURE: what signals, how combined,
   what risk framework."

---

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 minutes

"This week is also a dry run for the capstone.
For each student: did the multi-signal pipeline fire this week?
What did the composite score look like on Monday, Wednesday, Friday?
Did you take any paper trades based on the combined signal?
If yes — how did it perform?"

Standard chart review.

---

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 minutes
Standard checklist.

---

#### Block 4 — Capstone Design Briefing & Close (9:20–9:30 PM) | 10 minutes

"Next week is Week 20 — the last week of Month 5.
Monday is the capstone design session. Wednesday you build the specification
document. Friday you present and lock the hypothesis.

The capstone specification must include:
1. Strategy name and one-sentence hypothesis
2. Target asset universe (which tickers, what market cap range)
3. Signal architecture: which of our three signals, how combined
4. Feature engineering plan: which features, which period, which model
5. Risk framework: position sizing model, stop logic, max positions
6. Paper trading plan for Month 6: minimum trades, review cadence
7. Success metrics: target Sharpe, win rate, alpha vs. SPY

Spend the weekend drafting this. Monday we discuss and refine.
Wednesday we formalize. Friday we lock it. No changes after Friday."

**Assign reading:**
- Review all workshop notebooks from Months 4–5
- Review your Milestone 3 forward plan
- Think hard about what you want Month 6 to produce

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

---

# WEEK 20 — Capstone Strategy Design & Month 5 Close
**Theme:** Everything we've built points to this. Design the strategy you'll run in Month 6.

---

## Monday, August 24, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Portfolio Pulse:** Month 5 Week 4. Full summary.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Open your capstone strategy draft.
Find the single weakest point in your design — the assumption you
are least confident about. Write it down. We'll address it tonight."

---

### Monday, August 24, 2026 — Theory Session
**Time:** 8:00–9:30 PM EST
**Topic:** Capstone Strategy Architecture — Design Principles + Common Failure Modes
**Curriculum source:** All prior content, synthesized

#### Pre-Session Requirements
- [ ] Capstone strategy draft written (all 7 sections)
- [ ] W19 multi-signal comparison results reviewed
- [ ] Weakest assumption identified (DMB observation)

---

#### Block 1 — Day Review & Draft Review (8:00–8:15 PM) | 15 minutes

"Who has a draft capstone? Let's hear the one-sentence hypothesis
from each person. Just the hypothesis. Not the full plan.
One sentence. If you can't state it in one sentence —
the strategy is not well-defined enough yet."

---

#### Block 2 — Capstone Design Session (8:15–8:55 PM) | 40 minutes

Tonight is not a lecture — it is a structured design review.
Instructor facilitates. Students present and critique each other.

**Round 1 — Hypothesis stress test (20 min):**
Each student reads their one-sentence hypothesis.
Class asks: "What would falsify this? What market condition would break it?
Is this testable with the tools we have?"
Instructor ensures every hypothesis is specific, testable, and falsifiable.

**Round 2 — Architecture review (20 min):**
Each student states:
1. Which signal architecture they're using (gate / scoring / regime-conditional)
2. Which features they'll include in the ML model
3. What the sentiment integration looks like
4. The risk framework in two sentences

Class gives one challenge per student.
Instructor flags any architectures that appear to be overfitting risks,
underdetermined, or logistically impossible in Month 6.

Common failure modes to flag:
- "Too many free parameters" — scoring weights + RSI threshold +
  ADX threshold + sentiment threshold = 4 optimization targets.
  Warn: optimize only on training data, lock everything before Month 6.
- "Universe too broad" — 'all S&P 500 stocks' requires data and
  compute infrastructure. Narrow to 20–30 tickers for Month 6 paper.
- "Backtest period too short" — less than 2 years of training data
  is insufficient for XGBoost. Flag and require minimum 3y.
- "Exit logic not defined" — entry is clear but exit is vague.
  'When the position looks bad' is not an exit rule.

---

#### Block 3 — Capstone Specification Requirements (8:55–9:15 PM) | 20 minutes

Walk through the Milestone 4 capstone deliverable format from
Wiki Section 9 (Semester Milestones):

"The capstone specification document due Wednesday must contain:

**Section 1 — Strategy Identity:**
Name, version number, one-sentence hypothesis, edge statement
(what market inefficiency are you exploiting and why does it persist?)

**Section 2 — Universe and Data:**
Target tickers (list them), data period, data sources,
any alternative data (sentiment, macro, etc.)

**Section 3 — Feature Engineering:**
Complete list of features to be included in the ML model.
Feature selection rationale — IC evidence for each.
Any features removed from W06 matrix and why.

**Section 4 — Signal Architecture:**
Which architecture (gate/scoring/regime-conditional).
Weights or thresholds for each signal component.
How parameters were determined (IC-based, equal-weight, or backtested
on specific training data period — state which).

**Section 5 — Risk Framework:**
Position sizing model and parameters.
Stop loss logic.
Maximum concurrent positions.
Portfolio beta target.
Drawdown circuit breakers.

**Section 6 — Month 6 Paper Trading Plan:**
Minimum trades per week.
How signals will be monitored (automated pipeline).
Journal entry requirements.
Weekly review process.

**Section 7 — Success Metrics:**
Target Sharpe (minimum acceptable for Month 6).
Target win rate.
Target alpha vs. SPY.
Criteria for concluding the strategy works or doesn't."

---

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 minutes

**Wednesday workshop:**
"Final capstone specification document workshop.
Starter: `W20_workshop_capstone_spec_starter.ipynb`
This notebook generates a structured capstone document, runs
a final IC validation on your chosen features, and produces
the signal report that will run in Month 6 week 1.

Come with all 7 sections drafted in any format.
Wednesday we formalize and validate."

---

## Wednesday, August 26, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Portfolio Pulse:** Penultimate session of Month 5.

---

### Wednesday, August 26, 2026 — Workshop Session
**Time:** 8:00–9:30 PM EST
**Topic:** Capstone Specification Document + Final Validation
**Curriculum source:** All Month 5 content
**Notebook:** `W20_workshop_capstone_spec_[initials].ipynb`

---

#### Block 1 — Framing (8:00–8:10 PM) | 10 minutes

"Tonight we do three things:
1. Generate the formal capstone specification document
2. Run a final IC validation on the chosen feature set
3. Produce the Month 6 signal pipeline configuration

At the end of tonight, every student will have a complete, locked
specification document. Friday you present it. After Friday, no changes.
Month 6 trades the capstone strategy as designed — not as revised."

---

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 minutes

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
# Students fill this with their finalized strategy parameters
# This object drives ALL Month 6 trading

CAPSTONE_CONFIG = {

    # Strategy Identity
    'strategy_name':        'Your Strategy Name Here',
    'version':              '1.0',
    'hypothesis':           'Your one-sentence hypothesis here',
    'edge_statement':       'The edge exists because ...',

    # Universe
    'tickers':              ['SPY', 'QQQ', 'AAPL'],  # Replace with your list
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
    'architecture':         'SCORING',   # 'GATE', 'SCORING', 'REGIME'
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

    print(f"\nFeature IC Validation (training period → {training_end})")
    print("="*65)

    all_ic_results = []

    for ticker in tickers:
        df = yf.download(ticker, end=training_end, period='4y',
                          interval='1d', progress=False)
        df.columns = [c[0] if isinstance(c, tuple) else c for c in df.columns]

        # Compute all features
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

        # Forward return label
        df['Fwd_Return'] = df['Close'].pct_change(fwd_days).shift(-fwd_days)
        df.dropna(inplace=True)

        ticker_ics = {'ticker': ticker}
        for feat in features:
            if feat in df.columns:
                # Negate RSI/Stoch (lower = more bullish)
                sign   = -1 if feat in ['RSI_14', 'RSI_7', 'Stoch_K'] else 1
                ic, pv = spearmanr(sign * df[feat], df['Fwd_Return'])
                ticker_ics[feat] = round(ic, 4)
                all_ic_results.append({
                    'ticker': ticker, 'feature': feat,
                    'ic': ic, 'pval': pv,
                    'significant': pv < 0.05
                })

    ic_df = pd.DataFrame(all_ic_results)

    # Summary by feature
    feat_summary = ic_df.groupby('feature').agg(
        mean_ic=('ic', 'mean'),
        std_ic=('ic', 'std'),
        n_significant=('significant', 'sum'),
        n_tickers=('ticker', 'count')
    ).round(4).sort_values('mean_ic', ascending=False)

    print(f"\n{'Feature':<20} {'Mean IC':>10} {'Std':>8} {'Sig/Total':>12}")
    print("─"*55)
    for feat, row in feat_summary.iterrows():
        flag = " ✓" if row['mean_ic'] > 0.04 else \
               " ⚠️" if row['mean_ic'] > 0.02 else " ✗"
        print(f"{feat:<20} {row['mean_ic']:>10.4f} {row['std_ic']:>8.4f} "
              f"{int(row['n_significant'])}/{int(row['n_tickers']):>8}{flag}")

    # Identify features to consider dropping
    weak_features = feat_summary[feat_summary['mean_ic'] < 0.02].index.tolist()
    if weak_features:
        print(f"\n⚠️  Weak features (mean IC < 0.02): {weak_features}")
        print("  Consider removing from capstone feature set.")

    return feat_summary

ic_summary = validate_capstone_features(CAPSTONE_CONFIG)
```

**Step 3 — Save capstone specification (15 min)**
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

| Feature | Mean IC | Significant? |
|---------|---------|-------------|
"""

    for feat in config['features_to_use']:
        if feat in ic_summary.index:
            ic_val = ic_summary.loc[feat, 'mean_ic']
            sig    = "Yes ✓" if ic_val > 0.04 else "Marginal" if ic_val > 0.02 else "Weak"
            doc   += f"| {feat} | {ic_val:.4f} | {sig} |\n"
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

---

## Section 5 — Risk Framework

| Parameter | Value |
|-----------|-------|
| Risk per trade | {config['risk_pct_per_trade']:.0%} of portfolio |
| Stop loss | ATR × {config['atr_stop_multiplier']} |
| Max concurrent positions | {config['max_positions']} |
| Cash reserve | {config['cash_reserve_pct']:.0%} minimum |
| Daily drawdown halt | {config['daily_drawdown_stop']:.0%} |
| Total drawdown reduce | {config['total_drawdown_reduce']:.0%} → halve sizes |
| Portfolio beta max | {config['portfolio_beta_max']} |

---

## Section 6 — Month 6 Paper Trading Plan

- **Signal check time:** {config['signal_check_time']} daily (automated pipeline)
- **Minimum trades/week:** {config['min_trades_per_week']}
- **Target trades/week:** {config['target_trades_per_week']}
- **Journal:** Required for every trade — all fields
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
        print(f"\n✅ Capstone specification saved: {filename}")

    return doc

doc = generate_capstone_document(
    CAPSTONE_CONFIG, ic_summary,
    student_name="[YOUR NAME]"
)
```

---

#### Block 3 — Independent Work (8:50–9:10 PM) | 20 minutes

Students complete their own capstone config object and run validation.
Instructor circulates. Key questions:
- "Any weak features flagged? Will you remove them?"
- "Are your weights based on IC or arbitrary?"
- "Is your exit logic fully specified in the config?"
- "Can you run the Month 6 pipeline from this config alone, without guessing?"

---

#### Block 4 — Muddiest Point & Submission (9:10–9:30 PM) | 20 minutes

**Capstone spec review (15 min):**
2 students walk through their specification.
Class checks: is every section complete? Is the hypothesis falsifiable?
Is the risk framework operational?

**Muddiest Point (5 min):**
> *"The weakest point in my capstone design is ___."*

**Submissions:**
- `W20_workshop_capstone_spec_[initials].ipynb` → GitHub
- `capstone_spec_[initials].md` → GitHub (due before Friday DMB)

---

## Friday, August 28, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation
**Note:** Keep efficient. Capstone presentations tonight.

**Portfolio Pulse:** Final Month 5 account snapshot.

---

### Friday, August 28, 2026 — Capstone Hypothesis Lock + Month 5 Close
**Time:** 8:00–9:30 PM EST
**Format:** Capstone presentations (5 min each) + Month 5 close

---

#### Capstone Hypothesis Lock Presentations (8:00–8:50 PM)

Each student has 5 minutes (strict) to present their capstone:
1. Strategy name and one-sentence hypothesis (30 sec)
2. Architecture and key signals (1 min)
3. Feature set and IC evidence (1 min)
4. Risk framework summary (30 sec)
5. Month 6 plan and success metrics (1 min)

After each presentation: instructor and class ask ONE question.
No more. This is not the full Milestone 4 — it is hypothesis lock.

Instructor confirms or asks for revision before locking:
- Hypothesis must be specific and falsifiable
- Architecture must be implementable with our tools
- Risk framework must follow all 6 rules from Month 3
- Success metrics must be measurable and defined

Once confirmed: **hypothesis is LOCKED. No changes without a new version number.**

---

#### Month 5 Close (8:50–9:30 PM)

**Month 5 retrospective (20 min):**
"XGBoost. Live sentiment. Multi-signal architecture. Capstone design.
That's 4 weeks of work at a professional level.

What was the single hardest technical concept from Month 5?
What surprised you most about combining signals?
What do you wish you had understood earlier in the course
that would have changed how you designed your capstone?"

One answer per student. Instructor takes notes — these inform
what to reinforce in Month 6's early sessions.

**Month 6 preview (10 min):**
"Month 6 is the capstone in motion.
You trade your capstone strategy every week.
You build the final written report simultaneously.
At the end of Month 6: the Milestone 4 capstone presentation.

Everything from the last 5 months has been preparation for that.
The strategy is locked. The tools are built. The only variable is you —
whether you follow the rules, maintain the journal, and analyze honestly.

Month 6 standards are the highest of the course:
- No undocumented trades
- No parameter changes without a new version and a backtest
- Weekly analytics report due every Friday before the session
- Capstone report draft due Week 23"

**Pre-reading for Month 6, Week 1:**
- Re-read capstone specification document
- Re-read Wiki Section 8 (paper trading) and Section 9 (risk management)
- Review Week 13 signal monitor — we extend it in Week 21

**Monthly One-Liner:**
> *"Month 5 taught me ___, and Month 6 I want to ___."*

---

---

## Month 5 Instructor Summary Notes

### Content Coverage Checklist

- [ ] Wiki Section 6.3 — ML signal generation (full depth, applied) — Week 17
- [ ] Wiki Section 6.4 — Multi-agent AI (conceptual + implemented) — Week 19
- [ ] XGBoost training, CV, feature importance — Week 17 workshop
- [ ] Live NewsAPI + FinBERT pipeline — Week 18 workshop
- [ ] Multi-signal scoring architecture — Week 19 workshop
- [ ] Capstone strategy specification — Week 20 workshop

### Workshops Delivered

| Workshop | Notebook | Key Skills |
|---------|---------|-----------|
| W17 | `W17_workshop_xgboost_signal` | XGBoost training, TSCV, feature importance, IC evaluation |
| W18 | `W18_workshop_live_sentiment` | NewsAPI fetch, deduplication, FinBERT batch scoring, aggregation |
| W19 | `W19_workshop_multisignal` | Signal scoring architecture, combined backtest, IC comparison |
| W20 | `W20_workshop_capstone_spec` | Capstone config, IC validation, specification document generator |

### Pre-Built Async Package

**Week 17 Monday Async** (if cancelled — back-to-school period):
- Topic: XGBoost theory, gradient boosting intuition, feature importance
- Reading: Wiki Section 6.3 + external: "XGBoost Tutorial"
  (xgboost.readthedocs.io/en/stable/tutorials/model.html)
- Exercise: Write down your feature matrix columns and rank them
  in order of expected IC — without running code.
  Document reasoning for each ranking. Used Wednesday to compare
  against actual feature importance output.
- Due: Monday 11:59 PM

### Capstone Locks — Record per Student

```
Student: [Name]
Capstone Lock Date: August 28, 2026
Strategy Name: ___
Architecture: GATE / SCORING / REGIME
Primary Tickers: ___
Feature Count: ___
Mean Feature IC (training): ___
Risk Model: Fixed% / Kelly / ATR
Entry Threshold: ___
Sentiment Veto: ___
Target Sharpe (M6): ___
Instructor Notes: ___
Lock Confirmed: Yes / Pending Revision
```

### Notes for Month 6 Setup

Before Month 6 begins:
- [ ] All capstone specifications confirmed and locked
- [ ] Every student's signal pipeline tested and running cleanly
- [ ] NewsAPI keys active for all students
- [ ] XGBoost models saved (pickle) and version-controlled in GitHub
- [ ] Capstone report template distributed (shared in GitHub repo)
- [ ] Milestone 4 presentation format shared with students —
  Month 6 Week 4 is the capstone presentation

---

*FINN — Month 05 Lesson Plan*
*Optimization, Deep AI & Capstone Strategy Design*
*Dates: August 3 – August 28, 2026*
*Next: FINN_Month06.md — Capstone Execution, Final Analysis & Milestone 4*
