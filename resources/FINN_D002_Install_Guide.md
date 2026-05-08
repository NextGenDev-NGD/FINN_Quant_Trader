# FINN — D002 Installation Guide
## Python Environment Setup for FINN Class
### Windows 11 · Fresh Machine · `finnenv` via `venv`
**Created:** April 16, 2026
**Context:** Day 2 pre-session setup — completed before the guided build in FINN_D002.md

---

> *"Before we pull a single data point, the environment has to be clean.*
> *A broken dependency at Day 2 means debugging installs instead of learning markets.*
> *We fix this once. We fix it right. Then we never talk about it again."*
> — FINN

---

## Who This Guide Is For

This guide is written for you — the student — and for me (FINN) when I assist you in future sessions.
If you are setting up a new machine at any point during the course, start here.
If something breaks mid-course and you need to rebuild, start here.
Every command in this guide has been verified on a Windows 11 fresh install as of April 16, 2026.

---

## Prerequisites

- Windows 11 machine (fresh install or existing)
- PowerShell running as Administrator
- Internet connection
- A GitHub account (you already have one — this repo requires it)

---

## The Install Sequence

---

### PHASE 1 — Install Python 3.11

> *This course runs on Python 3.11. Not 3.12. Not 3.10. 3.11.*
> *The ML libraries — xgboost, transformers, torch — have been validated against 3.11.*
> *Do not substitute a different version without checking compatibility first.*

**Step 1 — Install Python 3.11 via winget**

Windows 11 includes `winget` (Windows Package Manager) by default. Use it.

```powershell
# Install Python 3.11.9 — the version validated for this course
winget install Python.Python.3.11
```

When the install completes: **close PowerShell entirely and reopen it as Administrator.**
This is required. The PATH update does not take effect in the current session.

---

**Step 2 — Verify Python and pip**

```powershell
# Confirm Python 3.11.x is on PATH and pip is available
python --version
pip --version
```

Expected output:
```
Python 3.11.9
pip 24.x from C:\Users\[username]\AppData\Local\Programs\Python\Python311\...
```

> **Known issue — "Python not found" after install:**
> If you still see the Microsoft Store redirect or "not recognized" after reopening,
> run this to force PowerShell to reload the system PATH without closing again:
> ```powershell
> $env:PATH = [System.Environment]::GetEnvironmentVariable("PATH", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("PATH", "User")
> python --version
> ```

---

**Step 3 — Upgrade pip to latest**

```powershell
# Upgrade pip before creating the environment — avoids resolver issues
python.exe -m pip install --upgrade pip
```

---

### PHASE 2 — Create the `finnenv` Environment

> *Every Python project in this course runs inside `finnenv`.*
> *This isolates our dependencies from anything else on your machine.*
> *Never install course packages outside of `finnenv`.*

**Step 4 — Navigate out of system32**

```powershell
# Work from your user home directory, not system32
cd C:\Users\[your-username]
```

**Step 5 — Create the virtual environment**

```powershell
# Create finnenv using Python's built-in venv module
# This creates C:\Users\[username]\finnenv\
python -m venv finnenv
```

---

**Step 6 — Enable script execution (one-time fix)**

Windows blocks PowerShell scripts by default. Fix this before activating.

