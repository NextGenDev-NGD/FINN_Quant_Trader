# FINN — Week 21: Capstone Launch
## Capstone Execution, Final Analysis & Milestone 4 | Month 6: Capstone Execution
**Dates:** August 31 – September 5, 2026
**Week Number:** 21 of 24

---

## WEEK OVERVIEW

### Theme
The strategy is locked. The clock is running. Every trade matters now. This week launches Month 6 execution: the capstone pipeline goes live, the first real capstone trades are placed, and the written report begins with Section 1 due Friday. Everything from the last five months points to this week.

### Learning Objectives
By the end of this week, students will be able to:
- Run the unified CapstonePipeline v2.0 class from a single configuration object
- Generate a daily signal report with ML probability, sentiment, and composite score for all watchlist tickers
- Execute the first capstone paper trades with complete pre-trade journal entries
- Articulate the five Month 6 execution standards and apply them from day one
- Produce a complete draft of Capstone Report Section 1 (Executive Summary)
- Describe the capstone report evaluation criteria and their relative weights

### Materials Needed
- `finnenv` environment — all Month 5 packages
- Capstone specification document (`capstone_spec_[initials].md`) — reviewed and accessible
- Locked capstone config object from W20 notebook
- Signal pipeline from W13/W20 — extended to CapstonePipeline v2.0
- XGBoost model (`xgb_model.pkl`) — trained and saved from W17
- Webull paper trading account — confirmed at full cash
- Starter notebook: `W21_workshop_capstone_launch_starter.ipynb`

### Pre-Week Checklist (Instructor)
- [ ] Push `W21_workshop_capstone_launch_starter.ipynb` to GitHub
- [ ] Confirm all students have their capstone configs locked from Friday W20
- [ ] Verify Webull accounts are reset/ready for Month 6
- [ ] Prepare Block 2 execution standards — print or slide format
- [ ] Review each student's locked specification before Monday (flag any issues)
- [ ] Assign DMB rotation for Monday, Wednesday, Friday

---

## MONDAY — August 31, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** Month 6 begins today. Starting values documented.

#### Block 1 — Pre-Market Scan (9:00–9:15 AM)
Standard checklist plus Portfolio Pulse.
"Month 6 starts today. Pull up your capstone specification document before the DMB. We open every morning brief this month with: 'Does the market regime today match the conditions my strategy was designed for?' Answer that before looking at individual tickers."

#### Block 2 — Student-Led Brief (9:15–9:35 AM)
Rotating student presenter. From this month forward, the brief must include a capstone strategy signal status:
```
[Existing brief fields...]
Capstone Signal Status: [SIGNAL FIRED / NEAR MISS / NO SIGNAL]
Conditions met:          [List which entry conditions are active]
Action plan:             [Exact trade if signal fires today]
```

#### Block 3 — Hypothesis Setting (9:35–9:50 AM)
Add Month 6 header: `## Month 6 — Week 21`.
All hypotheses this month must be trade-specific — not market commentary.
"Every hypothesis you write must be traceable to your capstone strategy's entry conditions. If you can't connect the hypothesis to your strategy — rewrite it."

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Before tonight's class, run your complete capstone signal pipeline on all your watchlist tickers. Generate today's signal report. Screenshot or save the output. Bring it to class. Tonight we discuss what you found and whether the signal logic behaved as designed."

---

### EVENING: Theory Session (8:00–9:30 PM EST)
**Topic:** Capstone Execution Standards, Report Structure & The Final Stretch
**Curriculum Source:** All prior content — Month 6 synthesis

#### Pre-Session Setup
- [ ] Capstone specification document reviewed and accessible
- [ ] Signal pipeline run — today's signal report generated
- [ ] Trading journal template confirmed — all fields ready
- [ ] Portfolio at starting Month 6 value documented

#### Block 1 — Day Review & Month 6 Launch (8:00–8:15 PM) | 15 min

"Month 6 begins tonight. The strategy is locked. The report starts tonight. Let's hear from everyone: what did your signal pipeline show today? Any tickers flagged? Any signals confirmed? What's your portfolio state coming into Month 6?"

