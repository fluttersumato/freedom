import '../data/services/implementations/request_provider.dart';
import '../data/services/interfaces/i_request_provider.dart';
import '../res/app_urls.dart';

class AuthRepository {
  // final IRequestProvider _apiService;
  late final IRequestProvider _apiService; // 2nd way part1

/*  // alternate Way
  IRequestProvider userRepository() {
  return RequestProvider();
  }*/

  // IRequestProvider userRepository() => RequestProvider(); // 1st way

  // AuthRepository(IRequestProvider apiService){
  AuthRepository(){
    _apiService = RequestProvider(); // 2nd way part2
  }
  // final IRequestProvider _apiService = RequestProvider();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      // dynamic response = userRepository().getPostApiResponse(AppUrl.loginUrl, data);
      dynamic response = _apiService.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (ex) {
      rethrow; 
      // ex;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          _apiService.getPostApiResponse(AppUrl.registerUrl, data);
      return response;
    } catch (ex) {
      rethrow;
      // throw ex;
    }
  }
}
