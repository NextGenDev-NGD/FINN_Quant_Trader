# FINN — Week 17: ML Signals — XGBoost on the Feature Matrix
## Optimization + Capstone Design | Month 5: Optimization, Deep AI & Capstone Strategy Design
**Dates:** August 3–8, 2026
**Week Number:** 17 of 24

---

## WEEK OVERVIEW

### Theme
Rules-based signals set a threshold and act. ML signals learn the threshold from data. Both are hypotheses. Only evidence decides. This week moves from the adaptation framework of Month 4 into full machine learning signal generation — training XGBoost on a real financial feature matrix, evaluating it rigorously with time-series cross-validation, and comparing its IC to the rules-based signal it is meant to replace or augment.

### Learning Objectives
By the end of this week, students will be able to:
- Explain why XGBoost is preferred over linear models for financial signal generation
- Build a complete ML feature matrix from OHLCV data using `pandas-ta`
- Train an `XGBClassifier` with proper time-series cross-validation (never shuffle)
- Evaluate a trading ML model with IC, precision at threshold, and OOS Sharpe
- Generate and interpret a feature importance plot
- Compare ML signal IC to rules-based RSI signal IC on the same OOS data
- Identify and diagnose overfitting in an XGBoost financial model

### Materials Needed
- `finnenv` environment — `xgboost`, `scikit-learn`, `pandas_ta`, `yfinance`, `scipy`
- Feature matrix from W06 notebook (or rebuilt from scratch tonight)
- W15 version comparison results — know your rules-based IC baseline
- Milestone 3 feedback reviewed — any gaps to address in Month 5
- Starter notebook: `W17_workshop_xgboost_signal_starter.ipynb`

### Pre-Week Checklist (Instructor)
- [ ] Push `W17_workshop_xgboost_signal_starter.ipynb` to GitHub
- [ ] Confirm `xgboost`, `scikit-learn` installed in `finnenv` (`pip install xgboost scikit-learn`)
- [ ] All students have received Milestone 3 feedback before Monday
- [ ] Assign DMB rotation for Monday, Wednesday, Friday
- [ ] Pre-build Week 17 Monday async package (back-to-school absences likely this month)

---

## MONDAY — August 3, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** First DMB of Month 5. Current portfolio value after Milestone 3.

#### Block 1 — Pre-Market Scan (9:00–9:15 AM)
Standard checklist plus Portfolio Pulse. "Welcome to Month 5. Before we open the books — how did the market behave over the last week of July? Any macro developments from the end of Month 4 that carry into today?"

#### Block 2 — Student-Led Brief (9:15–9:35 AM)
Rotating student presenter. By Month 5 the briefs should be genuinely fluent — connect pre-market data, watchlist condition, and signal report into a coherent 5-minute narrative. If a brief is still fragmented or superficial, give direct feedback. The standard increases this month.

#### Block 3 — Hypothesis Setting (9:35–9:50 AM)
Add Month 5 header: `## Month 5 — Week 17`.
Encourage ML-framed hypotheses this month: "Can you frame a hypothesis that compares a model's prediction to a rules-based threshold? That tension is the core of this month."

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Think about your current rules-based strategy. Write down its entry condition as a decision rule: 'If [feature A] and [feature B] and [feature C] then BUY.' Now ask yourself: what if the relationship between A, B, C and future returns is NOT linear and NOT fixed? What kind of tool would you need to capture a more complex relationship? Bring your answer tonight."

---

### EVENING: Theory Session (8:00–9:30 PM EST)
**Topic:** Machine Learning Signals — XGBoost, Feature Importance & Model Evaluation
**Curriculum Source:** Wiki Section 6.3 (full depth)

#### Pre-Session Setup
- [ ] Wiki Section 6.3 read in full — all five subsections
- [ ] Milestone 3 report reviewed and any instructor feedback noted
- [ ] Month 5 strategy version (from Milestone 3 forward plan) confirmed
- [ ] DMB observation written — rules-based entry conditions in English and pseudo-code

#### Block 1 — Day Review & Milestone 3 Debrief (8:00–8:15 PM) | 15 min

