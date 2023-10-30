import 'dart:convert';
/// responseCode : 1
/// error : null
/// errorDetails : null
/// recordDateTime : "2023-09-22T05:22:22.5137657Z"
/// data : {"userStatus":1,"balance":574.56,"userProduct":{"id":7,"userProductId":577,"accountBalance":818.43,"lowMinRiskPercentage":50,"productCreatedOn":"2023-09-07T10:52:32.367","lowMinRiskBalance":409.22,"lowMinRiskRemainingBalance":409.22,"productCode":"Gold-Supreme","name":"Supreme","color":"Gold   ","currencyId":124,"minimumDeposit":2000.0000,"investmentProtection":0,"annualExpectedRoi":40,"vpsclass":1,"lowMinRiskMaxPercentage":50,"lowMinRiskMinPercentage":12,"status":1,"riskProfile":50,"offSet":22,"riskPctTrade":1.3},"products":[{"id":1,"userProductId":0,"accountBalance":0,"lowMinRiskPercentage":0,"productCreatedOn":null,"lowMinRiskBalance":0,"lowMinRiskRemainingBalance":0,"productCode":"Standard-Basic","name":"Basic","color":"Green  ","currencyId":124,"minimumDeposit":200.0000,"investmentProtection":0,"annualExpectedRoi":8,"vpsclass":3,"lowMinRiskMaxPercentage":0,"lowMinRiskMinPercentage":12,"status":1,"riskProfile":10,"offSet":10,"riskPctTrade":1.3},{"id":2,"userProductId":0,"accountBalance":0,"lowMinRiskPercentage":0,"productCreatedOn":null,"lowMinRiskBalance":0,"lowMinRiskRemainingBalance":0,"productCode":"Standard-Advance","name":"Advance","color":"Blue   ","currencyId":124,"minimumDeposit":300.0000,"investmentProtection":0,"annualExpectedRoi":13,"vpsclass":3,"lowMinRiskMaxPercentage":0,"lowMinRiskMinPercentage":20,"status":1,"riskProfile":20,"offSet":18,"riskPctTrade":1.3},{"id":3,"userProductId":0,"accountBalance":0,"lowMinRiskPercentage":0,"productCreatedOn":null,"lowMinRiskBalance":0,"lowMinRiskRemainingBalance":0,"productCode":"Standard-Pro","name":"Pro","color":"Red    ","currencyId":124,"minimumDeposit":500.0000,"investmentProtection":0,"annualExpectedRoi":18,"vpsclass":3,"lowMinRiskMaxPercentage":0,"lowMinRiskMinPercentage":30,"status":1,"riskProfile":30,"offSet":18,"riskPctTrade":1.3},{"id":4,"userProductId":0,"accountBalance":0,"lowMinRiskPercentage":0,"productCreatedOn":null,"lowMinRiskBalance":0,"lowMinRiskRemainingBalance":0,"productCode":"Silver-Basic","name":"Basic+","color":"Green  ","currencyId":124,"minimumDeposit":300.0000,"investmentProtection":0,"annualExpectedRoi":14,"vpsclass":3,"lowMinRiskMaxPercentage":0,"lowMinRiskMinPercentage":15,"status":1,"riskProfile":15,"offSet":10,"riskPctTrade":1.3},{"id":5,"userProductId":0,"accountBalance":0,"lowMinRiskPercentage":0,"productCreatedOn":null,"lowMinRiskBalance":0,"lowMinRiskRemainingBalance":0,"productCode":"Silver-Advance","name":"Advance+","color":"Teal   ","currencyId":124,"minimumDeposit":500.0000,"investmentProtection":0,"annualExpectedRoi":20,"vpsclass":3,"lowMinRiskMaxPercentage":0,"lowMinRiskMinPercentage":30,"status":1,"riskProfile":30,"offSet":15,"riskPctTrade":1.3},{"id":6,"userProductId":0,"accountBalance":0,"lowMinRiskPercentage":0,"productCreatedOn":null,"lowMinRiskBalance":0,"lowMinRiskRemainingBalance":0,"productCode":"Silver-Pro","name":"Pro+","color":"Orange ","currencyId":124,"minimumDeposit":1000.0000,"investmentProtection":0,"annualExpectedRoi":25,"vpsclass":2,"lowMinRiskMaxPercentage":0,"lowMinRiskMinPercentage":20,"status":1,"riskProfile":40,"offSet":20,"riskPctTrade":1.3},{"id":7,"userProductId":577,"accountBalance":818.43,"lowMinRiskPercentage":50,"productCreatedOn":"2023-09-07T10:52:32.367","lowMinRiskBalance":409.22,"lowMinRiskRemainingBalance":409.22,"productCode":"Gold-Supreme","name":"Supreme","color":"Gold   ","currencyId":124,"minimumDeposit":2000.0000,"investmentProtection":0,"annualExpectedRoi":40,"vpsclass":1,"lowMinRiskMaxPercentage":50,"lowMinRiskMinPercentage":12,"status":1,"riskProfile":50,"offSet":22,"riskPctTrade":1.3},{"id":8,"userProductId":0,"accountBalance":0,"lowMinRiskPercentage":0,"productCreatedOn":null,"lowMinRiskBalance":0,"lowMinRiskRemainingBalance":0,"productCode":"Platinum-Elite","name":"Elite","color":"Purple ","currencyId":124,"minimumDeposit":2000.0000,"investmentProtection":0,"annualExpectedRoi":50,"vpsclass":1,"lowMinRiskMaxPercentage":50,"lowMinRiskMinPercentage":12,"status":1,"riskProfile":50,"offSet":16,"riskPctTrade":1.3}],"markets":[{"marketId":1,"market":"Forex","active":true},{"marketId":2,"market":"Crypto","active":true},{"marketId":3,"market":"Stocks","active":true},{"marketId":4,"market":"Indices","active":true},{"marketId":5,"market":"Commodities","active":true}]}

