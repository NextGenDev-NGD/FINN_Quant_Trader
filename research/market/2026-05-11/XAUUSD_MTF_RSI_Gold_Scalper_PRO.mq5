//+------------------------------------------------------------------+
//|      XAUUSD Multi-Timeframe RSI Gold Scalper PRO - MT5           |
//|      M1 RSI + H1 RSI Alignment + ATR Risk Controls               |
//+------------------------------------------------------------------+
#property strict
#property version   "2.00"

#include <Trade/Trade.mqh>
CTrade trade;

//================ GENERAL INPUTS =================//
input int    MagicNumber              = 777555;
input int    SlippagePoints           = 30;

//================ LOT / RISK INPUTS =================//
input bool   UseRiskBasedLot          = true;
input double RiskPercent              = 1.0;      // risk per trade
input double FixedLot                 = 0.01;     // used if UseRiskBasedLot=false
input double MaxLotCap                = 0.05;     // safety cap

//================ RSI SETTINGS =================//
input int    RSIPeriod                = 14;

// Closed bar RSI levels
input double BuyRSI_M1                = 30.0;
input double SellRSI_M1               = 70.0;

input double BuyRSI_H1                = 45.0;     // H1 alignment for buy
input double SellRSI_H1               = 55.0;     // H1 alignment for sell

input double BuyCloseRSI_M1           = 67.0;
input double SellCloseRSI_M1          = 33.0;

//================ ATR HARD STOP SETTINGS =================//
input int    ATRPeriod                = 14;
input double ATR_SL_Mult              = 1.5;
input double ATR_TP_Mult              = 2.0;
input double MinATRPoints             = 50.0;     // avoid dead market

//================ EMA REGIME FILTER =================//
input bool   UseEMAFilter             = true;
input int    EMA_Period_H1            = 200;      // H1 trend gate

//================ PARTIAL CLOSE =================//
input bool   UsePartialClose          = true;
input double PartialCloseAtRR         = 1.0;      // close part at 1:1 RR
input double PartialClosePercent      = 50.0;     // close 50%

//================ BREAKEVEN / TRAILING =================//
input bool   UseBreakEven             = true;
input double BreakEvenAtRR            = 1.0;
input double BreakEvenPlusPoints      = 20.0;

input bool   UseTrailingStop          = true;
input double TrailStartRR             = 1.2;
input double TrailDistanceATRMult     = 1.0;

//================ DAILY RISK CONTROLS =================//
input double MaxDailyLossPercent      = 3.0;
input int    MaxTradesPerDay          = 6;

//================ SPREAD FILTER =================//
input int    MaxSpreadPoints          = 150;

//================ SESSION FILTER =================//
input bool   UseSessionFilter         = true;
input int    TradeStartHour           = 7;        // server time
input int    TradeEndHour             = 20;       // server time

//================ GLOBAL HANDLES =================//
int rsiHandleM1 = INVALID_HANDLE;
int rsiHandleH1 = INVALID_HANDLE;
int atrHandleM1 = INVALID_HANDLE;
int emaHandleH1 = INVALID_HANDLE;

datetime currentDay = 0;
double dayStartEquity = 0.0;
int tradesToday = 0;

//+------------------------------------------------------------------+
//| Expert Initialization                                            |
//+------------------------------------------------------------------+
int OnInit()
{
   trade.SetExpertMagicNumber(MagicNumber);
   trade.SetDeviationInPoints(SlippagePoints);

   rsiHandleM1 = iRSI(_Symbol, PERIOD_M1, RSIPeriod, PRICE_CLOSE);
   rsiHandleH1 = iRSI(_Symbol, PERIOD_H1, RSIPeriod, PRICE_CLOSE);
   atrHandleM1 = iATR(_Symbol, PERIOD_M1, ATRPeriod);
   emaHandleH1 = iMA(_Symbol, PERIOD_H1, EMA_Period_H1, 0, MODE_EMA, PRICE_CLOSE);

   if(rsiHandleM1 == INVALID_HANDLE ||
      rsiHandleH1 == INVALID_HANDLE ||
      atrHandleM1 == INVALID_HANDLE ||
      emaHandleH1 == INVALID_HANDLE)
   {
      Print("Failed to create indicator handles");
      return INIT_FAILED;
   }

   ResetDailyStats();

   Print("XAUUSD Multi-Timeframe RSI Gold Scalper PRO Loaded");
   return INIT_SUCCEEDED;
}