Go around the room. Each student: one sentence on their pipeline output. Then: "What you just did — morning scan, signal evaluation, portfolio check — is what you'll do every trading day for the rest of the course. Not sometimes. Every day. It takes 10 minutes with the automated tools we built. There is no acceptable reason to skip it."

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 min

**Topic A: Month 6 Execution Standards (15 min)**

"Five non-negotiable standards for Month 6:

**Standard 1 — Every signal gets documented, whether acted on or not.**
'No signal today' is a valid journal entry. It requires: date, market conditions summary, pipeline output, reason no trade taken. This is not optional. The capstone report includes signal frequency analysis.

**Standard 2 — Every trade gets a complete journal entry before execution.**
Not after. Before. If you cannot fill in the journal before placing the trade — you do not have a valid signal. Wait.

**Standard 3 — No strategy parameter changes without a new version number.**
If you change anything in your capstone config — RSI threshold, ML probability cutoff, sentiment veto level — it becomes Version 2.0. You document what changed, why, and what the IC evidence was. You do not simply adjust and continue.

**Standard 4 — Weekly analytics report generated every Friday.**
The `generate_month3_summary()` function from Month 3 — extended to cover all months — runs every Friday. Output pushed to GitHub before Friday DMB. This report is the basis for Friday's session every week.

**Standard 5 — Capstone report section due on schedule.**
Each section has a draft deadline. Late drafts delay the final report. The final report deadline does not move. Missing section deadlines means working backwards from a fixed finish line — that is a recipe for poor quality."

**Topic B: Capstone Report Standards (15 min)**

"The capstone report is a professional document. It will be evaluated on six criteria:

1. **Hypothesis Quality** (15%) — specific, testable, causally motivated
2. **Technical Execution** (25%) — clean, documented, reproducible code
3. **Backtest Rigor** (20%) — OOS methodology, realistic costs, benchmark comparison
4. **AI Integration** (15%) — meaningful use of ML and sentiment, not superficial
5. **Self-Assessment** (15%) — honest about limitations and failures
6. **Communication** (10%) — complex ideas explained clearly

The highest-weighted criterion after technical execution is self-assessment. A report that claims the strategy worked perfectly and shows no limitations earns a low self-assessment score — because no strategy works perfectly. The evidence always shows something unexpected. The mark of a good quant is finding it and explaining it honestly."

**Topic C: Report Writing as Active Research (10 min)**

"Most students approach writing as documenting what they already know. That is the wrong approach. Writing this report is active research — you will discover things about your strategy that you didn't know while writing about it.

Specifically:
- You will find trades that contradict your stated rules (look harder at why)
- You will find periods where your IC collapsed (investigate the regime)
- You will find that your live performance deviates from your backtest in specific ways that reveal assumptions you didn't know you were making

Those discoveries are not failures. They are findings. A well-written capstone report treats them as evidence and explains them carefully.

Write in the first person. Write precisely. Every claim should be backed by a number from your data. 'The strategy performed well' is not a claim. 'The strategy generated a Sharpe of 0.87 vs. SPY benchmark of 1.12 over the 16-week paper trading period, with alpha of +0.3% per week attributable to momentum factor exposure' is a claim."

#### Block 3 — Report Section 1 Workshop (8:55–9:15 PM) | 20 min

"Section 1 — Executive Summary — is due Friday. It is one page. It must answer four questions:
1. What was your hypothesis?
2. What did you actually test?
3. What did the evidence show?
4. What is your conclusion?

Notice question 3 says 'what did the evidence show' — not 'did it work.' The evidence shows whatever it shows. Your job is to describe it accurately, not to spin it.

Spend 15 minutes writing a draft of Section 1 right now. Not a perfect draft — a working draft. We workshop it Friday."

Students write independently. Instructor circulates and reads drafts. Common problems to flag immediately:
- Vague hypothesis restatement ('I tested a momentum strategy')
- Missing numeric results
- Absence of benchmark comparison
- Defensiveness about underperformance

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 min

**Wednesday workshop:**
"We finalize the Month 6 signal pipeline configuration and place the first capstone paper trades. Starter: `W21_workshop_capstone_launch_starter.ipynb`. This notebook extends the W13 signal monitor with the capstone config object from W20 — everything runs from a single config file. Come with your capstone config finalized and your Webull account at full cash."

