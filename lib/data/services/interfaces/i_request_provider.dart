
abstract class IRequestProvider{
  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> getPostApiResponse(String url, dynamic data);

  Future<dynamic> get({required String url});
  Future<dynamic> delete({required String url});
  Future<dynamic> post({required String url,required dynamic model});

  Future<dynamic> put({required String url,required dynamic model});

}