//+------------------------------------------------------------------+
//| Expert Deinitialization                                          |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   if(rsiHandleM1 != INVALID_HANDLE) IndicatorRelease(rsiHandleM1);
   if(rsiHandleH1 != INVALID_HANDLE) IndicatorRelease(rsiHandleH1);
   if(atrHandleM1 != INVALID_HANDLE) IndicatorRelease(atrHandleM1);
   if(emaHandleH1 != INVALID_HANDLE) IndicatorRelease(emaHandleH1);
}

//+------------------------------------------------------------------+
//| Expert Tick Function                                             |
//+------------------------------------------------------------------+
void OnTick()
{
   CheckNewDay();

   ManageOpenPositions();

   if(HasOpenPosition())
      return;

   if(!TradingAllowedNow())
      return;

   double rsiM1 = GetBufferValue(rsiHandleM1, 1);   // closed M1 candle
   double rsiH1 = GetBufferValue(rsiHandleH1, 1);   // closed H1 candle
   double atrM1 = GetBufferValue(atrHandleM1, 1);   // closed M1 ATR

   if(rsiM1 < 0 || rsiH1 < 0 || atrM1 <= 0)
      return;

   double atrPoints = atrM1 / _Point;
   if(atrPoints < MinATRPoints)
      return;

   double emaH1 = GetBufferValue(emaHandleH1, 1);
   double h1Close = iClose(_Symbol, PERIOD_H1, 1);

   if(emaH1 <= 0 || h1Close <= 0)
      return;

   bool buySignal  = false;
   bool sellSignal = false;

   // M1 AND H1 alignment using closed candles
   if(rsiM1 <= BuyRSI_M1 && rsiH1 <= BuyRSI_H1)
      buySignal = true;

   if(rsiM1 >= SellRSI_M1 && rsiH1 >= SellRSI_H1)
      sellSignal = true;

   // EMA regime filter
   // Buy only when H1 is above EMA. Sell only when H1 is below EMA.
   if(UseEMAFilter)
   {
      if(buySignal && h1Close <= emaH1)
         buySignal = false;

      if(sellSignal && h1Close >= emaH1)
         sellSignal = false;
   }

   if(buySignal)
      OpenTrade(ORDER_TYPE_BUY, atrM1);

   if(sellSignal)
      OpenTrade(ORDER_TYPE_SELL, atrM1);
}

//+------------------------------------------------------------------+
//| Open Trade                                                       |
//+------------------------------------------------------------------+
void OpenTrade(ENUM_ORDER_TYPE orderType, double atrValue)
{
   double ask = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
   double bid = SymbolInfoDouble(_Symbol, SYMBOL_BID);

   double entry = 0.0;
   double sl = 0.0;
   double tp = 0.0;

   double slDistance = atrValue * ATR_SL_Mult;
   double tpDistance = atrValue * ATR_TP_Mult;

   if(orderType == ORDER_TYPE_BUY)
   {
      entry = ask;
      sl = entry - slDistance;
      tp = entry + tpDistance;
   }
   else if(orderType == ORDER_TYPE_SELL)
   {
      entry = bid;
      sl = entry + slDistance;
      tp = entry - tpDistance;
   }
   else
      return;

   sl = NormalizeDouble(sl, _Digits);
   tp = NormalizeDouble(tp, _Digits);

   double lot = FixedLot;

   if(UseRiskBasedLot)
      lot = CalculateRiskLot(slDistance);

   lot = NormalizeLot(lot);

   if(lot <= 0)
   {
      Print("Lot calculation failed");
      return;
   }

   bool result = false;

   if(orderType == ORDER_TYPE_BUY)
      result = trade.Buy(lot, _Symbol, 0.0, sl, tp, "MTF RSI PRO BUY");

   if(orderType == ORDER_TYPE_SELL)
      result = trade.Sell(lot, _Symbol, 0.0, sl, tp, "MTF RSI PRO SELL");

   if(result)
   {
      tradesToday++;
      Print("Trade opened. Type: ", EnumToString(orderType),
            " Lot: ", lot,
            " SL: ", sl,
            " TP: ", tp,
            " TradesToday: ", tradesToday);
   }
   else
   {
      Print("Trade open failed. Error: ", GetLastError());
   }
}