**Pre-reading:** Re-read capstone specification document. Know every parameter by memory before Wednesday.

**Closing reflection:**
*"The part of my capstone strategy I am least confident about going live is ___."*

---

## WEDNESDAY — September 2, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** Full account summary. Starting Month 6 values recorded.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
"Before tonight, run a final test of your complete signal pipeline. Confirm: data fetches cleanly, indicators compute, ML model loads, sentiment pipeline runs, signal report generates. Document any errors and how you resolved them. Bring the clean output."

---

### EVENING: Workshop Session (8:00–9:30 PM EST)
**Workshop:** W21 — Capstone Pipeline v2.0 + First Live Capstone Trades
**Notebook:** `W21_workshop_capstone_launch_[initials].ipynb`
**Curriculum Source:** Capstone specification + all pipeline notebooks

#### Block 1 — Framing & Context Bridge (8:00–8:10 PM) | 10 min

"Tonight we do two things. First: we make the capstone pipeline production-ready. One config object drives everything — features, signals, risk, trades. Second: we place the first capstone paper trades of Month 6.

These trades are different from everything we've done before. They are the primary evidence for the Milestone 4 presentation. Every trade after tonight is data in your capstone report. Trade accordingly."

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 min

```python
# ── CAPSTONE PIPELINE v2.0 ────────────────────────────────────
# Month 6 unified signal pipeline
# Driven entirely by capstone_config object
# Integrates: features → XGBoost → sentiment → risk → trade

import pandas as pd
import numpy as np
import pandas_ta as ta
import yfinance as yf
import xgboost as xgb
import pickle
from newsapi import NewsApiClient
from transformers import pipeline as hf_pipeline
from webull import paper_webull
from datetime import datetime
import os
import warnings
from dotenv import load_dotenv
load_dotenv()
warnings.filterwarnings('ignore')

print(f"Capstone Pipeline v2.0 — {datetime.now().strftime('%Y-%m-%d %H:%M EST')}")
print("="*60)
```

