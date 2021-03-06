//+------------------------------------------------------------------+
//|                                                         inde.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql4.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql4.com"
#property version   "1.00"
#property script_show_inputs

#include<Trade/trade.mqh>
CTrade trade;
double lotSize=0.1;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()

  {
BuyOrder();
Comment(NormalizeDouble(PositionGetDouble(POSITION_PROFIT),_Digits));
if(NormalizeDouble(PositionGetDouble(POSITION_PROFIT),_Digits)>0.00){CloseAllBuyPosition();}
PositionGetDouble(POSITION_PROFIT);
   SellOrder();
   if(NormalizeDouble(PositionGetDouble(POSITION_PROFIT),_Digits)>0.00){CloseSellBuyPosition();}
 
  }
//+------------------------------------------------------------------+
void BuyOrder(){

double Ask=NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
if(PositionsTotal()<2){
trade.Buy(lotSize,_Symbol,Ask,0.000000,0.000000,NULL);
}
}
void SellOrder(){

double Bid=NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);
if(PositionsTotal()<2){
trade.Buy(lotSize,_Symbol,Bid,0.000000,0.000000,NULL);
}
}

void CloseAllBuyPosition(){


trade.PositionClose(PositionGetTicket(0));
}
void CloseSellBuyPosition(){
trade.PositionClose(PositionGetTicket(1));
}