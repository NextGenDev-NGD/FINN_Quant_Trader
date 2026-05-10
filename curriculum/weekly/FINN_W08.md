# FINN — Week 8: AI Integration, Strategy Refinement & Milestone 2
## Quant Methods Phase | Month 2: Quant Methods, AI Integration & Strategy Development
**Dates:** June 1–6, 2026
**Week Number:** 8 of 24

---

## WEEK OVERVIEW

### Theme
Adding AI to the toolkit. Presenting your first complete quantitative strategy. This week introduces FinBERT sentiment analysis as a live signal layer, then culminates in Milestone 2 — every student presents a complete backtested strategy to the class.

### Learning Objectives
By the end of this week, students will be able to:
- Explain what FinBERT is, why it outperforms VADER on financial text, and its limitations
- Describe the full sentiment-to-signal pipeline: news fetch → FinBERT → aggregate score → feature column
- Run a batch of financial headlines through FinBERT and interpret the output labels and confidence scores
- Build a daily sentiment aggregator that merges sentiment scores with OHLCV price data
- Present a complete backtested trading strategy using the 6-section format: Hypothesis → Data → Logic → Results → What Could Go Wrong → What I'd Do Differently
- Answer structured Q&A about their strategy including questions on overfitting, limitations, and forward plan

### Materials Needed
- `finnenv` — `transformers`, `torch`, `yfinance`, `pandas` installed (HuggingFace model downloads ~440MB on first run)
- GitHub repo — starter notebook `W08_workshop_sentiment_starter.ipynb`
- HuggingFace account (free) — for model downloads
- Each student's Milestone 2 strategy notebook — ready for presentation
- Milestone 2 presentation order published in course channel by Wednesday

### Pre-Week Checklist (Instructor)
- [ ] Verify `transformers` and `torch` are installed in `finnenv` — test FinBERT load before class
- [ ] Push `W08_workshop_sentiment_starter.ipynb` to GitHub before Wednesday
- [ ] Post Milestone 2 presentation order in course channel by Wednesday evening
- [ ] Assign DMB rotation for Monday, Wednesday, Friday
- [ ] Note: Friday session IS Milestone 2 presentations — keep DMB efficient
- [ ] Prepare Q&A question bank (see Friday section) — select 1–2 per presenter
- [ ] Have assessment rubric ready for Friday
- [ ] If class size > 4 students, plan Saturday June 6 overflow session

---

## MONDAY — June 1, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Find one financial news headline today. Rate it yourself: Bullish, Bearish, Neutral and confidence 0–100. Then go to huggingface.co, search for 'ProsusAI/finbert', and read the model card. Bring the headline and your rating tonight. We'll run it through FinBERT."

---

### EVENING: Theory Session (8:00–9:30 PM EST)
**Topic:** AI & LLM Integration in Trading — Sentiment as a Signal
**Curriculum Source:** Wiki Sections 6.1, 6.2

#### Pre-Session Setup
- [ ] Wiki Section 6.1 read — full AI/LLM overview
- [ ] Wiki Section 6.2 read — sentiment pipeline, FinBERT, LangChain template
- [ ] Milestone 2 backtest running with results
- [ ] News headline from DMB logged with personal sentiment rating

#### Block 1 — Day Review & Reading Check (8:00–8:15 PM) | 15 min

"Who has a headline? Read it. What did you rate it? Bullish, Bearish, Neutral? What confidence? Now — 5 other people in this room might rate it differently. That inconsistency is exactly the problem AI sentiment models solve. They produce a consistent, reproducible, quantifiable score every time.

Tonight we understand the theory. Wednesday we build the pipeline."

Cold-call reading check:
- "What is FinBERT? Why was it trained specifically on financial data?"
- "What is the difference between VADER and FinBERT for sentiment analysis?"
- "Name 3 types of unstructured financial data that LLMs can process into signals."

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 min

**Topic A: Why AI Expands the Signal Universe (10 min)**

"Traditional quant signals come from price and volume. They are derived from the same underlying data. Every quant in the world has access to the same prices.

