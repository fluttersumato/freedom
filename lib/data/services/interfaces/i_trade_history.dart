import '../../../models/myPlans/api_model/product_selection_model.dart';
import '../../../models/tradeHistory/trade_history_model.dart';

abstract class ITradeHistory{


  Future<TradeHistoryModel> getTradesHistory({String? url});

}