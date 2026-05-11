//+------------------------------------------------------------------+
//|           Multi-Timeframe RSI Gold Scalper - MT5                 |
//|                     XAUUSD M1 + H1 RSI Bot                       |
//+------------------------------------------------------------------+
#property strict

#include <Trade/Trade.mqh>

CTrade trade;

//================ INPUTS =================//
input double LotSize            = 0.10;

// RSI Settings
input int    RSIPeriod          = 14;

// M1 RSI Levels
input double BuyRSI_M1          = 30.0;
input double SellRSI_M1         = 70.0;

input double BuyCloseRSI_M1     = 67.0;
input double SellCloseRSI_M1    = 33.0;

// H1 RSI Levels
input double BuyRSI_H1          = 30.0;
input double SellRSI_H1         = 70.0;

input double BuyCloseRSI_H1     = 67.0;
input double SellCloseRSI_H1    = 33.0;

// Trade settings
input int    MagicNumber        = 777555;
input int    SlippagePoints     = 30;

//========================================//

int rsiHandleM1 = INVALID_HANDLE;
int rsiHandleH1 = INVALID_HANDLE;

//+------------------------------------------------------------------+
//| Expert Initialization                                            |
//+------------------------------------------------------------------+
int OnInit()
{
   trade.SetExpertMagicNumber(MagicNumber);
   trade.SetDeviationInPoints(SlippagePoints);

   // M1 RSI
   rsiHandleM1 = iRSI(_Symbol, PERIOD_M1, RSIPeriod, PRICE_CLOSE);

   // H1 RSI
   rsiHandleH1 = iRSI(_Symbol, PERIOD_H1, RSIPeriod, PRICE_CLOSE);

   if(rsiHandleM1 == INVALID_HANDLE || rsiHandleH1 == INVALID_HANDLE)
   {
      Print("Failed to create RSI handles");
      return(INIT_FAILED);
   }

   Print("Multi-Timeframe RSI Scalper Loaded");

   return(INIT_SUCCEEDED);
}

//+------------------------------------------------------------------+
//| Expert Deinitialization                                          |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   if(rsiHandleM1 != INVALID_HANDLE)
      IndicatorRelease(rsiHandleM1);

   if(rsiHandleH1 != INVALID_HANDLE)
      IndicatorRelease(rsiHandleH1);
}

//+------------------------------------------------------------------+
//| Expert Tick Function                                             |
//+------------------------------------------------------------------+
void OnTick()
{
   double rsiM1[];
   double rsiH1[];

   ArraySetAsSeries(rsiM1, true);
   ArraySetAsSeries(rsiH1, true);

   //================ GET RSI DATA ================//
   if(CopyBuffer(rsiHandleM1, 0, 0, 1, rsiM1) <= 0)
      return;

   if(CopyBuffer(rsiHandleH1, 0, 0, 1, rsiH1) <= 0)
      return;

   double currentRSIM1 = rsiM1[0];
   double currentRSIH1 = rsiH1[0];

   bool hasBuy  = false;
   bool hasSell = false;

   //================ CHECK OPEN POSITIONS ================//
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      ulong ticket = PositionGetTicket(i);

      if(PositionSelectByTicket(ticket))
      {
         string symbol = PositionGetString(POSITION_SYMBOL);
         long magic    = PositionGetInteger(POSITION_MAGIC);

         if(symbol != _Symbol || magic != MagicNumber)
            continue;

         ENUM_POSITION_TYPE type =
            (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);

         if(type == POSITION_TYPE_BUY)
            hasBuy = true;

         if(type == POSITION_TYPE_SELL)
            hasSell = true;
      }
   }

   //====================================================//
   //==================== BUY EXIT ======================//
   //====================================================//

   // Close BUY from M1 signal
   if(hasBuy && currentRSIM1 >= BuyCloseRSI_M1)
   {
      ClosePositions(POSITION_TYPE_BUY);
      Print("BUY Closed by M1 RSI");
      return;
   }

   // Close BUY from H1 signal
   if(hasBuy && currentRSIH1 >= BuyCloseRSI_H1)
   {
      ClosePositions(POSITION_TYPE_BUY);
      Print("BUY Closed by H1 RSI");
      return;
   }

   //====================================================//
   //==================== SELL EXIT =====================//
   //====================================================//

   // Close SELL from M1 signal
   if(hasSell && currentRSIM1 <= SellCloseRSI_M1)
   {
      ClosePositions(POSITION_TYPE_SELL);
      Print("SELL Closed by M1 RSI");
      return;
   }

   // Close SELL from H1 signal
   if(hasSell && currentRSIH1 <= SellCloseRSI_H1)
   {
      ClosePositions(POSITION_TYPE_SELL);
      Print("SELL Closed by H1 RSI");
      return;
   }

   //====================================================//
   //==================== BUY ENTRY =====================//
   //====================================================//

   // M1 BUY
   if(currentRSIM1 <= BuyRSI_M1 && !hasBuy && !hasSell)
   {
      if(trade.Buy(LotSize, _Symbol))
      {
         Print("M1 BUY Opened | RSI: ", currentRSIM1);
      }
      else
      {
         Print("M1 BUY failed. Error: ", GetLastError());
      }

      return;
   }

   // H1 BUY
   if(currentRSIH1 <= BuyRSI_H1 && !hasBuy && !hasSell)
   {
      if(trade.Buy(LotSize, _Symbol))
      {
         Print("H1 BUY Opened | RSI: ", currentRSIH1);
      }
      else
      {
         Print("H1 BUY failed. Error: ", GetLastError());
      }

      return;
   }

   //====================================================//
   //==================== SELL ENTRY ====================//
   //====================================================//

   // M1 SELL
   if(currentRSIM1 >= SellRSI_M1 && !hasBuy && !hasSell)
   {
      if(trade.Sell(LotSize, _Symbol))
      {
         Print("M1 SELL Opened | RSI: ", currentRSIM1);
      }
      else
      {
         Print("M1 SELL failed. Error: ", GetLastError());
      }

      return;
   }

   // H1 SELL
   if(currentRSIH1 >= SellRSI_H1 && !hasBuy && !hasSell)
   {
      if(trade.Sell(LotSize, _Symbol))
      {
         Print("H1 SELL Opened | RSI: ", currentRSIH1);
      }
      else
      {
         Print("H1 SELL failed. Error: ", GetLastError());
      }

      return;
   }
}

//+------------------------------------------------------------------+
//| Close Positions Function                                         |
//+------------------------------------------------------------------+
void ClosePositions(ENUM_POSITION_TYPE positionType)
{
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      ulong ticket = PositionGetTicket(i);

      if(PositionSelectByTicket(ticket))
      {
         string symbol = PositionGetString(POSITION_SYMBOL);
         long magic    = PositionGetInteger(POSITION_MAGIC);

         if(symbol != _Symbol || magic != MagicNumber)
            continue;

         ENUM_POSITION_TYPE type =
            (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);

         if(type == positionType)
         {
            if(!trade.PositionClose(ticket))
            {
               Print("Failed to close position ticket: ", ticket,
                     " | Error: ", GetLastError());
            }
         }
      }
   }
}
//+------------------------------------------------------------------+
