# FINN — Week 13: The Automation Layer
## Paper Trading Phase II | Month 4: Paper Trading II — Iteration, Automation & Milestone 3
**Dates:** July 6–11, 2026
**Week Number:** 13 of 24

---

## WEEK OVERVIEW

### Theme
Your strategy should not require you to watch charts all day. Build the system that watches for you. This week introduces the full automated signal monitor pipeline — data ingestion, indicator computation, signal evaluation, sentiment veto, and alert output — as a replacement for manual chart-watching.

### Learning Objectives
By the end of this week, students will be able to:
- Describe the 3-stage signal pipeline architecture (data layer → signal evaluation → alert layer)
- Build a complete automated signal monitor in Python that runs on a watchlist and outputs a signal report
- Integrate FinBERT sentiment scoring as a veto condition on top of technical signals
- Explain the difference between a missed signal (limit order) and a broken strategy
- Use the `schedule` Python library to automate daily pre-market execution
- Evaluate whether automated signals outperform their own manual detection rate

### Materials Needed
- `finnenv` environment — `yfinance`, `pandas`, `pandas_ta`, `numpy`, `transformers`, `torch`, `schedule`
- `.env` file with credentials — do not commit to GitHub
- GitHub repo — starter notebook `W13_workshop_signal_monitor_starter.ipynb`
- FinBERT model (pre-downloaded from HuggingFace — ~440MB)
- Month 3 strategy rules written as explicit Python boolean conditions

### Pre-Week Checklist (Instructor)
- [ ] Push `W13_workshop_signal_monitor_starter.ipynb` to GitHub before Wednesday
- [ ] Verify `schedule` library is installed in `finnenv` (`pip install schedule`)
- [ ] Confirm FinBERT model loads without error on instructor machine before class
- [ ] Assign DMB rotation for Monday, Wednesday, Friday
- [ ] Note: Month 4 begins this week — add `## Month 4 — Week 13` to hypothesis log

---

## MONDAY — July 6, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse (Block 1 — standing addition):**
Back from July 4 weekend. Portfolio state check. Any overnight market developments?

#### Block 1 — Pre-Market Scan (9:00–9:15 AM)
Standard checklist.
- [ ] ES, NQ, YM futures — direction post-holiday weekend
- [ ] VIX — any volatility compression from July 4?
- [ ] Macro calendar — any Q2 data releases this week?
- [ ] Earnings calendar — July earnings season beginning
- [ ] Finviz sector heatmap
- [ ] 10-year yield, BTC/ETH

#### Block 2 — Student-Led Brief (9:15–9:35 AM)
Standard rotation. This week's extended brief element:
```
Trade Idea:    [Based on your strategy — any setups forming?]
Action Plan:  [If signal triggers today — what exactly do you do?]
Manual Count: [How many times did you manually check charts today?]
```

#### Block 3 — Hypothesis Setting (9:35–9:50 AM)
Month 4 hypothesis log section. Encourage trade-specific hypotheses connected to the signal pipeline.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "During market hours, manually monitor your signal conditions for your top 3 tickers every 30 minutes. Keep a written log: time, ticker, indicator readings, signal status (triggered/not). Count how many total checks you make. Bring the count to tonight's class."

---

### EVENING: Theory Session (8:00–9:30 PM EST)
**Topic:** Automated Signal Alerts & AI Workflow Integration
**Curriculum Source:** Wiki Section 6.3 (intro), 8.3

#### Pre-Session Setup
- [ ] Manual monitoring log from today — count of checks ready
- [ ] Month 3 strategy rules written out as explicit conditions
- [ ] FinBERT model confirmed downloadable (run `pip install transformers` if not done)

#### Block 1 — Day Review & The Manual Problem (8:00–8:15 PM) | 15 min

"How many manual checks did you make today? Call them out."

Collect the numbers. Calculate the class average.

"That number — multiplied by every trading day — is the attention tax your strategy is charging you. Tonight we build the system that eliminates it. Not because automation is better than human judgment. Because human judgment applied to the wrong problem — 'is the RSI at 32 yet?' — is a waste of the cognitive resource we need for the hard problems: 'is my thesis still valid?'"

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 min

**Topic A: The Automated Trading Workflow (15 min)**

Four phases, run in sequence each trading day:

