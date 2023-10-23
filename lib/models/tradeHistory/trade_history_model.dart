class TradeHistoryModel {
  List<Table>? tradeHistoryList;

  TradeHistoryModel({this.tradeHistoryList});

  TradeHistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['Table'] != null) {
      tradeHistoryList = <Table>[];
      json['Table'].forEach((v) {
        tradeHistoryList!.add(new Table.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tradeHistoryList != null) {
      data['Table'] = this.tradeHistoryList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Table {
  int? totalcount;
  int? orderId;
  String? market;
  String? symbol;
  String? direction;
  String? openTime;
  String? closeTime;
  double? entryPrice;
  double? closingPrice;
  double? closedVolume;
  double? commission;
  double? net;
  double? balance;

  Table(
      {this.totalcount,
        this.orderId,
        this.market,
        this.symbol,
        this.direction,
        this.openTime,
        this.closeTime,
        this.entryPrice,
        this.closingPrice,
        this.closedVolume,
        this.commission,
        this.net,
        this.balance});

  Table.fromJson(Map<String, dynamic> json) {
    totalcount = json['Totalcount'];
    orderId = json['OrderId'];
    market = json['Market'];
    symbol = json['Symbol'];
    direction = json['Direction'];
    openTime = json['OpenTime'];
    closeTime = json['CloseTime'];
    entryPrice = json['EntryPrice'];
    closingPrice = json['ClosingPrice'];
    closedVolume = json['ClosedVolume'];
    commission = json['Commission'];
    net = json['Net'];
    balance = json['Balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Totalcount'] = this.totalcount;
    data['OrderId'] = this.orderId;
    data['Market'] = this.market;
    data['Symbol'] = this.symbol;
    data['Direction'] = this.direction;
    data['OpenTime'] = this.openTime;
    data['CloseTime'] = this.closeTime;
    data['EntryPrice'] = this.entryPrice;
    data['ClosingPrice'] = this.closingPrice;
    data['ClosedVolume'] = this.closedVolume;
    data['Commission'] = this.commission;
    data['Net'] = this.net;
    data['Balance'] = this.balance;
    return data;
  }
}