"Before we move into Month 5 content — quick Milestone 3 debrief. What was the single most surprising finding from your mid-review? Not P&L — something you genuinely didn't expect to discover about yourself or your strategy."

Go around the room. One sentence per student.
Then: "Keep that finding visible. Everything we build this month should address whatever you discovered at Milestone 3."

Reading check:
- "Name the 5 ML model types from the wiki. For each — one sentence on when you'd choose it over the others."
- "What is time-series cross-validation and why is shuffling a time-series dataset before splitting catastrophically wrong?"

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 min

**Topic A: Why Rules Break and Models Learn (10 min)**

"Your rules-based strategy says: 'RSI < 30 and price > EMA_20 → BUY.'
That rule assumes:
1. RSI < 30 is always the right threshold
2. The relationship between RSI and future returns is fixed over time
3. The same threshold works across different market regimes

None of those assumptions are fully correct.

A machine learning model doesn't make those assumptions. It learns the relationship between features and outcomes from data. If the relationship between RSI and returns changes in different volatility regimes — a model with regime features can learn that. If the interaction between RSI and volume surge is more predictive than either alone — a model finds that interaction automatically.

This is not magic. It is pattern recognition applied to features you design. The model is only as good as your feature matrix. 'Garbage in, garbage out' applies absolutely."

**Topic B: XGBoost — Why Quants Use It (15 min)**

"XGBoost (eXtreme Gradient Boosting) is the dominant model in systematic trading for several reasons:

1. **Handles non-linear relationships** — unlike linear regression, XGBoost captures complex interactions between features
2. **Built-in feature importance** — tells you which features drive predictions. This is research insight, not just a black box.
3. **Robust to noise** — tree-based models don't overfit on correlated features as badly as linear models do
4. **Fast** — can retrain nightly on updated data
5. **Interpretable enough** — SHAP values give per-prediction feature attribution (we cover this Wednesday)

The workflow:
- Input: feature matrix rows (each = one trading day)
- Label: 1 if next 5-day return > threshold, 0 otherwise
- Training: learn which feature combinations predict label = 1
- Prediction: for today's features, output probability of label = 1
- Signal: if probability > threshold (e.g., 0.55), generate entry signal

The model does NOT replace the strategy framework. It replaces the entry rule. Risk management, position sizing, and exit logic remain exactly as before. The only thing that changes is what triggers entry: a rules threshold → a model probability."

**Topic C: Model Evaluation for Trading (15 min)**

"Standard ML metrics (accuracy, F1) are not sufficient for trading. We need trading-specific evaluation:

**IC (Information Coefficient):**
Correlation between model probability and actual forward return.
IC > 0.05 = the model has genuine predictive value.
IC is the primary quality gate for any ML signal.

**Precision at threshold:**
Of all days where model probability > 0.55, what fraction were actually profitable over the next 5 days? This is the win rate of the model's confident predictions.

**Calibration:**
Does a 70% probability actually mean 70% of those days went up? Poorly calibrated models say 70% but only deliver 52% — they are overconfident. `sklearn.calibration.CalibratedClassifierCV` fixes this.

**Out-of-sample Sharpe:**
Backtest the strategy using only the model's signals (not rules). Compare Sharpe to the rules-based version on the same OOS data. If the model doesn't beat the rules on OOS data — the rules win.

**Decay analysis:**
Retrain monthly. Track if IC declines over time. Model decay = the signal the model learned has diminished in the market. When IC drops below 0.02 consistently — retrain or replace."

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 min

1. *"Your XGBoost model has 94% training accuracy and 53% test accuracy. What happened? What is the technical term and what does it tell you about the feature matrix?"*
   *(Expected: severe overfitting. The model memorized the training data. In financial ML, overfitting is the norm without strict prevention: time-series split, max_depth limits, early stopping, fewer trees, feature selection before training.)*

