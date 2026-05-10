# FINN — Month 04 Lesson Plan
## Financial Intelligence & Navigation Network
### Paper Trading Phase II — Iteration, Automation & Milestone 3
**Dates:** July 6 – August 1, 2026
**Phase:** Month 4 of 6 — Paper Trading II
**Milestone:** M3 — Paper Trading Mid-Review (End of Week 16 / August 1, 2026)

---

> **INSTRUCTOR NOTE**
> Month 4 is the deepest operational month of the course. Students are no longer
> learning to trade — they are trading. The instructor's role shifts from teacher
> to coach. Sessions become less about delivering content and more about interrogating
> decisions, diagnosing problems, and pushing students to think rigorously about
> their own performance.
>
> Three significant additions this month:
> 1. **Automated signal alerts** — Python pipelines that notify students when
>    their strategy conditions are met, removing the need to watch charts manually
> 2. **AI-enhanced analysis** — integrating the sentiment pipeline from Month 2
>    into live paper trading workflow
> 3. **Milestone 3 preparation** — the mid-review at end of Month 4 is the
>    most comprehensive assessment yet: full journal audit, P&L attribution,
>    strategy adherence review, and a live trade discussion
>
> **Standard pressure warning:** Month 4 coincides with summer — July/August
> brings vacation schedules, family commitments, and work slowdowns for many
> adult learners. Expect 1–2 cancellations this month. The async packages
> for Weeks 13 and 15 are pre-built at the end of this file as a precaution.
>
> **Milestone 3 is non-negotiable.** Even if sessions are missed leading up
> to it, every student must complete the Milestone 3 review. It is the
> primary evidence checkpoint for the Month 3–4 block.

---

## Month 4 Overview

### Learning Objectives

By the end of Month 4, every student will be able to:

- Build and run an automated signal alert pipeline in Python that monitors
  market conditions and notifies when entry criteria are met
- Integrate FinBERT or LLM-based sentiment scoring into a live daily workflow
- Manage an actively running paper portfolio across multiple concurrent positions
- Apply the Month 3 adaptation framework — deciding what to change, justify it, test it
- Conduct a structured weekly performance review independently, without instructor prompting
- Present a complete 2-month paper trading record at Milestone 3:
  P&L, attribution, journal quality, strategy adherence, and forward plan
- Identify and articulate the difference between strategy underperformance due to
  regime mismatch versus genuine signal decay
- Use quantitative evidence — IC, rolling Sharpe, attribution — to support
  all strategy decisions

### Month 4 Curriculum Sources
*(from `FINN_Curriculum_Wiki.md`)*

- Section 6.3 — ML signal generation (applied to live signal monitoring)
- Section 6.4 — Multi-agent AI concept (introduced conceptually)
- Section 8 — Paper trading (ongoing operational)
- Section 9 — Risk management (ongoing, deepened)
- All prior content — applied and synthesized

### Month 4 at a Glance

| Week | Dates | Theme | Monday Topic | Wednesday Workshop | Friday Focus |
|------|-------|-------|-------------|-------------------|-------------|
| 13 | Jul 6–11 | Automation Layer | Signal alert pipelines + AI workflow | Build automated signal monitor | Live alerts vs. manual observation |
| 14 | Jul 13–18 | Multi-Position Management | Running 3–5 concurrent positions | Portfolio correlation + hedging notebook | Full portfolio review + rebalance |
| 15 | Jul 20–25 | Strategy Evolution | Applying Month 3 adaptations live | Updated strategy backtest + comparison | Adapted vs. original performance |
| 16 | Jul 27–Aug 1 | Milestone 3 Prep + Review | Full synthesis + M3 preparation | Final journal audit workshop | **Milestone 3: Paper Trading Mid-Review** |

---

---

# WEEK 13 — The Automation Layer
**Theme:** Your strategy should not require you to watch charts all day. Build the system that watches for you.

---

## Monday, July 6, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

#### Block 1 — Pre-Market Scan (9:00–9:15 AM)
Standard checklist plus Portfolio Pulse.
"Welcome back from the July 4th weekend. What happened in the market
during the holiday? Any overnight futures moves? How does the portfolio
look coming into Week 13?"

#### Block 2 — Student-Led Brief (9:15–9:35 AM)
Rotating student presenter. Note: briefs should now routinely include
the Trade Idea and Action Plan fields added in Month 3.
"By now, every brief should include a concrete trade setup or
a documented reason why no setup exists today."

#### Block 3 — Hypothesis Setting (9:35–9:50 AM)
Add Month 4 header to hypothesis log: `## Month 4 — Week 13`.
Encourage trade-level hypotheses framed around automation:
"Can you write a hypothesis that a computer could evaluate without
a human making a judgment call? That's the target level of specificity."

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "During market hours, manually monitor your
strategy's signal conditions for your top 3 watchlist tickers.
Every 30 minutes, note the RSI and EMA readings.
Count how many times you check — that number is the problem we're
solving tonight. Bring your tally sheet to class."

---

### Monday, July 6, 2026 — Theory Session
**Time:** 8:00–9:30 PM EST
**Topic:** Automated Signal Alerts, AI Workflow Integration & The Quant's Operating Model
**Curriculum source:** Wiki Sections 6.3, 6.4 (conceptual intro)

#### Pre-Session Requirements
- [ ] Wiki Section 6.3 read — ML signal generation framework
- [ ] Wiki Section 6.4 read — Multi-agent AI concept (conceptual only)
- [ ] Month 3 summary report complete and pushed to GitHub
- [ ] Strategy adaptation decision from end of Month 3 documented

---

#### Block 1 — Day Review & July 4th Debrief (8:00–8:15 PM) | 15 minutes

"How many times did you check your tickers during market hours today?
Write the number down. Now multiply by 5 — that's roughly how many
times you'd check in a trading week if you continued this manually.

This is the problem. Manual monitoring is inefficient, inconsistent,
and psychologically exhausting. You miss signals when distracted.
You see phantom signals when anxious. You override rules when bored.

The solution is what we build tonight: a system that monitors conditions
for you and alerts you only when action is required. You check your phone
once, confirm the signal, place the trade, and go back to your life.

That is how professional systematic traders operate."

Reading check:
- "What is the difference between a rules-based signal generator
  and an ML-based one? When would you use each?"
- "What is a multi-agent AI system in the context of trading?
  Name two agents you'd want in a financial analysis pipeline."

---

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 minutes

**Topic A: The Automated Trading Workflow (15 min)**

"The quant's operating model at a professional level looks like this:

```
OVERNIGHT / PRE-MARKET:
  Automated pipeline runs at 8:00 AM
  → Fetches previous day's data (yfinance / Alpaca)
  → Updates all indicators (pandas-ta)
  → Runs sentiment scan on overnight news (FinBERT / NewsAPI)
  → Evaluates entry conditions for all watchlist tickers
  → Generates signal report: [ticker, signal, strength, direction]
  → Sends alert notification if any signal fires

9:00 AM DMB:
  Trader reviews automated signal report
  → Validates signal against live pre-market data
  → Sets limit order levels based on signal
  → Decides position sizing using risk calculator

MARKET HOURS:
  Automated pipeline monitors open positions every 15 min
  → Checks if stop loss levels are breached
  → Checks if exit conditions are met
  → Sends alert if exit triggered

END OF DAY:
  Automated summary report
  → Open positions and unrealized P&L
  → Any signals missed today
  → Tomorrow's pre-market prep data
```

This is completely achievable with Python, yfinance, and a free email/SMS API.
We build every component of this over the next two weeks."

> **Resource:** FINN quant workflow — 9-step pipeline from data fetch to signal report → `resources/infographics/ig_quant_workflow.html`

**Topic B: Signal Generation as a Pipeline (15 min)**

Walk through Wiki Section 6.3 ML signal framework in applied context.

"A signal pipeline has three stages:

**Stage 1 — Data layer:**
Fetch fresh OHLCV data, compute all indicators, fetch sentiment scores.
This is the `build_feature_matrix()` function we built in Week 6,
running every morning on fresh data.

**Stage 2 — Signal evaluation layer:**
For each ticker in the watchlist, evaluate: do current conditions
meet entry criteria? This is a boolean check:
```python
def check_entry_signal(features_row, strategy_params):
    rsi_ok = features_row['RSI_14'] < strategy_params['rsi_entry']
    ema_ok = features_row['Close_vs_EMA20'] > strategy_params['ema_threshold']
    vol_ok = features_row['Vol_Ratio'] < strategy_params['max_vol_ratio']
    return rsi_ok and ema_ok and vol_ok
```

**Stage 3 — Alert layer:**
If a signal fires, notify the trader. Methods from simplest to most sophisticated:
- Print to console / log file (we build this Wednesday)
- Email notification via SMTP (extension challenge Wednesday)
- Slack/Discord webhook message
- SMS via Twilio API (optional)

The key insight: the system tells YOU when to look.
You don't watch the market. The market reports to you."

**Topic C: Sentiment Integration in Live Workflow (10 min)**

"In Month 2, we built FinBERT as a standalone experiment.
Now we integrate it into the daily workflow as a filter.

Specifically: before entering a trade, the pipeline fetches the last
24 hours of news for that ticker and scores the aggregate sentiment.
If sentiment is strongly negative (< -0.3), the entry is blocked
regardless of technical signal.

This is a regime-level filter using unstructured data. It prevents
entering a momentum trade on a stock that is under sustained news pressure.

We are not using sentiment as the primary signal.
We are using it as a veto condition. That is the correct use."

---

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 minutes

1. "If your automated pipeline fires a signal at 9:47 AM and you're
   in a meeting until 10:30 AM, what happens? How do you build a
   system that handles missed signals gracefully without turning into
   fully autonomous trading?"
   *(Expected: limit orders vs. market orders. A limit order placed
   pre-market captures the signal if price reaches your level — no
   need to be present. Autonomous execution adds risk you can't monitor.
   Semi-automated is the right level for this course.)*

