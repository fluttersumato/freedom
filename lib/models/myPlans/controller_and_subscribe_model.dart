class ControllerAndSubscribeModel {
  String? userId;
  int? productId;
  double? accountBalance;
  double? lowMinRiskBalance;
  int? lowMinRiskPercentage;
  double? lowMinRiskRemainingBalance;

  ControllerAndSubscribeModel(
      {this.userId,
        this.productId,
        this.accountBalance,
        this.lowMinRiskBalance,
        this.lowMinRiskPercentage,
        this.lowMinRiskRemainingBalance});

  ControllerAndSubscribeModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId '];
    productId = json['productId'];
    accountBalance = json['accountBalance'];
    lowMinRiskBalance = json['lowMinRiskBalance'];
    lowMinRiskPercentage = json['lowMinRiskPercentage'];
    lowMinRiskRemainingBalance = json['lowMinRiskRemainingBalance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId '] = userId;
    data['productId'] = productId;
    data['accountBalance'] = accountBalance;
    data['lowMinRiskBalance'] = lowMinRiskBalance;
    data['lowMinRiskPercentage'] = lowMinRiskPercentage;
    data['lowMinRiskRemainingBalance'] = lowMinRiskRemainingBalance;
    return data;
  }
}

/*
{
	"userId ": "e12dcab4 - f713 - 4 a5b - b1a7 - 76 d9f6c24913 ",
	"productId": 7,
	"accountBalance": 2482.19,
	"lowMinRiskBalance": 571,
	"lowMinRiskPercentage": 23,
	"lowMinRiskRemainingBalance": 0
}
 */