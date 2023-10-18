import '../../../models/myPlans/api_model/product_selection_model.dart';

abstract class IProductSelection{


  Future<ProductSelectionModel> getUserProducts({String? url});
  Future<dynamic> getUserPendingInvoices({String? url});
  Future<dynamic> postSaveMarkets({ String? url,required dynamic model});
  Future<ProductSelectionModel> postChangeTradeStatus({ String? url,required dynamic model});
  Future<ProductSelectionModel> postControllerSaveAndSubscribe({ String? url,required dynamic model});

  // Future<dynamic> put({required String url,required dynamic model});

}

// How to consume these Api

/*
IProductSelection productSelection = ProductSelection();

var getUserProductsApiResult = await productSelection.getUserProducts();

MarketModel marketsModel = MarketModel(
  marketId: 0,
  market: "",
  active: false,

  // marketId : um.marketId,
  // market : um.market,
  // active : um.active,
);
var saveMarketsApiResult =
    await productSelection.postSaveMarkets(model: marketsModel);

PostTradeStatusModel startTradeModel = PostTradeStatusModel(
userId: Settings.userUniqueId,
currentStatus: 1,
newStatus: TradeStatus.active.index,
);
var startTradeApiResult =
await productSelection.postChangeTradeStatus(model: startTradeModel);

PostTradeStatusModel pauseTradeModel = PostTradeStatusModel(
userId: Settings.userUniqueId,
currentStatus: 1,
newStatus: TradeStatus.paused.index,
);
var pauseTradeApiResult =
await productSelection.postChangeTradeStatus(model: pauseTradeModel);

PostTradeStatusModel stopTradeModel = PostTradeStatusModel(
userId: Settings.userUniqueId,
currentStatus: 1,
newStatus: TradeStatus.stopped.index,
);
var stopTradeApiResult =
await productSelection.postChangeTradeStatus(model: stopTradeModel);

ControllerAndSubscribeModel saveControllerAndSubscribeModel = ControllerAndSubscribeModel(
userId: Settings.userUniqueId,
productId: 54,
// productId : myPlanUserCurrentPlanModel.id,
accountBalance: 100,
// accountBalance = userBalance,
lowMinRiskBalance: 10,
// lowMinRiskBalance : percentbalence,
lowMinRiskPercentage: 12,
// lowMinRiskpercentage : MyPlanSliderValue,
lowMinRiskRemainingBalance: 133,
// lowMinRiskRemainingBalance : responseFromApi.data.userProduct.lowMinRiskRemainingBalance,
);
var saveControllerAndSubscribeApiResult =
await productSelection.postControllerSaveAndSubscribe(model: saveControllerAndSubscribeModel);
*/