**Step 1 — Unified pipeline class (20 min)**
```python
class CapstonePipeline:
    """
    Unified pipeline for capstone strategy execution.
    Drives all signal generation, evaluation, and trade management
    from a single configuration object.
    """

    def __init__(self, config, verbose=True):
        self.config  = config
        self.verbose = verbose
        self.model   = None
        self.finbert = None
        self.pwb     = None
        self._load_components()

    def _load_components(self):
        """Load ML model, sentiment pipeline, and broker connection."""
        model_path = self.config.get('model_path', 'xgb_model.pkl')
        try:
            with open(model_path, 'rb') as f:
                self.model = pickle.load(f)
            if self.verbose:
                print(f"XGBoost model loaded from {model_path}")
        except FileNotFoundError:
            if self.verbose:
                print(f"Model not found at {model_path}. ML signal disabled.")

        try:
            self.finbert = hf_pipeline(
                "sentiment-analysis",
                model="ProsusAI/finbert",
                tokenizer="ProsusAI/finbert",
                truncation=True,
                max_length=512
            )
            if self.verbose:
                print("FinBERT sentiment model loaded")
        except Exception as e:
            if self.verbose:
                print(f"FinBERT unavailable: {e}")

        try:
            self.pwb = paper_webull()
            self.pwb.login(
                os.getenv('WEBULL_EMAIL'),
                os.getenv('WEBULL_PASSWORD')
            )
            self.pwb.get_trade_token(os.getenv('WEBULL_TRADE_PIN'))
            if self.verbose:
                print("Webull paper trading connected")
        except Exception as e:
            if self.verbose:
                print(f"Webull connection failed: {e}")

    def compute_features(self, ticker):
        """Compute all configured features for a ticker."""
        try:
            df = yf.download(ticker, period='3mo', interval='1d', progress=False)
            df.columns = [c[0] if isinstance(c, tuple) else c for c in df.columns]
            if len(df) < 30:
                return None

            df['RSI_14']      = ta.rsi(df['Close'], length=14)
            df['EMA_20']      = ta.ema(df['Close'], length=20)
            df['Close_EMA20'] = (df['Close'] - df['EMA_20']) / df['EMA_20']
            df['ATR_14']      = ta.atr(df['High'], df['Low'], df['Close'], length=14)
            df['ATR_Norm']    = df['ATR_14'] / df['Close']
            bb                = ta.bbands(df['Close'], length=20, std=2)
            df['BB_Pct']      = bb['BBP_20_2.0']
            df['Vol_Ratio']   = df['Volume'] / df['Volume'].rolling(20).mean()
            adx               = ta.adx(df['High'], df['Low'], df['Close'], length=14)
            df['ADX']         = adx['ADX_14']
            macd              = ta.macd(df['Close'])
            df['MACD_Hist']   = macd['MACDh_12_26_9']
            df['Ret_5d']      = df['Close'].pct_change(5)
            df['Ret_20d']     = df['Close'].pct_change(20)
            df['SMA_200']     = ta.sma(df['Close'], length=min(200, len(df)-1))
            df['Vol_20d']     = df['Close'].pct_change().rolling(20).std() * np.sqrt(252)

            latest = df.iloc[-1]
            return {
                'ticker':       ticker,
                'date':         df.index[-1].strftime('%Y-%m-%d'),
                'close':        float(latest['Close']),
                'RSI_14':       float(latest['RSI_14']),
                'Close_EMA20':  float(latest['Close_EMA20']),
                'ATR_14':       float(latest['ATR_14']),
                'ATR_Norm':     float(latest['ATR_Norm']),
                'BB_Pct':       float(latest['BB_Pct']),
                'Vol_Ratio':    float(latest['Vol_Ratio']),
                'ADX':          float(latest['ADX']),
                'MACD_Hist':    float(latest['MACD_Hist']),
                'Ret_5d':       float(latest['Ret_5d']),
                'Ret_20d':      float(latest['Ret_20d']),
                'above_sma200': bool(latest['Close'] > latest['SMA_200'])
                                if not pd.isna(latest['SMA_200']) else None,
                'Vol_20d':      float(latest['Vol_20d']),
            }
        except Exception as e:
            if self.verbose:
                print(f"  Feature error for {ticker}: {e}")
            return None

    def get_ml_probability(self, features):
        """Get XGBoost prediction probability for entry."""
        if self.model is None:
            return 0.5
        feat_names = self.config['features_to_use']
        try:
            row = np.array([
                features.get(f, 0) for f in feat_names
            ]).reshape(1, -1)
            return float(self.model.predict_proba(row)[0, 1])
        except Exception:
            return 0.5

    def get_sentiment(self, ticker):
        """Get current sentiment score for a ticker."""
        if self.finbert is None:
            return 0.0, 'unavailable'
        try:
            newsapi   = NewsApiClient(api_key=os.getenv('NEWSAPI_KEY'))
            articles  = newsapi.get_everything(
                q=f'"{ticker}"', language='en',
                sort_by='publishedAt', page_size=10
            ).get('articles', [])
            if not articles:
                return 0.0, 'no_news'
            texts     = [f"{a['title']}. {a.get('description','')[:200]}"
                         for a in articles[:8]]
            results   = self.finbert(texts)
            label_map = {'positive': 1, 'negative': -1, 'neutral': 0}
            scores    = [label_map[r['label']] * r['score'] for r in results]
            mean      = float(np.mean(scores))
            quality   = 'high' if len(scores) >= 5 else 'low'
            return round(mean, 4), quality
        except Exception:
            return 0.0, 'error'

    def evaluate_entry(self, features, ml_prob, sentiment_score):
        """Compute composite signal score from all three signals."""
        cfg       = self.config
        rsi_ok    = features.get('RSI_14', 100) < cfg['rsi_entry']
        ema_ok    = features.get('Close_EMA20', 0) > -cfg['ema_distance_pct']
        vol_ok    = features.get('Vol_Ratio', 99) < cfg['vol_ratio_max']
        adx_ok    = features.get('ADX', 0) > cfg.get('adx_min', 0)
        tech_score = 1.0 if (rsi_ok and ema_ok and vol_ok and adx_ok) else \
                     0.5 if sum([rsi_ok, ema_ok, vol_ok]) >= 2 else 0.0

        sent_norm  = (sentiment_score + 1) / 2
        sent_veto  = sentiment_score < cfg['sentiment_veto']

        composite  = (cfg['w_technical'] * tech_score +
                      cfg['w_ml']        * ml_prob +
                      cfg['w_sentiment'] * sent_norm)

        if sent_veto:
            composite = 0.0
            decision  = 'PASS_VETO'
        elif composite >= cfg['entry_threshold']:
            decision  = 'BUY'
        elif composite >= cfg['entry_threshold'] - 0.10:
            decision  = 'WATCH'
        else:
            decision  = 'PASS'

        return {
            'composite':  round(composite, 4),
            'tech_score': round(tech_score, 4),
            'ml_prob':    round(ml_prob, 4),
            'sent_norm':  round(sent_norm, 4),
            'sent_veto':  sent_veto,
            'decision':   decision,
        }

    def calculate_position_size(self, entry_price, atr):
        """Calculate position size per capstone risk framework."""
        if self.pwb is None:
            return 0, 0
        account     = self.pwb.get_account()
        port_value  = float(account.get('netLiquidation', 1_000_000))
        stop_dist   = atr * self.config['atr_stop_multiplier']
        dollar_risk = port_value * self.config['risk_pct_per_trade']
        shares      = max(1, int(dollar_risk / stop_dist))
        stop_price  = round(entry_price - stop_dist, 2)
        return shares, stop_price

    def run_daily_scan(self, dry_run=True):
        """Run the full morning signal scan on all watchlist tickers."""
        tickers   = self.config['tickers']
        results   = []
        timestamp = datetime.now().strftime('%Y-%m-%d %H:%M')

        print(f"\n{'='*60}")
        print(f"CAPSTONE DAILY SCAN — {timestamp}")
        print(f"Strategy: {self.config['strategy_name']}")
        print(f"{'='*60}")

        for ticker in tickers:
            features = self.compute_features(ticker)
            if not features:
                continue

            ml_prob             = self.get_ml_probability(features)
            sent_score, quality = self.get_sentiment(ticker)
            signal              = self.evaluate_entry(features, ml_prob, sent_score)
            shares, stop        = self.calculate_position_size(
                features['close'], features['ATR_14']
            )

            entry = {
                'ticker':       ticker,
                'close':        features['close'],
                'rsi':          round(features['RSI_14'], 1),
                'ml_prob':      round(ml_prob, 3),
                'sentiment':    round(sent_score, 3),
                'sent_quality': quality,
                'composite':    signal['composite'],
                'decision':     signal['decision'],
                'shares':       shares,
                'stop_price':   stop,
            }
            results.append(entry)

            icon = "SIGNAL" if signal['decision'] == 'BUY' else \
                   "WATCH " if signal['decision'] == 'WATCH' else \
                   "VETO  " if signal['decision'] == 'PASS_VETO' else "     "
            print(f"[{icon}] {ticker:6s} | RSI:{features['RSI_14']:5.1f} | "
                  f"ML:{ml_prob:.3f} | Sent:{sent_score:+.3f} | "
                  f"Score:{signal['composite']:.3f} -> {signal['decision']}")

        results_df = pd.DataFrame(results)
        confirmed  = results_df[results_df['decision'] == 'BUY']

        print(f"\n{'─'*60}")
        print(f"Signals confirmed: {len(confirmed)}/{len(results_df)}")

        if len(confirmed) > 0 and not dry_run:
            print("\nExecuting confirmed trades...")
            for _, trade in confirmed.iterrows():
                if self.pwb:
                    self.pwb.place_order(
                        stock=trade['ticker'],
                        action='BUY',
                        orderType='LMT',
                        quant=int(trade['shares']),
                        price=trade['close']
                    )
                    print(f"  Placed: BUY {trade['shares']} {trade['ticker']} @ ${trade['close']:.2f}")
        elif dry_run and len(confirmed) > 0:
            print("\n[DRY RUN — set dry_run=False to execute trades]")
            for _, trade in confirmed.iterrows():
                print(f"  Would buy: {trade['shares']} {trade['ticker']} @ ${trade['close']:.2f} | Stop: ${trade['stop_price']:.2f}")

        report_path = f"signal_report_{datetime.now().strftime('%Y%m%d')}.csv"
        results_df.to_csv(report_path, index=False)
        print(f"\nReport saved: {report_path}")

        return results_df

# Initialize pipeline with student's capstone config
# Students import their own config from W20 notebook
from W20_config import CAPSTONE_CONFIG   # defined by each student

pipeline      = CapstonePipeline(CAPSTONE_CONFIG, verbose=True)
signal_report = pipeline.run_daily_scan(dry_run=True)
```