2. "Your signal pipeline fetches data at 8:00 AM and generates a signal.
   By 9:30 AM open, market conditions have changed significantly.
   How do you build the DMB validation step so it's rigorous but fast?"
   *(Expected: define specific re-validation checks — not 'does it still
   feel right' but 'is RSI still below threshold? Is EMA relationship
   still intact? Has there been significant premarket news?')*

3. "Devil's advocate: Automating a bad strategy just executes mistakes
   faster. How do you know your strategy is good enough to automate?"
   *(Expected: paper trade it manually for at minimum 30 trades before
   automating. Automation doesn't improve strategy quality — it improves
   consistency of execution. A strategy with positive edge benefits from
   automation. A strategy without edge reaches ruin faster.)*

4. "The FinBERT sentiment veto blocks entries when news is negative.
   But sometimes the best time to enter is when news is terrible —
   capitulation. Is the sentiment veto always correct?"
   *(Expected: No — and this is a known failure mode of news-based filters.
   Deep negative sentiment during genuine capitulation is actually a contrarian
   buy signal. The veto should be parameterized: block moderately negative,
   consider reversing rule for extreme negative. Nuance matters.)*

---

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 minutes

**Wednesday workshop:**
"We build the complete automated signal monitor — a Python script that runs
at market open, scans your watchlist, computes signals, integrates sentiment,
and outputs a structured signal report. Starter: `W13_workshop_signal_monitor_starter.ipynb`
Come with your full watchlist of 5–8 tickers and your strategy's entry conditions
written as explicit boolean rules."

**Weekly hypotheses:**
"This week, frame at least one hypothesis as a testable automation condition:
'If [exact boolean condition], then [expected outcome] within [N days].'"

**Pre-reading:**
- Wiki Section 6.2 — Re-read sentiment pipeline (will be integrated Wednesday)
- Wiki Section 4.2 — Review alpaca-py for live data alternative

**Closing reflection:**
*"The most important automation I need built before Wednesday is ___."*

---

## Wednesday, July 8, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Portfolio Pulse:** Full account summary. Note any open positions from Month 3
that carried over.

**Block 4 — Observation Assignment:**
"Before tonight's class, write your strategy's entry condition as a Python
boolean expression. Example:
`signal = (rsi < 30) and (close < ema_20 * 1.02) and (vol_ratio < 3.0)`
Bring the exact expression — not English, Python. We'll use it directly in the notebook."

---

### Wednesday, July 8, 2026 — Workshop Session
**Time:** 8:00–9:30 PM EST
**Topic:** Automated Signal Monitor — Full Pipeline Build
**Curriculum source:** Wiki Sections 6.2, 6.3, Code Pattern 1 & 2
**Notebook:** `W13_workshop_signal_monitor_[initials].ipynb`

---

#### Block 1 — Framing & Context Bridge (8:00–8:10 PM) | 10 minutes

"Tonight we build the most practical tool in the course.
By the time we're done, you'll have a Python script you can run
every morning at 8:00 AM — before the DMB — that scans your entire
watchlist, evaluates your strategy conditions, checks sentiment,
and hands you a prioritized signal report.

Starting tomorrow, your pre-market preparation time drops from
'scanning every chart manually' to 'reviewing the overnight report.'
That is a real operational improvement that professional traders pay for.
We're building it for free."

---

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 minutes

```python
import yfinance as yf
import pandas as pd
import numpy as np
import pandas_ta as ta
from transformers import pipeline
from datetime import datetime, timedelta
import json
import warnings
warnings.filterwarnings('ignore')

print(f"Signal Monitor — {datetime.now().strftime('%Y-%m-%d %H:%M EST')}")
print("="*55)
```

**Step 1 — Watchlist and strategy configuration (5 min)**
```python
# ── CONFIGURATION — Students customize this section ──────────
WATCHLIST = ['SPY', 'QQQ', 'AAPL', 'MSFT', 'NVDA', 'AMZN', 'META']
BENCHMARK = 'SPY'

# Strategy parameters — replace with YOUR strategy rules
STRATEGY = {
    'name':             'RSI Mean Reversion v1.0',
    'direction':        'LONG',           # LONG or SHORT
    'rsi_entry':        32,               # RSI threshold for entry
    'ema_period':       20,               # EMA period for trend filter
    'ema_distance':     0.02,             # Max distance below EMA (2%)
    'vol_ratio_max':    2.5,              # Max volume ratio (no mania)
    'atr_multiplier':   1.5,             # Stop = entry - ATR * multiplier
    'risk_pct':         0.02,            # Portfolio risk per trade
    'sentiment_veto':   -0.25,           # Block entry if sentiment below this
    'portfolio_value':  1_000_000        # Paper portfolio size
}
# ─────────────────────────────────────────────────────────────

print(f"Strategy:   {STRATEGY['name']}")
print(f"Watchlist:  {WATCHLIST}")
print(f"Portfolio:  ${STRATEGY['portfolio_value']:,.0f}")
```

**Step 2 — Feature computation for each ticker (12 min)**
```python
def compute_features(ticker, period='3mo', interval='1d'):
    """
    Fetch data and compute all strategy-relevant features.
    Returns the most recent bar's features as a dict.
    """
    try:
        df = yf.download(ticker, period=period, interval=interval,
                         progress=False)
        df.columns = [c[0] if isinstance(c, tuple) else c for c in df.columns]
        if len(df) < 30:
            return None

        # Core features
        df['RSI']        = ta.rsi(df['Close'], length=14)
        df['EMA_20']     = ta.ema(df['Close'], length=20)
        df['ATR']        = ta.atr(df['High'], df['Low'], df['Close'], length=14)
        df['Vol_MA20']   = df['Volume'].rolling(20).mean()
        df['Vol_Ratio']  = df['Volume'] / df['Vol_MA20']
        df['Close_EMA']  = (df['Close'] - df['EMA_20']) / df['EMA_20']
        df['Return']     = df['Close'].pct_change()
        df['SMA_200']    = ta.sma(df['Close'], length=min(200, len(df)-1))

        latest = df.iloc[-1]
        prev   = df.iloc[-2] if len(df) > 1 else latest

        return {
            'ticker':       ticker,
            'date':         df.index[-1].strftime('%Y-%m-%d'),
            'close':        round(float(latest['Close']), 2),
            'rsi':          round(float(latest['RSI']), 2),
            'ema_20':       round(float(latest['EMA_20']), 2),
            'atr':          round(float(latest['ATR']), 4),
            'vol_ratio':    round(float(latest['Vol_Ratio']), 2),
            'close_vs_ema': round(float(latest['Close_EMA']), 4),
            'daily_return': round(float(latest['Return']), 4),
            'above_sma200': bool(latest['Close'] > latest['SMA_200'])
                            if not pd.isna(latest['SMA_200']) else None,
            'prev_rsi':     round(float(prev['RSI']), 2),
        }
    except Exception as e:
        print(f"  Error fetching {ticker}: {e}")
        return None

# Scan all watchlist tickers
print("\nFetching feature data...")
features_list = []
for ticker in WATCHLIST:
    feat = compute_features(ticker)
    if feat:
        features_list.append(feat)
        print(f"  {ticker:6s} | RSI: {feat['rsi']:5.1f} | "
              f"EMA dist: {feat['close_vs_ema']:+.2%} | "
              f"Vol: {feat['vol_ratio']:.1f}x")

features_df = pd.DataFrame(features_list)
print(f"\nData fetched for {len(features_df)}/{len(WATCHLIST)} tickers")
```

**Step 3 — Signal evaluation (8 min)**
```python
def evaluate_signal(feat, strategy):
    """
    Evaluate entry signal conditions for a single ticker.
    Returns signal dict with conditions breakdown.
    """
    if feat is None:
        return None

    # ── ENTRY CONDITIONS (customize per strategy) ──────────
    cond_rsi    = feat['rsi'] < strategy['rsi_entry']
    cond_ema    = feat['close_vs_ema'] > -strategy['ema_distance']
    cond_vol    = feat['vol_ratio'] < strategy['vol_ratio_max']
    cond_trend  = feat['above_sma200'] is True  # Bull regime filter

    # RSI improving (not still falling)
    cond_rsi_turn = feat['rsi'] > feat['prev_rsi']

    all_conditions = {
        f"RSI < {strategy['rsi_entry']}":          cond_rsi,
        f"Close within {strategy['ema_distance']:.0%} of EMA": cond_ema,
        f"Vol ratio < {strategy['vol_ratio_max']}x": cond_vol,
        "Above 200 SMA (bull regime)":              cond_trend,
        "RSI turning up (not still falling)":       cond_rsi_turn,
    }

    signal_fired = all(all_conditions.values())

    # ── POSITION SIZING ─────────────────────────────────────
    stop_distance = feat['atr'] * strategy['atr_multiplier']
    dollar_risk   = strategy['portfolio_value'] * strategy['risk_pct']
    shares        = int(dollar_risk / stop_distance) if stop_distance > 0 else 0
    stop_price    = round(feat['close'] - stop_distance, 2)

    return {
        'ticker':        feat['ticker'],
        'signal_fired':  signal_fired,
        'close':         feat['close'],
        'rsi':           feat['rsi'],
        'conditions':    all_conditions,
        'conditions_met': sum(all_conditions.values()),
        'conditions_total': len(all_conditions),
        'stop_price':    stop_price,
        'shares':        shares,
        'position_value': shares * feat['close'],
        'sentiment_pending': True   # Will be updated in Step 4
    }

# Evaluate signals for all tickers
print("\nEvaluating signals...")
signals = []
for _, row in features_df.iterrows():
    sig = evaluate_signal(row.to_dict(), STRATEGY)
    if sig:
        signals.append(sig)
        status = "🔔 SIGNAL" if sig['signal_fired'] else \
                 f"  {sig['conditions_met']}/{sig['conditions_total']} conditions"
        print(f"  {sig['ticker']:6s} | {status}")

signals_df = pd.DataFrame(signals)
fired = signals_df[signals_df['signal_fired']]
print(f"\nSignals fired: {len(fired)}/{len(signals_df)} tickers")
```

**Step 4 — Sentiment integration (8 min)**
```python
def get_ticker_sentiment(ticker, n_headlines=5):
    """
    Get sentiment score for a ticker using recent news headlines.
    Returns aggregate sentiment score (-1 to +1).

    Note: In production use NewsAPI or Alpaca News.
    For this workshop, we use simulated headlines.
    Full live NewsAPI integration in Month 5.
    """
    # Simulated headlines — replace with real API call in production
    # See Month 5 for live NewsAPI integration
    simulated_headlines = {
        'SPY':  ["Market shows resilience amid rate concerns",
                 "S&P 500 holds key support levels"],
        'QQQ':  ["Tech stocks under pressure from yields",
                 "NASDAQ volume below average"],
        'AAPL': ["Apple supply chain concerns ease",
                 "iPhone demand strong in emerging markets"],
        'NVDA': ["AI chip demand continues to surge",
                 "NVIDIA beats quarterly estimates"],
        'MSFT': ["Microsoft Azure growth steady",
                 "Cloud business maintains momentum"],
        'AMZN': ["Amazon logistics costs falling",
                 "AWS revenue growth accelerates"],
        'META': ["Meta ad revenue beats expectations",
                 "Threads user growth continues"],
    }

    headlines = simulated_headlines.get(ticker, [f"{ticker} shows normal trading activity"])

    # Load FinBERT (cached after first load)
    try:
        finbert = pipeline("sentiment-analysis",
                           model="ProsusAI/finbert",
                           tokenizer="ProsusAI/finbert")
        results = finbert(headlines, truncation=True, max_length=512)
        label_map = {'positive': 1, 'negative': -1, 'neutral': 0}
        scores    = [label_map[r['label']] * r['score'] for r in results]
        agg_score = np.mean(scores)
        return round(agg_score, 4)
    except Exception:
        return 0.0  # Default neutral if model unavailable

# Apply sentiment to any fired signals
print("\nRunning sentiment check on fired signals...")
print("(Replace with live NewsAPI in Month 5)")

for i, row in signals_df[signals_df['signal_fired']].iterrows():
    ticker    = row['ticker']
    sent_score = get_ticker_sentiment(ticker)
    signals_df.loc[i, 'sentiment_score'] = sent_score
    signals_df.loc[i, 'sentiment_pending'] = False

    veto = sent_score < STRATEGY['sentiment_veto']
    signals_df.loc[i, 'sentiment_veto'] = veto
    signals_df.loc[i, 'signal_confirmed'] = not veto

    print(f"  {ticker:6s} | Sentiment: {sent_score:+.3f} | "
          f"{'VETOED ❌' if veto else 'CONFIRMED ✅'}")
```

**Step 5 — Signal report output (7 min)**
```python
def generate_signal_report(signals_df, strategy, save=True):
    """
    Generate a formatted signal report for the trading day.
    """
    now = datetime.now().strftime('%Y-%m-%d %H:%M')
    confirmed = signals_df[signals_df.get('signal_confirmed', False) == True] \
                if 'signal_confirmed' in signals_df.columns else pd.DataFrame()
    near_miss = signals_df[(signals_df['signal_fired'] == False) &
                            (signals_df['conditions_met'] >= signals_df['conditions_total'] - 1)]

    report_lines = [
        f"# FINN Signal Report — {now}",
        f"**Strategy:** {strategy['name']}",
        f"**Portfolio:** ${strategy['portfolio_value']:,.0f}",
        f"",
        f"---",
        f"",
        f"## 🔔 Confirmed Signals ({len(confirmed)})",
    ]

    if len(confirmed) == 0:
        report_lines.append("*No confirmed signals today.*")
    else:
        for _, sig in confirmed.iterrows():
            report_lines += [
                f"",
                f"### {sig['ticker']}",
                f"- **Entry:** ${sig['close']:.2f}",
                f"- **Stop:** ${sig['stop_price']:.2f}",
                f"- **Shares:** {sig['shares']} (${sig['position_value']:,.0f})",
                f"- **Sentiment:** {sig.get('sentiment_score', 'N/A')}",
                f"- **Action:** Place limit buy at ${sig['close']:.2f} or better",
            ]

    report_lines += [
        f"",
        f"---",
        f"",
        f"## 👀 Near-Miss Setups ({len(near_miss)})",
    ]

    for _, sig in near_miss.iterrows():
        missing = [k for k, v in sig['conditions'].items() if not v]
        report_lines += [
            f"- **{sig['ticker']}** — Missing: {', '.join(missing)}"
        ]

    report_lines += [
        f"",
        f"---",
        f"",
        f"*Generated by FINN Automated Signal Monitor*",
    ]

    report = '\n'.join(report_lines)

    if save:
        filename = f"signal_report_{datetime.now().strftime('%Y%m%d')}.md"
        with open(filename, 'w') as f:
            f.write(report)
        print(f"\nReport saved: {filename}")

    print(report)
    return report

generate_signal_report(signals_df, STRATEGY)
```

---

#### Block 3 — Independent / Pair Work (8:50–9:15 PM) | 25 minutes

**Core Exercise:**
Customize the signal monitor for YOUR specific strategy:
1. Update `WATCHLIST` with your personal tickers
2. Update `STRATEGY` dict with your actual parameters
3. Update the boolean conditions in `evaluate_signal()` to match
   your exact entry rules
4. Run the full pipeline and review the signal report output
5. Does the report match what you would have found by manually checking charts?

Answer in markdown:
1. Did the automated pipeline find any signals you missed today?
2. Did it block any signals you would have taken? Was the veto correct?
3. How long did the manual observation from the DMB take vs. running this script?
4. What one improvement would make this most useful to your workflow?

**Extension Challenge:**
Schedule the signal monitor to run automatically at 8:00 AM using
Python's `schedule` library:
```python
import schedule
import time

def run_morning_scan():
    print(f"\n{'='*55}")
    print(f"AUTOMATED MORNING SCAN — {datetime.now().strftime('%H:%M')}")
    print(f"{'='*55}")
    # Run full pipeline here
    pass

schedule.every().day.at("08:00").do(run_morning_scan)
print("Scheduler running. Press Ctrl+C to stop.")
while True:
    schedule.run_pending()
    time.sleep(60)
```

---

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 minutes

**Share-out:** Did the automated scan match manual observation?
"Who found a signal the script caught that they missed manually?
Who had the script veto a signal they would have taken?
Were the vetoes correct in hindsight?"

**Muddiest Point:**
> *"The muddiest point from tonight was ___."*

**Notebook submission:** `W13_workshop_signal_monitor_[initials].ipynb` to GitHub.

---

## Friday, July 10, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Portfolio Pulse:** Full account summary plus first automated signal report review.
"Did you run the signal monitor this morning? What did it find?
Did you act on any automated signals this week?"

---

### Friday, July 10, 2026 — Review & Market Session
**Time:** 8:00–9:30 PM EST
**Topic:** Week 13 Review + Automated Signals vs. Manual Observation

---

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 minutes

1. "Walk me through your signal pipeline's entry conditions in plain English.
   Then give me the Python boolean expression. They must match exactly."

2. "The sentiment veto blocked a signal this week. Walk through the
   decision tree: was the veto justified? What would have happened
   without the veto?"

3. "You ran the automated scan at 8:00 AM and got a signal.
   By 9:30 AM open, the stock had already gapped up 1.5% past your limit.
   What do you do? How should your pipeline handle this?"

4. "Devil's advocate: If your signal monitor is automated and you're
   following it mechanically, how are you demonstrating skill rather
   than just executing a computer's instructions?"
   *(Expected: the skill is in building the signal, defining the parameters,
   managing risk, and making the adaptation decisions. Execution automation
   is just removing the emotional variable from implementation.)*

---

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 minutes

**Automated Signal Validation:**
"Let's audit this week's signal reports. For every signal that fired —
did price do what the strategy predicted? For every signal that was vetoed
by sentiment — was the sentiment reading accurate? Did the stock underperform?"

Pull up each ticker that signaled this week on TradingView.
Walk through: entry level, stop level, current price.
"If you took this trade: what is the unrealized P&L? Is it still open?
What is the exit plan?"

Standard chart review: SPY, QQQ, VIX, sector rotation.

---

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 minutes

Standard checklist. Add: "Note any options activity on tickers that
fired signals this week. Unusual options buying ahead of a signal
is a potential confirmation — or a warning that someone knows something."

---

#### Block 4 — Next Week Preview & Close (9:20–9:30 PM) | 10 minutes

**Next week:** Managing multiple concurrent positions — the art of
running a live multi-position portfolio without letting correlations
kill your diversification.

**Assign reading:**
- Wiki Section 9.3 — Re-read correlation monitoring section
- Review Week 11 correlation analysis notebook

**Action items:**
- Run signal monitor every morning before DMB this week
- Log whether you acted on each signal and why/why not
- If no signal fires all week — document that and what the market conditions were

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

---

# WEEK 14 — Multi-Position Management
**Theme:** Managing 3–5 concurrent positions is qualitatively different from managing 1.

---

## Monday, July 13, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Portfolio Pulse:** How many concurrent positions are open?
"Who has more than 2 open positions right now?
Walk through them: are they correlated? What is the combined beta?"

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Look at your current open positions.
Find the correlation between each pair using last 30 days of returns
(yfinance pull, 30-day daily returns, `.corr()` in pandas).
Bring the correlation matrix to tonight's class."

---

### Monday, July 13, 2026 — Theory Session
**Time:** 8:00–9:30 PM EST
**Topic:** Multi-Position Portfolio Management — Correlation, Hedging & Rebalancing
**Curriculum source:** Wiki Section 9.3, original FINN framework

#### Pre-Session Requirements
- [ ] Correlation matrix of current positions calculated (DMB assignment)
- [ ] Signal monitor run and signal report from today ready to share
- [ ] Week 13 notebook reviewed

---

#### Block 1 — Day Review & Portfolio State (8:00–8:15 PM) | 15 minutes

"Let's see everyone's correlation matrix. What did you find?
Who has two positions with correlation above 0.7?
Tell me what those two positions are and why that's a problem."

Reading check:
- "What is portfolio beta and how is it different from individual stock beta?"
- "Name three signals that suggest a portfolio is over-concentrated."
- "Why does diversification across sectors sometimes fail to reduce
  correlation during market stress?"

---

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 minutes

**Topic A: The Multi-Position Challenge (10 min)**

"Running 3–5 positions simultaneously creates problems that don't
exist with a single position:

**Problem 1 — Hidden correlation:**
You think you have 4 independent bets. Your positions:
NVDA (long), AMD (long), MSFT (long), QQQ (long).
These are all technology exposure. When tech sells off — all 4
positions move against you simultaneously. That's 1 bet, not 4.
Your position sizing (2% risk × 4) is actually 8% exposure to one factor.

**Problem 2 — Portfolio delta:**
Each position has a direction. 4 longs in a bear market creates
a highly directional portfolio. Net delta (sum of position betas)
tells you how correlated your portfolio is to market direction.
Net positive delta = long the market. Net near-zero = market neutral.
Market neutral is harder to achieve but dramatically reduces drawdown
in adverse conditions.

**Problem 3 — Capital allocation:**
When a new signal fires, do you have available capital?
If 80% of your portfolio is in open positions, a 5th signal means
either passing on it or over-sizing. Managing cash as a reserve
is part of multi-position management."

**Topic B: Practical Multi-Position Rules (15 min)**

"These are the operational rules for running multiple positions:

**Rule 1 — Maximum concurrent positions: 5**
Beyond 5 positions, monitoring quality degrades for retail traders.
Better to run 3 high-conviction positions well than 8 mediocre ones poorly.

**Rule 2 — Maximum sector concentration: 30%**
No more than 30% of the portfolio in a single GICS sector.
If SPY, QQQ, and AAPL are all open — that's 3 positions but
potentially 60%+ in large-cap tech. Rebalance or wait for sector rotation.

**Rule 3 — Check pairwise correlation before entering:**
New position correlation with existing portfolio > 0.7 = pause.
Either wait until a lower-correlated signal fires, or reduce size
of the new position to account for the correlation.

**Rule 4 — Maintain a 20–30% cash reserve:**
Always keep 20–30% of portfolio in cash. This serves two purposes:
1. Allows you to enter high-conviction signals without selling other positions
2. Provides a buffer that reduces overall portfolio volatility

**Rule 5 — Weekly rebalancing check:**
Every Friday, review: is any position now more than 25% of portfolio
due to price appreciation? If yes, trim to target weight.
This forces selling into strength — one of the hardest disciplines to maintain."

> **Resource:** Risk rules reference — 6 non-negotiable rules including concentration limits and rebalancing triggers → `resources/infographics/ig_risk_rules.html`

**Topic C: Hedging with ETFs (15 min)**

"For Month 4 students with confident strategies, an optional layer:
using inverse ETFs or VIX products as a portfolio hedge.

The simplest hedge: if your portfolio is net-long (positive beta),
a small position in an inverse ETF (SH = inverse SPY, PSQ = inverse QQQ)
reduces overall portfolio beta toward zero.

Size the hedge: if portfolio beta = 0.8 and portfolio value = $1M,
market exposure = $800,000. To get to 0.4 beta, need to offset $400,000.
SH moves approximately inverse to SPY — $400,000 in SH would do it.

Hedging cost: hedges drag performance in bull markets.
During the hedge period, the market went up 3% — your hedge costs ~3% on 40% of portfolio.
Net drag: 1.2% on the total portfolio.

When is hedging worth it? When you have high conviction on directional
risk but want to keep positions open. Month 3 onwards — optional addition."

---

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 minutes

1. "Your correlation matrix shows AAPL and MSFT have 0.82 correlation.
   You're long AAPL and a signal fires for MSFT.
   Walk me through exactly what you do."
   *(Expected: several valid approaches — pass on MSFT, reduce AAPL first,
   take half-size MSFT acknowledging the correlation, or wait for AAPL
   to close before opening MSFT. No single right answer — the point
   is having a pre-defined rule, not deciding in the moment.)*

2. "You have 4 open positions, all longs, all performing well.
   Your signal monitor fires a 5th signal. You're at 80% invested.
   What's the decision framework?"
   *(Expected: check cash reserve (rule 4), check correlation with
   existing positions (rule 3), check if any existing position
   is at target and should be closed first.)*

3. "Devil's advocate: Why not just own 1 position at a time?
   Simplicity, full focus, no correlation problems."
   *(Expected: concentration risk — a single bad trade wipes out
   multiple good periods. Diversification reduces variance of outcomes
   even if it reduces peak returns. A portfolio approach is more
   sustainable long-term.)*

---

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 minutes

**Wednesday workshop:**
"We build a live portfolio correlation monitor and rebalancing alert system.
Starter: `W14_workshop_portfolio_mgmt_starter.ipynb`
Come with your full list of current open positions and their entry dates."

**Pre-reading:**
- Review Week 10 risk dashboard notebook — we're extending it Wednesday

**Closing reflection:**
*"The correlation problem I need to solve in my portfolio right now is ___."*

---

## Wednesday, July 15, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Portfolio Pulse:** Standard. Add: "Who has checked the correlation
between their positions this week using the automated monitor?"

---

### Wednesday, July 15, 2026 — Workshop Session
**Time:** 8:00–9:30 PM EST
**Topic:** Portfolio Correlation Monitor + Rebalancing Alert System
**Curriculum source:** Wiki Section 9.3
**Notebook:** `W14_workshop_portfolio_mgmt_[initials].ipynb`

---

#### Block 1 — Framing & Context Bridge (8:00–8:10 PM) | 10 minutes

"Week 10 we built the individual position risk dashboard.
Tonight we upgrade it to portfolio level. The new features:
1. Live correlation matrix of all open positions
2. Net portfolio beta calculation
3. Sector exposure breakdown
4. Rebalancing alerts when concentration limits are breached
5. A new trade pre-clearance check — before entering any position,
   the system evaluates whether it fits the current portfolio"

---

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 minutes

```python
from webull import paper_webull
import yfinance as yf
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import os
from dotenv import load_dotenv
load_dotenv()

pwb = paper_webull()
pwb.login(os.getenv('WEBULL_EMAIL'), os.getenv('WEBULL_PASSWORD'))
pwb.get_trade_token(os.getenv('WEBULL_TRADE_PIN'))
```

**Step 1 — Live position correlation matrix (15 min)**
```python
def compute_portfolio_correlation(positions, lookback_days=30):
    """
    Compute correlation matrix for all current open positions.
    """
    if not positions:
        print("No open positions.")
        return pd.DataFrame()

    tickers = [p.get('ticker', {}).get('symbol') for p in positions
               if p.get('ticker', {}).get('symbol')]

    if len(tickers) < 2:
        print("Need at least 2 positions for correlation analysis.")
        return pd.DataFrame()

    # Fetch returns for all tickers
    end   = pd.Timestamp.now()
    start = end - pd.Timedelta(days=lookback_days + 5)
    returns = {}

    for ticker in tickers:
        try:
            df = yf.download(ticker, start=start, end=end,
                             progress=False)['Close']
            returns[ticker] = df.pct_change().dropna()
        except:
            pass

    if not returns:
        return pd.DataFrame()

    ret_df  = pd.DataFrame(returns).dropna()
    corr_df = ret_df.corr()

    # Visualize
    fig, ax = plt.subplots(figsize=(max(6, len(tickers)), max(5, len(tickers)-1)))
    im = ax.imshow(corr_df.values, cmap='RdYlGn', vmin=-1, vmax=1, aspect='auto')
    plt.colorbar(im, ax=ax)
    ax.set_xticks(range(len(corr_df.columns)))
    ax.set_yticks(range(len(corr_df.index)))
    ax.set_xticklabels(corr_df.columns, rotation=45, ha='right')
    ax.set_yticklabels(corr_df.index)

    for i in range(len(corr_df)):
        for j in range(len(corr_df.columns)):
            ax.text(j, i, f"{corr_df.iloc[i, j]:.2f}",
                   ha='center', va='center', fontsize=10,
                   color='black' if abs(corr_df.iloc[i, j]) < 0.7 else 'white')

    ax.set_title(f'Portfolio Correlation Matrix ({lookback_days}d returns)', fontsize=13)
    plt.tight_layout()
    plt.savefig('portfolio_correlation.png', dpi=150, bbox_inches='tight')
    plt.show()

    # Identify high-correlation pairs
    high_corr_pairs = []
    cols = corr_df.columns.tolist()
    for i in range(len(cols)):
        for j in range(i+1, len(cols)):
            c = corr_df.iloc[i, j]
            if abs(c) >= 0.70:
                high_corr_pairs.append((cols[i], cols[j], round(c, 3)))

    if high_corr_pairs:
        print(f"\n⚠️  HIGH CORRELATION PAIRS (|r| >= 0.70):")
        for t1, t2, r in high_corr_pairs:
            print(f"   {t1} & {t2}: r = {r:.3f} — Review sizing or hedge")
    else:
        print("\n✓  No high-correlation pairs detected.")

    return corr_df

positions = pwb.get_positions()
corr_matrix = compute_portfolio_correlation(positions)
```

**Step 2 — Portfolio beta and sector exposure (15 min)**
```python
def portfolio_exposure_report(positions, account_value, benchmark='SPY'):
    """
    Calculate net portfolio beta, sector weights, and concentration flags.
    """
    if not positions:
        print("No open positions for exposure report.")
        return

    # Sector mapping (simplified — expand as needed)
    sector_map = {
        'SPY': 'Broad Market', 'QQQ': 'Broad Market',
        'AAPL': 'Technology',  'MSFT': 'Technology',
        'NVDA': 'Technology',  'AMD': 'Technology',
        'AMZN': 'Consumer',    'GOOG': 'Technology',
        'META': 'Technology',  'TSLA': 'Consumer',
        'JPM':  'Financials',  'GS': 'Financials',
        'XOM':  'Energy',      'CVX': 'Energy',
        'JNJ':  'Healthcare',  'UNH': 'Healthcare',
    }

    # Fetch beta for each ticker
    end     = pd.Timestamp.now()
    start   = end - pd.Timedelta(days=252)
    bm_ret  = yf.download(benchmark, start=start, end=end,
                           progress=False)['Close'].pct_change().dropna()

    position_data = []
    for p in positions:
        ticker    = p.get('ticker', {}).get('symbol', 'N/A')
        mkt_val   = float(p.get('marketValue', 0))
        weight    = mkt_val / account_value

        try:
            stk_ret = yf.download(ticker, start=start, end=end,
                                   progress=False)['Close'].pct_change().dropna()
            common  = stk_ret.index.intersection(bm_ret.index)
            beta    = (np.cov(stk_ret[common], bm_ret[common])[0,1] /
                      np.var(bm_ret[common]))
        except:
            beta = 1.0

        position_data.append({
            'ticker':     ticker,
            'mkt_val':    mkt_val,
            'weight':     weight,
            'beta':       round(beta, 3),
            'beta_contrib': weight * beta,
            'sector':     sector_map.get(ticker, 'Unknown')
        })

    pos_df = pd.DataFrame(position_data)
    net_beta = pos_df['beta_contrib'].sum()

    print(f"\n{'='*55}")
    print(f"PORTFOLIO EXPOSURE REPORT")
    print(f"{'='*55}")
    print(f"\nNet Portfolio Beta: {net_beta:.3f}")
    if net_beta > 1.2:
        print("  ⚠️  High market exposure — consider hedging")
    elif net_beta < 0.3:
        print("  ✓  Well-hedged / market neutral")
    else:
        print("  ✓  Moderate market exposure")

    print(f"\nPosition Details:")
    for _, row in pos_df.iterrows():
        print(f"  {row['ticker']:6s} | Weight: {row['weight']:5.1%} | "
              f"Beta: {row['beta']:5.3f} | Contrib: {row['beta_contrib']:+.3f} | "
              f"Sector: {row['sector']}")

    # Sector concentration
    sector_weights = pos_df.groupby('sector')['weight'].sum().sort_values(ascending=False)
    print(f"\nSector Exposure:")
    for sector, wt in sector_weights.items():
        flag = " ⚠️  OVER 30% LIMIT" if wt > 0.30 else ""
        print(f"  {sector:20s}: {wt:.1%}{flag}")

    return net_beta, pos_df

snapshot = pwb.get_account()
account_value = float(snapshot.get('netLiquidation', 1_000_000))
net_beta, pos_details = portfolio_exposure_report(positions, account_value)
```

**Step 3 — Pre-trade clearance check (10 min)**
```python
def pre_trade_clearance(new_ticker, new_direction, entry_price,
                         stop_price, positions, account_value,
                         max_sector_pct=0.30, max_correlation=0.70,
                         max_positions=5, cash_reserve_pct=0.20):
    """
    Run pre-trade checks before entering a new position.
    Returns: (approved: bool, reasons: list)
    """
    reasons = []
    approved = True

    # Check 1: Position count
    if len(positions) >= max_positions:
        approved = False
        reasons.append(f"❌ Position limit: {len(positions)}/{max_positions} open")
    else:
        reasons.append(f"✓  Position count: {len(positions)}/{max_positions}")

    # Check 2: Cash reserve
    cash = float(pwb.get_account().get('cashBalance', 0))
    cash_pct = cash / account_value
    if cash_pct < cash_reserve_pct:
        approved = False
        reasons.append(f"❌ Insufficient cash: {cash_pct:.1%} < {cash_reserve_pct:.1%} reserve")
    else:
        reasons.append(f"✓  Cash reserve: {cash_pct:.1%}")

    # Check 3: Correlation with existing positions
    tickers = [p.get('ticker', {}).get('symbol') for p in positions
               if p.get('ticker', {}).get('symbol')]
    if tickers:
        try:
            all_tickers = tickers + [new_ticker]
            end   = pd.Timestamp.now()
            start = end - pd.Timedelta(days=35)
            rets  = {}
            for t in all_tickers:
                rets[t] = yf.download(t, start=start, end=end,
                                       progress=False)['Close'].pct_change().dropna()
            ret_df = pd.DataFrame(rets).dropna()
            new_corr = ret_df[new_ticker].corr(ret_df[tickers].max(axis=1))
            if abs(new_corr) > max_correlation:
                approved = False
                reasons.append(f"❌ High portfolio correlation: {new_corr:.3f}")
            else:
                reasons.append(f"✓  Portfolio correlation: {new_corr:.3f}")
        except:
            reasons.append(f"⚠️  Correlation check skipped (data error)")

    print(f"\n{'='*50}")
    print(f"PRE-TRADE CLEARANCE: {new_ticker} {new_direction}")
    print(f"{'='*50}")
    for r in reasons:
        print(f"  {r}")
    print(f"\n{'APPROVED ✅' if approved else 'REJECTED ❌'}")
    return approved, reasons

# Test pre-clearance on a potential new trade
approved, reasons = pre_trade_clearance(
    new_ticker='TSLA', new_direction='LONG',
    entry_price=250.0, stop_price=244.0,
    positions=positions, account_value=account_value
)
```

---

#### Block 3 — Independent / Pair Work (8:50–9:15 PM) | 25 minutes

**Core Exercise:**
Run the full portfolio management suite on your real paper account.
Answer in markdown:
1. What is your net portfolio beta? Is it appropriate for current market regime?
2. Any high-correlation pairs detected? What will you do about them?
3. Which sector has the highest concentration? Is it within the 30% limit?
4. Run `pre_trade_clearance()` on the next signal in your signal report.
   Does it pass? If not — what needs to change first?

**Extension Challenge:**
Build a portfolio rebalancing suggester:
If any position has grown beyond 25% of the portfolio due to price appreciation,
generate a suggested trim amount that brings it back to 20%.
Print the suggested trades needed to rebalance.

---

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 minutes

**Share-out:** Who had a pre-trade rejection from the clearance check?
"Walk through why it was rejected and what you'll do about it."

**Muddiest Point:**
> *"The muddiest point from tonight was ___."*

**Notebook submission:** `W14_workshop_portfolio_mgmt_[initials].ipynb` to GitHub.

---

## Friday, July 17, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Portfolio Pulse:** Full account summary with sector and beta exposure.

---

### Friday, July 17, 2026 — Review & Market Session
**Time:** 8:00–9:30 PM EST
**Topic:** Week 14 Review + Full Portfolio Review + Rebalancing Assessment

---

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 minutes

1. "Walk me through your net portfolio beta right now.
   Is that intentional? What would you need to change to move it?"

2. "You have NVDA (long) and QQQ (long) with correlation 0.81.
   Both signal exits this week. Which do you close first? Why?"

3. "Explain the pre-trade clearance concept to someone who missed
   Monday. What problems does it solve and what are its limitations?"

4. "What is the 20–30% cash reserve for? Give me two scenarios
   where not having that reserve would have cost you this month."

5. "You run the signal monitor and get 3 signals simultaneously.
   You can only take 1 due to position limits. How do you prioritize?"
   *(Expected: ranking by signal strength — RSI reading, IC history,
   sentiment score, how far below entry threshold each is.
   Use a scoring system, not gut feel.)*

---

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 minutes

**Full portfolio performance vs. week's market:**
"This week SPY did ___%. Your portfolio did ___%.
With a net beta of ___, the expected return was ___ × ___% = ___%
Your actual return was __%.
The difference is your strategy alpha for the week: ___%.
Is it positive or negative? What drove it?"

Standard chart review. Focus on sector performance relative to positions.

---

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 minutes
Standard checklist.

---

#### Block 4 — Next Week Preview & Close (9:20–9:30 PM) | 10 minutes

**Next week:** Strategy evolution — applying Month 3 adaptations live
and comparing performance to the original version.

**Assign reading:**
- Re-read Week 12 adaptation framework notebook
- Review Month 3 summary report — what change did you commit to?

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

---

# WEEK 15 — Strategy Evolution
**Theme:** Run your adaptation live. Compare it to the original. Measure the difference honestly.

---

## Monday, July 20, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Portfolio Pulse:** Three weeks into Month 4. Full cumulative review.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Look at your Month 3 summary report.
You committed to one strategy change for Month 4. Have you implemented it?
Write down: the change, when you implemented it, and how many trades
have occurred since the change. Bring this tonight."

---

### Monday, July 20, 2026 — Theory Session
**Time:** 8:00–9:30 PM EST
**Topic:** Measuring Strategy Evolution — Before vs. After Comparison
**Curriculum source:** Wiki Section 7.1, original FINN framework

#### Pre-Session Requirements
- [ ] Month 3 summary report reviewed
- [ ] Strategy adaptation change documented and implemented
- [ ] All Month 4 trades to date logged in journal

---

#### Block 1 — Day Review (8:00–8:15 PM) | 15 minutes

"Who implemented a strategy change from Month 3?
Walk me through it: what changed, why, and what have you observed?

Who did NOT implement a change — and why? Was it because the
adaptation framework said HOLD? Or because you were avoiding it?"

Enforce the framework: if the decision tree said HOLD, that's valid.
If the student avoided a necessary change due to reluctance, address it directly.

---

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 minutes

**Topic A: Comparing Pre- and Post-Adaptation Performance (20 min)**

"The correct way to evaluate whether your adaptation improved the strategy:

**Method 1 — Split sample comparison:**
Take all Month 3 trades (original strategy).
Take all Month 4 trades to date (adapted strategy).
Compare: win rate, average R:R, expectancy, Sharpe.
Problem: sample sizes are small. Be humble about conclusions.

**Method 2 — Updated backtest comparison:**
Re-run your backtest on recent data (last 6 months) with original
vs. adapted parameters. Does the adapted version outperform?
This is more statistically valid than 3 weeks of live trades.

**Method 3 — IC comparison:**
Re-run the IC test from Week 5 on the adapted signal.
Has the IC improved? Compare old IC to new IC on the same data.
A higher IC means better signal predictive power.

**The honest outcome space:**
- Adapted version clearly better → continue, build confidence
- No meaningful difference → adaptation was neutral — not harmful but not needed
- Adapted version worse → revert, understand why, go back to the decision tree
- Not enough data → need more trades before concluding anything

All four outcomes are valid. The worst outcome is pretending one is another."

**Topic B: Versioning Your Strategy (15 min)**

"Professional quant shops version-control their strategies.
Every parameter change gets a new version number and a documented rationale.
Performance is tracked per version.

We do the same in GitHub:

```
strategy_v1.py  — Original Month 2 strategy
strategy_v1_1.py — Month 4 adaptation: added ADX filter
strategy_v1_2.py — [future adaptation]
```

Each version has:
- A changelog: what changed and why
- A backtest result: 3-year performance on fresh out-of-sample data
- A live result: actual paper trading performance since deployment
- An IC score: signal quality measurement at version deployment

This is the documentation habit that separates rigorous quants from guess-workers.
In a professional environment, every strategy change requires documented justification.
We hold ourselves to the same standard."

**Topic C: When Original Beats Adapted (10 min)**

"Sometimes the original strategy was correct and the adaptation
introduces problems you didn't anticipate. Signs the adaptation failed:

1. Win rate dropped but R:R improved (or vice versa) — net expectancy neutral
2. Fewer signals fire — the regime filter is too restrictive
3. New rule creates edge cases where the system logic is unclear
4. IC declined on recent data despite the adaptation

The discipline to revert to the original when evidence supports it
is harder than it sounds. It means admitting you were wrong.
That discipline is what makes systematic trading systematic.
Your ego is not a valid input to the adaptation decision."

---

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 minutes

1. "You added an ADX > 25 filter to your strategy. Since adding it,
   your signal frequency dropped 60%. The remaining signals perform
   better on average. Is this a successful adaptation?"
   *(Expected: depends on expectancy math. Fewer, higher-quality signals
   can be better — IF the reduction in frequency doesn't drop expectancy
   below the cost of running the strategy. Calculate total expected P&L
   per year with old vs. new signal frequency × win rate × avg P&L.)*

2. "Your adaptation improved backtest Sharpe from 1.1 to 1.4 on the last
   6 months of data — the same 6 months you used to design the adaptation.
   What's the problem with this result?"
   *(Expected: in-sample optimization. The adaptation was designed using
   that 6-month data, so of course it performs better on it. Need to test
   on a different period — or use walk-forward on data the adaptation never saw.)*

3. "Devil's advocate: Should strategy parameters ever be fixed permanently?
   What if the market structure fundamentally changes in ways that make
   the original parameters obsolete?"
   *(Expected: Parameters should be reviewed on a defined schedule —
   quarterly or after 100+ trades — not after every drawdown.
   The key is systematic review with evidence, not ad-hoc changes.
   Fundamental market structure changes are real and warrant adaptation
   but require substantial evidence before acting.)*

---

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 minutes

**Wednesday workshop:**
"We run the before/after comparison in Python — original vs. adapted
strategy backtest side by side, IC comparison, and live trade statistics.
Starter: `W15_workshop_strategy_evolution_starter.ipynb`
Bring: your original strategy parameters and your adapted parameters."

**Closing reflection:**
*"The honest assessment of my adaptation so far is ___."*

---

## Wednesday, July 22, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

---

### Wednesday, July 22, 2026 — Workshop Session
**Time:** 8:00–9:30 PM EST
**Topic:** Before vs. After Strategy Comparison + Version Control Setup
**Curriculum source:** Wiki Sections 7.1, 7.3
**Notebook:** `W15_workshop_strategy_evolution_[initials].ipynb`

---

#### Block 1 — Framing & Context Bridge (8:00–8:10 PM) | 10 minutes

"Tonight is the most honest session of the course.
We put the adaptation decision on trial. Two strategies go in,
the data decides which wins.
No pride. No attachment. Just evidence."

---

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 minutes

```python
import backtrader as bt
import yfinance as yf
import pandas as pd
import numpy as np
import quantstats as qs
import pandas_ta as ta
from scipy.stats import spearmanr
import matplotlib.pyplot as plt
import warnings
warnings.filterwarnings('ignore')
```

**Step 1 — Define both strategy versions (8 min)**
```python
# ── STRATEGY VERSIONS — Students fill these with their own params ──

VERSION_1 = {
    'name':       'v1.0 — Original',
    'rsi_entry':  30,
    'rsi_exit':   60,
    'ema_period': 20,
    'max_hold':   10,
    'adx_filter': False,   # No ADX filter in original
    'adx_min':    0,
}

VERSION_2 = {
    'name':       'v1.1 — ADX Filter Added',
    'rsi_entry':  30,
    'rsi_exit':   60,
    'ema_period': 20,
    'max_hold':   10,
    'adx_filter': True,    # Require ADX > 25 for entry
    'adx_min':    25,
}

print("Strategy versions defined:")
print(f"  V1: {VERSION_1['name']}")
print(f"  V2: {VERSION_2['name']}")
```

**Step 2 — Parameterized Backtrader strategy (15 min)**
```python
class ParameterizedStrategy(bt.Strategy):
    """
    Flexible RSI mean reversion strategy that accepts version parameters.
    Used to compare V1 vs V2 on identical data.
    """
    params = dict(
        rsi_period=14,
        rsi_entry=30,
        rsi_exit=60,
        ema_period=20,
        max_hold=10,
        risk_pct=0.02,
        adx_filter=False,
        adx_min=25,
        version_name='v1.0',
        printlog=False
    )

    def __init__(self):
        self.rsi  = bt.indicators.RSI(self.data.close, period=self.params.rsi_period)
        self.ema  = bt.indicators.EMA(self.data.close, period=self.params.ema_period)
        self.atr  = bt.indicators.ATR(self.data, period=14)
        self.adx  = bt.indicators.AverageDirectionalMovementIndex(self.data, period=14)
        self.order      = None
        self.bar_in_trade = 0
        self.trades_log = []

    def notify_order(self, order):
        if order.status == order.Completed:
            if order.issell() and self.order:
                self.trades_log.append({
                    'exit_date': self.datas[0].datetime.date(0),
                    'pnl':       order.executed.pnl
                })
        if order.status in [order.Completed, order.Canceled, order.Rejected]:
            self.order = None

    def next(self):
        if self.order:
            return

        if not self.position:
            rsi_ok  = self.rsi[0] < self.params.rsi_entry
            ema_ok  = self.data.close[0] <= self.ema[0] * 1.02
            adx_ok  = (self.adx[0] > self.params.adx_min
                       if self.params.adx_filter else True)

            if rsi_ok and ema_ok and adx_ok:
                stop_dist = self.atr[0] * 1.5
                risk_amt  = self.broker.getvalue() * self.params.risk_pct
                size      = max(1, int(risk_amt / stop_dist))
                self.order = self.buy(size=size)
                self.bar_in_trade = 0
        else:
            self.bar_in_trade += 1
            rsi_exit = self.rsi[0] > self.params.rsi_exit
            time_exit = self.bar_in_trade >= self.params.max_hold

            if rsi_exit or time_exit:
                self.order = self.close()

def run_version_backtest(version_params, ticker, start, end,
                          starting_cash=10_000, commission=0.001):
    """Run a full backtest for one strategy version."""
    raw = yf.download(ticker, start=start, end=end,
                       auto_adjust=True, progress=False)
    raw.columns = [c[0] if isinstance(c, tuple) else c for c in raw.columns]

    data = bt.feeds.PandasData(dataname=raw)

    cerebro = bt.Cerebro()
    cerebro.adddata(data)
    cerebro.addstrategy(ParameterizedStrategy, **version_params,
                         printlog=False)
    cerebro.broker.setcash(starting_cash)
    cerebro.broker.setcommission(commission=commission)
    cerebro.broker.set_slippage_perc(0.001)

    cerebro.addanalyzer(bt.analyzers.SharpeRatio,
                         _name='sharpe', riskfreerate=0.05/252)
    cerebro.addanalyzer(bt.analyzers.DrawDown, _name='dd')
    cerebro.addanalyzer(bt.analyzers.TradeAnalyzer, _name='trades')
    cerebro.addanalyzer(bt.analyzers.PyFolio, _name='pyfolio')

    results = cerebro.run()
    strat   = results[0]

    final   = cerebro.broker.getvalue()
    sharpe  = strat.analyzers.sharpe.get_analysis().get('sharperatio', 0)
    dd      = strat.analyzers.dd.get_analysis()
    trades  = strat.analyzers.trades.get_analysis()
    pf      = strat.analyzers.pyfolio.get_analysis()

    n_trades = trades.get('total', {}).get('total', 0)
    n_won    = trades.get('won', {}).get('total', 0)
    win_rate = n_won / n_trades if n_trades > 0 else 0
    mdd      = dd.max.drawdown if hasattr(dd, 'max') else 0

    pf_returns = pd.Series(pf['returns'])
    pf_returns.index = pd.to_datetime(pf_returns.index)

    return {
        'version':    version_params.get('version_name', 'Unknown'),
        'final_value': final,
        'total_return': (final / starting_cash - 1),
        'sharpe':     sharpe or 0,
        'max_dd':     mdd,
        'n_trades':   n_trades,
        'win_rate':   win_rate,
        'returns':    pf_returns
    }

# Run both versions on out-of-sample data (2025 onwards — not used in original backtest)
TICKER = 'SPY'
OOS_START = '2025-01-01'
OOS_END   = '2026-06-01'

print(f"\nRunning out-of-sample comparison on {TICKER}")
print(f"Period: {OOS_START} → {OOS_END}")
print("─"*55)

v1_result = run_version_backtest({**VERSION_1, 'version_name': 'v1.0'},
                                   TICKER, OOS_START, OOS_END)
v2_result = run_version_backtest({**VERSION_2, 'version_name': 'v1.1'},
                                   TICKER, OOS_START, OOS_END)
```

**Step 3 — Side-by-side comparison (7 min)**
```python
def compare_versions(v1, v2):
    """Print side-by-side version comparison."""
    metrics = ['version', 'total_return', 'sharpe', 'max_dd', 'n_trades', 'win_rate']
    labels  = ['Version', 'Total Return', 'Sharpe', 'Max Drawdown', 'Trades', 'Win Rate']
    fmts    = [str, '{:.2%}', '{:.3f}', '{:.2f}%', str, '{:.1%}']

    print(f"\n{'='*60}")
    print(f"OUT-OF-SAMPLE COMPARISON")
    print(f"{'='*60}")
    print(f"{'Metric':<20} {'V1 Original':>18} {'V1.1 Adapted':>18}")
    print(f"{'─'*60}")

    for metric, label, fmt in zip(metrics, labels, fmts):
        val1 = v1[metric]
        val2 = v2[metric]
        if callable(fmt):
            v1_str = str(val1)
            v2_str = str(val2)
        else:
            try:
                v1_str = fmt.format(val1)
                v2_str = fmt.format(val2)
            except:
                v1_str = str(val1)
                v2_str = str(val2)

        winner = ""
        if metric in ['total_return', 'sharpe', 'win_rate', 'n_trades']:
            if isinstance(val1, (int, float)) and isinstance(val2, (int, float)):
                if val2 > val1:
                    winner = " ✓"
        elif metric == 'max_dd':
            if isinstance(val1, (int, float)) and isinstance(val2, (int, float)):
                if val2 < val1:
                    winner = " ✓"

        print(f"{label:<20} {v1_str:>18} {v2_str:>18}{winner}")

    print(f"{'─'*60}")

    # Overall recommendation
    v2_score = sum([
        v2_result['total_return'] > v1_result['total_return'],
        v2_result['sharpe'] > v1_result['sharpe'],
        abs(v2_result['max_dd']) < abs(v1_result['max_dd'])
    ])

    print(f"\nOut-of-sample verdict (3 metrics):")
    if v2_score == 3:
        print("  V1.1 WINS on all 3 metrics → Adaptation validated ✓")
    elif v2_score == 2:
        print("  V1.1 WINS on 2/3 metrics → Cautious support for adaptation")
    elif v2_score == 1:
        print("  V1.0 WINS on 2/3 metrics → Adaptation shows limited benefit")
    else:
        print("  V1.0 WINS on all 3 metrics → Consider reverting ⚠️")

compare_versions(v1_result, v2_result)
```

**Step 4 — IC comparison (10 min)**
```python
def compare_ic_versions(ticker, v1_params, v2_params, period='1y'):
    """Compare IC of original vs. adapted signal."""
    df = yf.download(ticker, period=period, interval='1d', progress=False)
    df.columns = [c[0] if isinstance(c, tuple) else c for c in df.columns]
    df['RSI']    = ta.rsi(df['Close'], length=14)
    df['EMA_20'] = ta.ema(df['Close'], length=20)
    df['ADX']    = ta.adx(df['High'], df['Low'], df['Close'])['ADX_14']
    df['Fwd_5d'] = df['Close'].pct_change(5).shift(-5)
    df.dropna(inplace=True)

    # V1: all RSI < 30 instances
    v1_mask = df['RSI'] < v1_params['rsi_entry']
    # V2: RSI < 30 AND ADX > 25
    v2_mask = (df['RSI'] < v2_params['rsi_entry']) & \
              (df['ADX'] > v2_params['adx_min'])

    def calc_ic(mask, df):
        subset = df[mask]
        if len(subset) < 5:
            return 0, 1.0
        return spearmanr(-subset['RSI'], subset['Fwd_5d'])

    v1_ic, v1_p = calc_ic(v1_mask, df)
    v2_ic, v2_p = calc_ic(v2_mask, df)

    print(f"\nIC Comparison — {ticker}")
    print(f"{'─'*40}")
    print(f"V1.0 IC: {v1_ic:.4f} (p={v1_p:.4f}) | n={v1_mask.sum()}")
    print(f"V1.1 IC: {v2_ic:.4f} (p={v2_p:.4f}) | n={v2_mask.sum()}")
    ic_change = v2_ic - v1_ic
    print(f"IC delta: {ic_change:+.4f} "
          f"({'improved' if ic_change > 0 else 'declined'})")

compare_ic_versions('SPY', VERSION_1, VERSION_2)
```

---

#### Block 3 — Independent / Pair Work (8:50–9:15 PM) | 25 minutes

**Core Exercise:**
Run the full comparison with YOUR actual strategy versions.
Update VERSION_1 and VERSION_2 with your real original and adapted parameters.
Run on your actual target ticker.
Complete the markdown section: "My adaptation result + recommendation."

**Extension Challenge:**
Add a third version: V1.2 — testing a different adaptation idea you considered
but didn't implement. Compare all three. What does the data suggest about
the direction of future development?

---

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 minutes

**Share-out:** 2–3 students share their comparison results.
"Whose adaptation won? Whose lost? Who was surprised by the result?"

**Muddiest Point:**
> *"The muddiest point from tonight was ___."*

**Notebook submission:** `W15_workshop_strategy_evolution_[initials].ipynb` to GitHub.

---

## Friday, July 24, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Portfolio Pulse:** Month 4 Week 3 summary. Three weeks of adapted strategy data.

---

### Friday, July 24, 2026 — Review & Market Session
**Time:** 8:00–9:30 PM EST
**Topic:** Week 15 Review + Strategy Evolution Findings + Milestone 3 Preview

---

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 minutes

1. "Present your version comparison results. Which version won?
   What is your recommendation going into Month 5?"

2. "IC improved from 0.04 to 0.07 with the ADX filter.
   Is that a meaningful improvement? What would make you more confident?"

3. "Your adapted strategy fires 40% fewer signals.
   Does that mean it makes less money? Walk me through the math."

4. "You ran the out-of-sample comparison. What does 'out-of-sample'
   mean and why does it matter that we didn't touch that period
   when designing the adaptation?"

5. "Looking at your live Month 4 trades vs. Month 3 trades —
   what single behavioral pattern do you notice across all your work?"

---

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 minutes

Standard format. Add: "Pull up the period we used for the out-of-sample
comparison in Wednesday's notebook. Does the chart of that period match
what the backtest told us? Where did the strategy succeed or fail
relative to the chart's actual price action?"

---

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 minutes

Standard checklist plus Milestone 3 context:
"One week until the Milestone 3 review. What does the current
derivatives picture tell you about market expectations for next week?
This feeds directly into your forward plan presentation at the milestone."

---

#### Block 4 — Milestone 3 Preview & Close (9:20–9:30 PM) | 10 minutes

"Milestone 3 is Friday August 1. Individual 30-minute reviews.
The review will cover:

1. Full journal audit — every trade, every field, every post-trade review
2. P&L vs. SPY benchmark (Month 3 + Month 4 combined)
3. Attribution analysis — how much was alpha vs. beta?
4. Strategy adherence rate — did you follow your rules?
5. Adaptation decision — what changed, why, and what did the data show?
6. Forward plan — what are you doing in Month 5?

Start preparing your Milestone 3 package this weekend:
- Complete trade journal for all Months 3–4
- Run the Week 11 analytics notebook on all data
- Run the Week 15 version comparison on your strategy
- Write a 1-page summary of Months 3–4 findings"

**Assign reading for Week 16:**
- Review entire trading journal — every entry
- Re-read Month 3 summary report
- Prepare 2-minute summary of strategy performance

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

---

# WEEK 16 — Milestone 3 Preparation & Review
**Theme:** Two months of live trading. What did the data actually show?

---

## Monday, July 27, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Portfolio Pulse:** Final full-week review before Milestone 3.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Run the automated signal monitor and the portfolio
management notebook. Generate a complete current-state snapshot.
This is the starting point for Friday's Milestone 3 review."

---

### Monday, July 27, 2026 — Theory Session
**Time:** 8:00–9:30 PM EST
**Topic:** Synthesizing Two Months of Paper Trading — What the Data Reveals
**Curriculum source:** All prior Month 3–4 content

---

#### Block 1 — Day Review & Milestone Prep Check (8:00–8:15 PM) | 15 minutes

"Let's do a quick inventory. Who has:
- Complete journal for all Month 3–4 trades (raise hand)
- Run the attribution notebook on full Month 3–4 data (raise hand)
- Written their forward plan for Month 5 (raise hand)
- Version comparison run and documented (raise hand)

Anyone missing any of these — Wednesday workshop is your recovery time.
Friday Milestone 3 requires all of them."

---

#### Block 2 — Synthesis Session (8:15–8:55 PM) | 40 minutes

No new content tonight. This is a guided synthesis session.

**Structured retrospective — instructor facilitates, students drive:**

**Part 1 — The Data Story (15 min):**
"What does two months of paper trading tell you about your strategy?
Not feelings — data. What are the numbers?

Walk me through:
- Total P&L and return %
- Win rate and R:R
- Sharpe ratio
- Max drawdown from the risk dashboard
- Alpha vs. SPY beta contribution
- Rule adherence rate
- Signal monitor effectiveness — did it improve your timing?"

Call on each student. They present their numbers verbally without notes.
If they can't recall them — that's feedback. Their metrics should be
internalized by now, not just in a notebook.

**Part 2 — The Behavioral Story (15 min):**
"Numbers tell half the story. Behavior tells the rest.

For each student:
- When did you deviate from your rules? What triggered it?
- When did you feel the strongest urge to override the strategy?
  What happened when you did vs. when you didn't?
- When was your best decision? (Not best trade — best decision.)
- When was your worst decision? (Not worst trade — worst decision.)"

**Part 3 — The Forward Story (10 min):**
"Month 5 adds more sophisticated AI tools and deeper automation.
But it also continues paper trading with the same rigor.

What is the most important thing to change in Month 5?
What is the most important thing to keep exactly the same?

Spend 5 minutes writing these two answers before Wednesday.
They become your Milestone 3 forward plan."

---

#### Block 3 — Milestone 3 Q&A (8:55–9:15 PM) | 20 minutes

Open floor: any questions about the Milestone 3 format, what to prepare,
or how to handle specific edge cases in the review.

"Let me be clear about what Milestone 3 is and what it isn't.

It IS:
- A structured review of your documented work from Months 3–4
- An opportunity to articulate your learnings with data support
- A coaching session with feedback on what to strengthen in Months 5–6

It IS NOT:
- A judgment on P&L performance
- A test you can 'fail' by having losing trades
- An evaluation of whether you picked good stocks

A student who lost 3% but has a complete journal, honest attribution,
and a rigorous forward plan PASSES with distinction.

A student who made 8% but has a sparse journal, no attribution work,
and no forward plan is the one who should be concerned."

---

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 minutes

**Wednesday workshop:**
"Final journal audit and Milestone 3 package assembly.
Starter: `W16_workshop_milestone3_prep_starter.ipynb`
This notebook walks you through generating the complete Milestone 3 package:
journal audit, full analytics report, attribution summary, and forward plan."

**Pre-reading:** None — preparation only.

---

## Wednesday, July 29, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Portfolio Pulse:** Penultimate day of Month 4. Full account snapshot.

---

### Wednesday, July 29, 2026 — Workshop Session
**Time:** 8:00–9:30 PM EST
**Topic:** Milestone 3 Package Assembly — Journal Audit + Full Analytics
**Curriculum source:** All Month 3–4 content
**Notebook:** `W16_workshop_milestone3_prep_[initials].ipynb`

---

#### Block 1 — Framing (8:00–8:10 PM) | 10 minutes

"Tonight is preparation, not new content.
By the end of this session, every student will have a complete
Milestone 3 package: journal, analytics, attribution, forward plan.

If your journal has gaps — we fill them tonight.
If your attribution notebook hasn't been run — we run it tonight.
No one leaves this session unprepared for Friday."

---

#### Block 2 — Milestone 3 Package Builder (8:10–9:10 PM) | 60 minutes

Students work through the following checklist independently.
Instructor circulates — no lecture, pure 1:1 coaching.

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
            missing_report.append(f"  ❌ Column missing: {field}")
        else:
            null_count = journal_df[field].isna().sum() + \
                        (journal_df[field] == '').sum() + \
                        (journal_df[field] == '[TBD]').sum()
            if null_count > 0:
                missing_report.append(
                    f"  ⚠️  {field}: {null_count} incomplete entries"
                )
            else:
                print(f"  ✓  {field}: complete")

    if missing_report:
        print("\nINCOMPLETE FIELDS — MUST FIX BEFORE FRIDAY:")
        for item in missing_report:
            print(item)
        return False
    else:
        print("\n✅ Journal is complete. All fields populated.")
        return True

# Students load their actual journal CSV here
# For workshop: create sample if no journal exists yet
sample_journal = pd.DataFrame({
    'date':             ['2026-06-10', '2026-06-15', '2026-06-22',
                         '2026-07-01', '2026-07-08', '2026-07-15'],
    'ticker':           ['SPY', 'QQQ', 'AAPL', 'MSFT', 'SPY', 'NVDA'],
    'direction':        ['Long', 'Long', 'Long', 'Long', 'Long', 'Long'],
    'hypothesis':       ['RSI oversold + EMA support'] * 6,
    'signal':           ['RSI=29, Close/EMA=0.99'] * 6,
    'entry_price':      [538.2, 470.5, 195.3, 415.0, 542.1, 485.0],
    'position_size':    [50, 40, 100, 60, 50, 45],
    'stop_loss':        [535.0, 467.0, 192.0, 411.0, 539.0, 481.0],
    'target':           [545.0, 476.0, 200.0, 421.0, 549.0, 493.0],
    'exit_price':       [542.0, 468.2, 198.5, 418.5, 540.0, 491.0],
    'pnl':              [190, -92, 320, 210, -105, 270],
    'rule_followed':    [True, True, True, False, True, True],
    'post_trade_review':['Price respected EMA support'] * 6
})

journal_complete = audit_journal(sample_journal)
```

**Section 2 — Full Performance Analytics (15 min)**
```python
# (Reuse functions from W11 + W12)
print("\nSECTION 2: PERFORMANCE ANALYTICS")
print("─"*40)

# Students run their actual trade_summary(), calculate_alpha_beta(),
# and detect_market_regime() functions here
# These should already be built from W11 workshop

total_pnl   = sample_journal['pnl'].sum()
total_ret   = total_pnl / 1_000_000
wins        = sample_journal[sample_journal['pnl'] > 0]
losses      = sample_journal[sample_journal['pnl'] < 0]
win_rate    = len(wins) / len(sample_journal)
rule_rate   = sample_journal['rule_followed'].mean()
avg_win     = wins['pnl'].mean()
avg_loss    = abs(losses['pnl'].mean())
rr          = avg_win / avg_loss

print(f"Period:              Month 3 + Month 4")
print(f"Total Trades:        {len(sample_journal)}")
print(f"Total P&L:           ${total_pnl:+,.2f} ({total_ret:+.2%})")
print(f"Win Rate:            {win_rate:.1%}")
print(f"R:R Ratio:           {rr:.2f}")
print(f"Rule Adherence:      {rule_rate:.1%}")
```

**Section 3 — Strategy Adaptation Summary (10 min)**
```python
print("\nSECTION 3: STRATEGY ADAPTATION SUMMARY")
print("─"*40)

adaptation_summary = {
    'original_strategy':    'RSI Mean Reversion v1.0',
    'adaptation_made':      'Added ADX > 25 filter (v1.1)',
    'adaptation_rationale': 'Reduce losing trades in choppy/trendless markets',
    'oos_comparison':       'V1.1 Sharpe: 1.21 vs V1.0 Sharpe: 0.94 (out-of-sample)',
    'ic_comparison':        'V1.1 IC: 0.068 vs V1.0 IC: 0.041',
    'live_result':          'V1.1 fired 8 signals vs V1.0 fired 14 (Month 4)',
    'recommendation':       'Continue V1.1 into Month 5 — OOS improvement validated',
    'month5_plan':          'Test sentiment veto threshold optimization'
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
| SPY Benchmark Return | [FILL FROM ANALYTICS] |
| Alpha vs SPY | [FROM W11 NOTEBOOK] |
| Total Trades | {len(journal_df)} |
| Win Rate | {win_rate:.1%} |
| Avg Win / Avg Loss | ${avg_win:,.2f} / ${avg_loss:,.2f} |
| Risk:Reward | {rr:.2f} |
| Expectancy | ${expectancy:+,.2f} per trade |
| Rule Adherence | {rule_rate:.1%} |
| Max Drawdown | [FROM RISK DASHBOARD] |
| Sharpe Ratio | [FROM ANALYTICS] |

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

[WRITE: When did you deviate? What triggered it? Pattern observed?]

## 4. Best and Worst Decisions

**Best decision (not trade):**
[Describe the decision and why it was correct regardless of outcome]

**Worst decision (not trade):**
[Describe the decision and what you would do differently]

## 5. Month 5 Forward Plan

**Strategy version for Month 5:** {adaptation_summary['month5_plan']}
**Primary focus:** [What skill or area do you most need to develop?]
**Risk management adjustment:** [Any changes to sizing or stops?]
**Target metrics for Month 5:** Win rate ___ | Sharpe ___ | Rule adherence ___

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
    sample_journal, adaptation_summary,
    student_name="[YOUR NAME]"
)
print("\n✅ Milestone 3 package complete.")
```

---

#### Block 4 — Share-Out & Muddiest Point (9:10–9:30 PM) | 20 minutes

**Pre-milestone check-in (15 min):**
"Who still has incomplete journal entries? Name the trades.
Who is missing post-trade reviews? Write them tonight — not tomorrow.

The Milestone 3 review is in 48 hours. The package is due before Friday DMB."

**Final muddiest point for Month 4:**
> *"Going into Milestone 3, the thing I am least confident about is ___."*

**Notebook submission:** `W16_workshop_milestone3_prep_[initials].ipynb` to GitHub.
**Milestone 3 report:** `milestone3_report_[initials].md` pushed to GitHub before Friday DMB.

---

## Friday, August 1, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation
**Note:** Keep this DMB efficient. Milestone 3 reviews begin at 8:00 PM.
Students should be reviewing their packages, not adding new trades.

**Portfolio Pulse:** Final Month 4 account snapshot.

---

### Friday, August 1, 2026 — Milestone 3: Paper Trading Mid-Review
**Time:** 8:00–9:30 PM EST
**Format:** Individual reviews — 30 minutes per student

---

#### Milestone 3 Review Format (30 minutes per student)

Reviews run sequentially. Other students continue independent work
or review their own packages while waiting.
If class size exceeds 3 students, overflow sessions scheduled for
Saturday August 2 at same time slot.

**Part 1 — Journal Audit (8 min)**
Instructor reviews the student's journal notebook or markdown file live.
Checks: all fields complete, post-trade reviews present, honest assessment.

Questions during audit:
- "Walk me through your worst trade in terms of journal quality.
  What's missing? Why?"
- "Your post-trade review on this trade says 'it went up.' That's not analysis.
  What should it say?"
- "Show me one post-trade review you're genuinely proud of."

**Part 2 — Performance Review (10 min)**
Student presents key metrics verbally (no reading from screen):
- Total return vs. SPY
- Win rate, R:R, expectancy
- Attribution: alpha vs. beta contribution
- Rule adherence rate

Instructor questions:
- "Your Sharpe was 0.8. Your backtest showed 1.4. Walk me through
  three possible explanations for the gap."
- "Your rule adherence was 78%. What was happening in the 22%
  of trades where you deviated? What triggered those deviations?"
- "What is your portfolio beta right now and is it appropriate
  for the current market regime?"

**Part 3 — Strategy Adaptation Review (7 min)**
Student presents the version comparison findings.

Instructor questions:
- "Your adaptation improved OOS Sharpe. Is that sufficient evidence
  to trust it for Month 5? What would make you MORE confident?"
- "If the OOS comparison had shown V1.0 winning — what would you do?
  Walk me through the decision tree."

**Part 4 — Month 5 Forward Plan (5 min)**
Student presents their Month 5 plan verbally.
Instructor gives one coaching point and one question to consider.

---

#### After Reviews — Month 4 Close (remaining time)

**Month 4 group retrospective (10 min):**
"Looking back at Week 9 — what feels completely automated now
that felt overwhelming then? What is the hardest thing about
systematic trading that you didn't anticipate?"

**Month 5 preview (5 min):**
"Month 5 adds deeper AI integration — multi-agent pipelines,
live NewsAPI sentiment, and the beginning of the capstone strategy design.
We also bring in more sophisticated ML: XGBoost on the live feature matrix.
The pace increases. The standards for your trading journal and analytics
do not drop — they rise."

**Pre-reading for Month 5, Week 1:**
- Wiki Section 6.3 — Full ML framework (re-read with 2 months context)
- Wiki Section 6.4 — Multi-agent AI (conceptual to applied)
- Review Week 8 FinBERT notebook — we extend it significantly in Month 5

**Monthly One-Liner:**
> *"Month 4 taught me ___, and Month 5 I want to ___."*

---

---

## Month 4 Instructor Summary Notes

### Content Coverage Checklist

- [ ] Wiki Section 6.3 — ML signal generation applied to live automation (Week 13)
- [ ] Wiki Section 6.4 — Multi-agent AI concept introduced (Week 13)
- [ ] Automated signal monitor — full pipeline (Week 13 workshop)
- [ ] Multi-position correlation management (Week 14)
- [ ] Portfolio beta and sector exposure (Week 14 workshop)
- [ ] Pre-trade clearance system (Week 14 workshop)
- [ ] Strategy evolution framework — before/after comparison (Week 15)
- [ ] Version control for strategies — GitHub workflow (Week 15)
- [ ] Milestone 3 package generation (Week 16 workshop)

### Workshops Delivered

| Workshop | Notebook | Key Skills |
|---------|---------|-----------|
| W13 | `W13_workshop_signal_monitor` | Automated watchlist scanner, sentiment integration, signal reports |
| W14 | `W14_workshop_portfolio_mgmt` | Correlation matrix, portfolio beta, pre-trade clearance |
| W15 | `W15_workshop_strategy_evolution` | Before/after backtest, IC comparison, version control |
| W16 | `W16_workshop_milestone3_prep` | Journal audit, analytics package, M3 report generator |

### Pre-Built Async Packages

Two async packages prepared for potential summer cancellations:

**Week 13 Monday Async** (if cancelled):
- Topic: Automated signal pipelines and AI workflow theory
- Reading: Wiki 6.3, 6.4 + external: "Building a Python Stock Screener"
- Exercise: Write entry conditions as Python boolean expressions (no code execution)
- Due: Monday 11:59 PM

**Week 15 Monday Async** (if cancelled):
- Topic: Strategy evolution and before/after comparison methodology
- Reading: Wiki 7.1 (re-read), review W12 adaptation notebook
- Exercise: Written comparison of original vs. adapted parameters —
  hypothesize which will perform better and why (without running code)
- Due: Monday 11:59 PM

### Milestone 3 Results

Document each student's review outcome:
```
Student: [Name]
Date: August 1, 2026
Month 3+4 Combined Return: ___% vs SPY ___%
Total Trades: ___
Win Rate: ___
Rule Adherence: ___
Journal Quality: Complete / Mostly Complete / Needs Work
Attribution Work: Complete / Incomplete
Strategy Adaptation: Validated / Neutral / Reverted
Strongest area: ___
Biggest gap to address in Month 5: ___
Month 5 strategy version: ___
Milestone 3 outcome: Pass / Needs Follow-up
Notes: ___
```

### Notes for Month 5 Setup

Before Month 5 begins:
- [ ] All Milestone 3 reports reviewed and feedback given
- [ ] Each student's Month 5 strategy version confirmed
- [ ] NewsAPI keys distributed (Month 5 uses live news feed)
- [ ] XGBoost and scikit-learn pipeline modules reviewed
- [ ] Capstone strategy hypothesis format shared with students —
  Month 5 is the beginning of capstone design

---

*FINN — Month 04 Lesson Plan*
*Paper Trading Phase II: Iteration, Automation & Milestone 3*
*Dates: July 6 – August 1, 2026*
*Next: FINN_Month05.md — Optimization, Deep AI & Capstone Strategy Design*
