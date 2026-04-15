#!/usr/bin/env python3
"""
finn_launch.py — FINN Session Launcher

Resolves today's class day, pulls live market data, and writes
_session_context.md for Claude to read on session start.

Usage:
    python finn_launch.py              # Today's session
    python finn_launch.py 2026-04-20   # Specific date override
    python finn_launch.py --discord    # Print Discord-formatted ping to stdout
    python finn_launch.py --json       # Print raw JSON payload (for piping)

Requirements:
    pip install yfinance

_session_context.md is ephemeral — add it to .gitignore.
"""

import sys
import json
from datetime import date, timedelta, datetime
from pathlib import Path

# ── Dependencies ───────────────────────────────────────────────────────────────

try:
    import yfinance as yf
    HAS_YFINANCE = True
except ImportError:
    HAS_YFINANCE = False


# ── Course Calendar ────────────────────────────────────────────────────────────

COURSE_START = date(2026, 4, 13)   # D001 — Monday April 13
COURSE_END   = date(2026, 9, 25)   # D072 — Friday September 25 (M4 Day 1)

# Days with no class — async packages apply instead
ASYNC_DAYS = {
    date(2026, 5, 25): "Memorial Day — no class. Async package: curriculum/monthly/FINN_Month02.md",
    date(2026, 9, 7):  "Labor Day — no class. Async package: curriculum/weekly/FINN_W22.md",
}


def build_course_calendar():
    """
    Returns {date: day_number} for every scheduled class day.
    Class days: Mon/Wed/Fri only, excluding ASYNC_DAYS.
    Day numbering starts at 1 (April 13, 2026 = Day 1).
    """
    calendar = {}
    day_num = 0
    current = COURSE_START
    while current <= COURSE_END:
        if current.weekday() in (0, 2, 4) and current not in ASYNC_DAYS:
            day_num += 1
            calendar[current] = day_num
        current += timedelta(days=1)
    return calendar


CALENDAR = build_course_calendar()


def get_next_class_day(from_date):
    """Find the next scheduled class day after from_date."""
    d = from_date + timedelta(days=1)
    while d <= COURSE_END:
        if d in CALENDAR:
            return d, CALENDAR[d]
        d += timedelta(days=1)
    return None, None


# ── Market Data ────────────────────────────────────────────────────────────────

CORE_TICKERS = {
    "ES=F":    "S&P 500 Futures",
    "NQ=F":    "Nasdaq Futures",
    "YM=F":    "Dow Futures",
    "^VIX":    "VIX",
    "SPY":     "SPY",
    "QQQ":     "QQQ",
    "BTC-USD": "Bitcoin",
    "^TNX":    "10-Year Yield",
}

SECTOR_ETFS = {
    "XLK":  "Tech",
    "XLE":  "Energy",
    "XLF":  "Financials",
    "XLV":  "Health Care",
    "XLI":  "Industrials",
    "XLY":  "Consumer Disc.",
    "XLP":  "Consumer Staples",
    "XLC":  "Comm. Services",
    "XLU":  "Utilities",
    "XLRE": "Real Estate",
    "XLB":  "Materials",
}


def fetch_quote(symbol):
    """
    Fetch last close and % change vs prior close for a symbol.
    Returns dict with keys: last, prev, change_pct — or None on failure.
    """
    try:
        hist = yf.Ticker(symbol).history(period="5d", progress=False)
        if hist.empty or len(hist) < 2:
            return None
        prev = float(hist["Close"].iloc[-2])
        last = float(hist["Close"].iloc[-1])
        chg  = (last - prev) / prev * 100
        return {
            "last":       round(last, 2),
            "prev":       round(prev, 2),
            "change_pct": round(chg, 3),
        }
    except Exception:
        return None


def pull_snapshot():
    """Pull quotes for all core tickers and sector ETFs."""
    if not HAS_YFINANCE:
        return {}

    print("  Fetching market data...", end=" ", flush=True)
    snapshot = {}
    all_symbols = list(CORE_TICKERS) + list(SECTOR_ETFS)
    for sym in all_symbols:
        q = fetch_quote(sym)
        if q:
            snapshot[sym] = q

    print(f"{len(snapshot)}/{len(all_symbols)} instruments fetched.")
    return snapshot


# ── Formatting ─────────────────────────────────────────────────────────────────

def arrow(chg):
    return "▲" if chg >= 0 else "▼"


def fmt_chg(chg):
    return f"{arrow(chg)} {chg:+.2f}%"


def build_markdown_snapshot(snapshot):
    """Format market data as markdown for _session_context.md."""
    lines = ["## Live Market Data\n"]

    lines.append("### Core Instruments")
    for sym, label in CORE_TICKERS.items():
        if sym in snapshot:
            q = snapshot[sym]
            lines.append(f"- **{label} ({sym}):** {q['last']} {fmt_chg(q['change_pct'])}")

    lines.append("\n### Sector ETFs — Daily Performance (sorted)")
    sectors = [
        (snapshot[s]["change_pct"], s, name)
        for s, name in SECTOR_ETFS.items()
        if s in snapshot
    ]
    sectors.sort(reverse=True)
    for chg, sym, name in sectors:
        lines.append(f"- **{name} ({sym}):** {fmt_chg(chg)}")

    return "\n".join(lines)