//+------------------------------------------------------------------+
//| Manage Open Positions                                            |
//+------------------------------------------------------------------+
void ManageOpenPositions()
{
   double rsiM1 = GetBufferValue(rsiHandleM1, 1);
   double atrM1 = GetBufferValue(atrHandleM1, 1);

   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      ulong ticket = PositionGetTicket(i);

      if(!PositionSelectByTicket(ticket))
         continue;

      if(PositionGetString(POSITION_SYMBOL) != _Symbol)
         continue;

      if(PositionGetInteger(POSITION_MAGIC) != MagicNumber)
         continue;

      ENUM_POSITION_TYPE type =
         (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);

      double openPrice = PositionGetDouble(POSITION_PRICE_OPEN);
      double volume    = PositionGetDouble(POSITION_VOLUME);
      double sl        = PositionGetDouble(POSITION_SL);
      double tp        = PositionGetDouble(POSITION_TP);

      double bid = SymbolInfoDouble(_Symbol, SYMBOL_BID);
      double ask = SymbolInfoDouble(_Symbol, SYMBOL_ASK);

      // RSI exit using closed candle
      if(type == POSITION_TYPE_BUY && rsiM1 >= BuyCloseRSI_M1)
      {
         trade.PositionClose(ticket);
         Print("BUY closed by RSI exit");
         continue;
      }

      if(type == POSITION_TYPE_SELL && rsiM1 <= SellCloseRSI_M1)
      {
         trade.PositionClose(ticket);
         Print("SELL closed by RSI exit");
         continue;
      }

      if(sl <= 0 || atrM1 <= 0)
         continue;

      double initialRisk = MathAbs(openPrice - sl);
      if(initialRisk <= 0)
         continue;

      double currentPrice = (type == POSITION_TYPE_BUY) ? bid : ask;
      double profitDistance = 0.0;

      if(type == POSITION_TYPE_BUY)
         profitDistance = currentPrice - openPrice;

      if(type == POSITION_TYPE_SELL)
         profitDistance = openPrice - currentPrice;

      double rr = profitDistance / initialRisk;

      // Partial close at 1R
      if(UsePartialClose && rr >= PartialCloseAtRR && !PartialAlreadyDone(ticket))
      {
         double closeVol = NormalizeLot(volume * PartialClosePercent / 100.0);
         double minLot = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MIN);

         if(closeVol >= minLot && closeVol < volume)
         {
            if(trade.PositionClosePartial(ticket, closeVol))
            {
               MarkPartialDone(ticket);
               Print("Partial close done at RR: ", rr);
            }
         }
         else
         {
            MarkPartialDone(ticket);
         }
      }

      // Breakeven
      if(UseBreakEven && rr >= BreakEvenAtRR)
      {
         double newSL = sl;

         if(type == POSITION_TYPE_BUY)
            newSL = openPrice + BreakEvenPlusPoints * _Point;

         if(type == POSITION_TYPE_SELL)
            newSL = openPrice - BreakEvenPlusPoints * _Point;

         newSL = NormalizeDouble(newSL, _Digits);

         if(type == POSITION_TYPE_BUY && newSL > sl && newSL < bid)
            trade.PositionModify(ticket, newSL, tp);

         if(type == POSITION_TYPE_SELL && (newSL < sl || sl == 0) && newSL > ask)
            trade.PositionModify(ticket, newSL, tp);
      }

      // Trailing stop after breakeven
      if(UseTrailingStop && rr >= TrailStartRR)
      {
         double trailDistance = atrM1 * TrailDistanceATRMult;
         double trailSL = sl;

         if(type == POSITION_TYPE_BUY)
            trailSL = bid - trailDistance;

         if(type == POSITION_TYPE_SELL)
            trailSL = ask + trailDistance;

         trailSL = NormalizeDouble(trailSL, _Digits);

         if(type == POSITION_TYPE_BUY && trailSL > sl && trailSL < bid)
            trade.PositionModify(ticket, trailSL, tp);

         if(type == POSITION_TYPE_SELL && trailSL < sl && trailSL > ask)
            trade.PositionModify(ticket, trailSL, tp);
      }
   }
}

//+------------------------------------------------------------------+
//| Trading Allowed Now                                              |
//+------------------------------------------------------------------+
bool TradingAllowedNow()
{
   if(tradesToday >= MaxTradesPerDay)
      return false;

   double equity = AccountInfoDouble(ACCOUNT_EQUITY);

   if(dayStartEquity > 0)
   {
      double lossPct = ((dayStartEquity - equity) / dayStartEquity) * 100.0;

      if(lossPct >= MaxDailyLossPercent)
      {
         Print("Daily loss cap hit. Trading stopped for today. Loss %: ", lossPct);
         return false;
      }
   }

   double spreadPoints =
      (SymbolInfoDouble(_Symbol, SYMBOL_ASK) -
       SymbolInfoDouble(_Symbol, SYMBOL_BID)) / _Point;

   if(spreadPoints > MaxSpreadPoints)
      return false;

   if(UseSessionFilter)
   {
      MqlDateTime timeStruct;
      TimeToStruct(TimeCurrent(), timeStruct);

      int hour = timeStruct.hour;

      if(TradeStartHour < TradeEndHour)
      {
         if(hour < TradeStartHour || hour >= TradeEndHour)
            return false;
      }
      else
      {
         if(hour < TradeStartHour && hour >= TradeEndHour)
            return false;
      }
   }

   return true;
}