**Step 2 — First live capstone trades (20 min)**

Students run their capstone pipeline independently. Verify signal output is correct. Review any confirmed signals. Using `pre_trade_clearance()` from W14 — confirm portfolio state. If signal confirmed and clearance passes: execute with `dry_run=False`.

Each student documents in journal before executing:
- Date, ticker, all signal component scores
- Entry price, position size calculation
- Stop price (ATR-based)
- Hypothesis: what the strategy predicts and why

After execution: verify order appears in Webull account.

#### Block 3 — Share-Out & Muddiest Point (8:50–9:15 PM) | 25 min

**Share-out (10 min):**
"Who placed a capstone trade tonight? Walk through: which signal component drove the composite score highest? Was the trade consistent with the locked specification?"

Students who did not receive a signal describe what their pipeline showed and why conditions were not met.

**Muddiest Point (5 min):**
> *"The muddiest point in my capstone pipeline tonight was ___."*

**Independent work (10 min):** Continue drafting capstone report Section 1 based on tonight's first data point.

#### Block 4 — Close & Submission (9:15–9:30 PM) | 15 min

**Notebook submission:** `W21_workshop_capstone_launch_[initials].ipynb` to GitHub.

**Closing reminder:**
"Report Section 1 (Executive Summary) is due Friday before the DMB. Push to GitHub as `capstone_report_sec1_[initials].md`. One page. Four questions answered. Numbers in every answer."

