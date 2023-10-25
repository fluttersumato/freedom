import 'package:flutter/material.dart';
import '../data/services/implementations/product_selection.dart';
import '../data/services/implementations/trade_history.dart';
import '../data/services/interfaces/i_product_selection.dart';
import '../data/services/interfaces/i_trade_history.dart';
import '../data/services/settings.dart';
import '../models/myPlans/api_model/product_selection_model.dart';
import '../models/myPlans/controller_and_subscribe_model.dart';
import '../models/myPlans/stop_trade_model.dart';
import '../models/tradeHistory/trade_history_model.dart';
import '../models/tradeHistory/trade_history_model.dart';
import '../res/colors.dart';
import '../styles/app_styles.dart';
import '../../enums/trade_status.dart';
import '../utils/constants.dart';
import '../utils/img_path.dart';
import '../views/investmentDashboard/my_plan_ad.dart';
import '../views/investmentDashboard/myplan_silver_ad.dart';
import '../views/popup/congrats_popup.dart';
import '../views/popup/pause_trade_popup.dart';
import '../views/widgets/alert_dialog.dart';

class TradeHistoryProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String _searchText = "";

  String get searchText => _searchText;

  void setSearchText(String text) {
    _searchText = text;
    notifyListeners();
  }

   List<String> tradeHDropdownList = <String>[
     "All History",
     "Today",
     "Yesterday",
     "Current Week",
     "Current Month",
     "Custom",
  ];
   List<String> tradeDList= <String>[
     "All Direction",
     "Sell",
     "Buy",
  ];
  String? _selectedDirectionItem;
  String? _tradeHDropdownSelectedItem;

  // TradeHistoryProvider(this.items) {
  //   _selectedItem = items[0];
  // }

  String? get selectedDirectionItem => _selectedDirectionItem;
  String? get selectedTradeHItem => _tradeHDropdownSelectedItem;

  void setSelectedItem(String? item) {
    _selectedDirectionItem = item;
    notifyListeners();
  }
  void setSelectedTradeHItem(String? item) {
    _tradeHDropdownSelectedItem = item;
    notifyListeners();
  }


  ProductSelectionModel apiResult = ProductSelectionModel();

  List<TradeHistoryTable>? _tradeHistoryList;

  List<TradeHistoryTable>? get tradeHistoryList => _tradeHistoryList;

  set tradeHistoryList(List<TradeHistoryTable>? value) {
    _tradeHistoryList = value;
    notifyListeners();
  }

  Future<List<TradeHistoryTable>?> getTradeHistory(BuildContext buildContext) async {
    setLoading(true);
    try {
      ITradeHistory tradeHistory = TradeHistory();
      var temp = await tradeHistory.getTradesHistory();
      tradeHistoryList = temp.tradeHistoryList;
      // List<Table>? TradeHistoryList=apiResult.tradeHistoryList;
      setLoading(false);
      return tradeHistoryList;
    } catch (ex) {
      setLoading(false);

      var baseDialog = CustomAlertDialog(
        title: "Failed",
        content: ex.toString(),
        yes: "Ok",
      );
      showDialog(
          context: buildContext, builder: (BuildContext context) => baseDialog);

      // return TradeHistoryModel();
    }
  }





}
