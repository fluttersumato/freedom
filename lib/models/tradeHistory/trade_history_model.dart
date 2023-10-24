import 'dart:convert';
/// Table : [{"Totalcount":45,"OrderId":599863638,"Market":"Forex","Symbol":"EURUSD","Direction":"Buy","OpenTime":"2023-10-24T08:35:32.96","CloseTime":"2023-10-24T09:55:09.887","EntryPrice":1.06,"ClosingPrice":1.06,"ClosedVolume":1.41,"Commission":-9.00,"Net":-150.00,"Balance":13807.08},{"Totalcount":45,"OrderId":599818940,"Market":"Commodities","Symbol":"XAUUSD","Direction":"Buy","OpenTime":"2023-10-24T07:20:38.047","CloseTime":"2023-10-24T09:39:08.45","EntryPrice":1977.20,"ClosingPrice":1964.99,"ClosedVolume":0.15,"Commission":-1.77,"Net":-184.92,"Balance":13957.08},{"Totalcount":45,"OrderId":599863521,"Market":"Commodities","Symbol":"XAGUSD","Direction":"Buy","OpenTime":"2023-10-24T08:34:47.887","CloseTime":"2023-10-24T08:35:19.867","EntryPrice":23.01,"ClosingPrice":23.00,"ClosedVolume":0.14,"Commission":-0.20,"Net":-1.60,"Balance":14142.00},{"Totalcount":45,"OrderId":599862776,"Market":"Forex","Symbol":"EURUSD","Direction":"Buy","OpenTime":"2023-10-24T07:33:37.123","CloseTime":"2023-10-24T08:34:30.233","EntryPrice":1.07,"ClosingPrice":1.06,"ClosedVolume":0.15,"Commission":-0.96,"Net":-24.96,"Balance":14143.60},{"Totalcount":45,"OrderId":599862762,"Market":"Commodities","Symbol":"XAGUSD","Direction":"Buy","OpenTime":"2023-10-24T07:50:03.32","CloseTime":"2023-10-24T08:34:29.867","EntryPrice":23.12,"ClosingPrice":23.00,"ClosedVolume":0.15,"Commission":-0.20,"Net":-18.35,"Balance":14168.56},{"Totalcount":45,"OrderId":599862759,"Market":"Commodities","Symbol":"XAGUSD","Direction":"Buy","OpenTime":"2023-10-24T07:35:56.167","CloseTime":"2023-10-24T08:34:29.85","EntryPrice":23.14,"ClosingPrice":23.00,"ClosedVolume":0.15,"Commission":-0.20,"Net":-21.95,"Balance":14186.91},{"Totalcount":45,"OrderId":599862746,"Market":"Commodities","Symbol":"XAUUSD","Direction":"Buy","OpenTime":"2023-10-24T07:21:29.617","CloseTime":"2023-10-24T08:34:28.637","EntryPrice":1977.35,"ClosingPrice":1973.97,"ClosedVolume":0.15,"Commission":-1.78,"Net":-52.48,"Balance":14208.86},{"Totalcount":45,"OrderId":599862743,"Market":"Commodities","Symbol":"XAUUSD","Direction":"Buy","OpenTime":"2023-10-24T07:20:19.52","CloseTime":"2023-10-24T08:34:28.513","EntryPrice":1977.28,"ClosingPrice":1973.97,"ClosedVolume":0.15,"Commission":-1.78,"Net":-51.43,"Balance":14261.34},{"Totalcount":45,"OrderId":599818615,"Market":"Commodities","Symbol":"XAUUSD","Direction":"Buy","OpenTime":"2023-10-24T07:19:50.47","CloseTime":"2023-10-24T07:20:01.37","EntryPrice":1977.67,"ClosingPrice":1977.03,"ClosedVolume":0.15,"Commission":-1.78,"Net":-11.38,"Balance":14312.77},{"Totalcount":45,"OrderId":599815472,"Market":"Forex","Symbol":"EURJPY","Direction":"Buy","OpenTime":"2023-10-24T07:06:22.157","CloseTime":"2023-10-24T07:12:40.24","EntryPrice":159.65,"ClosingPrice":159.64,"ClosedVolume":0.44,"Commission":-2.82,"Net":-6.06,"Balance":14324.15}]