AI expands the signal universe to unstructured data — text that carries meaning that price alone doesn't capture until hours or days later:
- A Fed speech that hints at rate changes before the market reprices
- An earnings call where the CEO's language is unusually hedged
- A 10-K filing where the risk factors section doubled in length
- A Reddit thread where retail sentiment is building on an unknown small-cap

These signals are available in real time but require AI to extract them. That's the structural edge that modern quant shops pursue."

> **Resource:** Sentiment indicators (non-AI) — Fear & Greed index, AAII survey, Put/Call ratio, and VIX regime table — structured sentiment signals that complement FinBERT's unstructured text analysis → `resources/infographics/ig_sentiment_indicators.html` + `resources/handbook/FINN_HB_P6_MarketReference.md` §6.4

**Topic B: The NLP Toolkit for Finance (15 min)**

Walk through Wiki Section 6.2 tool options table.

- **VADER:** "Rule-based, fast, good for social media. Doesn't understand financial context. 'The company's debt is not bearish' — VADER might flag 'bearish' as negative. FinBERT understands the full sentence in financial context."

- **FinBERT:** "BERT architecture pre-trained on financial text — Reuters, SEC filings, earnings transcripts. Fine-tuned for three-class sentiment: Positive, Negative, Neutral. Outperforms VADER on financial text by a significant margin."

- **LLMs (GPT-4o-mini, Claude):** "For complex analysis — summarizing an earnings call, extracting structured data from an SEC filing, answering specific questions about company fundamentals. More powerful than FinBERT but slower and costs API tokens."

- **LangChain pipeline:** Walk through Wiki Section 6.2 LangChain template conceptually. "We define a prompt template, pass it a headline, get back a structured sentiment label and confidence score. This becomes a column in our feature matrix."

**Topic C: Sentiment as a Feature — The Integration (15 min)**

"Sentiment is not a standalone strategy. It is a feature. You add it to the feature matrix alongside RSI, MACD, and ATR. The combined model may outperform any single signal alone.

The research pipeline for sentiment:
1. Fetch headlines for your ticker using NewsAPI or Alpaca News
2. Run each headline through FinBERT — get Positive/Negative/Neutral + confidence
3. Aggregate daily sentiment: average score, % positive headlines, etc.
4. Align with OHLCV data by date
5. Test IC of sentiment feature vs. forward returns
6. Add to feature matrix and backtest"

Walk through Wiki Section 6.3 ML framework conceptually — emphasize time-series split. "Never shuffle time-series data. NEVER. The past cannot leak into the future in training."

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 min

1. "If FinBERT is trained on historical financial text, what happens when the market starts using new terminology or jargon that FinBERT has never seen? How would you detect this degradation?"

2. "Devil's advocate: If every quant firm uses the same FinBERT model on the same public news, does the sentiment signal disappear the moment it's widely adopted?"
   *(Expected: Signal crowding is a real risk. The edge likely lies in speed of processing, quality of news sources beyond public headlines, or combining sentiment with proprietary signals.)*

3. "LLMs can hallucinate — produce confident-sounding wrong answers. In a trading context, what are the failure modes of an LLM-based signal? How do you build a system that catches hallucinations before they cause trades?"

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 min

**Wednesday workshop:**
"We build the FinBERT sentiment pipeline and integrate it into a feature matrix. Starter notebook: `W08_workshop_sentiment_starter.ipynb`. Have your HuggingFace account ready — model downloads automatically on first run (~440MB). Also: bring your Milestone 2 notebook. Last 20 minutes of Wednesday is strategy polish."

**Milestone 2 final reminder:**
"Presentations are Friday June 5. 15 minutes each + 5 minutes Q&A. If class is large, overflow continues Saturday June 6. Slides are not required — a clean notebook and clear explanation is sufficient."

**Monday Deliverable:** Reading Notes + 3 Hypotheses by 11:59 PM

---

## WEDNESDAY — June 3, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Observation Assignment:** "Find 5 financial headlines from today about any stock or index. Write them down. Personally rate each as Bullish/Bearish/Neutral. We'll compare your ratings to FinBERT's output tonight."

---

### EVENING: Workshop Session (8:00–9:30 PM EST)
**Workshop:** W8 — FinBERT Sentiment Pipeline + Milestone 2 Polish
**Notebook:** `W08_workshop_sentiment_[initials].ipynb`
**Curriculum Source:** Wiki Section 6.2, 6.3

