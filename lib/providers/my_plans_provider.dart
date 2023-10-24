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

class MyPlansProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  ProductSelectionModel apiResult = ProductSelectionModel();

  Future<ProductSelectionModel> getPlansData(BuildContext buildContext) async {
    setLoading(true);
    try {
      IProductSelection productSelection = ProductSelection();
      apiResult = await productSelection.getUserProducts();
      setLoading(false);
      return apiResult;
    } catch (ex) {
      setLoading(false);
      showAlertDialog(
          buildContext: buildContext, title: "Failed", content: ex.toString());

      return ProductSelectionModel();
    }
  }
   TradeHistoryModel? tradeHistoryResponse;
  Future<void> getTradeHistory(BuildContext buildContext) async {
    setLoading(true);
    try {
      ITradeHistory tradeHistory = TradeHistory();
      tradeHistoryResponse = await tradeHistory.getTradesHistory();
      // List<Table>? TradeHistoryList=apiResult.tradeHistoryList;
      setLoading(false);
      // return tradeHistoryResponse;
    } catch (ex) {
      setLoading(false);
      showAlertDialog(
          buildContext: buildContext, title: "Failed", content: ex.toString());

      // return TradeHistoryModel();
    }
  }

  List<Products>? allPlansProductList = [];
  List<Products>? getAllPlans() {
    bool isVisibleSilverAdvertisement,
        isVisibleGoldAdvertisement,
        isVisiblePlatiniumAdvertisement;
    Set<String> allPlansProductCodes, advertisementProductCodes;

    if (Settings.accountTypeId == 1) // standard
    {
      isVisibleSilverAdvertisement = true;
      isVisibleGoldAdvertisement = true;
      isVisiblePlatiniumAdvertisement = true;

      Set<String> allPlansProductCodes = {
        "Standard-Basic",
        "Standard-Advance",
        "Standard-Pro",
      };

      Set<String> advertisementProductCodes = {
        "Silver-Basic",
        "Silver-Advance",
        "Silver-Pro",
      };

      allPlansProductList = apiResult.data?.products
          .where((i) => allPlansProductCodes.contains(i.productCode))
          .toList();

      if (apiResult.data?.userProduct != null) {
        Products? subscribedProduct = allPlansProductList?.firstWhere(
          (product) => product.id == apiResult.data?.userProduct?.id,
        );

        if (subscribedProduct != null) {
          // subscribedProduct.id = true;
        }
      }
    } else if (Settings.accountTypeId == 2) //Silver
    {
      isVisibleSilverAdvertisement = false;
      isVisibleGoldAdvertisement = true;
      isVisiblePlatiniumAdvertisement = true;

      allPlansProductCodes = {"Silver-Basic", "Silver-Advance", "Silver-Pro"};
      advertisementProductCodes = {"Gold-Supreme"};
      allPlansProductList = apiResult.data?.products
          .where((i) => allPlansProductCodes.contains(i.productCode))
          .toList();
      if (apiResult.data?.userProduct != null) {
        Products? subscribedProduct = allPlansProductList?.firstWhere(
          (product) => product.id == apiResult.data?.userProduct?.id,
        );

        if (subscribedProduct != null) {
          // subscribedProduct.id = true;
        }
      }
    } else if (Settings.accountTypeId == 3) //Gold
    {
      isVisibleSilverAdvertisement = false;
      isVisibleGoldAdvertisement = false;
      isVisiblePlatiniumAdvertisement = true;

      advertisementProductCodes = {"Gold-Supreme"};
      allPlansProductList = apiResult.data?.products
          .where((i) => i.productCode == "Gold-Supreme")
          .toList();

      if (apiResult.data?.userProduct != null) {
        Products? subscribedProduct = allPlansProductList?.firstWhere(
          (product) => product.id == apiResult.data?.userProduct?.id,
        );

        if (subscribedProduct != null) {
          // subscribedProduct.id = true;
        }
      }
    } else if (Settings.accountTypeId == 4) //Platinum
    {
      isVisibleSilverAdvertisement = false;
      isVisibleGoldAdvertisement = false;
      isVisiblePlatiniumAdvertisement = false;

      allPlansProductList = apiResult.data?.products
          .where((i) => i.productCode == "Platinum-Elite")
          .toList();

      if (apiResult.data?.userProduct != null) {
        Products? subscribedProduct = allPlansProductList?.firstWhere(
          (product) => product.id == apiResult.data?.userProduct?.id,
        );

        if (subscribedProduct != null) {
          // subscribedProduct.id = true;
        }
      }
    }

    return allPlansProductList;
  }

  Future<void> startTrade(BuildContext buildContext) async {
    int userAccountType = 0;
    // final tradeStatus = apiResult.data?.userStatus as int;
    // final tradeStatus = apiResult.data?.userStatus as TradeStatus;
    final TradeStatus tradeStatus =
        TradeStatus.values[apiResult.data?.userStatus as int];

    switch (tradeStatus) {
      case TradeStatus.paymentBlocked:
        // IsTradeStopped = true;
        showAlertDialog(
            buildContext: buildContext,
            title: "Alert",
            content:
                "Your Trade has been blocked due to missing payments, please pay your invoice(s).");

        break;
      case TradeStatus.tradingBlocked:
        if (userAccountType == 3 || userAccountType == 4) {
          showAlertDialog(
              buildContext: buildContext,
              title: "Alert",
              content:
                  "Your Trade has been blocked due to high drawdown or withdrawal, either you can top up your broker account balance or you can adjust the risk profile.");
        } else {
          showAlertDialog(
              buildContext: buildContext,
              title: "Alert",
              content:
                  "Your trade has been blocked due to high drawdown/withdrawal, please top-up your broker account balance.");
        }
        break;
      case TradeStatus.emergencyStop:
        showAlertDialog(
            buildContext: buildContext,
            title: "Alert",
            content:
                "All the running trades for your account have been stopped due to unusual situation/emergency");

        break;
      /* the following switch is extra only added for removing error and warning

       case TradeStatus.idle:
      case TradeStatus.stopped:
      case TradeStatus.paused:
      case TradeStatus.idleToActive:
      case TradeStatus.deLink:
      case TradeStatus.authorizationInProgress:

    error: The type 'TradeStatus' is not exhaustively matched by the switch cases since it doesn't match 'TradeStatus.idle'. (non_exhaustive_switch_statement at [freedom] lib\providers\my_plans_provider.dart:59)*/
      case TradeStatus.active:
      case TradeStatus.idle:
      case TradeStatus.stopped:
      case TradeStatus.paused:
      case TradeStatus.idleToActive:
      case TradeStatus.deLink:
      case TradeStatus.authorizationInProgress:
        break;
    }
    if (!([
      TradeStatus.active,
      TradeStatus.paymentBlocked,
      TradeStatus.tradingBlocked,
      TradeStatus.emergencyStop
    ].contains(TradeStatus.values[apiResult.data?.userStatus as int]))) {
      final model = PostTradeStatusModel()
        ..userId = Settings.userUniqueId
        ..currentStatus = apiResult.data?.userStatus
        ..newStatus = TradeStatus.active.index;

      ProductSelectionModel productsModel =
          await _performTradeStatusChange(model);

      // if (response.statusCode == 200) {
      if (TradeStatus.values[productsModel.data?.userProduct?.status as int] ==
          TradeStatus.active) {
        // API call was successful
        showDialog(
          context: buildContext,
          builder: (BuildContext context) {
            return CongratsDistributorPopup(
                isSuccess: true,
                title: StringCons.tradeStartPopupTitle,
                description: StringCons.tradeStartPopupDesc);
            // return ResultDialog(isSuccess: isSuccess);
          },
        );
      } else {
        // API call failed
        showDialog(
          context: buildContext,
          builder: (BuildContext context) {
            return CongratsDistributorPopup(
                isSuccess: false,
                title: StringCons.failedPopupTitle,
                description: StringCons.failedPopupDesc);
            // return ResultDialog(isSuccess: isSuccess);
          },
        );
      }
    }
  }

  Future<void> pauseTrade(BuildContext buildContext) async {
    final tradeStatus = apiResult.data?.userStatus as int;
    if (!([
      TradeStatus.idle,
      TradeStatus.stopped,
      TradeStatus.paused,
      TradeStatus.paymentBlocked,
      TradeStatus.tradingBlocked,
      TradeStatus.emergencyStop
    ].contains(TradeStatus.values[tradeStatus]))) {
      isCheckboxChecked = false;
      showDialog(
        context: buildContext,
        builder: (BuildContext context) {
          return CustomDialog(
              callbackBtnDone: () {
                // callbackPauseTrade(context);
                callbackPauseTrade(context); // working as expected
                // pauseTrade(context);
              },
              // callbackBtnDone: callbackPauseTrade,
              type: StringCons.disclaimer,
              title: StringCons.pauseTradePopupTitle,
              checkBoxText: StringCons.pauseTradeCheckbox);

          // Your custom dialog widget
        },
      );
    }
  }

  Future<void> callbackPauseTrade(BuildContext context) async {
    try {
      // Store the context for later use
      setLoading(true);

      final model = PostTradeStatusModel()
        ..userId = Settings.userUniqueId
        ..currentStatus = apiResult.data?.userStatus
        ..newStatus = TradeStatus.paused.index;

      ProductSelectionModel productsModel =
          await _performTradeStatusChange(model);

      if (productsModel.data?.userStatus == TradeStatus.paused.index) {
        // API call was successful
        Navigator.of(context).pop(); // Close the confirmation dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CongratsDistributorPopup(
                isSuccess: true,
                title: StringCons.tradePausedPopupTitle,
                description: StringCons.tradePausedPopupDesc);
            // return ResultDialog(isSuccess: isSuccess);
          },
        );
      } else {
        // API call failed
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CongratsDistributorPopup(
                isSuccess: false,
                title: StringCons.failedPopupTitle,
                description: StringCons.failedPopupDesc);
            // return ResultDialog(isSuccess: isSuccess);
          },
        );
      }
    } catch (error) {
      // Handle any exceptions
      // API call failed
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CongratsDistributorPopup(
              isSuccess: false,
              title: StringCons.failedPopupTitle,
              description: StringCons.failedPopupDesc);
          // return ResultDialog(isSuccess: isSuccess);
        },
      );
    } finally {
      setLoading(false);
    }
  }

  Future<void> stopTrade(BuildContext buildContext) async {
    final tradeStatus = apiResult.data?.userStatus as int;

    if (!([
      TradeStatus.idle,
      TradeStatus.stopped,
      TradeStatus.paymentBlocked,
      TradeStatus.tradingBlocked,
      TradeStatus.emergencyStop
    ].contains(TradeStatus.values[tradeStatus]))) {
      isCheckboxChecked = false;
      showDialog(
        context: buildContext,
        builder: (BuildContext context) {
          return CustomDialog(
              callbackBtnDone: () {
                callbackStopTrade(context);
              },
              type: StringCons.disclaimer,
              title: StringCons.stopTradePopupTitle,
              checkBoxText: StringCons.stopTradeCheckbox);

          // Your custom dialog widget
        },
      );
    }
  }

  Future<void> callbackStopTrade(BuildContext context) async {
    try {
      // Store the context for later use
      setLoading(true);

      final model = PostTradeStatusModel()
        ..userId = Settings.userUniqueId
        ..currentStatus = apiResult.data?.userStatus
        ..newStatus = TradeStatus.stopped.index;

      ProductSelectionModel productsModel =
          await _performTradeStatusChange(model);

      if (productsModel.data?.userStatus == TradeStatus.stopped.index) {
        // API call was successful
        Navigator.of(context).pop(); // Close the confirmation dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CongratsDistributorPopup(
                isSuccess: true,
                title: StringCons.tradeStopPopupTitle,
                description: StringCons.tradeStopPopupDesc);
            // return ResultDialog(isSuccess: isSuccess);
          },
        );
      } else {
        // API call failed
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CongratsDistributorPopup(
                isSuccess: false,
                title: StringCons.failedPopupTitle,
                description: StringCons.failedPopupDesc);
            // return ResultDialog(isSuccess: isSuccess);
          },
        );
      }
    } catch (error) {
      // Handle any exceptions
      // API call failed
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CongratsDistributorPopup(
              isSuccess: false,
              title: StringCons.failedPopupTitle,
              description: StringCons.failedPopupDesc);
          // return ResultDialog(isSuccess: isSuccess);
        },
      );
    } finally {
      setLoading(false);
    }
  }

  Future<void> subscribeNowBtn(
      {required BuildContext context, required int id}) async {
    try {
      if (id == apiResult.data?.userProduct?.id) return; // already subscribed

      Products? data = allPlansProductList?.firstWhere((item) => item.id == id);

      // Store the context for later use
      setLoading(true);

      if (data != null) {
        if ((apiResult.data?.balance != null ) &&
            (apiResult.data!.balance! < data.minimumDeposit)) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const CongratsDistributorPopup(
                  isSuccess: false,
                  title: "Low balance",
                  description: "Popup balance");
              // return ResultDialog(isSuccess: isSuccess);
            },
          );

          return;
        }

        // double percentBalance =
        //     (apiResult.data?.balance ?? 0.0 * data.lowMinRiskPercentage) /
        //         100;

        double percentBalance =
            (apiResult.data!.balance! * (data.lowMinRiskMinPercentage as int)) /
                100;

        final model = ControllerAndSubscribeModel()
          ..userId = Settings.userUniqueId
          ..productId = data.id
          ..accountBalance = apiResult.data?.balance
          ..lowMinRiskBalance = percentBalance
          ..lowMinRiskPercentage = data.lowMinRiskMinPercentage
          ..lowMinRiskRemainingBalance = data.lowMinRiskRemainingBalance;
        ProductSelectionModel productsModel =
            await postControllerSaveAndSubscribe(model);
        apiResult = productsModel;

        if (data.id == productsModel.data?.userProduct?.id) {
          // API call was successful
          Navigator.of(context).pop(); // Close the confirmation dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CongratsDistributorPopup(
                  isSuccess: true,
                  title: StringCons.successSubscribedTitle,
                  description: StringCons.successSubscribedPopupDesc);
              // return ResultDialog(isSuccess: isSuccess);
            },
          );
        } else {
          // API call failed
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CongratsDistributorPopup(
                  isSuccess: false,
                  title: StringCons.successSubscribedTitle,
                  description: StringCons.successSubscribedPopupDesc);
              // return ResultDialog(isSuccess: isSuccess);
            },
          );
        }
      }
    } catch (error) {
      // Handle any exceptions
      // API call failed
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CongratsDistributorPopup(
              isSuccess: false,
              title: StringCons.failedPopupTitle,
              description: StringCons.failedPopupDesc);
          // return ResultDialog(isSuccess: isSuccess);
        },
      );
    } finally {
      setLoading(false);
    }
  }

  Future<ProductSelectionModel> _performTradeStatusChange(dynamic model) async {
    setLoading(true);
    IProductSelection productSelection = ProductSelection();

    ProductSelectionModel changeTradeStatusApiResult =
        await productSelection.postChangeTradeStatus(model: model);
    apiResult = changeTradeStatusApiResult;
    setLoading(false);
    return changeTradeStatusApiResult;
  }

  Future<ProductSelectionModel> postControllerSaveAndSubscribe(
      dynamic model) async {
    setLoading(true);
    IProductSelection productSelection = ProductSelection();

    ProductSelectionModel changeTradeStatusApiResult =
        await productSelection.postControllerSaveAndSubscribe(model: model);
    apiResult = changeTradeStatusApiResult;
    setLoading(false);
    return changeTradeStatusApiResult;
  }

  Widget getAdvertisement({required bool isDarkMode}) {
    Products? advertisemt;
    if (Settings.accountTypeId == 1) // Standard = 1,
    {
      switch (apiResult.data?.userProduct?.productCode) {
        case "Standard-Basic":
          advertisemt = apiResult.data?.products
              .where((p) => p.productCode == "Standard-Advance")
              .first;
          break;
        case "Standard-Advance":
          advertisemt = apiResult.data?.products
              .where((p) => p.productCode == "Standard-Pro")
              .first;
          break;
        case "Standard-Pro":
          return const MyPlanSilverAd();

        // break;
      }
    } else if (Settings.accountTypeId == 2) //    Silver = 2,
    {
      switch (apiResult.data?.userProduct?.productCode) {
        case "Silver-Basic":
          advertisemt = apiResult.data?.products
              .where((p) => p.productCode == "Silver-Advance")
              .first;
          break;
        case "Silver-Advance":
          advertisemt = apiResult.data?.products
              .where((p) => p.productCode == "Silver-Pro")
              .first;
          break;
        case "Silver-Pro":
          advertisemt = apiResult.data?.products
              .where((p) => p.productCode == "Gold-Supreme")
              .first;

          break;
      }
    } else if (Settings.accountTypeId == 3) //     Gold = 3,,
    {
      advertisemt = apiResult.data?.products
          .where((p) => p.productCode == "Platinum-Elite")
          .first;
    }

    if (advertisemt != null) {
      return MyPlanAd(
          isVisibleSubscribeBtn: false,
          btnDecoration: advertisementBtnDecoration(
              productCode: advertisemt.productCode ?? ''),
          iconDecoration: getProductIconDecoration(
              productCode: advertisemt.productCode ?? ''),
          // backgroundImgPath: themeP.isDarkMode ? ImgP.standardD : ImgP.standardL,
          backgroundImgPath: getProductBackgroundImage(
              isDarkMode: isDarkMode, productCode: advertisemt.productCode),
          planIconPath: getProductIcon(productCode: advertisemt.productCode),
          investmentAmount: advertisemt.minimumDeposit,
          planName: advertisemt.name ?? '',
          riskProfile: advertisemt.riskProfile ?? 0,
          vpsClass: advertisemt.vpsclass ?? 0,
          period: 12,
          annualROI: advertisemt.annualExpectedRoi ?? 0,
          blurRowColor: getBlurRowBackgroundColorForAd(
              productCode: advertisemt.productCode ?? '',
              isDarkMode: isDarkMode));
    } else {
      return Container();
    }
  }

  void showAlertDialog(
      {required BuildContext buildContext,
      required String title,
      required String content}) {
    var baseDialog = CustomAlertDialog(
        title: title,
        content: content,
        yes: "Ok",
        );
    showDialog(
        context: buildContext, builder: (BuildContext context) => baseDialog);
  }

  String formatDouble(double value) =>
      value.toStringAsFixed(2).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (match) => '${match.group(1)},');

  Decoration getDecorationForTradeStatus(int status) {
    var myEnum = TradeStatus.values[status]; // get some assigned enum instance
    // type and empty switch
    switch (myEnum) {
      case TradeStatus.idle:
        return AppStyles.getCustomDecorationForTradeStatus(AppC.idle);
      case TradeStatus.active:
        return AppStyles.getCustomDecorationForTradeStatus(AppC.running);
      case TradeStatus.stopped:
        return AppStyles.getCustomDecorationForTradeStatus(AppC.stopped);
      case TradeStatus.paused:
        return AppStyles.getCustomDecorationForTradeStatus(AppC.paused);
      case TradeStatus.paymentBlocked:
        return AppStyles.getCustomDecorationForTradeStatus(AppC.paymentBlocked);
      case TradeStatus.tradingBlocked:
        return AppStyles.getCustomDecorationForTradeStatus(AppC.tradingBlocked);
      case TradeStatus.emergencyStop:
        return AppStyles.getCustomDecorationForTradeStatus(AppC.emergencyStop);
      default:
        return AppStyles.getCustomDecorationForTradeStatus(
            AppC.white); // Handle the default case if needed
    }
  }

  String getProductBackgroundImage(
      {String? productCode, required bool isDarkMode}) {
    final productImageMap = {
      "Standard-Basic": isDarkMode ? ImgP.standardD : ImgP.standardL,
      "Standard-Advance": isDarkMode ? ImgP.standardD : ImgP.standardL,
      "Standard-Pro": isDarkMode ? ImgP.standardD : ImgP.standardL,
      "Silver-Basic": isDarkMode ? ImgP.silverD : ImgP.silverL,
      "Silver-Advance": isDarkMode ? ImgP.silverD : ImgP.silverL,
      "Silver-Pro": isDarkMode ? ImgP.silverD : ImgP.silverL,
      "Gold-Supreme": isDarkMode ? ImgP.goldD : ImgP.goldL,
      "Platinum-Elite": isDarkMode ? ImgP.platiniumD : ImgP.platiniumL,
    };

    return productImageMap[productCode] ??
        ''; // Return the mapped image path or an empty string for the default case
  }
  String getAdvertisementProductBackgroundImage(
      {String? productCode, required bool isDarkMode}) {
    final productImageMap = {
     /* "Standard-Basic": isDarkMode ? ImgP.standardD : ImgP.standardL,
      "Standard-Advance": isDarkMode ? ImgP.standardD : ImgP.standardL,
      "Standard-Pro": isDarkMode ? ImgP.standardD : ImgP.standardL,*/
      "Silver-Basic": isDarkMode ? ImgP.silverAdProductDark : ImgP.silverAdProductLight,
      "Silver-Advance": isDarkMode ? ImgP.silverAdProductDark : ImgP.silverAdProductLight,
      "Silver-Pro": isDarkMode ? ImgP.silverAdProductDark : ImgP.silverAdProductLight,
      "Gold-Supreme": isDarkMode ? ImgP.goldAdProductDark : ImgP.goldAdProductLight,
      "Platinum-Elite": isDarkMode ? ImgP.platinumAdProductDark : ImgP.platinumAdProductLight,
    };

    return productImageMap[productCode] ??
        ''; // Return the mapped image path or an empty string for the default case
  }
  String getAdvertisementBackgroundImage(
      {String? productCode, required bool isDarkMode}) {
    final productImageMap = {
  /*    "Standard-Basic": isDarkMode ? ImgP.standardD : ImgP.standardL,
      "Standard-Advance": isDarkMode ? ImgP.standardD : ImgP.standardL,
      "Standard-Pro": isDarkMode ? ImgP.standardD : ImgP.standardL,*/
      "Silver-Basic": isDarkMode ? ImgP.silverAdDark : ImgP.silverAdLight,
      "Silver-Advance": isDarkMode ? ImgP.silverAdDark : ImgP.silverAdLight,
      "Silver-Pro": isDarkMode ? ImgP.silverAdDark : ImgP.silverAdLight,
      "Gold-Supreme": isDarkMode ? ImgP.goldAdDark : ImgP.goldAdLight,
      "Platinum-Elite": isDarkMode ? ImgP.platinumAdDark : ImgP.platinumAdLight,
    };

    return productImageMap[productCode] ??
        ''; // Return the mapped image path or an empty string for the default case
  }

  String getProductIcon({String? productCode}) {
    final productImageMap = {
      "Standard-Basic": 'images/StandardIcon.png',
      "Standard-Advance": 'images/StandardIcon.png',
      "Standard-Pro": 'images/StandardIcon.png',
      "Silver-Basic": 'images/SilverBasicIcon.png',
      "Silver-Advance": 'images/SilverAdvanceIcon.png',
      "Silver-Pro": 'images/SilverProIcon.png',
      "Gold-Supreme": 'images/GoldIcon.png',
      "Platinum-Elite": 'images/PlatiniumIcon.png',
    };

    return productImageMap[productCode] ??
        ''; // Return the mapped image path or an empty string for the default case
  }

  Decoration getProductIconDecoration({required String productCode}) {
    final productIconBackgroundColorMap = {
      "Standard-Basic": AppStyles.getCustomProductIconBackground(
          color: AppC.standardPlanIconColor, isPlanStandard: true),
      "Standard-Advance": AppStyles.getCustomProductIconBackground(
          color: AppC.standardPlanIconColor, isPlanStandard: true),
      "Standard-Pro": AppStyles.getCustomProductIconBackground(
          color: AppC.standardPlanIconColor, isPlanStandard: true),
      "Silver-Basic": AppStyles.getCustomProductIconBackground(
          color: AppC.silverBtnBackground),
      "Silver-Advance": AppStyles.getCustomProductIconBackground(
          color: AppC.silverBtnBackground),
      "Silver-Pro": AppStyles.getCustomProductIconBackground(
          color: AppC.silverBtnBackground),
      "Gold-Supreme":
          AppStyles.getCustomProductIconBackground(color: AppC.goldColor),
      "Platinum-Elite":
          AppStyles.getCustomProductIconBackground(color: AppC.platiniumColor),
    };

    return productIconBackgroundColorMap[productCode]
        as Decoration; // Return the mapped color
  }

  Decoration advertisementBtnDecoration({required String productCode}) {
    final productIconBackgroundColorMap = {
      "Standard-Basic": AppStyles.setAdvertisementBtnDecoration(
          color: AppC.standardPlanIconColor, isPlanStandard: true),
      "Standard-Advance": AppStyles.setAdvertisementBtnDecoration(
          color: AppC.standardPlanIconColor, isPlanStandard: true),
      "Standard-Pro": AppStyles.setAdvertisementBtnDecoration(
          color: AppC.standardPlanIconColor, isPlanStandard: true),
      "Silver-Basic": AppStyles.setAdvertisementBtnDecoration(
          color: AppC.silverBtnBackground),
      "Silver-Advance": AppStyles.setAdvertisementBtnDecoration(
          color: AppC.silverBtnBackground),
      "Silver-Pro": AppStyles.setAdvertisementBtnDecoration(
          color: AppC.silverBtnBackground),
      "Gold-Supreme":
          AppStyles.setAdvertisementBtnDecoration(color: AppC.goldColor),
      "Platinum-Elite":
          AppStyles.setAdvertisementBtnDecoration(color: AppC.platiniumColor),
    };

    return productIconBackgroundColorMap[productCode]
        as Decoration; // Return the mapped color
  }

  Color getBlurRowBackgroundColorForAd(
      {required String productCode, required bool isDarkMode}) {
    final productIconBackgroundColorMap = {
      "Standard-Basic": isDarkMode
          ? AppC.standardAdD.withOpacity(1)
          : AppC.standardAdL.withOpacity(1),
      "Standard-Advance": isDarkMode
          ? AppC.standardAdD.withOpacity(1)
          : AppC.standardAdL.withOpacity(1),
      "Standard-Pro": isDarkMode
          ? AppC.standardAdD.withOpacity(1)
          : AppC.standardAdL.withOpacity(1),
      "Silver-Basic": isDarkMode
          ? AppC.silverAdD.withOpacity(1)
          : AppC.silverAdL.withOpacity(1),
      "Silver-Advance": isDarkMode
          ? AppC.silverAdD.withOpacity(1)
          : AppC.silverAdL.withOpacity(1),
      "Silver-Pro": isDarkMode
          ? AppC.silverAdD.withOpacity(1)
          : AppC.silverAdL.withOpacity(1),
      "Gold-Supreme": isDarkMode
          ? AppC.goldAdD.withOpacity(0.3)
          : AppC.goldAdL.withOpacity(1),
      "Platinum-Elite": isDarkMode
          ? AppC.platAdD.withOpacity(0.1)
          : AppC.platAdL.withOpacity(0.6),
    };

    return productIconBackgroundColorMap[productCode] ??
        Colors.white; // Return the mapped color
  }

  int _selectedTabIndex = 0;

  int get selectedTabIndex => _selectedTabIndex;

  set selectedTabIndex(int value) {
    _selectedTabIndex = value;
    notifyListeners();
  }

  void setTab(int index) {
    selectedTabIndex = index;
    if (index == 1) // all Plans
    {
      getAllPlans();
    }

    // selectedTabIndex(index);
  }

  // testing start

  bool _isCheckboxChecked = false;

  set isCheckboxChecked(bool value) {
    _isCheckboxChecked = value;
  }

  bool get isCheckboxChecked => _isCheckboxChecked;

  void toggleCheckBox() {
    _isCheckboxChecked = !_isCheckboxChecked; // testing
    notifyListeners();
  }

  // testing End
}
