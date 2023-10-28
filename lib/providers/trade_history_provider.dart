import 'package:flutter/material.dart';
import '../data/services/implementations/trade_history.dart';
import '../data/services/interfaces/i_trade_history.dart';
import '../models/myPlans/api_model/product_selection_model.dart';
import '../models/tradeHistory/trade_history_model.dart';
import '../views/widgets/alert_dialog.dart';

class TradeHistoryProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  TextEditingController startDate=TextEditingController();
  Future<DateTime?> selectDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime.now(), context: context,
    );
    if(selectedDate!=null) {
      startDate.text=selectedDate.toString();
    }
    return selectedDate;
  }

  TextEditingController endDate=TextEditingController();
  Future<DateTime?> selectEndDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime.now(), context: context,
    );
    if(selectedDate!=null) {
      endDate.text=selectedDate.toString();
    }
    return selectedDate;
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

  TradeHistoryProvider() {
    _selectedDirectionItem=tradeDList[0];
    _tradeHDropdownSelectedItem=tradeHDropdownList[0];

  }

  String? get selectedDirectionItem => _selectedDirectionItem;
  String? get selectedTradeHItem => _tradeHDropdownSelectedItem;

  void setSelectedItem(String? item) {
    _selectedDirectionItem = item;
    notifyListeners();
  }
  bool isVisibleStartDate=false;
  void setSelectedTradeHItem(String? item) {
    _tradeHDropdownSelectedItem = item;
    if(item=="Custom") {
      isVisibleStartDate=true;
    } else {
      isVisibleStartDate=false;
    }
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