2. *"Feature importance shows that Volume_Ratio is the most predictive feature in your model by a large margin. Why might this be both exciting and suspicious?"*
   *(Expected: exciting — volume surge is a known precursor to price moves. Suspicious — volume data can be noisy, and if volume surge correlates with specific event types that don't repeat, this could be a spurious correlation. Need to test volume signal standalone for IC.)*

3. *"Devil's advocate: If XGBoost learns patterns from historical data and markets are not fully stationary, isn't every trained model already stale the moment you deploy it?"*
   *(Expected: Yes — this is the fundamental challenge of ML in finance. The answer is rolling retraining, decay monitoring, and never treating a model as permanent. Models are hypotheses with expiry dates.)*

4. *"A rules-based strategy is fully explainable: 'I bought because RSI was 28.' An XGBoost model says 'I bought because the model output was 0.67.' Which is better for learning? Which is better for live trading? Are these the same question?"*
   *(Expected: Not the same question. For learning — rules are more instructive. For performance — the model may be better. SHAP values partially bridge this gap by giving feature-level attribution per prediction.)*

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 min

**Wednesday workshop:**
"We train our first XGBoost model on the live feature matrix. We evaluate it with IC, precision, and OOS comparison. We compare it to the rules-based strategy on the same data. Starter: `W17_workshop_xgboost_signal_starter.ipynb`

Bring: your feature matrix (W06 notebook output), your strategy's target ticker and time period, and your rules-based entry conditions. We use the same ticker and period for both models so the comparison is fair."

**Weekly hypotheses:**
"Frame this week's hypotheses at the model level: 'The XGBoost model will outperform the RSI rule on OOS data because ___.' That's a falsifiable ML hypothesis. Test it Wednesday."

**Pre-reading:**
- Wiki Section 4.2 — scikit-learn and XGBoost entries (re-read)
- Skim: XGBoost documentation at xgboost.readthedocs.io — especially the `XGBClassifier` parameter reference

**Closing reflection:**
*"The feature I most expect to be important in my XGBoost model is ___, because ___."*

---

## WEDNESDAY — August 5, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** Full account summary. Note whether any positions are being held while we shift to ML signal testing.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
"Before tonight's class, run `build_feature_matrix()` from W06 on your target ticker with 3 years of data. Verify it runs cleanly. Note the number of rows and the number of features. We use this directly in tonight's workshop."

---

### EVENING: Workshop Session (8:00–9:30 PM EST)
**Workshop:** W17 — Training Your First XGBoost Signal Model
**Notebook:** `W17_workshop_xgboost_signal_[initials].ipynb`
**Curriculum Source:** Wiki Section 6.3

#### Block 1 — Framing & Context Bridge (8:00–8:10 PM) | 10 min

"Tonight we train a machine learning model on financial data for the first time. Not a toy dataset. Not MNIST. Real OHLCV-derived features on real tickers.

Three things we will know by the end of tonight that we don't know now:
1. Does XGBoost improve on the rules-based signal for our ticker?
2. Which features drive the model's predictions?
3. Is the improvement real or an artifact of overfitting?

The answer to all three might be disappointing. That is not failure — that is quantitative research done honestly."

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 min

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

    # Return lags
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

    print(f"Feature matrix: {X.shape[0]} rows x {X.shape[1]} features")
    print(f"Label distribution: {y.mean():.1%} positive ({y.sum()} of {len(y)})")
    print(f"Date range: {df.index[0].date()} to {df.index[-1].date()}")

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
        'subsample':         0.8,
        'colsample_bytree':  0.8,
        'min_child_weight':  5,
        'scale_pos_weight':  (y==0).sum() / (y==1).sum(),
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
        ic, p_val = spearmanr(proba, y_test)

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
    print(f"Mean IC across folds: {mean_ic:.4f} +/- {std_ic:.4f}")
    print(f"IC Stability: {'Stable' if std_ic < 0.05 else 'Variable — investigate'}")
    print(f"Signal Quality: {'Strong' if mean_ic > 0.08 else 'Moderate' if mean_ic > 0.04 else 'Weak — do not deploy'}")

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
          f"({X_train.index[0].date()} to {X_train.index[-1].date()})")
    print(f"OOS:   {X_oos.shape[0]} rows "
          f"({X_oos.index[0].date()} to {X_oos.index[-1].date()})")

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

    oos_proba  = model.predict_proba(X_oos)[:, 1]
    oos_ic, _  = spearmanr(oos_proba, y_oos)
    high_conf  = oos_proba > 0.55
    precision  = (y_oos[high_conf] == 1).mean() if high_conf.sum() > 0 else np.nan

    print(f"\nOOS Results:")
    print(f"  IC:              {oos_ic:.4f}")
    if not np.isnan(precision):
        print(f"  Precision@0.55:  {precision:.1%}")
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