//+------------------------------------------------------------------+
//| Check If Any Position Exists                                     |
//+------------------------------------------------------------------+
bool HasOpenPosition()
{
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      ulong ticket = PositionGetTicket(i);

      if(!PositionSelectByTicket(ticket))
         continue;

      if(PositionGetString(POSITION_SYMBOL) == _Symbol &&
         PositionGetInteger(POSITION_MAGIC) == MagicNumber)
      {
         return true;
      }
   }

   return false;
}

//+------------------------------------------------------------------+
//| Calculate Risk Lot                                               |
//+------------------------------------------------------------------+
double CalculateRiskLot(double slDistancePrice)
{
   double equity = AccountInfoDouble(ACCOUNT_EQUITY);
   double riskMoney = equity * RiskPercent / 100.0;

   double tickSize = SymbolInfoDouble(_Symbol, SYMBOL_TRADE_TICK_SIZE);
   double tickValue = SymbolInfoDouble(_Symbol, SYMBOL_TRADE_TICK_VALUE);

   if(tickSize <= 0 || tickValue <= 0 || slDistancePrice <= 0)
      return FixedLot;

   double lossPerLot = (slDistancePrice / tickSize) * tickValue;

   if(lossPerLot <= 0)
      return FixedLot;

   double lot = riskMoney / lossPerLot;

   return lot;
}

//+------------------------------------------------------------------+
//| Normalize Lot                                                    |
//+------------------------------------------------------------------+
double NormalizeLot(double lot)
{
   double minLot  = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MIN);
   double maxLot  = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MAX);
   double stepLot = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_STEP);

   if(stepLot <= 0)
      stepLot = 0.01;

   lot = MathMin(lot, MaxLotCap);
   lot = MathMin(lot, maxLot);
   lot = MathMax(lot, minLot);

   lot = MathFloor(lot / stepLot) * stepLot;

   return NormalizeDouble(lot, 2);
}

//+------------------------------------------------------------------+
//| Get Buffer Value                                                 |
//+------------------------------------------------------------------+
double GetBufferValue(int handle, int shift)
{
   double buffer[];
   ArraySetAsSeries(buffer, true);

   if(CopyBuffer(handle, 0, shift, 1, buffer) <= 0)
      return -1;

   return buffer[0];
}

//+------------------------------------------------------------------+
//| Daily Reset                                                      |
//+------------------------------------------------------------------+
void ResetDailyStats()
{
   MqlDateTime timeStruct;
   TimeToStruct(TimeCurrent(), timeStruct);

   timeStruct.hour = 0;
   timeStruct.min  = 0;
   timeStruct.sec  = 0;

   currentDay = StructToTime(timeStruct);
   dayStartEquity = AccountInfoDouble(ACCOUNT_EQUITY);
   tradesToday = 0;

   Print("Daily stats reset. Start equity: ", dayStartEquity);
}

//+------------------------------------------------------------------+
//| Check New Day                                                    |
//+------------------------------------------------------------------+
void CheckNewDay()
{
   MqlDateTime timeStruct;
   TimeToStruct(TimeCurrent(), timeStruct);

   timeStruct.hour = 0;
   timeStruct.min  = 0;
   timeStruct.sec  = 0;

   datetime today = StructToTime(timeStruct);

   if(today != currentDay)
      ResetDailyStats();
}

//+------------------------------------------------------------------+
//| Partial Close Tracking                                           |
//+------------------------------------------------------------------+
string PartialKey(ulong ticket)
{
   return "MTF_RSI_PRO_PARTIAL_" + _Symbol + "_" + IntegerToString(MagicNumber) + "_" + IntegerToString((int)ticket);
}

bool PartialAlreadyDone(ulong ticket)
{
   return GlobalVariableCheck(PartialKey(ticket));
}

void MarkPartialDone(ulong ticket)
{
   GlobalVariableSet(PartialKey(ticket), 1.0);
}
//+------------------------------------------------------------------+