#### Pre-Session Setup
- [ ] `transformers` and `torch` verified — FinBERT loads without error
- [ ] 5 headlines from DMB observation ready
- [ ] Milestone 2 notebook open for polish in Block 3
- [ ] Presentation order published

#### Block 1 — Framing (8:00–8:10 PM) | 10 min

"Tonight has two parts.

Part 1 (first 60 min): We build the sentiment pipeline. You'll run your 5 headlines through FinBERT and compare the model's output to your own ratings. Then we'll discuss what it means when they disagree.

Part 2 (last 20 min): Strategy polish for Milestone 2. Each of you works on your own presentation notebook while I circulate. This is the last workshop before Friday."

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 min

**Part 1A — FinBERT Sentiment Pipeline (25 min)**

```python
from transformers import pipeline, AutoTokenizer, AutoModelForSequenceClassification
import torch
import pandas as pd
import numpy as np
import warnings
warnings.filterwarnings('ignore')

print("Loading FinBERT model... (downloads ~440MB on first run)")
# ProsusAI/finbert: fine-tuned BERT for financial sentiment
# Labels: positive, negative, neutral
finbert = pipeline(
    "sentiment-analysis",
    model="ProsusAI/finbert",
    tokenizer="ProsusAI/finbert",
    device=0 if torch.cuda.is_available() else -1  # Use GPU if available
)
print("FinBERT loaded successfully.")
```

```python
def analyze_sentiment_batch(headlines, model=finbert):
    """
    Run a batch of headlines through FinBERT.
    Returns a DataFrame with label, score, and normalized score.
    """
    results = model(headlines, truncation=True, max_length=512)

    rows = []
    for headline, result in zip(headlines, results):
        label = result['label']   # 'positive', 'negative', 'neutral'
        score = result['score']   # Confidence 0-1

        # Convert to numeric: positive=+1, negative=-1, neutral=0
        # Weighted by confidence
        label_map = {'positive': 1, 'negative': -1, 'neutral': 0}
        numeric = label_map[label] * score

        rows.append({
            'headline': headline[:80] + '...' if len(headline) > 80 else headline,
            'label':    label,
            'score':    round(score, 4),
            'numeric':  round(numeric, 4)
        })

    return pd.DataFrame(rows)

# Your 5 headlines from the DMB observation
test_headlines = [
    "Federal Reserve signals potential rate cut amid cooling inflation data",
    "Tesla misses Q2 earnings estimates by wide margin, shares fall premarket",
    "Apple reports record iPhone sales, beats analyst expectations",
    "Oil prices fall on concerns over global demand slowdown",
    "Job market shows resilience with stronger than expected employment report"
]

results_df = analyze_sentiment_batch(test_headlines)
print(results_df.to_string(index=False))
print(f"\nMean sentiment score: {results_df['numeric'].mean():.4f}")
```

```python
# Compare FinBERT to your own ratings from the DMB
your_ratings = {
    # Fill in with actual DMB headlines and your personal ratings
    'headline_1': {'your_label': 'Bullish', 'your_confidence': 80},
    # ... etc
}

print("\nComparison: Your Rating vs. FinBERT")
print("-" * 60)
for i, row in results_df.iterrows():
    finbert_label = row['label'].upper()
    finbert_conf  = f"{row['score']:.0%}"
    print(f"Headline: {row['headline']}")
    print(f"  FinBERT: {finbert_label} ({finbert_conf})")
    print(f"  You:     [compare manually]")
    print()
```

**Part 1B — Build a Daily Sentiment Aggregator (15 min)**