def build_discord_message(day_num, target_date, snapshot, daily_file):
    """Format a Discord-ready ping for the class group."""
    date_str = target_date.strftime("%A, %B %d, %Y")

    lines = [
        f"**FINN — Day {day_num} | {date_str}**",
        f"*Daily file: `{daily_file}`*",
        "",
        "**Pre-Market Snapshot**",
    ]

    for sym, label in CORE_TICKERS.items():
        if sym in snapshot:
            q = snapshot[sym]
            lines.append(f"> **{label}:** {q['last']} {fmt_chg(q['change_pct'])}")

    if snapshot:
        lines.append("")
        lines.append("**Sector Leaders / Laggards**")
        sectors = [
            (snapshot[s]["change_pct"], s, name)
            for s, name in SECTOR_ETFS.items()
            if s in snapshot
        ]
        sectors.sort(reverse=True)
        top3    = sectors[:3]
        bottom3 = sectors[-3:]
        for chg, sym, name in top3:
            lines.append(f"> 🟢 {name}: {fmt_chg(chg)}")
        for chg, sym, name in bottom3:
            lines.append(f"> 🔴 {name}: {fmt_chg(chg)}")

    lines += ["", "📚 *Open Claude Code and prompt: \"Load FINN for today.\"*"]
    return "\n".join(lines)


# ── Context File ───────────────────────────────────────────────────────────────

def write_context_file(day_num, target_date, snapshot, daily_file):
    """
    Write _session_context.md — Claude reads this on session start.
    File is ephemeral (gitignore it). Regenerate before each class.
    """
    generated = datetime.now().strftime("%Y-%m-%d %H:%M")
    date_str  = target_date.strftime("%A, %B %d, %Y")

    market_block = (
        build_markdown_snapshot(snapshot)
        if snapshot
        else "_Market data unavailable — install yfinance: `pip install yfinance`_"
    )

    content = f"""# FINN Session Context
## Generated: {generated}
## Day {day_num} — {date_str}

**Daily file:** `{daily_file}`

---

{market_block}

---

## Startup Instructions for Claude

1. Read `core/FINN_Soul.md` in full — required before any FINN interaction.
2. Read `{daily_file}` in full.
3. If the Generated date above matches today's date, use the market data to populate
   any DMB fields marked [update] in the daily file.
4. Do not wait for a follow-up prompt — lead with today's briefing immediately.
5. If this file's date does not match today: note that market data is stale and proceed
   without it.
"""

    path = Path("_session_context.md")
    path.write_text(content, encoding="utf-8")
    return path


# ── Main ───────────────────────────────────────────────────────────────────────

def main():
    args       = sys.argv[1:]
    discord    = "--discord" in args
    json_mode  = "--json" in args
    date_arg   = next((a for a in args if not a.startswith("--")), None)

    # Resolve target date
    if date_arg:
        try:
            target = datetime.strptime(date_arg, "%Y-%m-%d").date()
        except ValueError:
            print(f"Bad date format: {date_arg}. Use YYYY-MM-DD.")
            sys.exit(1)
    else:
        target = date.today()

    # Look up day number
    day_num = CALENDAR.get(target)

    if day_num is None:
        print()
        if target < COURSE_START:
            print(f"Course hasn't started yet. First class: {COURSE_START.strftime('%B %d, %Y')} (Day 1).")
        elif target > COURSE_END:
            print(f"Course has ended. Last class was {COURSE_END.strftime('%B %d, %Y')}.")
        elif target in ASYNC_DAYS:
            print(f"No class today ({target.strftime('%b %d')}) — {ASYNC_DAYS[target]}")
        else:
            print(f"No class on {target.strftime('%A, %B %d')} ({target.strftime('%A')} is not a class day).")
        next_d, next_n = get_next_class_day(target)
        if next_d:
            print(f"Next class: Day {next_n} — {next_d.strftime('%A, %B %d, %Y')}")
        sys.exit(0)

    daily_file = Path(f"curriculum/daily/FINN_D{day_num:03d}.md")

    # Header
    print()
    print("=" * 54)
    print(f"  FINN — Day {day_num} | {target.strftime('%A, %B %d, %Y')}")
    print(f"  File: {daily_file}")
    if not daily_file.exists():
        print(f"  WARNING: daily file not yet written.")
    print("=" * 54)

    # Pull data
    snapshot = pull_snapshot()

    # Output mode: JSON
    if json_mode:
        payload = {
            "day":        day_num,
            "date":       str(target),
            "daily_file": str(daily_file),
            "market":     snapshot,
        }
        print(json.dumps(payload, indent=2))
        return

    # Output mode: Discord
    if discord:
        print()
        print(build_discord_message(day_num, target, snapshot, daily_file))
        return

    # Default: write context file for Claude
    out = write_context_file(day_num, target, snapshot, daily_file)
    print(f"\n  Context file written: {out}")
    print(f"\n  Prompt Claude: \"Load FINN for today.\"")
    print("=" * 54)
    print()


if __name__ == "__main__":
    main()
