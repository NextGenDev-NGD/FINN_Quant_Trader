# FINN — Week 18: Live Sentiment Integration
## Optimization + Capstone Design | Month 5: Optimization, Deep AI & Capstone Strategy Design
**Dates:** August 10–15, 2026
**Week Number:** 18 of 24

---

## WEEK OVERVIEW

### Theme
The market reacts to language before it reacts to price. Make the language readable. This week connects the NewsAPI live news feed to the FinBERT sentiment model, building a production-ready pipeline that scores every headline for every watchlist ticker in real time. The simulated sentiment from Month 4 is replaced with actual news data. The veto condition from the W13 signal monitor becomes a live, data-driven filter.

### Learning Objectives
By the end of this week, students will be able to:
- Fetch live financial news headlines via the NewsAPI Python client
- Deduplicate headlines to avoid counting the same story multiple times
- Score headlines in batch through FinBERT and extract numeric sentiment values
- Aggregate daily sentiment scores into actionable features: mean, percent positive/negative, news volume
- Identify and handle extreme sentiment signals (potential capitulation or euphoria)
- Integrate the live sentiment pipeline with the W13 signal monitor
- Evaluate sentiment signal quality with IC and lead-lag analysis
- Describe three architectures for combining ML predictions and sentiment scores

### Materials Needed
- `finnenv` environment — `transformers`, `newsapi-python`, `pandas`, `numpy`, `yfinance`
- NewsAPI key (free tier at newsapi.org — students must obtain before class)
- Alpaca account with news access confirmed (alternative data source)
- W13 signal monitor notebook — we extend it tonight
- W17 XGBoost model (`xgb_model.pkl`) — loaded for integration
- Starter notebook: `W18_workshop_live_sentiment_starter.ipynb`

### Pre-Week Checklist (Instructor)
- [ ] Push `W18_workshop_live_sentiment_starter.ipynb` to GitHub
- [ ] Confirm all students have NewsAPI keys (`pip install newsapi-python`)
- [ ] Confirm FinBERT model cached or downloadable during session
- [ ] Assign DMB rotation for Monday, Wednesday, Friday

---

## MONDAY — August 10, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** Standard. Note any ML model signals that fired this week and whether they led to trades.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Find a financial headline published today about any company or index. Write it down verbatim. Then: manually score it Bullish/Bearish/Neutral with confidence 0–100. Note what specific words or phrases drove your rating. Those words are exactly what FinBERT is trained to recognize. Bring it tonight."

---

### EVENING: Theory Session (8:00–9:30 PM EST)
**Topic:** Live Sentiment Architecture — NewsAPI, FinBERT & Signal Quality
**Curriculum Source:** Wiki Section 6.2 (applied, live)

#### Pre-Session Setup
- [ ] NewsAPI account and key obtained and working
- [ ] Alpaca account with news access confirmed
- [ ] Week 17 XGBoost results reviewed — model IC noted
- [ ] Headline from DMB observation written and manually rated

#### Block 1 — Day Review & Sentiment Context (8:00–8:15 PM) | 15 min

"Who has their headline from this morning? Read it aloud. What did you rate it and why? What specific words influenced you?

Now here's the problem at scale: You have 500 stocks in your universe. Each generates 5–10 headlines per day. That's 2,500–5,000 headlines daily. You cannot manually score them. FinBERT can score all of them in minutes. That's the operational case for NLP in trading.

Tonight we connect the data source (NewsAPI) to the model (FinBERT) and validate the output quality. Wednesday we make it live and integrate it into the signal monitor."

Reading check:
- "What is the difference between VADER and FinBERT for financial text?"
- "What does IC > 0.05 mean when applied to a sentiment signal? What are you actually measuring?"
- "Name two failure modes of news-based sentiment signals."

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 min

**Topic A: The Live Sentiment Architecture (15 min)**

"The production pipeline we're building tonight and Wednesday:

```
STEP 1 — DATA SOURCE (NewsAPI or Alpaca News)
  Fetch headlines for each watchlist ticker
  Filter: last 24 hours, English language, financial sources

STEP 2 — PREPROCESSING
  Clean text: remove HTML, special chars, truncate to 512 tokens
  Deduplicate: same story from multiple sources = count once

STEP 3 — FINBERT SCORING
  Run each headline through FinBERT
  Output: label (positive/negative/neutral) + confidence score
  Convert to numeric: +1 x confidence, -1 x confidence, 0

STEP 4 — DAILY AGGREGATION
  For each ticker, aggregate all today's scores:
    → mean_sentiment, pct_positive, pct_negative, news_volume
  Apply rolling: 3-day sentiment moving average

STEP 5 — SIGNAL INTEGRATION
  Merge sentiment features with OHLCV feature matrix
  Use as additional input to XGBoost model OR as veto rule:
    If mean_sentiment < -0.30 → block long entry
    If mean_sentiment > +0.30 and ML_prob > 0.55 → confirm entry

STEP 6 — OUTPUT
  Updated signal report includes sentiment column
  Flag tickers with strongly negative/positive sentiment for DMB
```

This is not a toy pipeline. Versions of this run at every major systematic fund that uses alt data. The sophistication level here is commercially relevant."

**Topic B: Evaluating Sentiment Signal Quality (15 min)**

"Before integrating sentiment into trading decisions, we evaluate it the same way we evaluate any other signal:

**IC Test:**
Compute daily sentiment score for a ticker over 6+ months.
Compute forward 5-day return for the same period.
IC = Spearmanr(sentiment_score, fwd_return).
Sentiment IC > 0.04 = genuine predictive value. Most studies find IC of 0.03–0.07 for quality news sentiment. Social media sentiment (Reddit, Twitter) tends to be noisier: 0.01–0.04.

**Lead-lag analysis:**
Does same-day sentiment predict same-day return? Or does yesterday's sentiment predict today's return (1-day lag)? The lag that maximizes IC tells you HOW the market processes sentiment. Fast-moving stocks may price in sentiment same-day. Slower-moving ones may have a 1–2 day lag.

**News volume as a feature:**
The number of headlines is as important as their tone. High news volume + negative sentiment = confirmed negative signal. High news volume + positive sentiment = confirmed positive signal. Low news volume + any sentiment = unreliable — thin data.

**Reversal at extremes:**
Extreme negative sentiment (bottom 5% historically) often precedes a bounce — capitulation signal. This is the contrarian use case. The sentiment veto should be parameterized: block moderately negative, consider reversing rule for extreme negative."

**Topic C: Combining Sentiment with ML (10 min)**

"Three architectures for combining ML predictions and sentiment:

**Architecture 1 — Feature integration (cleanest):**
Add sentiment features directly to the XGBoost feature matrix. Let the model learn the optimal combination weight. Run IC with vs. without sentiment features and see if the model improves.

**Architecture 2 — Signal confirmation (most conservative):**
Keep ML signal and sentiment as separate systems. Only trade when BOTH agree: ML_prob > 0.55 AND sentiment > 0. Reduces false positives but also reduces signal frequency.

**Architecture 3 — Weighted combination:**
Final_Score = w1 × ML_prob + w2 × sentiment_norm where w1 + w2 = 1. Backtest-optimize the weights. Risk: additional optimization parameter → overfitting risk.

We implement Architecture 3 as the core of the multi-signal system in Week 19."

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 min