---

## FRIDAY — September 4, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** First week of capstone execution complete. Full account snapshot.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
"Before tonight's session, finalize and push your Report Section 1 to GitHub. Read it one more time. Does it answer all four required questions? Does every claim have a number attached to it? Fix anything that doesn't before class."

---

### EVENING: Review & Market Session (8:00–9:30 PM EST)
**Topic:** Week 21 Review + First Capstone Trade Analysis + Report Section 1 Workshop

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 min

1. "Walk me through the first capstone trade you placed. Which signal component was most responsible for the entry? Was it consistent with your specification?"

2. "Your pipeline computed a composite score of 0.63 for a ticker. The threshold is 0.60. That's a 0.03 margin. Should you be confident in this trade? What would a 0.63 vs. 0.73 score tell you differently?"

3. "The sentiment component was unavailable for one ticker (no news today). How did the pipeline handle it? Was that handling correct per your spec?"

4. "You placed a trade and the journal entry took 12 minutes to write. What does that tell you? What should the target time be? What would you need to do to get to 3 minutes per entry?"

5. "Section 1 of the capstone report is due tonight. Read your executive summary aloud. Does it answer all four required questions?"

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 min

**First capstone trade review:**
"For every trade placed this week: pull up the chart. Where did price go after entry? Is the thesis intact? Is the stop still appropriate? What does the current signal score say?"

Standard chart review: SPY, QQQ, VIX, sectors.
"How does the current market regime match the regime your strategy was designed for? Is this a favorable or unfavorable week for your approach?"

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 min
Standard checklist.

#### Block 4 — Next Week Preview & Close (9:20–9:30 PM) | 10 min

**Report Section 1 collection:**
"Every student pushes their Section 1 executive summary draft to GitHub before midnight tonight: `capstone_report_sec1_[initials].md`"

**Labor Day reminder:**
"Monday September 7 is Labor Day. Class is cancelled. Your async package is in the GitHub repo: `W22_async_monday_package.md`. Complete it by Monday 11:59 PM. Wednesday class runs as normal."

**Assign reading for next week:**
- Review W11 analytics notebook — we extend it to cover all 4 months
- Re-read capstone specification document Sections 2 and 3

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

## WEEKLY DELIVERABLES SUMMARY

