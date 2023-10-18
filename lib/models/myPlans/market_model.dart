/// marketId : 1
/// market : "Forex"
/// active : true

class MarketModel {
  MarketModel({
      this.marketId, 
      this.market, 
      this.active,});

  MarketModel.fromJson(dynamic json) {
    marketId = json['marketId'];
    market = json['market'];
    active = json['active'];
  }
  int? marketId;
  String? market;
  bool? active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['marketId'] = marketId;
    map['market'] = market;
    map['active'] = active;
    return map;
  }

}