1. *"NewsAPI free tier gives 100 requests per day and a 1-month lookback limit. What are the implications for backtesting a sentiment signal? How would you build a historical sentiment dataset given these constraints?"*
   *(Expected: you can't easily backtest historical sentiment with the free tier. Options: use Alpaca news which has better history, store locally going forward, use a proxy like GDELT (free but coarser), or accept that sentiment backtesting requires paid data. In Month 5 we paper trade with live sentiment going forward — no historical backtest needed.)*

2. *"A pharmaceutical stock gets 50 negative headlines about a failed drug trial. FinBERT scores all 50 as 'negative.' Is the aggregate score meaningful, or are all 50 headlines the same story counted 50 times?"*
   *(Expected: deduplication matters enormously. 50 headlines about one event = 1 news event repeated 50 times, not 50 independent negative signals. Deduplication by source + time window is essential.)*

3. *"Devil's advocate: Retail traders can access sentiment signals from free tools like StockTwits and social media scrapers. If everyone has the same sentiment data, is there still an edge?"*
   *(Expected: the edge is in speed, quality, and integration. Manual StockTwits scanning vs. automated FinBERT scoring on structured news — the systematic approach is more consistent, faster, and integrated with other signals. The edge is in the pipeline, not just the data.)*

4. *"Your ML model fires a BUY signal. Sentiment is -0.05 — mildly negative. The veto threshold is -0.30. Do you take the trade?"*
   *(Expected: yes, by the rules. The veto threshold was designed to block entries under strong negative sentiment, not mild. The discipline is following the rule as parameterized, not adjusting it trade-by-trade. If -0.05 should veto, change the threshold in the config and document the change — don't make ad hoc exceptions.)*

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 min

**Wednesday workshop:**
"We build the live sentiment pipeline end to end — NewsAPI fetch, FinBERT scoring, daily aggregation, signal report integration. Starter: `W18_workshop_live_sentiment_starter.ipynb`. Have your NewsAPI key in `.env` before class."

**Pre-reading:**
- NewsAPI Python quickstart: newsapi.org/docs (`pip install newsapi-python`)

**Closing reflection:**
*"The ticker I most want to run live sentiment on — and why — is ___."*

---

## WEDNESDAY — August 12, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** Standard.

#### Block 4 — Observation Assignment (9:50–10:00 AM)
"Before tonight's class, manually find 3 headlines from today about your primary trading ticker. Write them down. Then note: what do you expect FinBERT to score each one? Positive, Negative, or Neutral — and confidence level. We'll compare your prediction to the model's output tonight."

---

### EVENING: Workshop Session (8:00–9:30 PM EST)
**Workshop:** W18 — Live NewsAPI + FinBERT Sentiment Pipeline — Production Build
**Notebook:** `W18_workshop_live_sentiment_[initials].ipynb`
**Curriculum Source:** Wiki Section 6.2

#### Block 1 — Framing & Context Bridge (8:00–8:10 PM) | 10 min

"In Month 2, we ran FinBERT on hardcoded headlines. In Month 4, we used simulated sentiment. Tonight we connect to the live internet. Real headlines. Real companies. Real scores. Today's data.

The output of tonight's session is a production-ready function that you run every morning alongside the signal monitor. It takes a ticker, fetches today's news, scores it, and returns a number you can act on. That function does not exist yet. By 9:30 PM it will."

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 min

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
print("Loading FinBERT... (first run downloads model ~400MB)")
finbert = pipeline(
    "sentiment-analysis",
    model="ProsusAI/finbert",
    tokenizer="ProsusAI/finbert",
    truncation=True,
    max_length=512
)
print("FinBERT ready.")
```

**Step 1 — News fetcher with deduplication (12 min)**
```python
def fetch_ticker_news(ticker, company_name=None,
                       hours_back=24, max_articles=20):
    """
    Fetch recent news headlines for a ticker via NewsAPI.
    Deduplicates by content hash to avoid counting same story multiple times.
    """
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
        print(f"  WARNING: EXTREME NEGATIVE — potential capitulation signal")
    if features['sent_extreme_pos']:
        print(f"  WARNING: EXTREME POSITIVE — potential euphoria / fade signal")
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

        # 1. Technical features (from W13 compute_features function)
        features = compute_features(ticker)
        if not features:
            continue

        # 2. Rules-based signal check (from W13 evaluate_signal function)
        rules_signal = evaluate_signal(features, strategy_params)
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

        if final_signal:
            status = "SIGNAL CONFIRMED"
        elif tech_signal and sent_veto:
            status = "VETOED by sentiment"
        else:
            cond_met = rules_signal.get('conditions_met', '?')
            cond_tot = rules_signal.get('conditions_total', '?')
            status = f"{cond_met}/{cond_tot} conditions met"
        print(f"  {status} | sent={sent_score:+.3f} | n_articles={sentiment['news_volume']}")

    results_df = pd.DataFrame(results)
    confirmed  = results_df[results_df['final_signal']]
    print(f"\n{'─'*60}")
    print(f"Final confirmed signals: {len(confirmed)}/{len(results_df)}")

    return results_df

# Run the full pipeline on your watchlist
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

#### Block 3 — Independent Work (8:50–9:15 PM) | 25 min

Run the full pipeline on your personal watchlist. Compare your pre-class headline predictions to FinBERT's actual scores.

Answer in markdown:
1. Which headlines did FinBERT score differently from your expectation? Why do you think the model scored them that way?
2. Did any tickers get a sentiment veto that your rules would have entered? In retrospect — was the veto correct?
3. For your primary trading ticker: what is today's sentiment score? How does it compare to last week's trading behavior?

**Extension Challenge:**
Build a 5-day rolling sentiment tracker:
```python
# Fetch news for the last 5 trading days for one ticker
# Store daily sentiment scores in a DataFrame
# Plot the rolling mean sentiment score vs. price
# Is there a visible lead-lag relationship?
from datetime import timedelta
import pandas as pd

ticker = 'AAPL'
days_back = 5
daily_sentiments = []

for i in range(days_back, 0, -1):
    date = datetime.now() - timedelta(days=i)
    # Note: NewsAPI free tier only supports up to 24h for most plans
    # Use stored daily outputs if available
    day_articles = fetch_ticker_news(ticker, hours_back=24*(i+1))
    day_scored = score_headlines_finbert(day_articles) if day_articles else []
    day_agg = aggregate_daily_sentiment(day_scored)
    daily_sentiments.append({'date': date, **day_agg})

sentiment_history = pd.DataFrame(daily_sentiments)
print(sentiment_history[['date', 'sent_mean', 'news_volume', 'data_quality']])
```

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 min

**Share-out:** Headline comparison — where did students disagree with FinBERT? "These disagreements are the most interesting data points. They reveal either FinBERT's limitations or your own cognitive biases. Both are worth understanding."

**Muddiest Point:**
> *"The muddiest point from tonight was ___."*

**Notebook submission:** `W18_workshop_live_sentiment_[initials].ipynb` to GitHub.

---

## FRIDAY — August 14, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** Full account summary. "Who ran the live sentiment pipeline this morning before the DMB? What did it flag? Did any tickers show extreme sentiment readings?"

#### Block 4 — Observation Assignment (9:50–10:00 AM)
"For each signal that fired or was vetoed by sentiment this week: pull up the chart for that ticker. What happened to price after the signal? If the signal was vetoed — was the veto correct? If the signal confirmed — did price behave as expected? Document your findings. We review them tonight."

---

### EVENING: Review & Market Session (8:00–9:30 PM EST)

#### Pre-Session Setup
- [ ] Live sentiment pipeline run this week — outputs saved
- [ ] Any vetoed signals documented with post-veto price action
- [ ] W17 XGBoost model still accessible

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 min

1. "Explain the deduplication step in the news pipeline. Why is it essential? Give a specific example of what the output looks like without it vs. with it."

2. "The sentiment pipeline returned a score of -0.42 for NVDA today. The technical signal fired. What do you do? Walk me through the decision tree step by step."

3. "News volume is a feature in the pipeline. 'Low volume + negative sentiment' vs. 'high volume + negative sentiment' — which is a stronger signal and why?"

4. "What is the lead-lag relationship in sentiment? Give an example of a case where same-day sentiment is the wrong lag to use — and what lag you would test instead."

5. "Your pipeline takes 4 minutes to run for 10 tickers. At scale — 500 tickers — that's 200 minutes. How would you architect this to run in under 5 minutes total?"
   *(Expected: parallelization with Python's `concurrent.futures` or `asyncio`, batch FinBERT processing, caching previously scored articles by hash, running only on tickers with new articles since last scan.)*

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 min

**Sentiment retrospective:**
"Pull up each ticker that had a sentiment signal this week. What did the score say? What did price do? Were there any cases where extreme negative sentiment preceded a bounce? Were there cases where the veto would have blocked a winning trade? What does that teach you about the veto threshold?"

Standard chart review: SPY, QQQ, VIX, sectors.

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 min
Standard checklist. Note any unusual options activity on tickers that had strong sentiment readings this week.

#### Block 4 — Next Week Preview & Close (9:20–9:30 PM) | 10 min

**Next week:** Multi-signal architecture — combining XGBoost + sentiment + technical in a single decision framework. This is the capstone strategy's engine.

**Assign reading:**
- Wiki Section 6.4 — Multi-agent AI (re-read, now with applied context from W18)
- Review W17 XGBoost notebook and W18 sentiment notebook — we connect them next week
- Save sentiment pipeline functions to a separate module file — we import them in W19

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

## WEEKLY DELIVERABLES SUMMARY

| Deliverable | Due | Format |
|-------------|-----|--------|
| Live sentiment pipeline notebook (W18) | Wednesday 11:59 PM | `.ipynb` pushed to GitHub |
| Sentiment IC validation (on at least one ticker) | Wednesday 11:59 PM | In notebook markdown |
| Headline prediction vs. FinBERT comparison | Wednesday 11:59 PM | In notebook markdown |
| Trading journal — all trades this week | Friday 11:59 PM | Updated `.md` or `.csv` in GitHub |

---

## INSTRUCTOR NOTES FOR WEEK 18

**The deduplication lesson lands hardest with examples:** Before class, find a real example of one news event covered by 15 sources (any major earnings announcement works). Show the raw API response — 15 entries with slightly different titles. Then show the deduplicated output — 1. This makes the concept concrete and the pipeline step feels necessary rather than academic.

**FinBERT is opinionated about financial language:** Words like "beat," "miss," "raise," "cut" have very different sentiment weights in FinBERT than in VADER. Students who manually scored headlines should notice that FinBERT picks up on specific financial vocabulary that general-purpose sentiment models miss. This is worth pausing on — it is why domain-specific models exist.

**Disagreements between student scores and FinBERT are teaching moments:** Do not let students dismiss disagreements as model error. Ask them to examine whether the disagreement reveals a cognitive bias (anchoring to past price action, recency bias about a company) or a genuine model limitation. Both are valuable findings.

**Sentiment lag matters and students tend to assume same-day:** Some stocks (large-cap, liquid) price in sentiment within hours. Others (smaller-cap, less followed) may have a 1–2 day lag. Encourage students to think about this before assuming a same-day veto is optimal for their specific ticker.

**Save the pipeline as a module:** Students who write everything inline in the notebook will have difficulty importing functions in W19. Encourage saving `fetch_ticker_news`, `score_headlines_finbert`, and `aggregate_daily_sentiment` as a file called `sentiment_pipeline.py` in the repo. This makes W19 much smoother.

---

## WEEKLY RESOURCES

> Resources are labeled **[Pre-session]** (review before class) or **[Homework]** (explore after). Week 18 builds the live data connection — practical reading is most valuable.

---

### Monday — Sentiment Architecture & Signal Quality

- **[Article | Pre-session]** [NewsAPI Documentation — Getting Started](https://newsapi.org/docs/get-started) — NewsAPI official docs. Read the authentication section and the `get_everything` endpoint parameters before Monday. Understand what `q`, `language`, `sort_by`, and `from_param` do. You will use these directly in Wednesday's build.

- **[Article | Homework]** [FinBERT: Financial Sentiment Analysis with Pre-trained Language Models](https://arxiv.org/abs/1908.10063) — Araci (2019). The original FinBERT paper. Abstract and Sections 3–4 are accessible without deep NLP background. Understanding why FinBERT was trained specifically on financial text — vs. general-purpose BERT — explains why it outperforms VADER on our headlines.

---

### Wednesday — Live Pipeline Build

- **[Reference | Pre-session]** [newsapi-python PyPI documentation](https://pypi.org/project/newsapi-python/) — Review the `NewsApiClient` class before Wednesday. Confirm your key is active and your environment has `newsapi-python` installed.

- **[Article | Reference]** [ProsusAI/finbert on Hugging Face](https://huggingface.co/ProsusAI/finbert) — Hugging Face model card. Keep open during Wednesday's workshop. The model card describes the training data, labels, and expected output format — useful when debugging scoring results.

---

### Friday — Combined Signal Audit

- **[Article | Pre-session]** [Sentiment Analysis for Trading — A Practitioner's Guide](https://blog.quantinsti.com/sentiment-analysis-trading/) — QuantInsti. Read before Friday's retrospective. Focus on the sections about signal decay and lead-lag analysis — directly relevant to the discussion of veto threshold calibration.

- **[Article | Homework]** [Information Coefficient for Alternative Data Signals](https://www.cfainstitute.org/en/membership/professional-development/refresher-readings/alternative-investments) — CFA Institute. Read the IC application section. Applying IC methodology to sentiment signals (not just price signals) is the Wednesday extension challenge and Friday discussion topic.

---

*FINN Week 18 — Live Sentiment Integration | Part of FINN_Month05.md*