| Deliverable | Due | Format |
|-------------|-----|--------|
| CapstonePipeline v2.0 notebook (W21) | Wednesday 11:59 PM | `.ipynb` pushed to GitHub |
| First capstone paper trade(s) executed | Wednesday session | Webull account + journal entry |
| Signal reports — Mon, Wed, Fri | Each day before class | `signal_report_YYYYMMDD.csv` |
| Capstone Report Section 1 — Executive Summary | Friday 11:59 PM | `capstone_report_sec1_[initials].md` |
| Trading journal — all Week 21 entries | Friday 11:59 PM | Updated `.csv` or `.md` |

---

## INSTRUCTOR NOTES FOR WEEK 21

**Pipeline launch failures are expected — treat them as teaching moments:** The CapstonePipeline class integrates four external systems (yfinance, XGBoost, FinBERT, Webull). At least one student will have a broken component on Wednesday. The coaching response is: "Which component failed? Is the failure in the data layer, the model layer, or the execution layer? What is the fallback behavior per your specification?" Every student should have a documented fallback for each component before Wednesday.

**The composite score margin matters:** When a student trades on a 0.61 composite with a 0.60 threshold, push hard on what that margin means statistically. A strategy with IC of 0.05 has enormous variance on any given trade. The composite score is a probability estimate, not a guarantee. Students who treat the threshold as a bright line will misunderstand why individual trades fail.

**Section 1 common failure — present tense hypothesis:** Many students write "my strategy is designed to..." instead of "I hypothesized that..." The executive summary should be written in past tense — you are reporting findings, not describing a design. Flag this immediately in Monday's workshop. The framing shift from "what I built" to "what I tested and found" is the most important intellectual transition of Month 6.

**Journal entry timing:** If a student reports their journal entries take more than 5 minutes, investigate why. Common causes: too many fields required, unclear field definitions, or missing pre-computation. The journal should be a 2–3 minute exercise — entry conditions, composite score, position sizing calculation, stop price. If it takes longer, the pipeline is doing too little automated work.

**Labor Day communication:** Make the async package assignment explicit on Wednesday, not just Friday. Some students will need the weekend to complete it around family obligations. Distribute `W22_async_monday_package.md` no later than Wednesday session close.

---

## WEEKLY RESOURCES

> Resources are labeled **[Pre-session]** (review before class) or **[Homework]** (explore after).

---

### Monday — Execution Standards

- **[Reference | Pre-session]** Your `capstone_spec_[initials].md` — Read every field before Monday's DMB. Know your entry conditions, architecture type, and success metrics without looking. Month 6 starts today.

- **[Article | Homework]** [How to Build a Live Algorithmic Trading System](https://blog.quantinsti.com/automated-trading-system/) — QuantInsti. After Monday, read the section on operational standards — signal logging, trade documentation, and system monitoring. The five Month 6 standards map directly to the professional practices described here.

---

### Wednesday — Pipeline + First Trades

- **[Reference | Pre-session]** Your W13 signal monitor notebook — CapstonePipeline v2.0 extends this directly. Review the `run_signal_scan()` function before Wednesday. The architecture is the same; the config object and the CapstonePipeline class add unified execution.

- **[Reference | Pre-session]** Your W17 XGBoost notebook — Confirm `xgb_model.pkl` is saved and loadable. Run `pickle.load(open('xgb_model.pkl', 'rb'))` before Wednesday. If it fails, bring the W17 notebook and we will re-export the model at the start of Wednesday's session.

---

### Friday — Report Section 1

- **[Article | Pre-session]** [How to Write an Executive Summary for a Research Report](https://www.indeed.com/career-advice/career-development/how-to-write-executive-summary) — Indeed Career Guide. Short read. The four questions the FINN executive summary must answer map directly to the standard research executive summary format: problem, method, finding, conclusion.

- **[Book | Homework]** [Advances in Financial Machine Learning — Lopez de Prado](https://www.wiley.com/en-us/Advances+in+Financial+Machine+Learning-p-9781119482086) — Chapter 1 (Financial Machine Learning as a Discipline). Read the introduction. The framing of financial ML as hypothesis testing rather than pattern-matching is the intellectual foundation of everything we built this course.

---

*FINN Week 21 — Capstone Launch | Part of FINN_Month06.md*