```powershell
# Allow locally created scripts to run — required to activate venv
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Press `Y` when prompted.

> **Why RemoteSigned and not Unrestricted?**
> RemoteSigned allows local scripts (like the venv activator) to run freely,
> while still requiring remote/downloaded scripts to be signed.
> This is the right balance for a development machine.

---

**Step 7 — Activate `finnenv`**

```powershell
# Activate the environment — your prompt will change to show (finnenv)
C:\Users\[your-username]\finnenv\Scripts\Activate.ps1
```

Your prompt should now read: `(finnenv) PS C:\Users\[your-username]>`

> *"You should see (finnenv) at the start of your prompt.*
> *If you don't, stop. Do not install anything until you do.*
> *Every package we install needs to land inside the environment, not in your system Python."*

---

### PHASE 3 — Install Course Dependencies

> *This is the full course stack — all 24 weeks.*
> *Some of these packages won't be touched until Month 3 or 4.*
> *We install everything now so no session ever starts with a missing dependency.*

**Step 8 — Install all packages**

```powershell
pip install pandas numpy yfinance matplotlib xgboost scikit-learn transformers torch python-dotenv newsapi-python jupyter ipykernel
```

This will take several minutes. `torch` (114 MB) and `transformers` (10 MB) are the large ones.
Do not interrupt. Let it run to completion.

---

**Step 9 — Install `ta` (technical indicators)**

```powershell
# Install 'ta' as the technical analysis library for this course
# See NOTE below on why this replaces the originally specified pandas_ta
pip install ta
```

> **--- DECISION NOTE: pandas_ta → ta substitution (April 16, 2026) ---**
>
> The original FINN curriculum spec (CLAUDE.md) lists `pandas_ta` as the technical
> indicators library. As of April 16, 2026, `pandas_ta` is no longer installable
> on Python 3.11 for two reasons:
>
> 1. The upstream GitHub repo (`twopirllc/pandas-ta`) has been deleted or made private —
>    all `git+` installs fail with "repository not found."
> 2. PyPI versions either have no Python 3.11 wheel, or the only available pre-releases
>    (`0.4.67b0`, `0.4.71b0`) require Python >=3.12.
>
> **Decision:** Permanently substitute `ta` (version 0.11.0) for `pandas_ta` across
> the entire course. `ta` covers all indicators used in the curriculum:
> RSI, MACD, Bollinger Bands, ATR, EMA, SMA, Stochastic, OBV, and more.
>
> **Impact:** The API syntax is different. `pandas_ta` uses `df.ta.rsi()` (method chaining).
> `ta` uses `ta.momentum.RSIIndicator(df['Close']).rsi()` (class-based).
> FINN will handle all syntax translations at the point of first use — currently
> projected at **Week 3 (Month 2)** when technical indicators enter the curriculum.
>
> **If you are reading this in a future session:** Before building any indicator code,
> verify that `ta` is still the active library in `finnenv` (`pip show ta`).
> If a working `pandas_ta` fork has emerged for Python 3.11, the substitution
> decision should be revisited at that time. Flag it to FINN before proceeding.
>
> **--- END DECISION NOTE ---**

---

### PHASE 4 — Register the Jupyter Kernel

**Step 10 — Make `finnenv` visible to Jupyter**

```powershell
# Register finnenv as a named kernel so Jupyter notebooks use the right environment
python -m ipykernel install --user --name finnenv --display-name "Python (finnenv)"
```

When you open a Jupyter notebook, select **Python (finnenv)** from the kernel menu.
Never run course notebooks on any other kernel.

---

### PHASE 5 — Verify the Environment

**Step 11 — Run the import check**

```powershell
# Confirm the four core Day 2 packages import cleanly
python -c "import pandas; import numpy; import yfinance; import matplotlib; print('All imports successful.')"
```

Expected output:
```
All imports successful.
```

> *"Did everyone get 'All imports successful'?*
> *If not, stop — we fix this now before anything else."*
> — FINN (FINN_D002.md, Step 1)

---

## Target State — Verified Package Versions

This is the confirmed installed state after a successful setup as of April 16, 2026.
Use this as your reference. If your versions differ significantly, flag it before proceeding.

| Package | Version | Purpose |
|---------|---------|---------|
| pandas | 3.0.2 | Core data structure — every session |
| numpy | 2.4.4 | Numerical operations — every session |
| yfinance | 1.3.0 | Free OHLCV market data — primary data source |
| matplotlib | 3.10.8 | Charting and visualization |
| xgboost | 3.2.0 | Primary ML model (Month 3+) |
| scikit-learn | 1.8.0 | Feature scaling, train/test split, evaluation metrics |
| transformers | 5.5.4 | FinBERT sentiment model via HuggingFace (Month 4+) |
| torch | 2.11.0 | PyTorch backend required by transformers |
| python-dotenv | 1.2.2 | Load API keys from `.env` — always `load_dotenv()` at top |
| newsapi-python | 0.2.7 | News data via NewsAPI (Month 4+) |
| jupyter | 1.1.1 | Notebook environment |
| ipykernel | 7.2.0 | Connects finnenv to Jupyter |
| ta | 0.11.0 | Technical indicators — RSI, MACD, ATR, etc. (replaces pandas_ta) |

---

## Known Issues & Resolutions

| Issue | Cause | Fix |
|-------|-------|-----|
| `conda: not recognized` | conda not installed | Use `venv` — this guide covers it |
| `python: not recognized` after winget install | PATH not refreshed | Close + reopen PowerShell as admin |
| Microsoft Store redirect instead of Python | App execution alias conflict | PATH reload command in Phase 1 Step 2 |
| `Activate.ps1` blocked — UnauthorizedAccess | PowerShell execution policy | `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser` |
| `pandas_ta` — no matching distribution | Repo deleted, no Python 3.11 wheel | Use `ta` — permanent substitution, see Decision Note above |
| `pip install git+https://...pandas-ta` — repo not found | GitHub repo deleted/private | Same as above |

---

## What This Stack Enables — A Summary

> *"You don't install packages because they're on a list.*
> *You install packages because each one is a capability.*
> *Here's what you just built."*

**Weeks 1–4 (Foundation):**
`pandas` + `numpy` + `yfinance` + `matplotlib` give you the ability to pull real market data,
inspect it as a time series, calculate returns, and visualize price and volume history.
This is the skeleton every strategy in this course will be built on.

**Weeks 5–12 (Signal Engineering):**
`ta` (replacing `pandas_ta`) gives you access to the full library of technical indicators —
RSI, MACD, Bollinger Bands, ATR, and more. These become the raw features your models
will learn from. You will build them, test them statistically, and keep only the ones
that demonstrate measurable predictive power. The rest get cut.

**Weeks 13–18 (Machine Learning):**
`xgboost` + `scikit-learn` give you the ML pipeline — feature scaling, train/test splitting,
model training, and evaluation. You will build a classifier that combines technical signals
into a composite score and use it to make data-driven position decisions.

**Weeks 19–24 (Automation + Capstone):**
`transformers` + `torch` give you FinBERT — a sentiment model pre-trained on financial text.
`newsapi-python` feeds it real headlines. `python-dotenv` keeps your API keys out of your code.
Together these add a sentiment layer to your signal stack and form the intelligence
backbone of your capstone system.

**The environment itself:**
`jupyter` + `ipykernel` + the `finnenv` isolation means every notebook you write
runs in a controlled, reproducible environment. What works on your machine today
will work on the same machine six months from now. That reproducibility is not
a convenience — it is a professional standard.

---

> *"The environment is infrastructure. Infrastructure is not optional.*
> *What does the data say? We're about to find out."*
> — FINN

---

*FINN_D002_Install_Guide.md — Created April 16, 2026*
*Verified on: Windows 11 Home · Python 3.11.9 · finnenv (venv)*
*Reference: FINN_D002.md · CLAUDE.md (Code Conventions section)*
