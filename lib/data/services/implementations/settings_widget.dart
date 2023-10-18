import 'package:freedom/data/services/implementations/request_provider.dart';
import '../../../config.dart';
import '../interfaces/i_request_provider.dart';
import '../interfaces/i_settinngs.dart';

class SettingsWidget implements ISettings {
  late final IRequestProvider _apiService; // dependency injenction

  SettingsWidget() {
    _apiService = RequestProvider(); // dependency injenction
  }

  @override
  Future saveAboutText({ String? url, required model}) {
    // TODO: implement postControllerSave

    try {
      url = Config.baseUrl;
      dynamic response = _apiService.post(url: url, model: model);
      return response;
    } catch (ex) {
      rethrow ;
    }

  }




}