```python
import yfinance as yf
from datetime import datetime, timedelta

def build_sentiment_feature(headlines_by_date, ticker):
    """
    Aggregate daily sentiment scores and merge with price data.

    headlines_by_date: dict of {date_str: [list of headlines]}
    Returns DataFrame with sentiment columns merged with OHLCV
    """
    # Process each date's headlines
    sentiment_records = []
    for date_str, headlines in headlines_by_date.items():
        if not headlines:
            continue

        batch_results = analyze_sentiment_batch(headlines)

        sentiment_records.append({
            'date':          pd.to_datetime(date_str),
            'sent_mean':     batch_results['numeric'].mean(),
            'sent_pct_pos':  (batch_results['label'] == 'positive').mean(),
            'sent_pct_neg':  (batch_results['label'] == 'negative').mean(),
            'sent_count':    len(batch_results),
            'sent_max':      batch_results['numeric'].max(),
            'sent_min':      batch_results['numeric'].min()
        })

    sent_df = pd.DataFrame(sentiment_records).set_index('date')

    # Merge with price data
    price_df = yf.download(ticker, period="6mo", interval="1d")
    price_df.columns = [c[0] if isinstance(c, tuple) else c for c in price_df.columns]
    price_df['Return'] = price_df['Close'].pct_change()
    price_df['Fwd_5d_Return'] = price_df['Close'].pct_change(5).shift(-5)

    merged = price_df.join(sent_df, how='left')
    merged['sent_mean'] = merged['sent_mean'].fillna(0)  # Missing = neutral

    return merged

# Example with synthetic data (replace with real NewsAPI data in Month 5)
example_headlines = {
    '2026-01-15': ['Fed holds rates steady, signals patience', 'Jobs data beats expectations'],
    '2026-01-16': ['Inflation ticks up slightly', 'Tech stocks under pressure'],
    '2026-01-20': ['Markets rally on strong earnings', 'Consumer confidence rebounds'],
}

print("Sentiment aggregation pipeline built.")
print("In live trading: replace example_headlines with NewsAPI or Alpaca News feed.")
print("Full live integration covered in Month 5.")
```

#### Block 3 — Milestone 2 Polish (8:50–9:10 PM) | 20 min

Students work on their own Milestone 2 notebooks. Instructor circulates. Key questions to ask each student:
- "Show me your backtest equity curve. Does it look reasonable?"
- "What is your Sharpe? Your max drawdown? Have you compared to SPY?"
- "Can you explain your entry and exit logic in plain English in under 60 seconds?"
- "What is the biggest weakness in your backtest? Have you addressed it?"
- "What would you do differently with 2 more weeks?"

#### Block 4 — Share-Out & Muddiest Point (9:10–9:30 PM) | 20 min

**Share-out (15 min):**
Two students walk through their Milestone 2 strategy in the 6-section format:
Hypothesis → Data & Features → Strategy Logic → Results → What Could Go Wrong → What I'd Do Differently

Class asks one question each after each presentation. Treat this as a dry run for Friday.

**Muddiest Point (5 min):**
> *"The muddiest point from tonight — and from Month 2 overall — was ___."*

**Wednesday Deliverable:** Completed notebook `W08_workshop_sentiment_[initials].ipynb` submitted to GitHub by 11:59 PM

---

## FRIDAY — June 5, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation
**Note:** Keep this brief efficient. Today is Milestone 2. Students need mental energy for presentations tonight.

---

### EVENING: Milestone 2 Strategy Presentations (8:00–9:30 PM EST)

**Format:** 15-minute presentations + 5 minutes Q&A per student
**Overflow:** Saturday June 6 at 8:00 PM EST if class size requires

#### Pre-Session Setup
- [ ] Presentation order confirmed and shared
- [ ] Assessment rubric ready
- [ ] TradingView available for chart reference during Q&A
- [ ] Strict timer ready — enforce 20-minute total slots
- [ ] Space for waiting students (can review notes)

#### Presentation Order
Randomize presentation order. Post the order in the course channel by Wednesday. Each presenter has exactly 20 minutes total — 15 presentation, 5 Q&A. Strict timing. This is a professional standard.

#### Presentation Assessment Rubric

