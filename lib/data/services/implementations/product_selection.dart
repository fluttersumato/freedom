import 'package:freedom/data/services/implementations/request_provider.dart';
import '../../../config.dart';
import '../../../models/myPlans/api_model/product_selection_model.dart';
import '../interfaces/i_product_selection.dart';
import '../interfaces/i_request_provider.dart';
import '../settings.dart';

class ProductSelection implements IProductSelection {
  late final IRequestProvider _apiService; // dependency injenction

  ProductSelection() {
    _apiService = RequestProvider(); // dependency injenction
  }

  @override
  Future<ProductSelectionModel> getUserProducts({String? url}) async {
    // TODO: implement getUserProducts
    try {
      url =
          "${Config.baseUrlForPlans}/api/FreedomMyPlan/${Settings.userUniqueId}";
      dynamic jsonData = await _apiService.get(url: url);
      // Convert JSON data to a ProductsModel model
      ProductSelectionModel productsModel = ProductSelectionModel.fromJson(jsonData);
      return productsModel;
    } catch (ex) {

       rethrow;
    }
  }

  @override
  Future getUserPendingInvoices({String? url}) {
    // TODO: implement getUserProducts
    try {
      url = "${Config.baseUrlForData}/unpaidbrokerdepositinvoiceexists";
      dynamic response = _apiService.get(url: url);
      return response;
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<ProductSelectionModel> postControllerSaveAndSubscribe({String? url, required model}) async {
    // TODO: implement postControllerSave

    try {
      // String apiUrl = Config.baseUrlForUpdateUserTradeStatus;
      url = Config.baseUrlForSubcribePlan;
      dynamic jsonData = await _apiService.post(url: url, model: model);
      ProductSelectionModel productsModel = ProductSelectionModel.fromJson(jsonData);
      return productsModel;
    } catch (ex) {
      rethrow;
      // ex;
    }
  }

  @override
  Future postSaveMarkets({String? url, required model}) {
    // TODO: implement postSaveMarkets
    try {
      String apiUrl = Config.baseUrlForUpdateUserMarkets;

      dynamic response = _apiService.post(url: apiUrl, model: model);
      return response;
    } catch (ex) {
      rethrow;
      // ex;
    }
  }

  @override
  Future<ProductSelectionModel> postChangeTradeStatus({String? url, required model}) async {
    // TODO: implement postStoppedTrade
    try {

      url = Config.baseUrlForUpdateUserTradeStatus;
      dynamic jsonData = await _apiService.post(url: url, model: model);
      // Convert JSON data to a ProductSelectionModel model
      ProductSelectionModel productsModel = ProductSelectionModel.fromJson(jsonData);
      return productsModel;

    } catch (ex) {
      rethrow;
      // ex;
    }
  }
}
