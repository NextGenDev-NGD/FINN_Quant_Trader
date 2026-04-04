# FINN — Financial Intelligence & Navigation Network
## FinTech, Quantitative Trading & AI Automation
### Master Curriculum Wiki · April 2026

---

> **PRIME DIRECTIVE**
> *Train students to approach every market question as a testable hypothesis, every trade as a data-driven decision, and every result as feedback for a better model.*

---

## Table of Contents

- [0. How to Use This Wiki](#0-how-to-use-this-wiki)
- [1. Course Overview & Learning Outcomes](#1-course-overview--learning-outcomes)
- [2. Financial Market Fundamentals](#2-financial-market-fundamentals)
- [3. Quantitative Analysis Foundations](#3-quantitative-analysis-foundations)
- [4. Python Quant Stack & Tooling](#4-python-quant-stack--tooling)
- [5. Technical Analysis as Data Inputs](#5-technical-analysis-as-data-inputs)
- [6. AI & LLM Integration in Trading](#6-ai--llm-integration-in-trading)
- [7. Backtesting & Strategy Development](#7-backtesting--strategy-development)
- [8. Paper Trading Phase: Webull](#8-paper-trading-phase-webull)
- [9. Risk Management Framework](#9-risk-management-framework)
- [10. Resource Repository](#10-resource-repository)
- [11. Tool & Dependency Checklist](#11-tool--dependency-checklist)
- [12. Glossary](#12-glossary)

---

## 0. How to Use This Wiki

This document is the living curriculum reference for the 6-month FINN FinTech & Quantitative Trading course. It is structured as a sequential learning guide, moving from financial fundamentals through advanced AI-driven trading systems.

| Section | Content | Phase |
|---------|---------|-------|
| 0 | How to Use This Wiki | Setup |
| 1 | Course Overview & Learning Outcomes | Setup |
| 2 | Financial Market Fundamentals | Month 1 |
| 3 | Quantitative Analysis Foundations | Month 1–2 |
| 4 | Python Quant Stack & Tooling | Month 1–2 |
| 5 | Technical Analysis as Data Inputs | Month 2 |
| 6 | AI & LLM Integration in Trading | Month 2 |
| 7 | Backtesting & Strategy Development | Month 2 |
| 8 | Paper Trading Phase: Webull | Months 3–6 |
| 9 | Risk Management Framework | Ongoing |
| 10 | Resource Repository | Reference |
| 11 | Tool & Dependency Checklist | Reference |
| 12 | Glossary | Reference |

> **📖 STRUCTURE NOTE:** Each module includes: Learning Objectives → Core Concepts → Tools/Code → Exercises → Resources. Work sequentially — each module builds on the last.

---

## 1. Course Overview & Learning Outcomes

### 1.1 Mission Statement

This course trains students to operate as junior quantitative analysts — combining rigorous data science methodology with financial market knowledge to build, test, and deploy AI-assisted trading strategies. By the end of the course, students will think in hypotheses, speak in probabilities, and trade with code.

### 1.2 Timeline Overview

| Phase | Duration | Focus | Platform |
|-------|----------|-------|----------|
| Foundation | Weeks 1–4 | Market structure, finance fundamentals, Python setup | Jupyter / Colab |
| Quant Methods | Weeks 5–8 | Statistics, indicators, data pipelines, backtesting | Backtrader / QuantConnect |
| AI & Automation | Weeks 7–8 | ML signals, LLM sentiment, automated pipelines | scikit-learn / LangChain |
| Paper Trading I | Months 3–4 | Live strategy execution, journaling, analysis | Webull Paper |
| Paper Trading II | Months 5–6 | Strategy iteration, performance attribution, final review | Webull Paper + API |

### 1.3 Final Learning Outcomes

By course completion, students will be able to:

- Explain market microstructure, asset classes, and order mechanics from first principles
- Build end-to-end Python data pipelines for financial data ingestion, cleaning, and feature engineering
- Apply statistical hypothesis testing to validate trading signals before deployment
- Construct, backtest, and evaluate rule-based and ML-driven trading strategies
- Integrate LLM and NLP tools for real-time sentiment analysis and market intelligence
- Execute disciplined paper trades on Webull and analyze results with quantitative rigor
- Understand and apply core risk management frameworks (position sizing, drawdown, VaR)
- Interact with brokerage APIs (Webull, Alpaca) programmatically in Python

---

## 2. Financial Market Fundamentals

> **⚠️ PREREQUISITE:** This section provides the essential financial vocabulary and market knowledge that all quantitative analysis is built on. Do not skip — models built on misunderstood fundamentals fail.

### 2.1 Asset Classes

Understanding what you can trade, and the characteristics of each asset class:

| Asset Class | Description | Key Characteristics | Examples |
|-------------|-------------|---------------------|----------|
| Equities (Stocks) | Ownership shares in a company | High volatility, dividends, liquid | AAPL, TSLA, NVDA |
| ETFs | Basket of assets traded like a stock | Diversified, low cost, very liquid | SPY, QQQ, IWM |
| Options | Right to buy/sell at a set price | Leverage, time decay, complex pricing | Calls, Puts, Spreads |
| Futures | Obligation to buy/sell at future date | Leverage, roll cost, index exposure | ES, NQ, /CL, /GC |
| Crypto | Decentralized digital assets | 24/7, high volatility, thin books | BTC, ETH, SOL |
| Forex | Currency pair exchange rates | 24/5, macro-driven, carry trade | EUR/USD, GBP/JPY |
| Fixed Income | Bonds and debt instruments | Lower risk, interest rate sensitive | Treasuries, Corporates |

> **🎯 SCOPE:** For this course, primary focus is on **Equities and ETFs**, with supplementary exposure to Options basics. Crypto will be referenced for API/automation exercises.

### 2.2 Market Structure & Microstructure

#### How Markets Work

- **NYSE, NASDAQ** — primary US exchanges
- **Market Hours:** Pre-market (4AM–9:30AM ET), Regular (9:30AM–4PM ET), After-hours (4PM–8PM ET)
- **Market Makers:** Firms that provide liquidity by quoting bid/ask prices continuously
- **Order Book:** The live record of all outstanding buy (bid) and sell (ask) orders
- **Bid-Ask Spread:** The difference between the best buy and sell price — a hidden transaction cost
- **Liquidity:** How easily an asset can be bought or sold without moving the price

#### Order Types — Must Know

| Order Type | Description | When to Use |
|------------|-------------|-------------|
| Market Order | Execute immediately at best available price | High-urgency; accept slippage risk |
| Limit Order | Execute only at specified price or better | Price-sensitive entries/exits |
| Stop Order | Becomes market order when price hits trigger | Stop-losses, breakout entries |
| Stop-Limit | Becomes limit order when stop triggered | Stop-loss with price floor protection |
| Trailing Stop | Stop that moves with price in your favor | Locking in profits on trending moves |
| MOO / MOC | Market On Open / Market On Close | Index rebalancing, institutional flows |

### 2.3 Key Market Indices

| Index | Ticker | What it Tracks | Relevance |
|-------|--------|----------------|-----------|
| S&P 500 | SPY / ^GSPC | 500 largest US companies by market cap | Benchmark for US equities |
| NASDAQ 100 | QQQ / ^NDX | 100 largest non-financial NASDAQ stocks | Tech-heavy benchmark |
| Dow Jones | DIA / ^DJI | 30 large US blue-chip companies | Historical benchmark |
| Russell 2000 | IWM / ^RUT | 2000 small-cap US companies | Small cap risk sentiment |
| VIX | ^VIX | Implied volatility of S&P 500 options | Fear gauge — critical risk signal |

### 2.4 Market Participants

- **Retail Traders** — Individual investors (us in this course)
- **Institutional Investors** — Mutual funds, pension funds, large ETF managers
- **Hedge Funds** — Including quant funds running systematic strategies
- **Market Makers** — Provide liquidity, profit from the spread
- **High-Frequency Traders (HFTs)** — Algorithmic shops executing thousands of trades/sec
- **Central Banks** — Macro policy actors (Federal Reserve, ECB) with outsized market influence

> **💡 QUANT INSIGHT:** Understanding who else is in the market, their objectives and time horizons, is critical for building realistic strategies. HFTs dominate intraday; institutions dominate weekly+ moves.

---

## 3. Quantitative Analysis Foundations

### 3.1 The Quant Workflow

Every strategy we build follows this pipeline. Memorize it. Live it.

| Step | Name | Description |
|------|------|-------------|
| 1 | **Hypothesis** | Define a specific, testable market behavior or inefficiency |
| 2 | **Data Acquisition** | Pull structured market data via APIs (yfinance, Alpaca, FRED) |
| 3 | **Feature Engineering** | Transform raw OHLCV into signals (indicators, ratios, lags) |
| 4 | **Statistical Testing** | Validate: Does the signal have predictive value? (t-test, IC) |
| 5 | **Model Building** | Formalize signal into a rule-based or ML-driven decision function |
| 6 | **Backtesting** | Simulate strategy on historical data with realistic constraints |
| 7 | **Risk Assessment** | Evaluate Sharpe, max drawdown, win rate, expectancy |
| 8 | **Paper Deployment** | Execute in Webull paper trading under live market conditions |
| 9 | **Performance Review** | Measure, attribute, iterate — close the feedback loop |

### 3.2 Essential Statistics for Quants

#### Descriptive Statistics

- **Mean, Median, Standard Deviation** — the baseline of any return series
- **Skewness** — asymmetry of returns distribution (positive = long tail on right)
- **Kurtosis** — tail fatness; financial returns are leptokurtic (fat tails) — markets crash more than a normal distribution predicts
- **Rolling statistics** — compute stats over a moving window to capture regime changes

#### Hypothesis Testing

- **Null Hypothesis (H₀):** No relationship exists between signal and returns
- **p-value:** Probability of observing the data if H₀ is true; p < 0.05 = statistically significant
- **t-test:** Compare means between two groups (e.g., returns when signal is positive vs. negative)
- **Information Coefficient (IC):** Correlation between predicted and actual returns — primary signal quality metric

#### Time Series Concepts

- **Stationarity:** A stationary series has constant mean/variance over time. Most price series are NOT stationary — returns usually are
- **Autocorrelation:** Does today's return predict tomorrow's? (key for momentum/mean-reversion)
- **ADF Test:** Augmented Dickey-Fuller — tests for unit root (non-stationarity)
- **Cointegration:** Two series move together long-term even if individually non-stationary (pairs trading basis)

> **🐍 PYTHON NOTE:** `scipy.stats` for tests, `statsmodels` for ADF and ARIMA, `pandas` for rolling stats. We will build these as reusable functions in our shared toolkit.

### 3.3 Core Performance Metrics

| Metric | Formula / Definition | Good Value | What It Tells You |
|--------|---------------------|------------|-------------------|
| Sharpe Ratio | (Return − Risk-Free Rate) / Std Dev | > 1.0, aim for > 1.5 | Risk-adjusted return quality |
| Sortino Ratio | (Return − Risk-Free Rate) / Downside Std | > 1.5 | Penalizes only downside volatility |
| Max Drawdown | Peak-to-trough decline in portfolio value | < 20% for retail | Worst-case loss from a peak |
| Win Rate | % of trades that are profitable | Meaningless alone — pair with R:R | Batting average |
| Risk:Reward (R:R) | Avg Win / Avg Loss | > 1.5:1 | Quality of wins vs losses |
| Expectancy | Win Rate × Avg Win − Loss Rate × Avg Loss | Positive | Expected value per trade |
| Calmar Ratio | CAGR / Max Drawdown | > 1.0 | Return per unit of worst loss |
| Alpha | Return above benchmark (risk-adjusted) | Positive | True edge over the market |
| Beta | Correlation to market moves | < 0.5 for market-neutral | Market sensitivity |

### 3.4 Factor Models — The Building Blocks of Alpha

Quantitative strategies are built on **factors** — measurable characteristics that systematically predict returns.

| Factor Family | Description | Examples |
|---------------|-------------|---------|
| Momentum | Assets that have risen tend to keep rising (short term) | 12-1 month return, RSI, Rate of Change |
| Mean Reversion | Prices revert to historical averages | Z-score of price vs MA, Bollinger Band %B |
| Value | Cheap assets outperform over time | P/E, P/B, EV/EBITDA ratios |
| Quality | Profitable, stable companies outperform | ROE, Debt/Equity, Earnings Stability |
| Volatility | Low-vol assets outperform on risk-adjusted basis | Realized vol, ATR, VIX level |
| Volume/Liquidity | Unusual volume precedes price moves | Volume surge ratio, OBV divergence |
| Sentiment | Market mood predicts short-term direction | News tone, put/call ratio, VIX term structure |
| Macro | Economic conditions affect sector rotation | Fed rate cycle, yield curve, PMI |

---

## 4. Python Quant Stack & Tooling

> **🛠️ ENVIRONMENT:** All code in this course runs in **Python 3.10+**. We use **Google Colab** for cloud-based free compute and **Jupyter** for local development. Git + GitHub for version control.

### 4.1 Environment Setup

1. Install **Anaconda** (includes Python, Jupyter, conda) — [anaconda.com](https://anaconda.com)
2. Create a dedicated virtual environment: `conda create -n finnenv python=3.11`
3. Activate: `conda activate finnenv`
4. Install the core stack (see Section 4.2)
5. Launch Jupyter: `jupyter notebook` or use VS Code with the Jupyter extension
6. **Cloud alternative (no install required):** [Google Colab](https://colab.research.google.com)

### 4.2 Full Python Stack by Layer

| Layer | Package(s) | Purpose | Install |
|-------|-----------|---------|---------|
| Data Manipulation | `pandas`, `numpy` | DataFrames, arrays, vectorized ops | `pip install pandas numpy` |
| Market Data | `yfinance` | Free historical OHLCV from Yahoo Finance | `pip install yfinance` |
| Market Data (Alt) | `alpaca-py` | Real-time + historical via Alpaca API | `pip install alpaca-py` |
| Market Data (Macro) | `fredapi` | Federal Reserve economic data (FRED) | `pip install fredapi` |
| Technical Indicators | `pandas-ta` | 100+ indicators as pandas methods | `pip install pandas-ta` |
| Technical Indicators (Alt) | `TA-Lib` | Industry-standard C-based indicator library | See TA-Lib install docs |
| Statistics | `scipy`, `statsmodels` | Hypothesis testing, time series models | `pip install scipy statsmodels` |
| Machine Learning | `scikit-learn` | Classification, regression, pipelines | `pip install scikit-learn` |
| Gradient Boosting | `xgboost`, `lightgbm` | High-performance tree-based ML | `pip install xgboost lightgbm` |
| Backtesting | `backtrader` | Event-driven strategy simulation | `pip install backtrader` |
| Backtesting (Fast) | `vectorbt` | Vectorized backtesting, very fast | `pip install vectorbt` |
| Performance Analytics | `quantstats` | HTML tear sheets, Sharpe/drawdown analysis | `pip install quantstats` |
| LLM Integration | `openai` | GPT API for sentiment & analysis | `pip install openai` |
| LLM Chains | `langchain` | Build LLM-powered analysis pipelines | `pip install langchain` |
| NLP / Sentiment | `transformers` (FinBERT) | Finance-tuned BERT for news sentiment | `pip install transformers` |
| Visualization | `plotly`, `matplotlib` | Interactive and static charts | `pip install plotly matplotlib` |
| Webull SDK | `webull` (unofficial) | Paper trading via Webull | `pip install webull` |
| Notebooks | `jupyter`, `ipykernel` | Interactive development environment | `pip install jupyter` |

### 4.3 Core Code Patterns — Reference Templates

#### Pattern 1: Fetch & Inspect Market Data

```python
import yfinance as yf
import pandas as pd

# Download 2 years of daily OHLCV for SPY
df = yf.download("SPY", period="2y", interval="1d")

df.head()           # First 5 rows
df.describe()       # Summary statistics
df.info()           # Schema and nulls check
```

#### Pattern 2: Add Technical Indicators

```python
import pandas_ta as ta

df['RSI']    = ta.rsi(df['Close'], length=14)
df['EMA_20'] = ta.ema(df['Close'], length=20)
df['ATR']    = ta.atr(df['High'], df['Low'], df['Close'], length=14)
macd         = ta.macd(df['Close'])
df           = df.join(macd)
```

#### Pattern 3: Simple Backtest with Backtrader

```python
import backtrader as bt

class SmaCrossStrategy(bt.Strategy):
    def __init__(self):
        self.sma_fast  = bt.ind.SMA(period=10)
        self.sma_slow  = bt.ind.SMA(period=30)
        self.crossover = bt.ind.CrossOver(self.sma_fast, self.sma_slow)

    def next(self):
        if self.crossover > 0:
            self.buy()
        elif self.crossover < 0:
            self.sell()

cerebro = bt.Cerebro()
cerebro.addstrategy(SmaCrossStrategy)
cerebro.broker.setcash(10000)   # Start with $10,000
cerebro.run()
cerebro.plot()
```

#### Pattern 4: Generate a QuantStats Tear Sheet

```python
import quantstats as qs
import yfinance as yf

# Replace 'returns' with your strategy's daily return series
stock = yf.download("AAPL", period="2y")['Close'].pct_change().dropna()
qs.reports.html(stock, benchmark="SPY", output="tearsheet.html")
```

---

## 5. Technical Analysis as Data Inputs

> **🎯 PHILOSOPHY:** FINN's approach — we do **NOT** use technical analysis as "gut-feel chart reading." We use indicators as **quantifiable, testable feature inputs** to models and signals.

### 5.1 Core Indicators — The Essential Toolkit

| Indicator | Type | What It Measures | Typical Params | Signal Use |
|-----------|------|-----------------|----------------|------------|
| RSI | Momentum | Overbought/oversold conditions | 14 periods | < 30 buy signal, > 70 sell signal |
| MACD | Momentum/Trend | Convergence/divergence of two EMAs | 12, 26, 9 | Crossover as entry/exit signal |
| Bollinger Bands | Volatility | Price relative to rolling stddev channel | 20 SMA, 2σ | Mean reversion at band extremes |
| ATR | Volatility | Average true range — normalized volatility | 14 periods | Position sizing & stop placement |
| EMA / SMA | Trend | Smoothed price trend | 20, 50, 200 | Trend direction & dynamic support |
| Volume | Volume | Raw participation — confirms price moves | Raw / MA ratio | High volume confirms breakouts |
| OBV | Volume | Cumulative volume tracking buy vs sell | Cumulative | Divergence from price = signal |
| VWAP | Price/Volume | Volume-weighted average price | Intraday | Institutional anchor — used as S/R |
| Stochastic | Momentum | Close relative to high-low range | 14, 3, 3 | %K/%D crossover signals |
| ADX | Trend Strength | Strength of trend (not direction) | 14 periods | > 25 = strong trend present |

### 5.2 Candlestick Patterns — Encoded as Features

We encode candlestick patterns as **binary flags** in our feature matrix, allowing ML models to learn their predictive value automatically.

| Pattern | Type | Signal | Code with pandas-ta |
|---------|------|--------|---------------------|
| Doji | Indecision | Potential reversal — neither side controls | `ta.cdl_pattern(name='doji')` |
| Hammer | Bullish Reversal | Buyers stepped in after downside pressure | `ta.cdl_pattern(name='hammer')` |
| Bullish Engulfing | Bullish Reversal | Large green candle absorbs previous red | `ta.cdl_pattern(name='engulfing')` |
| Bearish Engulfing | Bearish Reversal | Large red candle absorbs previous green | `ta.cdl_pattern(name='engulfing')` |
| Morning Star | Bullish Reversal | 3-candle bottom reversal pattern | `ta.cdl_pattern(name='morningstar')` |
| Evening Star | Bearish Reversal | 3-candle top reversal pattern | `ta.cdl_pattern(name='eveningstar')` |
| Shooting Star | Bearish Reversal | Failed rally with long upper wick | `ta.cdl_pattern(name='shootingstar')` |
| Marubozu | Continuation | No wicks — strong directional conviction | Manual: `body/(high-low) > 0.9` |

### 5.3 Chart Patterns (Macro Level)

These are used as categorical features or visual confirmation tools:

- **Head & Shoulders** — bearish reversal; neckline break confirms
- **Inverse Head & Shoulders** — bullish reversal
- **Double Top / Double Bottom** — reversal at key level tested twice
- **Ascending / Descending Triangle** — continuation or breakout pattern
- **Cup & Handle** — bullish continuation after consolidation
- **Wedges (Rising / Falling)** — compression before breakout

---

## 6. AI & LLM Integration in Trading

> **🤖 AI LAYER:** This is the cutting-edge layer that separates modern quant practice from traditional approaches. LLMs provide access to unstructured data (news, filings, transcripts) as structured signals.

### 6.1 Why AI/LLMs in Trading?

Traditional quant signals are derived from price/volume data. AI expands the signal universe to:

- **News sentiment** — real-time scoring of financial headlines
- **Earnings call analysis** — tone and language of executive communications
- **SEC filing parsing** — 10-K/10-Q language changes as early warning signals
- **Social media sentiment** — Reddit WallStreetBets, Twitter/X flow
- **Macro commentary** — Fed speeches, FOMC minutes parsing
- **Analyst report summarization** — aggregating consensus views quickly

### 6.2 Sentiment Analysis Pipeline

#### Tool Options — Free Tier

| Tool | Type | Use Case | Access |
|------|------|----------|--------|
| FinBERT | Pre-trained NLP model | Financial news sentiment (Positive/Negative/Neutral) | HuggingFace (free) |
| VADER | Rule-based NLP | Social media / short-text sentiment | `pip install vaderSentiment` |
| OpenAI GPT-4o-mini | LLM API | Complex analysis, summarization, structured extraction | Free tier available |
| Claude (Anthropic) | LLM API | Financial reasoning, report analysis | Free tier available |
| NewsAPI | News data API | Financial news headlines by ticker | Free: 100 req/day |
| Reddit PRAW | Social sentiment | WallStreetBets and finance subreddits | Free with Reddit account |
| Alpaca News API | Market news | Real-time financial news feed | Free with Alpaca account |

#### FinBERT Sentiment — Code Template

```python
from transformers import pipeline

# Load finance-tuned BERT model (downloads automatically)
sentiment_pipeline = pipeline(
    "sentiment-analysis",
    model="ProsusAI/finbert"
)

headlines = [
    "Fed signals rate cut ahead of expectations",
    "Company misses earnings by wide margin",
    "Strong jobs report boosts market confidence"
]

results = sentiment_pipeline(headlines)
for h, r in zip(headlines, results):
    print(f"{r['label']:10s} ({r['score']:.2f}) | {h}")
```

#### LangChain Trading Sentiment Pipeline

```python
from langchain_openai import ChatOpenAI
from langchain.prompts import PromptTemplate

llm = ChatOpenAI(model="gpt-4o-mini", temperature=0)

prompt = PromptTemplate.from_template("""
Analyze this financial news headline.
Return ONLY one of: BULLISH, BEARISH, or NEUTRAL
followed by a confidence score 0-100.
Format: sentiment|confidence

Headline: {headline}
""")

chain = prompt | llm
result = chain.invoke({"headline": "Fed signals rate cut ahead of expectations"})
print(result.content)  # e.g., "BULLISH|85"
```

### 6.3 ML Signal Generation

#### Supervised Learning Framework

```python
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import TimeSeriesSplit
from sklearn.metrics import classification_report
import pandas as pd
import yfinance as yf
import pandas_ta as ta

# 1. Get data
df = yf.download("SPY", period="5y")

# 2. Feature engineering
df['RSI']    = ta.rsi(df['Close'], length=14)
df['EMA_20'] = ta.ema(df['Close'], length=20)
df['ATR']    = ta.atr(df['High'], df['Low'], df['Close'], length=14)
df['Return'] = df['Close'].pct_change()
df['Vol_20'] = df['Return'].rolling(20).std()

# 3. Define label: did price go up > 0.5% in next 5 days?
df['Future_Return'] = df['Close'].pct_change(5).shift(-5)
df['Label'] = (df['Future_Return'] > 0.005).astype(int)
df.dropna(inplace=True)

# 4. Features and target
features = ['RSI', 'EMA_20', 'ATR', 'Return', 'Vol_20']
X = df[features]
y = df['Label']

# 5. Time-series cross-validation (NEVER shuffle time series data)
tscv = TimeSeriesSplit(n_splits=5)
model = RandomForestClassifier(n_estimators=100, random_state=42)

for train_idx, test_idx in tscv.split(X):
    model.fit(X.iloc[train_idx], y.iloc[train_idx])
    preds = model.predict(X.iloc[test_idx])
    print(classification_report(y.iloc[test_idx], preds))
```

#### ML Model Comparison

| Model | Strengths | Weaknesses | Good For |
|-------|-----------|------------|----------|
| Logistic Regression | Interpretable, fast, baseline | Linear relationships only | Baseline, feature importance |
| Random Forest | Handles nonlinearity, robust | Slower, overfits on noise | Feature selection, medium datasets |
| XGBoost / LightGBM | Best accuracy, fast | Black box, needs tuning | Primary production model |
| LSTM (Deep Learning) | Sequential patterns, memory | Needs lots of data, slow | Price prediction sequences |
| Reinforcement Learning | Learns from environment | Extremely hard to train | Advanced: portfolio optimization |

### 6.4 Multi-Agent AI System (Advanced Module)

Using LangGraph to build a coordinated AI research system:

```python
from langchain_openai import ChatOpenAI
from langgraph.prebuilt import create_react_agent

model = ChatOpenAI(model="gpt-4o-mini")

# Agent 1: Market data fetcher
market_data_agent = create_react_agent(
    model=model,
    tools=[fetch_market_data],
    name="market_data_agent",
    prompt="You fetch and summarize market data for a given ticker."
)

# Agent 2: Sentiment analyst
sentiment_agent = create_react_agent(
    model=model,
    tools=[fetch_news, run_finbert],
    name="sentiment_agent",
    prompt="You analyze news sentiment and return a structured signal."
)

# Supervisor coordinates both agents
# (full LangGraph Supervisor implementation in course notebook)
```

---

## 7. Backtesting & Strategy Development

> **⚠️ CRITICAL WARNING:** A backtest that looks great on training data and fails in live trading is not a good strategy — it's a well-fitted memory. Rigorous methodology is everything.

### 7.1 Backtesting Best Practices

1. **Never look ahead** — features must only use data available at signal time
2. **Include realistic costs** — commission, slippage (bid-ask spread), market impact
3. **Use walk-forward testing** — train on period A → test on period B → move forward → repeat
4. **Out-of-sample validation** — hold back a final test set until the very end
5. **Benchmark comparison** — compare to simple Buy & Hold SPY. If you underperform, your strategy adds no value
6. **Avoid overfitting** — if strategy has 10+ free parameters, be suspicious. Simpler = more robust
7. **Account for survivorship bias** — historical index constituents change; use point-in-time universe data

### 7.2 Backtesting Tools Comparison

| Tool | Type | Strengths | Best For | Free? |
|------|------|-----------|----------|-------|
| Backtrader | Event-driven Python | Flexible, realistic, strong community | Custom strategy development | ✅ Yes |
| VectorBT | Vectorized Python | Blazing fast, great for optimization | Parameter sweeps, fast iteration | ✅ Yes |
| QuantConnect LEAN | Cloud + Local | Institutional grade, multi-asset | Production-ready research | ✅ Free tier |
| Zipline Reloaded | Event-driven Python | Factor research, pipeline architecture | Multi-factor equity research | ✅ Yes |
| QuantStats | Analytics only | Beautiful HTML tear sheets | Post-backtest performance review | ✅ Yes |

### 7.3 Strategy Templates to Build (Course Progression)

| # | Strategy | Type | Signals Used | Phase |
|---|----------|------|-------------|-------|
| 1 | SMA Crossover | Trend Following | SMA(10) crosses SMA(30) | Month 2 — Intro backtest |
| 2 | RSI Mean Reversion | Mean Reversion | RSI < 30 buy, RSI > 70 sell | Month 2 |
| 3 | Momentum Factor | Momentum | 12-1 month return rank across universe | Month 2 |
| 4 | LLM Sentiment Overlay | AI/Sentiment | Sentiment score + price momentum | Month 2 |
| 5 | ML Signal Strategy | Machine Learning | XGBoost on feature matrix → trade signal | Month 2 |
| 6 | Adaptive Strategy | Combined | Dynamic regime switching via ML | Months 3–4 |

### 7.4 Walk-Forward Test Framework

```python
import pandas as pd
import numpy as np

def walk_forward_backtest(df, strategy_fn, train_window=252, test_window=63):
    """
    Rolling walk-forward backtest.
    train_window: days of training data (252 = ~1 year)
    test_window:  days of out-of-sample testing (63 = ~1 quarter)
    """
    results = []
    n = len(df)

    for start in range(0, n - train_window - test_window, test_window):
        train = df.iloc[start : start + train_window]
        test  = df.iloc[start + train_window : start + train_window + test_window]

        # Train and evaluate your strategy function on each fold
        fold_result = strategy_fn(train, test)
        results.append(fold_result)

    return pd.DataFrame(results)
```

---

## 8. Paper Trading Phase: Webull

> **📋 RULE #1:** Paper trading is NOT a casual exercise. Treat every paper trade as if it were real money. Use your backtested strategy. Log every trade. Review every week.

### 8.1 Webull Platform Overview

| Feature | Details |
|---------|---------|
| Paper Trading Account | Free — $1,000,000 virtual funds at start |
| Markets Available | US Stocks, ETFs, Options, Crypto |
| Order Types | Market, Limit, Stop, Stop-Limit (manual stop monitoring needed in paper mode) |
| Charting | TradingView-integrated charts, technical indicators, drawing tools |
| News Feed | Real-time financial news integrated |
| AI Feature (Vega) | AI assistant for portfolio insights, options analysis (launched Nov 2025) |
| Official API | Webull OpenAPI — HTTP/GRPC/MQTT (requires brokerage account) |
| Python SDK | Unofficial `webull` package — supports `paper_webull` class |
| Mobile App | iOS and Android with full paper trading support |

### 8.2 Getting Started with Webull Paper Trading

1. Download the Webull app or go to [webull.com](https://webull.com)
2. Create a free account (no funding required for paper trading)
3. Navigate to the **Paper Trading** section
4. You receive **$1,000,000** virtual balance automatically
5. For API access: register at [developer.webull.com](https://developer.webull.com) and apply
6. Install Python SDK: `pip install webull`

### 8.3 Webull Python Integration

```python
from webull import paper_webull   # Paper trading class

pwb = paper_webull()
pwb.login('email@example.com', 'yourpassword')

# Place a paper trade — BUY 10 shares of AAPL at market price
pwb.place_order(
    stock='AAPL',
    price=0,           # 0 = market order
    action='BUY',
    orderType='MKT',
    quant=10
)

# Get current paper account balance
account = pwb.get_account()
print(account['netLiquidation'])   # Total portfolio value

# Get current positions
positions = pwb.get_positions()
for p in positions:
    print(p['ticker']['symbol'], p['position'], p['lastPrice'])
```

> **💡 ALTERNATIVE:** Use **Alpaca's paper trading API** as a backup. Alpaca provides a dedicated sandbox with free API access and a clean, well-documented Python SDK.

```python
from alpaca.trading.client import TradingClient
from alpaca.trading.requests import MarketOrderRequest
from alpaca.trading.enums import OrderSide, TimeInForce

# Use paper=True for paper trading
client = TradingClient('YOUR_API_KEY', 'YOUR_SECRET_KEY', paper=True)

order = MarketOrderRequest(
    symbol="SPY",
    qty=10,
    side=OrderSide.BUY,
    time_in_force=TimeInForce.DAY
)
client.submit_order(order)
```

### 8.4 Trading Journal — Required Fields

Every paper trade requires a journal entry. No journal = no valid review.

| Field | Required Entry |
|-------|---------------|
| Date/Time | When the trade was placed |
| Ticker | Asset traded |
| Direction | Long / Short |
| Hypothesis | Why did you expect this trade to work? |
| Signal(s) | What indicators/model output triggered entry? |
| Entry Price | Execution price |
| Position Size | Number of shares and % of portfolio |
| Stop Loss Level | Pre-defined exit if wrong |
| Target / Exit Plan | Profit target and time horizon |
| Exit Price | Actual exit price |
| P&L | Result in $ and % |
| Post-trade Review | Did the hypothesis play out? What would you do differently? |

### 8.5 Weekly Review Checklist

- [ ] Review all open and closed trades against journal entries
- [ ] Calculate weekly P&L and compare to benchmark (SPY)
- [ ] Compute Sharpe ratio for the week (rolling)
- [ ] Identify the single best and worst decision — not outcome
- [ ] Update model or rule set based on what you learned
- [ ] Set strategy parameters for the following week

---

## 9. Risk Management Framework

> **⚠️ NON-NEGOTIABLE:** Risk management is not optional. It is the single most important skill in trading. More traders fail from poor risk management than from bad strategies.

### 9.1 Core Risk Rules

1. **Never risk more than 1–2% of your portfolio on a single trade**
2. **Define your stop loss BEFORE entering a trade, never after**
3. **If you hit 5% portfolio drawdown in a single day — stop trading for the day**
4. **If you hit 10% total drawdown — reduce position sizes by 50% until you recover**
5. **Never add to a losing position ("averaging down") without a pre-defined plan**
6. **Diversify across at minimum 3 uncorrelated positions at all times**

### 9.2 Position Sizing Models

| Model | Formula | Use Case |
|-------|---------|---------|
| Fixed % Risk | `Portfolio × Risk% / Stop Distance` | Simplest and most common for retail |
| Kelly Criterion | `f* = (bp − q) / b` where b=odds, p=win rate, q=loss rate | Theoretically optimal — use **half-Kelly** in practice |
| ATR-Based | `Portfolio × Risk% / (ATR × Multiplier)` | Volatility-normalized sizing |
| Equal Weight | `Portfolio / Number of Positions` | Simple diversification |

#### Kelly Criterion Code

```python
def kelly_fraction(win_rate, avg_win, avg_loss):
    """
    Returns the optimal fraction of capital to risk per trade.
    Use half_kelly in practice for safety.
    """
    b = avg_win / avg_loss   # odds
    p = win_rate
    q = 1 - win_rate
    kelly = (b * p - q) / b
    half_kelly = kelly / 2
    return max(0, half_kelly)   # Never bet negative

# Example: 55% win rate, avg win $200, avg loss $100
fraction = kelly_fraction(0.55, 200, 100)
print(f"Risk {fraction:.1%} of portfolio per trade")
```

### 9.3 Risk Metrics to Monitor Daily

- **Portfolio Beta** — overall market exposure (target: < 0.5 for market-neutral)
- **Sector Concentration** — no more than 30% in one sector
- **Correlation Matrix** — check positions are actually uncorrelated
- **Rolling Sharpe** — is your edge still present?
- **Daily P&L vs. Expected** — is the model behaving as backtested?

### 9.4 Value at Risk (VaR) — Intro

```python
import numpy as np

def historical_var(returns, confidence=0.95):
    """
    Historical VaR: the loss not exceeded on (confidence)% of days.
    Returns the daily loss threshold.
    """
    return np.percentile(returns, (1 - confidence) * 100)

# Example
import yfinance as yf
spy = yf.download("SPY", period="2y")['Close'].pct_change().dropna()
var_95 = historical_var(spy['SPY'])
print(f"95% 1-day VaR: {var_95:.2%}")
print(f"On 95% of days, SPY does not lose more than {abs(var_95):.2%}")
```

---

## 10. Resource Repository

### 10.1 Learning Platforms & Courses (Free)

| Platform | URL | What You Get |
|----------|-----|-------------|
| QuantConnect Learning Center | quantconnect.com/learning-center | Interactive quant trading courses, bootcamp, strategy library |
| QuantStart | quantstart.com | Deep articles on quant methods, backtesting, self-study plans |
| QuantInsti Blog | blog.quantinsti.com | LLM trading, ML finance, algo trading tutorials (free articles) |
| Investopedia | investopedia.com | Financial terminology encyclopedia — bookmark and use constantly |
| IBKR Campus | interactivebrokers.com/campus | Free quant lessons including LLM + trading series |
| Google Colab | colab.research.google.com | Free cloud Jupyter — run Python with no local setup |
| Towards Data Science | towardsdatascience.com | ML finance, Python finance, LLM articles |
| Babson TA Guide | babson.edu (search: "Introduction to Technical Analysis") | Free beginner PDF on technical analysis |
| Analyzing Alpha | analyzingalpha.com/python-trading-tools | Python trading tool reviews and guides |

### 10.2 Data Sources (Free Tier)

| Source | Library / URL | Data Type | Limit |
|--------|--------------|-----------|-------|
| Yahoo Finance | `yfinance` (Python) | Daily OHLCV, fundamentals, dividends | Unlimited historical, rate limited |
| Alpaca Markets | alpaca.markets + `alpaca-py` | Real-time + historical US stocks/crypto | Free paper trading + data API |
| Polygon.io | polygon.io | 2 years minute-bar data | Free tier available |
| FRED (Federal Reserve) | fred.stlouisfed.org + `fredapi` | Macro: GDP, CPI, rates, employment | Unlimited free |
| Alpha Vantage | alphavantage.co | OHLCV, fundamentals, forex, crypto | 25 req/day free |
| NewsAPI | newsapi.org | Financial news headlines by keyword | 100 req/day free |
| Reddit PRAW | praw.readthedocs.io | Social sentiment from finance subreddits | Free with Reddit account |
| SEC EDGAR | sec.gov/edgar | 10-K, 10-Q, 8-K filings for LLM parsing | Unlimited free |
| HuggingFace | huggingface.co | FinBERT and other finance NLP models | Free (model download) |

### 10.3 Key Websites & Reference Wikis

| Resource | URL | Purpose |
|----------|-----|---------|
| Investopedia | investopedia.com | Best financial terminology encyclopedia |
| CME Group Education | cmegroup.com/education | Futures and derivatives fundamentals |
| Awesome Quant (GitHub) | github.com/wilsonfreitas/awesome-quant | Curated list of all quant libraries |
| r/algotrading | reddit.com/r/algotrading | Community forum — many free code examples |
| r/quantfinance | reddit.com/r/quantfinance | Quantitative finance discussion |
| Backtrader Docs | backtrader.com/docu | Official backtrader documentation |
| pandas-ta Docs | github.com/twopirllc/pandas-ta | All indicator docs and examples |
| Webull API Docs | developer.webull.com | Official Webull OpenAPI documentation |
| Alpaca Docs | alpaca.markets/docs | Alpaca API documentation and tutorials |
| QuantConnect Docs | quantconnect.com/docs | LEAN engine and platform documentation |

### 10.4 Essential Reading List

| Book / Paper | Author | Focus | Difficulty |
|-------------|--------|-------|------------|
| Advances in Financial ML | Marcos Lopez de Prado | ML methods for finance, feature engineering | Intermediate–Advanced |
| Quantitative Trading | Ernest Chan | Building systematic strategies from scratch | Beginner–Intermediate |
| Algorithmic Trading | Ernest Chan | More advanced implementations | Intermediate |
| Python for Finance | Yves Hilpisch | Comprehensive Python finance programming | Intermediate |
| The Man Who Solved the Market | Gregory Zuckerman | Renaissance Technologies story — motivation | Beginner (narrative) |
| FinBERT Paper (ArXiv:1908.10063) | Araci (2019) | Foundation paper for finance NLP | Intermediate |
| LLMs in Equity Markets (Frontiers, 2025) | Jadhav & Mirza | Review of 84 LLM trading studies — free online | Intermediate |
| LLM Sentiment Analysis in Finance | Quantinsti Blog Series | Practical LLM + trading tutorials | Beginner–Intermediate |

---

## 11. Tool & Dependency Checklist

### 11.1 Accounts to Create (All Free)

| Service | URL | Purpose | Required? |
|---------|-----|---------|-----------|
| Webull | webull.com | Paper trading platform (primary) | ✅ YES |
| Alpaca Markets | alpaca.markets | Paper trading API + data API | ✅ YES |
| Google Account | google.com | Google Colab access | ✅ YES |
| GitHub | github.com | Version control for all course code | ✅ YES |
| FRED | fred.stlouisfed.org | Macro data API key (free) | ✅ YES |
| HuggingFace | huggingface.co | FinBERT model access (free) | ✅ YES |
| Alpha Vantage | alphavantage.co | Free API key for market data | Recommended |
| NewsAPI | newsapi.org | News data API key (free tier) | Recommended |
| QuantConnect | quantconnect.com | Free cloud backtesting platform | Recommended |
| OpenAI | platform.openai.com | GPT API for LLM sentiment (small cost possible) | Recommended |
| Reddit | reddit.com | PRAW API for sentiment data | Optional |

### 11.2 Full Python Environment — Install Command

```bash
# FINN Course — Full Dependency Install
# Run inside your 'finnenv' conda environment

pip install pandas numpy scipy statsmodels \
            yfinance alpaca-py fredapi \
            pandas-ta \
            scikit-learn xgboost lightgbm \
            backtrader vectorbt quantstats \
            openai langchain langchain-openai \
            transformers torch \
            plotly matplotlib seaborn \
            webull praw newsapi-python \
            jupyter ipykernel python-dotenv requests

# TA-Lib requires a binary install first — see:
# https://github.com/TA-Lib/ta-lib-python
```

### 11.3 Hardware Requirements

| Component | Minimum | Recommended | Notes |
|-----------|---------|-------------|-------|
| CPU | Intel i5 / AMD Ryzen 5 | i7 / Ryzen 7 or Apple M-series | ML training is CPU intensive |
| RAM | 8 GB | 16 GB+ | pandas DataFrames fill RAM fast |
| Storage | 50 GB free SSD | 100 GB+ SSD | Historical data files grow large |
| Internet | Stable broadband | Low-latency for paper trading | Real-time data needs stability |
| OS | Windows 10, macOS 12, Ubuntu 20+ | Any modern OS | Linux preferred for production |
| Cloud Alt. | Google Colab (free) | Google Colab Pro ($10/mo) | No hardware needed with cloud |

### 11.4 API Key Management (Security)

```python
# NEVER hardcode API keys in your notebooks.
# Use a .env file and python-dotenv

# .env file (add to .gitignore immediately!)
# ALPACA_API_KEY=your_key_here
# ALPACA_SECRET_KEY=your_secret_here
# OPENAI_API_KEY=your_key_here
# FRED_API_KEY=your_key_here

from dotenv import load_dotenv
import os

load_dotenv()   # Loads variables from .env

alpaca_key    = os.getenv("ALPACA_API_KEY")
alpaca_secret = os.getenv("ALPACA_SECRET_KEY")
openai_key    = os.getenv("OPENAI_API_KEY")
```

---

## 12. Essential Glossary

| Term | Definition |
|------|------------|
| **Alpha** | Return generated above and beyond the benchmark (SPY). The "edge" of a strategy. |
| **ATR** | Average True Range — volatility indicator measuring average price range over N periods. Used for stops and sizing. |
| **Backtesting** | Simulating a strategy on historical data to estimate how it would have performed. |
| **Beta** | Sensitivity of a portfolio to market movements. Beta = 1 means it moves with SPY. |
| **Bid-Ask Spread** | The gap between the highest buyer price and lowest seller price. A real transaction cost. |
| **CAGR** | Compound Annual Growth Rate — annualized return accounting for compounding. |
| **Drawdown** | Decline from a portfolio's peak value to its trough. Max Drawdown = worst peak-to-trough ever. |
| **EMH** | Efficient Market Hypothesis — theory that prices reflect all available information. Quants debate this constantly. |
| **ETF** | Exchange-Traded Fund — a basket of assets tradeable like a single stock. |
| **Factor** | A measurable characteristic proven to systematically predict asset returns (momentum, value, quality, etc.) |
| **Feature Engineering** | Transforming raw data into model-ready inputs that capture the signal you want to exploit. |
| **FinBERT** | A BERT-based NLP model fine-tuned on financial text for sentiment classification. |
| **HFT** | High-Frequency Trading — algorithmic trading at microsecond speeds by specialized firms. |
| **IC (Information Coefficient)** | Correlation between predicted and actual returns. IC > 0.05 is considered a good signal. |
| **Kelly Criterion** | Mathematical formula for optimal position sizing based on your edge (win rate and odds). |
| **LangChain** | A Python framework for building applications powered by LLMs, including pipelines and agents. |
| **Look-Ahead Bias** | Using future data in a backtest inadvertently. Fatal error — makes any backtest completely invalid. |
| **MACD** | Moving Average Convergence Divergence — momentum indicator based on EMA differences and a signal line. |
| **Market Microstructure** | The mechanics of how trades are executed — order books, spreads, price impact, and market depth. |
| **Mean Reversion** | The tendency for prices to return to a historical average after extreme moves. |
| **Momentum** | The tendency for assets with recent gains to continue gaining (and recent losers to keep falling). |
| **NLP** | Natural Language Processing — AI techniques for understanding, analyzing, and generating text. |
| **OHLCV** | Open, High, Low, Close, Volume — the fundamental unit of market price data. |
| **Overfitting** | A model that memorizes training data patterns but fails on new, unseen data. The #1 enemy in quant. |
| **P&L** | Profit and Loss — the result of a trade or portfolio in dollar terms. |
| **Paper Trading** | Simulated trading using virtual money — no real capital at risk. Essential for strategy testing. |
| **Position Sizing** | The decision of how much capital to allocate to each individual trade. |
| **Quantitative Analysis** | Data-driven approach to financial decision-making using mathematics, statistics, and code. |
| **RAG** | Retrieval-Augmented Generation — LLM technique that retrieves external documents to ground responses. |
| **RSI** | Relative Strength Index — momentum oscillator ranging from 0 to 100. |
| **Sharpe Ratio** | Risk-adjusted return: (Return − Risk Free Rate) / Standard Deviation of returns. |
| **Slippage** | The difference between the expected trade price and the actual execution price. Always a cost. |
| **Stop Loss** | A pre-set order to exit a trade if it moves against you by a defined amount. Never skip this. |
| **Universe** | The set of securities your strategy considers for trading. Screening and filters define the universe. |
| **VaR** | Value at Risk — the maximum expected loss over a time period at a given confidence level. |
| **VIX** | CBOE Volatility Index — measures implied volatility of S&P 500 options. The market's "fear gauge." |
| **VWAP** | Volume-Weighted Average Price — key institutional price reference calculated continuously intraday. |
| **Walk-Forward Testing** | Rigorous backtest method: train on period A → test on B → advance → repeat. Avoids overfitting. |

---

*FINN — FinTech, Quantitative Trading & AI Automation Curriculum*
*Version 1.0 · April 2026 · This is a living document and will be updated as the curriculum evolves.*
*Not financial advice. All strategies are for educational purposes only.*
