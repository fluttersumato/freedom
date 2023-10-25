import 'package:freedom/data/services/implementations/request_provider.dart';
import '../../../config.dart';
import '../../../models/tradeHistory/trade_history_model.dart';
import '../interfaces/i_request_provider.dart';
import '../interfaces/i_trade_history.dart';

class TradeHistory implements ITradeHistory {
  late final IRequestProvider _apiService; // dependency injenction

  TradeHistory() {
    _apiService = RequestProvider(); // dependency injenction
  }

  @override
  Future<TradeHistoryModel> getTradesHistory({String? url}) async {
    // TODO: implement getUserProducts
    try {
      url =
      "${Config.baseUrlForData}/gettradehistory(1,10,'CloseTime','desc')?direction=&startDate=2023-10-01&endDate=2023-10-31";
      dynamic jsonData = await _apiService.get(url: url);
      // Convert JSON data to a ProductsModel model
      TradeHistoryModel productsModel = TradeHistoryModel.fromJson(jsonData);
      return productsModel;
    } catch (ex) {

      rethrow;
    }
  }

}