# Save model for use in W18 and W19
import pickle
with open('xgb_model.pkl', 'wb') as f:
    pickle.dump(model, f)
print("\nModel saved to xgb_model.pkl for use in W18 and W19.")
```

#### Block 3 — Independent Work (8:50–9:15 PM) | 25 min

Run the full pipeline on YOUR target ticker. Answer in markdown:
1. What was your model's mean CV IC? Is it above the 0.05 threshold?
2. Which feature had the highest importance? Does that match your intuition from the DMB observation?
3. Did the ML signal outperform your RSI rule on OOS data by IC?
4. By how much did signal frequency change — more or fewer signals?
5. Based purely on the evidence: should you use the ML signal, the RSI rule, or a combination for Month 6? Justify with numbers.

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

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 min

**Share-out:** Who had ML beat the rules? Who had rules beat ML? "More interesting than who won: what did the feature importance plot tell you about your market? What did you learn about your own strategy from seeing which features the model prioritized?"

**Muddiest Point:**
> *"The muddiest point from tonight was ___."*

**Notebook submission:** `W17_workshop_xgboost_signal_[initials].ipynb` to GitHub.

---

## FRIDAY — August 7, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** Full account summary. Note any impact of ML signal on this week's trade decisions — did the ML model agree with the rules-based signal? Did it fire on different days?

#### Block 4 — Observation Assignment (9:50–10:00 AM)
"Pull up your target ticker. Run your feature matrix on this week's data — Monday through today. What was the ML model probability on each day? On which days did it exceed 0.55? On which days did the RSI rule fire? Where they disagreed — what did price actually do next?"

---

### EVENING: Review & Market Session (8:00–9:30 PM EST)

#### Pre-Session Setup
- [ ] XGBoost notebook complete and pushed
- [ ] Feature importance chart saved and reviewable
- [ ] ML vs. rules IC comparison table ready
- [ ] Model saved as `xgb_model.pkl` in GitHub repo

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 min

1. "Explain overfitting in the context of your XGBoost model. What specific hyperparameter choices reduce it? Why does each help?"

2. "Your model's CV IC was 0.07 but OOS IC was 0.03. What does this gap tell you? Is the model deployable as a trading signal?"

3. "Feature importance showed RSI_14 as most important. But RSI_7 was number two. These are highly correlated. Does having both improve the model or create redundancy?"

4. "Why is TimeSeriesSplit non-negotiable for financial ML? Give me a concrete example of what goes wrong with a random split on a time-series dataset."

5. "Your ML signal fires on 15% of trading days. Your RSI rule fires on 8%. More signals — is that better or worse?"
   *(Expected: depends on precision. More low-quality signals reduce the Sharpe. Fewer high-quality signals can be better. Evaluate by IC and win rate at threshold, not raw signal count.)*

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 min

**ML Signal Audit:**
"Pull up your target ticker. Run your feature matrix on this week's data. What was the ML model probability on Monday? Wednesday? Friday? Where it exceeded 0.55 — what did price do next? Where the RSI rule triggered — did the model agree or disagree? When they disagreed — which was right?"

Standard chart review: SPY, QQQ, VIX, sectors.

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 min
Standard checklist. Note any unusual options activity on tickers where the ML model fired a signal this week.

#### Block 4 — Next Week Preview & Close (9:20–9:30 PM) | 10 min

**Next week:** Live NewsAPI + FinBERT integration. The sentiment pipeline becomes operational — real headlines, real scores, live.

**Assign reading:**
- NewsAPI documentation: newsapi.org/docs
- Alpaca news endpoint: docs.alpaca.markets/reference/news-1
- Wiki Section 6.2 — Re-read FinBERT section

**Action items:**
- Obtain NewsAPI key if not yet done (free tier at newsapi.org)
- Verify Alpaca account has news access enabled
- Save XGBoost model to GitHub — we use it in W18 and W19

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

## WEEKLY DELIVERABLES SUMMARY

| Deliverable | Due | Format |
|-------------|-----|--------|
| XGBoost signal training notebook (W17) | Wednesday 11:59 PM | `.ipynb` pushed to GitHub |
| Feature importance chart | Wednesday 11:59 PM | `xgboost_feature_importance.png` in GitHub |
| ML vs. rules IC comparison table | Wednesday 11:59 PM | In notebook markdown |
| XGBoost model saved | Wednesday 11:59 PM | `xgb_model.pkl` pushed to GitHub |
| Trading journal — all trades this week | Friday 11:59 PM | Updated `.md` or `.csv` in GitHub |

---

## INSTRUCTOR NOTES FOR WEEK 17

**The overfitting conversation is central:** Most students will initially get high training accuracy and low test accuracy. Do not let them skip past this — it is the most important lesson of the week. The gap between training and test performance is the empirical demonstration of why we use TimeSeriesSplit and shallow trees. Name it, explain it, then show how the hyperparameter choices mitigate it.

**Feature importance is research, not just output:** Students who glance at the feature importance chart and move on are missing the point. Push them to interpret it: "Volume_Ratio is most important — what does that mean about your market? Does volume surge actually precede price moves in your ticker?" This is how quantitative research actually works.

**IC threshold guidance:** IC > 0.08 is strong for financial ML. IC 0.04–0.08 is moderate but tradeable. IC < 0.04 is weak and probably not worth deploying. Make sure students understand that IC of 0.05 sounds small but represents genuine edge — the signal predicts direction better than chance on half the days it fires.

**Not every student will beat the rules:** That is the correct outcome distribution. Some strategies have rules-based signals that are already well-tuned. In those cases, the ML model adds modest improvement or breaks even. The lesson is the same: you evaluated it rigorously. The evidence decided. That is how systematic trading works.

**Pre-save the model:** Students who don't save `xgb_model.pkl` before W18 will have to retrain on Wednesday. Remind them explicitly during Block 4.

---

## WEEKLY RESOURCES

> Resources are labeled **[Pre-session]** (review before class) or **[Homework]** (explore after). Week 17 introduces financial ML — read carefully and skeptically.

---

### Monday — XGBoost Theory & Model Evaluation

- **[Article | Pre-session]** [XGBoost Documentation — Introduction to Boosted Trees](https://xgboost.readthedocs.io/en/stable/tutorials/model.html) — XGBoost official docs. Read the "Introduction to Boosted Trees" tutorial before Monday. Focus on: what is a gradient boosted tree? What does `max_depth` control? Why does `learning_rate` matter for overfitting?

- **[Article | Homework]** [Why XGBoost is the Algorithm for Quantitative Finance](https://blog.quantinsti.com/xgboost-algorithm/) — QuantInsti. Overview of XGBoost applications in trading. Read after Monday's session for reinforcement and context.

---

### Wednesday — XGBoost Workshop Build

- **[Reference | Pre-session]** [scikit-learn TimeSeriesSplit documentation](https://scikit-learn.org/stable/modules/generated/sklearn.model_selection.TimeSeriesSplit.html) — Official docs. Read before Wednesday. Understand why the folds in TimeSeriesSplit are sequential, not random, and what happens to the training data size across folds.

- **[Article | Reference]** [Implement Walk-Forward Optimization with XGBoost for Stock Price Prediction](https://blog.quantinsti.com/walk-forward-optimization-python-xgboost-stock-prediction/) — QuantInsti. Keep open during Wednesday's workshop. The walk-forward methodology here extends what we build tonight into a more rigorous evaluation framework.

---

### Friday — ML Signal Review

- **[Article | Pre-session]** [Information Coefficient (IC) — How It Works](https://www.fe.training/free-resources/portfolio-management/information-coefficient-ic/) — FE Training. Quick IC formula refresh before Friday's retrospective. You should be able to state the IC formula and interpret your model's IC before class.

- **[Article | Homework]** [Machine Learning for Trading — Feature Importance](https://ml4trading.io/) — ML for Trading (book companion). Read the feature importance section. SHAP values give per-prediction attribution — a preview of the analysis we can run on our trained model.

---

*FINN Week 17 — ML Signals: XGBoost on the Feature Matrix | Part of FINN_Month05.md*