1. **Pre-Market (8:00 AM EST):** Overnight pipeline runs automatically. Data fetched, features computed, sentiment scored, signal report generated. By 9:00 AM — you know the pipeline's view before the market opens.

2. **DMB Validation (9:00–10:00 AM):** Cross-check the automated signal report against your DMB observations. Does the sentiment score match what you're reading in the pre-market headlines? Is the technical setup confirmed on the chart? The DMB is the human override layer.

3. **Market Hours Monitoring (10 AM–4 PM):** The pipeline has already fired or not. Your job is execution — not signal detection. If a signal fires intraday, your rules define what to do. The pipeline doesn't execute. You do.

4. **End-of-Day Summary (4:00–5:00 PM):** Log the day's results: signals fired, trades placed, deviations from rules. Journal updated.

> **Resource:** FINN's 9-step quant workflow — how the automated signal monitor fits the full pipeline (data → signal → position sizing → journal) — `resources/infographics/ig_quant_workflow.html`

**Topic B: Signal Generation as a Pipeline (15 min)**

Three stages — each produces a structured output that feeds the next:

- **Stage 1 — Data Layer:** Pull OHLCV data for your watchlist. Compute the full feature matrix (RSI, EMA, ATR, ADX, volume ratio, daily returns). Output: clean DataFrame for each ticker.

- **Stage 2 — Signal Evaluation:** Apply your strategy's entry conditions as explicit Python boolean expressions. Example: `entry_signal = (rsi < 35) & (close > ema_20) & (vol_ratio > 1.5)`. Output: True/False signal per ticker.

- **Stage 3 — Alert Layer:** Format the signal report. For confirmed signals: show indicator readings, position size calculation, stop price. For near-misses: show how close each condition came. Output: printed report or file.

**Topic C: Sentiment Integration as a Veto (10 min)**

"Sentiment is not a primary signal. It is a veto condition.

Here is why: FinBERT scores headlines. Headlines are backward-looking. 'Earnings beat estimates' is already priced. What matters is the direction of *unexpected* sentiment — very negative news in an uptrend, very positive in a downtrend.

The rule: if your technical and ML signals both say BUY, but FinBERT scores the last 5 headlines as strongly negative (score < -0.3), you PASS the trade. The sentiment veto prevents entries into confirmed bad news environments. It does not generate entries."

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 min

1. *"My signal monitor says AAPL is a BUY but the price already moved 2% by the time I got the report. Is the signal late, or am I too slow?"*
   *(Expected direction: This is a limit order vs. market order question. The signal fired — price is the question. Use a limit order at the pre-market price. Accept the miss if price runs past your limit.)*