TradeHistoryModel tradeHistoryModelFromJson(String str) => TradeHistoryModel.fromJson(json.decode(str));
String tradeHistoryModelToJson(TradeHistoryModel data) => json.encode(data.toJson());
class TradeHistoryModel {
  TradeHistoryModel({
      List<Table>? table,}){
    _table = table;
}

  TradeHistoryModel.fromJson(dynamic json) {
    var jsonData = jsonDecode(json);
    if (jsonData['Table'] != null ) {
    // if (json['Table'] != null && json['Table'] is Map<String, dynamic>) {
      _table = [];
      jsonData['Table'].forEach((v) {
        _table?.add(Table.fromJson(v));
      });
    }
  }
  List<Table>? _table;

  List<Table>? get table => _table;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_table != null) {
      map['Table'] = _table?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// Totalcount : 45
/// OrderId : 599863638
/// Market : "Forex"
/// Symbol : "EURUSD"
/// Direction : "Buy"
/// OpenTime : "2023-10-24T08:35:32.96"
/// CloseTime : "2023-10-24T09:55:09.887"
/// EntryPrice : 1.06
/// ClosingPrice : 1.06
/// ClosedVolume : 1.41
/// Commission : -9.00
/// Net : -150.00
/// Balance : 13807.08

Table tableFromJson(String str) => Table.fromJson(json.decode(str));
String tableToJson(Table data) => json.encode(data.toJson());
class Table {
  Table({
      int? totalcount, 
      int? orderId, 
      String? market, 
      String? symbol, 
      String? direction,
    DateTime? openTime,
      DateTime? closeTime,
      double? entryPrice, 
      double? closingPrice, 
      double? closedVolume, 
      double? commission, 
      double? net, 
      double? balance,}){
    _totalcount = totalcount;
    _orderId = orderId;
    _market = market;
    _symbol = symbol;
    _direction = direction;
    _openTime = openTime;
    _closeTime = closeTime;
    _entryPrice = entryPrice;
    _closingPrice = closingPrice;
    _closedVolume = closedVolume;
    _commission = commission;
    _net = net;
    _balance = balance;
}

  Table.fromJson(dynamic json) {
    _totalcount = json['Totalcount'];
    _orderId = json['OrderId'];
    _market = json['Market'];
    _symbol = json['Symbol'];
    _direction = json['Direction'];
    _openTime = DateTime.tryParse( json['OpenTime'] );
    _closeTime = DateTime.tryParse(json['CloseTime'] );
    _entryPrice = json['EntryPrice'];
    _closingPrice = json['ClosingPrice'];
    _closedVolume = json['ClosedVolume'];
    _commission = json['Commission'];
    _net = json['Net'];
    _balance = json['Balance'];
  }
  int? _totalcount;
  int? _orderId;
  String? _market;
  String? _symbol;
  String? _direction;
  DateTime? _openTime,_closeTime;
  double? _entryPrice;
  double? _closingPrice;
  double? _closedVolume;
  double? _commission;
  double? _net;
  double? _balance;

  int? get totalcount => _totalcount;
  int? get orderId => _orderId;
  String? get market => _market;
  String? get symbol => _symbol;
  String? get direction => _direction;
  DateTime? get openTime => _openTime;
  DateTime? get closeTime => _closeTime;
  double? get entryPrice => _entryPrice;
  double? get closingPrice => _closingPrice;
  double? get closedVolume => _closedVolume;
  double? get commission => _commission;
  double? get net => _net;
  double? get balance => _balance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Totalcount'] = _totalcount;
    map['OrderId'] = _orderId;
    map['Market'] = _market;
    map['Symbol'] = _symbol;
    map['Direction'] = _direction;
    map['OpenTime'] = _openTime;
    map['CloseTime'] = _closeTime;
    map['EntryPrice'] = _entryPrice;
    map['ClosingPrice'] = _closingPrice;
    map['ClosedVolume'] = _closedVolume;
    map['Commission'] = _commission;
    map['Net'] = _net;
    map['Balance'] = _balance;
    return map;
  }

}