ProductSelectionModel productSelectionModelFromJson(String str) => ProductSelectionModel.fromJson(json.decode(str));
String productSelectionModelToJson(ProductSelectionModel data) => json.encode(data.toJson());
class ProductSelectionModel {
  ProductSelectionModel({
      this.responseCode, 
      this.error, 
      this.errorDetails, 
      this.recordDateTime, 
      this.data,});

  ProductSelectionModel.fromJson(dynamic json) {
    responseCode = json['responseCode'];
    error = json['error'];
    errorDetails = json['errorDetails'];
    recordDateTime = json['recordDateTime'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? responseCode;
  dynamic error;
  dynamic errorDetails;
  String? recordDateTime;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['responseCode'] = responseCode;
    map['error'] = error;
    map['errorDetails'] = errorDetails;
    map['recordDateTime'] = recordDateTime;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// userStatus : 1
/// balance : 574.56
/// userProduct : {"id":7,"userProductId":577,"accountBalance":818.43,"lowMinRiskPercentage":50,"productCreatedOn":"2023-09-07T10:52:32.367","lowMinRiskBalance":409.22,"lowMinRiskRemainingBalance":409.22,"productCode":"Gold-Supreme","name":"Supreme","color":"Gold   ","currencyId":124,"minimumDeposit":2000.0000,"investmentProtection":0,"annualExpectedRoi":40,"vpsclass":1,"lowMinRiskMaxPercentage":50,"lowMinRiskMinPercentage":12,"status":1,"riskProfile":50,"offSet":22,"riskPctTrade":1.3}
/// products : [{"id":1,"userProductId":0,"accountBalance":0,"lowMinRiskPercentage":0,"productCreatedOn":null,"lowMinRiskBalance":0,"lowMinRiskRemainingBalance":0,"productCode":"Standard-Basic","name":"Basic","color":"Green  ","currencyId":124,"minimumDeposit":200.0000,"investmentProtection":0,"annualExpectedRoi":8,"vpsclass":3,"lowMinRiskMaxPercentage":0,"lowMinRiskMinPercentage":12,"status":1,"riskProfile":10,"offSet":10,"riskPctTrade":1.3},{"id":2,"userProductId":0,"accountBalance":0,"lowMinRiskPercentage":0,"productCreatedOn":null,"lowMinRiskBalance":0,"lowMinRiskRemainingBalance":0,"productCode":"Standard-Advance","name":"Advance","color":"Blue   ","currencyId":124,"minimumDeposit":300.0000,"investmentProtection":0,"annualExpectedRoi":13,"vpsclass":3,"lowMinRiskMaxPercentage":0,"lowMinRiskMinPercentage":20,"status":1,"riskProfile":20,"offSet":18,"riskPctTrade":1.3},{"id":3,"userProductId":0,"accountBalance":0,"lowMinRiskPercentage":0,"productCreatedOn":null,"lowMinRiskBalance":0,"lowMinRiskRemainingBalance":0,"productCode":"Standard-Pro","name":"Pro","color":"Red    ","currencyId":124,"minimumDeposit":500.0000,"investmentProtection":0,"annualExpectedRoi":18,"vpsclass":3,"lowMinRiskMaxPercentage":0,"lowMinRiskMinPercentage":30,"status":1,"riskProfile":30,"offSet":18,"riskPctTrade":1.3},{"id":4,"userProductId":0,"accountBalance":0,"lowMinRiskPercentage":0,"productCreatedOn":null,"lowMinRiskBalance":0,"lowMinRiskRemainingBalance":0,"productCode":"Silver-Basic","name":"Basic+","color":"Green  ","currencyId":124,"minimumDeposit":300.0000,"investmentProtection":0,"annualExpectedRoi":14,"vpsclass":3,"lowMinRiskMaxPercentage":0,"lowMinRiskMinPercentage":15,"status":1,"riskProfile":15,"offSet":10,"riskPctTrade":1.3},{"id":5,"userProductId":0,"accountBalance":0,"lowMinRiskPercentage":0,"productCreatedOn":null,"lowMinRiskBalance":0,"lowMinRiskRemainingBalance":0,"productCode":"Silver-Advance","name":"Advance+","color":"Teal   ","currencyId":124,"minimumDeposit":500.0000,"investmentProtection":0,"annualExpectedRoi":20,"vpsclass":3,"lowMinRiskMaxPercentage":0,"lowMinRiskMinPercentage":30,"status":1,"riskProfile":30,"offSet":15,"riskPctTrade":1.3},{"id":6,"userProductId":0,"accountBalance":0,"lowMinRiskPercentage":0,"productCreatedOn":null,"lowMinRiskBalance":0,"lowMinRiskRemainingBalance":0,"productCode":"Silver-Pro","name":"Pro+","color":"Orange ","currencyId":124,"minimumDeposit":1000.0000,"investmentProtection":0,"annualExpectedRoi":25,"vpsclass":2,"lowMinRiskMaxPercentage":0,"lowMinRiskMinPercentage":20,"status":1,"riskProfile":40,"offSet":20,"riskPctTrade":1.3},{"id":7,"userProductId":577,"accountBalance":818.43,"lowMinRiskPercentage":50,"productCreatedOn":"2023-09-07T10:52:32.367","lowMinRiskBalance":409.22,"lowMinRiskRemainingBalance":409.22,"productCode":"Gold-Supreme","name":"Supreme","color":"Gold   ","currencyId":124,"minimumDeposit":2000.0000,"investmentProtection":0,"annualExpectedRoi":40,"vpsclass":1,"lowMinRiskMaxPercentage":50,"lowMinRiskMinPercentage":12,"status":1,"riskProfile":50,"offSet":22,"riskPctTrade":1.3},{"id":8,"userProductId":0,"accountBalance":0,"lowMinRiskPercentage":0,"productCreatedOn":null,"lowMinRiskBalance":0,"lowMinRiskRemainingBalance":0,"productCode":"Platinum-Elite","name":"Elite","color":"Purple ","currencyId":124,"minimumDeposit":2000.0000,"investmentProtection":0,"annualExpectedRoi":50,"vpsclass":1,"lowMinRiskMaxPercentage":50,"lowMinRiskMinPercentage":12,"status":1,"riskProfile":50,"offSet":16,"riskPctTrade":1.3}]
/// markets : [{"marketId":1,"market":"Forex","active":true},{"marketId":2,"market":"Crypto","active":true},{"marketId":3,"market":"Stocks","active":true},{"marketId":4,"market":"Indices","active":true},{"marketId":5,"market":"Commodities","active":true}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.userStatus, 
      this.balance, 
      this.userProduct, 
      required this.products,
      this.markets,});