2. *"My signal monitor validates at 8 AM. A major piece of news drops at 10 AM that changes the thesis. Should I override the signal?"*
   *(Expected direction: This is exactly where human judgment belongs. Automated pipeline handles routine conditions. Genuine new information is the human's domain. The question is: does the news change your hypothesis, or just create noise?)*

3. *"FinBERT scored last week's NVDA headlines as negative, but NVDA went up 5%. Should I remove the sentiment veto?"*
   *(Expected direction: One week is not a sample. IC on 5 observations is noise. The veto is not a prediction — it is a risk management layer. Keep it and evaluate after 30+ vetoed signals.)*

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 min

**Wednesday workshop:** Build the complete signal monitor pipeline. Start to finish — data pull through formatted signal report. Starter notebook: `W13_workshop_signal_monitor_starter.ipynb`.

**Before Wednesday:** Write your strategy's entry conditions as explicit Python boolean expressions. Example: `entry = (rsi < 35) and (price > ema_20)`. If you can't write your strategy as code, you don't know your strategy precisely enough.

---

## WEDNESDAY — July 8, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** Standard.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Write your strategy's entry condition as a single Python boolean expression — the way you would code it in the signal monitor. Bring it to class. If you need to look up your strategy rules to do this — that is the first problem to fix."

---

### EVENING: Workshop Session (8:00–9:30 PM EST)
**Workshop:** W13 — Automated Signal Monitor — Full Pipeline Build
**Notebook:** `W13_workshop_signal_monitor_[initials].ipynb`
**Curriculum Source:** Wiki Section 6.3, 8.3

#### Block 1 — Framing (8:00–8:10 PM) | 10 min

"Tonight we build one thing: a function called `run_signal_monitor()` that takes a watchlist and outputs a structured signal report. Everything else in the course so far — yfinance, pandas-ta, FinBERT — plugs into this function. By the end of tonight, you have a pipeline you can run every morning in 60 seconds."

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 min

**Step 1 — Watchlist and Strategy Configuration (5 min)**
```python
import yfinance as yf
import pandas as pd
import pandas_ta as ta
import numpy as np
from transformers import pipeline

# Strategy configuration — customize to your rules
CONFIG = {
    'tickers':        ['AAPL', 'MSFT', 'QQQ', 'SPY'],
    'rsi_entry':      35,          # RSI threshold for entry
    'ema_period':     20,          # EMA lookback
    'vol_ratio_min':  1.2,         # Min volume vs. 20-day avg
    'adx_min':        20,          # Min trend strength
    'sentiment_veto': -0.30,       # Veto if sentiment below this
    'risk_pct':       0.01,        # 1% portfolio risk per trade
    'atr_stop_mult':  1.5,         # Stop = 1.5 × ATR
}
```

**Step 2 — Feature Computation per Ticker (12 min)**
```python
def compute_features(ticker, period='3mo'):
    """Fetch data and compute full feature matrix for one ticker."""
    df = yf.download(ticker, period=period, interval='1d', auto_adjust=True)
    if df.empty or len(df) < 30:
        return None
    
    df.ta.rsi(length=14, append=True)
    df.ta.ema(length=CONFIG['ema_period'], append=True)
    df.ta.atr(length=14, append=True)
    df.ta.adx(length=14, append=True)
    df['Vol_Avg20'] = df['Volume'].rolling(20).mean()
    df['Vol_Ratio'] = df['Volume'] / df['Vol_Avg20']
    df['Return_1d'] = df['Close'].pct_change()
    df = df.dropna()
    
    latest = df.iloc[-1]
    return {
        'close':         float(latest['Close']),
        'rsi':           float(latest[f'RSI_14']),
        'ema':           float(latest[f'EMA_{CONFIG["ema_period"]}']),
        'atr':           float(latest['ATRr_14']),
        'adx':           float(latest['ADX_14']),
        'vol_ratio':     float(latest['Vol_Ratio']),
        'return_1d':     float(latest['Return_1d']),
    }
```

**Step 3 — Signal Evaluation (8 min)**
```python
def evaluate_signal(features, cfg=CONFIG):
    """Apply strategy conditions. Returns True/False + individual condition results."""
    if not features:
        return False, {}
    
    rsi_ok   = features['rsi'] < cfg['rsi_entry']
    ema_ok   = features['close'] > features['ema']
    vol_ok   = features['vol_ratio'] > cfg['vol_ratio_min']
    adx_ok   = features['adx'] > cfg['adx_min']
    
    signal   = rsi_ok and ema_ok and vol_ok and adx_ok
    conditions = {
        'rsi_ok': rsi_ok, 'ema_ok': ema_ok,
        'vol_ok': vol_ok, 'adx_ok': adx_ok,
        'conditions_met': sum([rsi_ok, ema_ok, vol_ok, adx_ok])
    }
    return signal, conditions
```

**Step 4 — Sentiment Integration (8 min)**
```python
# Load FinBERT once (do this at module level to avoid repeated loading)
finbert = pipeline('sentiment-analysis',
                   model='ProsusAI/finbert',
                   truncation=True, max_length=512)

def get_sentiment_score(ticker, n_headlines=5):
    """Score recent headlines with FinBERT. Returns mean score."""
    # Replace with NewsAPI or Alpaca News in production
    # Demo: use a static list for workshop
    demo_headlines = {
        'AAPL': ["Apple reports record services revenue", "Supply chain concerns ease"],
        'MSFT': ["Microsoft cloud growth accelerates", "Azure beats estimates"],
    }
    headlines = demo_headlines.get(ticker, ["No recent news available"])
    
    label_map = {'positive': 1, 'negative': -1, 'neutral': 0}
    scores = [label_map[r['label']] * r['score']
              for r in finbert(headlines[:n_headlines])]
    return round(float(np.mean(scores)), 4) if scores else 0.0
```

**Step 5 — Signal Report Output (7 min)**
```python
def run_signal_monitor(cfg=CONFIG):
    """Run the full pipeline and print the signal report."""
    from datetime import datetime
    print(f"\n{'='*55}")
    print(f"SIGNAL MONITOR — {datetime.now().strftime('%Y-%m-%d %H:%M')}")
    print(f"{'='*55}")
    
    confirmed, near_miss, rejected = [], [], []
    
    for ticker in cfg['tickers']:
        features = compute_features(ticker)
        signal, conditions = evaluate_signal(features, cfg)
        sent_score = get_sentiment_score(ticker)
        
        sent_veto = sent_score < cfg['sentiment_veto']
        final_signal = signal and not sent_veto
        
        entry = {
            'ticker': ticker, 'signal': final_signal,
            'conditions': conditions, 'sentiment': sent_score,
            'sent_veto': sent_veto,
            'close': features['close'] if features else None,
        }
        
        if final_signal:
            confirmed.append(entry)
        elif conditions.get('conditions_met', 0) >= 3:
            near_miss.append(entry)
        else:
            rejected.append(entry)
    
    print(f"\n✅ CONFIRMED SIGNALS ({len(confirmed)})")
    for e in confirmed:
        print(f"  {e['ticker']:6s} | Close: ${e['close']:.2f} | Sentiment: {e['sentiment']:.3f}")
    
    print(f"\n⚠️  NEAR-MISSES ({len(near_miss)}) — 3 of 4 conditions met")
    for e in near_miss:
        print(f"  {e['ticker']:6s} | {e['conditions']['conditions_met']}/4 conditions | Sentiment: {e['sentiment']:.3f}")
    
    print(f"\n❌ REJECTED ({len(rejected)})")
    return confirmed, near_miss, rejected

run_signal_monitor()
```

#### Block 3 — Independent Work (8:50–9:15 PM) | 25 min

Customize `CONFIG` for your own strategy conditions. Run the monitor on your real watchlist. Answer in markdown cells:
1. Did the automated monitor fire a signal today? Do you agree with its assessment?
2. Were there any near-misses? What single condition kept them from confirming?
3. Would you have caught these signals through manual monitoring today?
4. Is your strategy condition expressible as a clean boolean expression? If not — why not?

**Extension:** Use the `schedule` library to schedule `run_signal_monitor()` to run automatically at 8:00 AM each morning:
```python
import schedule, time
schedule.every().day.at("08:00").do(run_signal_monitor)
while True:
    schedule.run_pending()
    time.sleep(60)
```

#### Block 4 — Share-Out & Close (9:15–9:30 PM) | 15 min

Two students share their signal reports. Did the automated result match their manual intuition? Where did it differ?

**Wednesday Deliverable:** Notebook pushed to GitHub by midnight.

---

## FRIDAY — July 10, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** Did you run the signal monitor this morning? Did it fire any signals? Did you act on them?

#### Block 4 — Observation Assignment (9:50–10:00 AM)
"Review this week's signal monitor outputs. Count: how many confirmed signals did the pipeline generate? How many did you actually trade? If there's a gap — what explains it?"

---

### EVENING: Review & Market Session (8:00–9:30 PM EST)

#### Pre-Session Setup
- [ ] Signal monitor output for Mon/Wed/Fri this week — available for review
- [ ] Trades placed this week logged in journal
- [ ] TradingView open: SPY daily, VIX, any signaled tickers

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 min

Five questions — students answer one each, Socratic style:
1. "Walk me through the signal pipeline logic. If RSI is 32, EMA relationship is correct, volume is high, but ADX is 18 — what does the monitor output? Why?"
2. "You set a sentiment veto at -0.30. Your signaled stock scored -0.28 — just above the threshold. Does sentiment justify concern? What do you do?"
3. "The pipeline fires a signal at 8 AM. Price opens 1.5% higher at 9:30 AM. Your limit order is at yesterday's close. Do you chase it or pass?"
4. "What is the difference between automation replacing judgment and automation handling routine tasks to free judgment?"
5. "If automated detection and manual detection disagree — which do you trust, and under what conditions?"

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 min

**Signal Audit:** Did the pipeline's signals this week predict price direction correctly? Pull up the charts for each confirmed signal. What actually happened?

**Standard chart review:** SPY (daily), QQQ, VIX, one student's watchlist ticker.

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 min
Standard options observation. Note earnings season context — July options premiums often elevated.

#### Block 4 — Next Week Preview & Close (9:20–9:30 PM) | 10 min

**Week 14 topic:** Multi-position management — running 3–5 concurrent positions without accidentally building a highly correlated portfolio.

**Pre-reading:** Wiki Section 9.3 (correlation monitoring and portfolio-level risk).

---

## WEEKLY DELIVERABLES SUMMARY

| Deliverable | Due | Format |
|-------------|-----|--------|
| Strategy entry conditions written as Python boolean | Monday 11:59 PM | In notebook or journal |
| Signal monitor notebook (W13) | Wednesday 11:59 PM | `.ipynb` pushed to GitHub |
| Trading journal — all trades this week | Friday 11:59 PM | Updated `.md` in GitHub |

---

## INSTRUCTOR NOTES FOR WEEK 13

**Boolean condition test:** The observation assignment on Wednesday is a diagnostic. If a student cannot write their strategy's entry condition as a Python boolean, they do not know their strategy precisely enough to automate it — or to trade it consistently. Address this before Wednesday's workshop. Vague rules produce vague code.

**FinBERT loading time:** On first run, the FinBERT model downloads ~440MB from HuggingFace. Warn students to run the download before Wednesday's workshop, not during class. Provide a fallback: students without GPU memory can use a lighter model or mock sentiment scores for the workshop.

**Sentiment veto context:** Students will want to debate whether the veto should be a primary signal. Hold the line: in this course, sentiment is risk management, not signal generation. The data to justify using sentiment as a primary signal requires more historical news data than the free NewsAPI tier provides.

**Automation vs. discipline:** The critical insight this week is not about code. It is that automation only works when the strategy is precisely defined. Students who struggled with rule adherence in Month 3 will find that the monitor exposes the ambiguity in their rules immediately. That is a feature, not a bug.

---

## WEEKLY RESOURCES

> Resources are labeled **[Pre-session]** (review before class) or **[Homework]** (explore after). Week 13 is code-heavy — prioritize the pre-session reads.

---

### Monday — Automated Pipeline Architecture & AI Workflow

- **[Article | Pre-session]** [Use Python to Automate Custom Trading Signals](https://optionalpha.com/blog/use-python-to-automate-custom-trading-signals) — OptionAlpha. Covers the principle of automated signal generation and alert systems for trading — same architecture as Monday's theory session. Read before Monday to have the vocabulary.

- **[Article | Pre-session]** [Automated Trading Using Python](https://www.geeksforgeeks.org/python/automated-trading-using-python/) — GeeksforGeeks. Code-forward walkthrough of building an automated trading signal system with yfinance and pandas. Covers the data fetch → feature computation → signal evaluation pipeline structure.

- **[Article | Homework]** [ProsusAI/finbert — Hugging Face](https://huggingface.co/ProsusAI/finbert) — Hugging Face. Re-read the FinBERT model card with Week 13's use case in mind — specifically, how to integrate it as a veto condition rather than a primary signal. Note the three output labels.

---

### Wednesday — Signal Monitor Build

- **[Reference | Pre-session]** [webull on PyPI](https://pypi.org/project/webull/) — PyPI. Keep this open during Wednesday's workshop. The extension exercise (live order placement) uses the Webull SDK — same `paper_webull` class from Week 9.

- **[Reference | Pre-session]** [pandas-ta GitHub Repository](https://github.com/twopirllc/pandas-ta) — GitHub. The `compute_features()` function uses `pandas_ta` for RSI, EMA, ATR, and ADX. Use this reference if any indicator call fails during the workshop build.

- **[YouTube | Pre-session]** Search YouTube for: *"python schedule library automation tutorial 2023"* — look for a short video (under 10 min) that demonstrates the `schedule` library for running Python functions on a timer. The extension exercise uses this for 8 AM automated runs.

---

### Friday — Signal Audit & Performance Review

- **[Article | Homework]** [Sentiment Analysis of Financial News with Python](https://pythoninvest.com/long-read/sentiment-analysis-of-financial-news) — PythonInvest. Covers the full sentiment pipeline from news source to signal integration. Read after Friday's signal audit to understand the evaluation methodology for the veto approach.

---

*FINN Week 13 — The Automation Layer | Part of FINN_Month04.md*