| Criterion | Weight | 4 — Exceeds | 3 — Meets | 2 — Developing | 1 — Incomplete |
|-----------|--------|-------------|-----------|----------------|----------------|
| Hypothesis Quality | 15% | Specific, testable, causally motivated | Specific and testable | Somewhat specific | Vague or missing |
| Technical Execution | 25% | Clean code, reproducible, well-commented | Correct and runs | Minor errors | Broken or absent |
| Backtest Rigor | 20% | Walk-forward, costs modeled, benchmark compared | Honest results, costs included | Results without benchmark | No cost modeling |
| Limitations Analysis | 15% | Identifies overfitting risk, regime sensitivity | Identifies 2+ weaknesses | Identifies 1 weakness | No limitations |
| Self-Assessment | 15% | Honest about failures, clear next steps | Balanced, specific | Somewhat reflective | Defensive |
| Communication | 10% | Clear, confident, jargon-appropriate | Clear and organized | Somewhat unclear | Difficult to follow |

#### Q&A Question Bank (Instructor selects 1–2 per presentation)

```
On hypothesis:
  "What would falsify this strategy? What would convince you it doesn't work?"
  "Why do you think this edge exists? What market inefficiency are you exploiting?"

On backtesting:
  "How many free parameters did you optimize? Does that create overfitting risk?"
  "What would the results look like if you excluded the best 10 trading days?"

On risk:
  "What is the maximum drawdown your strategy experienced? Could you hold through that?"
  "Is your strategy correlated with the market? What happens in a 2020-style crash?"

On AI/sentiment (if used):
  "Is the sentiment signal statistically significant? What's its IC?"
  "What happens to your strategy if the news API goes down?"

On future work:
  "If you had 3 more months to develop this — what's the first thing you'd change?"
  "Would you trust this strategy with real money at this point? Why or why not?"
```

#### After Presentations — Month 2 Close (remaining time)

**Month 2 retrospective (10 min):**
"Looking back at Week 5 — what was the hardest concept this month? What did you learn about your own strategy that surprised you? What does your backtest tell you about the signal you chose?"

**Month 3 preview (5 min):**
"Next month we stop building strategies and start running them — live, on Webull paper trading. Everything from Months 1 and 2 goes into action. Real market. Real time. Virtual money. The journals start. The weekly review becomes a performance review. It gets real next Monday."

**Pre-reading for Month 3, Week 1:**
- Wiki Section 8.1 — Webull platform overview (full)
- Wiki Section 8.2 — Getting started steps
- Wiki Section 8.3 — Python integration
- Wiki Section 8.4 — Trading journal requirements (memorize the fields)

**Monthly One-Liner:**
> *"Month 2 taught me ___, and Month 3 I want to ___."*

---

## WEEKLY DELIVERABLES SUMMARY

| Deliverable | Due | Format |
|-------------|-----|--------|
| Reading Notes + 3 Hypotheses | Monday 11:59 PM | Markdown in hypothesis log |
| Workshop Notebook (W08) | Wednesday 11:59 PM | `.ipynb` pushed to GitHub |
| Weekly Review Log | Friday 11:59 PM | Markdown |
| Hypothesis Outcome Record | Friday 11:59 PM | Appended to hypothesis log |
| **Milestone 2 Presentation** | **Friday/Saturday** | **Live presentation** |

---

## INSTRUCTOR NOTES FOR WEEK 8

**FinBERT model download:** The first-time FinBERT download is ~440MB and takes 3–5 minutes. Run it once before class to cache it. Alternatively, have students download it in the background while you discuss theory in Block 1. Slow internet can disrupt Block 2 timing significantly.

**"Your rating vs. FinBERT" exercise:** The most compelling moment is when FinBERT rates something differently from a student's intuition. When this happens, ask: "Who do you think is right? The model or you? How would you test it?" This is the gateway to understanding what sentiment signals actually measure — consistent patterns in language correlated with price movement, not human intuition.

**Sentiment limitations to address proactively:** FinBERT does not understand context, sarcasm, or ambiguous corporate language. "The company performed better than expected" and "The company barely escaped bankruptcy" might both score neutral if the language patterns aren't in training data. Flag this clearly: the model is a tool with known limitations, not a truth-oracle.

**Milestone 2 assessment tone:** The Q&A is the most important part of the assessment. A student who presents a perfect-looking backtest but cannot answer "what would falsify this strategy?" demonstrates shallow understanding. A student with a mediocre backtest who can clearly articulate three specific weaknesses and a forward plan demonstrates genuine insight. Weight accordingly.