  Data.fromJson(dynamic json) {
    userStatus = json['userStatus'];
    balance = json['balance']?.toDouble();
    userProduct = json['userProduct'] != null ? UserProduct.fromJson(json['userProduct']) : null;
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products.add(Products.fromJson(v));
      });
    }
    if (json['markets'] != null) {
      markets = [];
      json['markets'].forEach((v) {
        markets?.add(Markets.fromJson(v));
      });
    }
  }
  int? userStatus;
  double? balance;
  UserProduct? userProduct;
  late List<Products> products;
  List<Markets>? markets;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userStatus'] = userStatus;
    map['balance'] = balance;
    if (userProduct != null) {
      map['userProduct'] = userProduct?.toJson();
    }
    map['products'] = products.map((v) => v.toJson()).toList();
      if (markets != null) {
      map['markets'] = markets?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// marketId : 1
/// market : "Forex"
/// active : true

Markets marketsFromJson(String str) => Markets.fromJson(json.decode(str));
String marketsToJson(Markets data) => json.encode(data.toJson());
class Markets {
  Markets({
      this.marketId, 
      this.market, 
      this.active,});

  Markets.fromJson(dynamic json) {
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

/// id : 1
/// userProductId : 0
/// accountBalance : 0
/// lowMinRiskPercentage : 0
/// productCreatedOn : null
/// lowMinRiskBalance : 0
/// lowMinRiskRemainingBalance : 0
/// productCode : "Standard-Basic"
/// name : "Basic"
/// color : "Green  "
/// currencyId : 124
/// minimumDeposit : 200.0000
/// investmentProtection : 0
/// annualExpectedRoi : 8
/// vpsclass : 3
/// lowMinRiskMaxPercentage : 0
/// lowMinRiskMinPercentage : 12
/// status : 1
/// riskProfile : 10
/// offSet : 10
/// riskPctTrade : 1.3

Products productsFromJson(String str) => Products.fromJson(json.decode(str));
String productsToJson(Products data) => json.encode(data.toJson());
class Products {
  Products({
      this.id, 
      this.userProductId, 
      this.accountBalance, 
      this.lowMinRiskPercentage, 
      this.productCreatedOn, 
      this.lowMinRiskBalance, 
      this.lowMinRiskRemainingBalance, 
      this.productCode, 
      this.name, 
      this.color, 
      this.currencyId, 
      required this.minimumDeposit,
      this.investmentProtection, 
      this.annualExpectedRoi, 
      this.vpsclass, 
      this.lowMinRiskMaxPercentage, 
      this.lowMinRiskMinPercentage, 
      this.status, 
      this.riskProfile, 
      this.offSet, 
      this.riskPctTrade,});

  Products.fromJson(dynamic json) {
    id = json['id'];
    userProductId = json['userProductId'];
    // accountBalance = json['accountBalance']  ;
    accountBalance = json['accountBalance']?.toDouble();


    lowMinRiskPercentage = json['lowMinRiskPercentage'];
    productCreatedOn = json['productCreatedOn'];
    // lowMinRiskBalance = json['lowMinRiskBalance'];
    lowMinRiskBalance = json['lowMinRiskBalance']?.toDouble();

    // lowMinRiskRemainingBalance = json['lowMinRiskRemainingBalance'];
    productCode = json['productCode'];
    name = json['name'];
    color = json['color'];
    currencyId = json['currencyId'];
    minimumDeposit = json['minimumDeposit'];
    investmentProtection = json['investmentProtection'];
    annualExpectedRoi = json['annualExpectedRoi'];
    vpsclass = json['vpsclass'];
    lowMinRiskMaxPercentage = json['lowMinRiskMaxPercentage'];
    lowMinRiskMinPercentage = json['lowMinRiskMinPercentage'];
    status = json['status'];
    riskProfile = json['riskProfile'];
    offSet = json['offSet'];
    // riskPctTrade = json['riskPctTrade'];
  }
  int? id;
  int? userProductId;
  double? accountBalance;
  int? lowMinRiskPercentage;
  dynamic productCreatedOn;
  double? lowMinRiskBalance;
  double? lowMinRiskRemainingBalance;
  String? productCode;
  String? name;
  String? color;
  int? currencyId;
  late double minimumDeposit;
  int? investmentProtection;
  int? annualExpectedRoi;
  int? vpsclass;
  int? lowMinRiskMaxPercentage;
  int? lowMinRiskMinPercentage;
  int? status;
  int? riskProfile;
  int? offSet;
  double? riskPctTrade;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userProductId'] = userProductId;
    map['accountBalance'] = accountBalance;
    map['lowMinRiskPercentage'] = lowMinRiskPercentage;
    map['productCreatedOn'] = productCreatedOn;
    map['lowMinRiskBalance'] = lowMinRiskBalance;
    map['lowMinRiskRemainingBalance'] = lowMinRiskRemainingBalance;
    map['productCode'] = productCode;
    map['name'] = name;
    map['color'] = color;
    map['currencyId'] = currencyId;
    map['minimumDeposit'] = minimumDeposit;
    map['investmentProtection'] = investmentProtection;
    map['annualExpectedRoi'] = annualExpectedRoi;
    map['vpsclass'] = vpsclass;
    map['lowMinRiskMaxPercentage'] = lowMinRiskMaxPercentage;
    map['lowMinRiskMinPercentage'] = lowMinRiskMinPercentage;
    map['status'] = status;
    map['riskProfile'] = riskProfile;
    map['offSet'] = offSet;
    map['riskPctTrade'] = riskPctTrade;
    return map;
  }

}

/// id : 7
/// userProductId : 577
/// accountBalance : 818.43
/// lowMinRiskPercentage : 50
/// productCreatedOn : "2023-09-07T10:52:32.367"
/// lowMinRiskBalance : 409.22
/// lowMinRiskRemainingBalance : 409.22
/// productCode : "Gold-Supreme"
/// name : "Supreme"
/// color : "Gold   "
/// currencyId : 124
/// minimumDeposit : 2000.0000
/// investmentProtection : 0
/// annualExpectedRoi : 40
/// vpsclass : 1
/// lowMinRiskMaxPercentage : 50
/// lowMinRiskMinPercentage : 12
/// status : 1
/// riskProfile : 50
/// offSet : 22
/// riskPctTrade : 1.3

UserProduct userProductFromJson(String str) => UserProduct.fromJson(json.decode(str));
String userProductToJson(UserProduct data) => json.encode(data.toJson());
class UserProduct {
  UserProduct({
      this.id, 
      this.userProductId, 
      this.accountBalance, 
      this.lowMinRiskPercentage, 
      this.productCreatedOn, 
      this.lowMinRiskBalance, 
      this.lowMinRiskRemainingBalance, 
      this.productCode, 
      this.name, 
      this.color, 
      this.currencyId, 
      this.minimumDeposit, 
      this.investmentProtection, 
      this.annualExpectedRoi, 
      this.vpsclass, 
      this.lowMinRiskMaxPercentage, 
      this.lowMinRiskMinPercentage, 
      this.status, 
      this.riskProfile, 
      this.offSet, 
      this.riskPctTrade,});

  UserProduct.fromJson(dynamic json) {
    id = json['id'];
    userProductId = json['userProductId'];
    accountBalance = json['accountBalance'];
    lowMinRiskPercentage = json['lowMinRiskPercentage'];
    productCreatedOn = json['productCreatedOn'];
    lowMinRiskBalance = json['lowMinRiskBalance'];
    lowMinRiskRemainingBalance = json['lowMinRiskRemainingBalance'];
    productCode = json['productCode'];
    name = json['name'];
    color = json['color'];
    currencyId = json['currencyId'];
    minimumDeposit = json['minimumDeposit'];
    investmentProtection = json['investmentProtection'];
    annualExpectedRoi = json['annualExpectedRoi'];
    vpsclass = json['vpsclass'];
    lowMinRiskMaxPercentage = json['lowMinRiskMaxPercentage'];
    lowMinRiskMinPercentage = json['lowMinRiskMinPercentage'];
    status = json['status'];
    riskProfile = json['riskProfile'];
    offSet = json['offSet'];
    riskPctTrade = json['riskPctTrade'];
  }
  int? id;
  int? userProductId;
  double? accountBalance;
  int? lowMinRiskPercentage;
  String? productCreatedOn;
  double? lowMinRiskBalance;
  double? lowMinRiskRemainingBalance;
  String? productCode;
  String? name;
  String? color;
  int? currencyId;
  double? minimumDeposit;
  int? investmentProtection;
  int? annualExpectedRoi;
  int? vpsclass;
  int? lowMinRiskMaxPercentage;
  int? lowMinRiskMinPercentage;
  int? status;
  int? riskProfile;
  int? offSet;
  double? riskPctTrade;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userProductId'] = userProductId;
    map['accountBalance'] = accountBalance;
    map['lowMinRiskPercentage'] = lowMinRiskPercentage;
    map['productCreatedOn'] = productCreatedOn;
    map['lowMinRiskBalance'] = lowMinRiskBalance;
    map['lowMinRiskRemainingBalance'] = lowMinRiskRemainingBalance;
    map['productCode'] = productCode;
    map['name'] = name;
    map['color'] = color;
    map['currencyId'] = currencyId;
    map['minimumDeposit'] = minimumDeposit;
    map['investmentProtection'] = investmentProtection;
    map['annualExpectedRoi'] = annualExpectedRoi;
    map['vpsclass'] = vpsclass;
    map['lowMinRiskMaxPercentage'] = lowMinRiskMaxPercentage;
    map['lowMinRiskMinPercentage'] = lowMinRiskMinPercentage;
    map['status'] = status;
    map['riskProfile'] = riskProfile;
    map['offSet'] = offSet;
    map['riskPctTrade'] = riskPctTrade;
    return map;
  }

}