**Post-Milestone 2 transition framing:** End Month 2 with genuine excitement about Month 3. The shift from "building strategies" to "running strategies live" is a genuine psychological shift — students feel the difference immediately. "Everything we built this month is a hypothesis. Starting Monday, the market decides if you're right."

**Documentation of Milestone 2 results:**
```
Student: [Name]
Date: June 5-6, 2026
Strategy: [Name/description]
Sharpe (backtest): ___
Max Drawdown: ___
Outcome: Pass / Needs Review
Strongest: ___
Area to develop in Month 3: ___
```

---

## WEEKLY RESOURCES

> Resources are labeled **[Pre-session]** (review before class) or **[Homework]** (explore after). Friday this week is Milestone 2 — prepare your strategy presentation, not new material.

---

### Monday — FinBERT, Sentiment Signals & AI in the Pipeline

- **[Article | Pre-session]** [ProsusAI/finbert on Hugging Face](https://huggingface.co/ProsusAI/finbert) — Hugging Face. The official model card for the FinBERT model we use in class. Covers what it was trained on, the three output labels (positive/neutral/negative), and how to load it with the `transformers` library. Read before Monday — we run this model live.

- **[Article | Pre-session]** [Financial Sentiment Analysis Using FinBERT](https://medium.com/@ravirajshinde2000/financial-news-sentiment-analysis-using-finbert-25afcc95e65f) — Medium / Raviraj Shinde (October 2021, updated April 2022). Step-by-step walkthrough of loading FinBERT, running headlines through it, and interpreting output confidence scores. The code closely mirrors what we build in Wednesday's workshop.

- **[Article | Homework]** [FinBERT GitHub (ProsusAI)](https://github.com/ProsusAI/finBERT) — GitHub. The original research implementation of FinBERT. Read the README and the paper link — understanding why FinBERT outperforms general-purpose BERT on financial text is the key insight FINN covers Monday.

- **[Article | Homework]** [FinBERT — QuantConnect Documentation](https://www.quantconnect.com/docs/v2/writing-algorithms/machine-learning/hugging-face/popular-models/finbert) — QuantConnect. Shows how FinBERT is used in a live algorithmic trading context, not just a notebook experiment. Good context for Monday's discussion of the gap between research model and production signal.

- **[YouTube | Pre-session]** Search YouTube for: *"FinBERT financial sentiment analysis python tutorial 2023 2024"* — look for a notebook walkthrough that loads the HuggingFace model, runs a batch of headlines, and aggregates the scores. Target: 15–25 min. Avoid videos using the older VADER dictionary approach — we use FinBERT specifically because VADER doesn't understand financial language.

---

### Wednesday — Strategy Refinement Workshop & Milestone 2 Prep

- **[Article | Pre-session]** [Guide to Quantitative Trading Strategies and Backtesting](https://www.pyquantnews.com/free-python-resources/guide-to-quantitative-trading-strategies-and-backtesting) — PyQuant News. Re-read the "presenting your strategy" section with fresh eyes — this is your Milestone 2 framework. Check your own strategy against the structure described here before Wednesday's refinement session.

- **[Article | Reference]** [Kaggle — FinBERT Sentiment Analysis Notebook](https://www.kaggle.com/code/mexwell/huggingface-finbert-for-sentiment-analysis) — Kaggle / Mexwell. A runnable notebook showing the full FinBERT sentiment workflow in a clean environment. If your local `transformers` setup has issues, use this as a fallback to run the model and understand the output format.

---

### Friday — Milestone 2 Presentations

> No new resources. Your preparation is your strategy notebook and your ability to explain and defend it.

**Presentation checklist (6-section format):**
- **Hypothesis** — specific, falsifiable, tested
- **Data** — what data, what timeframe, any data quality issues?
- **Logic** — exactly how do signals translate to trades?
- **Results** — Sharpe, max drawdown, win rate, expectancy, benchmark comparison
- **What Could Go Wrong** — be honest: look-ahead bias? overfitting? out-of-sample?
- **What I'd Do Differently** — what would the next version test?

FINN's Q&A questions will come from your weakest section. Know your limitations before they're pointed out.

---

*FINN Week 8 — AI Integration, Strategy Refinement & Milestone 2 | Part of FINN_Month02.md*
