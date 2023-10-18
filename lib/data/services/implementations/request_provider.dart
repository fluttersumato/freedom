import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constants.dart';
import '../../app_exceptions.dart';
import '../interfaces/i_request_provider.dart';

// class NetworkApiService extends BaseApiService {
class RequestProvider implements IRequestProvider {
  /* String tokenSave =
      "eyJhbGciOiJSUzI1NiIsImtpZCI6Ilg1ZVhrNHh5b2pORnVtMWtsMll0djhkbE5QNC1jNTdkTzZRR1RWQndhTmsiLCJ0eXAiOiJKV1QifQ.eyJvaWQiOiIyYjUxMGUwNy0zNjk5LTRiMTYtODM3NC02ZTNhMTkzM2Q2NjQiLCJzdWIiOiIyYjUxMGUwNy0zNjk5LTRiMTYtODM3NC02ZTNhMTkzM2Q2NjQiLCJuYW1lIjoiRGVubmlzIEZpZWwgUm9oZGUiLCJnaXZlbl9uYW1lIjoiRGVubmlzIEZpZWwiLCJmYW1pbHlfbmFtZSI6IlJvaGRlIiwiZW1haWxzIjpbImRyb0BteWZyZWVkb20ubHRkIl0sIm5vbmNlIjoiNjY3NTdmZWYtZjFiMS00NDBmLWI0MmItNDk3NDU2MjgxNDNhIiwic2NwIjoiVXNlci5SZWFkQWxsIiwiYXpwIjoiMjM1MzA1MmEtNWM2Yi00OTgyLWIwZmQtZTcyNzVlNDIzNGM1IiwidmVyIjoiMS4wIiwiaWF0IjoxNjkyMjAxMTY2LCJhdWQiOiIyMzUzMDUyYS01YzZiLTQ5ODItYjBmZC1lNzI3NWU0MjM0YzUiLCJleHAiOjE2OTIyMDgzNjYsImlzcyI6Imh0dHBzOi8vbXlmcmVlZG9tbHRkLmIyY2xvZ2luLmNvbS81ZTdiZDFmOS1kOTUzLTQ5NWEtOThkNy0yNDc2MzE5NDg0ZjIvdjIuMC8iLCJuYmYiOjE2OTIyMDExNjZ9.mU5TMFEEEkLXbjHUqac_03_2cNBVf_Ev_tNVYCC53Yy7DwdRhC6UQvknX3Qoxv_jZFl7_bRybxS1P6xz9qOWKQKc8nFABromlzjXfMM6aovF1J1gLsVnz9VyOaqaSihD8BOVY1EzMa-sxnmBXFP3X5cUs36Wt1fYTl6JCX-LjSttxV7VrOcrOHdNfFomtcSm4m2jGPd1kx6aj7_HLECns_n1rMoZjITkwP4Rbtk-BWeLiVoQJ1_bKwJQPHZIZwXoSKYqc-0kB1miCHPU94wlXt_OV1Hckthq4wo_wkO552dPhvbugBN7wSsDPDsN-vNHjQ9Nk_KbHcExNyqxjlZVTw";
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('token', tokenSave);*/

  static final _client = http.Client();
  static const Duration _apiTimeOutDuration = Duration(seconds: 20);

  Future<Map<String, String>> createHeadersMap() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // String tokenSave =
    //     "eyJhbGciOiJSUzI1NiIsImtpZCI6Ilg1ZVhrNHh5b2pORnVtMWtsMll0djhkbE5QNC1jNTdkTzZRR1RWQndhTmsiLCJ0eXAiOiJKV1QifQ.eyJvaWQiOiIyYjUxMGUwNy0zNjk5LTRiMTYtODM3NC02ZTNhMTkzM2Q2NjQiLCJzdWIiOiIyYjUxMGUwNy0zNjk5LTRiMTYtODM3NC02ZTNhMTkzM2Q2NjQiLCJuYW1lIjoiRGVubmlzIEZpZWwgUm9oZGUiLCJnaXZlbl9uYW1lIjoiRGVubmlzIEZpZWwiLCJmYW1pbHlfbmFtZSI6IlJvaGRlIiwiZW1haWxzIjpbImRyb0BteWZyZWVkb20ubHRkIl0sIm5vbmNlIjoiNjY3NTdmZWYtZjFiMS00NDBmLWI0MmItNDk3NDU2MjgxNDNhIiwic2NwIjoiVXNlci5SZWFkQWxsIiwiYXpwIjoiMjM1MzA1MmEtNWM2Yi00OTgyLWIwZmQtZTcyNzVlNDIzNGM1IiwidmVyIjoiMS4wIiwiaWF0IjoxNjkyMjAxMTY2LCJhdWQiOiIyMzUzMDUyYS01YzZiLTQ5ODItYjBmZC1lNzI3NWU0MjM0YzUiLCJleHAiOjE2OTIyMDgzNjYsImlzcyI6Imh0dHBzOi8vbXlmcmVlZG9tbHRkLmIyY2xvZ2luLmNvbS81ZTdiZDFmOS1kOTUzLTQ5NWEtOThkNy0yNDc2MzE5NDg0ZjIvdjIuMC8iLCJuYmYiOjE2OTIyMDExNjZ9.mU5TMFEEEkLXbjHUqac_03_2cNBVf_Ev_tNVYCC53Yy7DwdRhC6UQvknX3Qoxv_jZFl7_bRybxS1P6xz9qOWKQKc8nFABromlzjXfMM6aovF1J1gLsVnz9VyOaqaSihD8BOVY1EzMa-sxnmBXFP3X5cUs36Wt1fYTl6JCX-LjSttxV7VrOcrOHdNfFomtcSm4m2jGPd1kx6aj7_HLECns_n1rMoZjITkwP4Rbtk-BWeLiVoQJ1_bKwJQPHZIZwXoSKYqc-0kB1miCHPU94wlXt_OV1Hckthq4wo_wkO552dPhvbugBN7wSsDPDsN-vNHjQ9Nk_KbHcExNyqxjlZVTw";


    prefs.setString('token', StringCons.token);
    // prefs.setString('token', tokenSave);
    String? token = prefs.getString("token");

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    return headers;
  }

  @override
  Future<dynamic> getGetApiResponse(String url) async {
    // TODO: implement getGetApiResponse
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    // TODO: implement getPostApiResponse
    dynamic responseJson;
    try {
      Response response = await http
          .post(
            Uri.parse(url),
            body: data,
          )
          .timeout(
            const Duration(seconds: 10),
          );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnautherizedException(response.body.toString());
      case 500:
        throw UnautherizedException(response.body.toString());
      default:
        throw FetchDataException('Error occured while communicating with '
            'server with statuscode ${response.statusCode}');
    }
  }

  @override
  Future<dynamic> get({required String? url}) async {
    // TODO: implement getGetApiResponse
    dynamic responseJson;
    try {
      if (kDebugMode) debugPrint("getUrl:${Uri.parse(url!)}");

      Map<String, String> headersMap = await createHeadersMap();
      final response = await _client
          .get(
            Uri.parse(url!),
            headers: headersMap,
          )
          .timeout(_apiTimeOutDuration);

      if (kDebugMode) {
        debugPrint("getResponse statusCode:${response.statusCode}");
        debugPrint("getResponse:$response");
      }
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  // Post
  @override
  Future<dynamic> post({required String url, required dynamic model}) async {
    // TODO: implement getPostApiResponse
    dynamic responseJson;
    try {
      Map<String, String> headersMap = await createHeadersMap();
      String jsonModel = json.encode(model);
      Response response = await _client
          .post(
            Uri.parse(url),
            body: jsonModel,
            headers: headersMap,
          )
          .timeout(
            _apiTimeOutDuration,
          );

      if (kDebugMode) {
        debugPrint("postUrl:${Uri.parse(url)}");
        debugPrint("postModel:$jsonModel");
        debugPrint("PostResponse statusCode:${response.statusCode}");

      }
      responseJson = returnResponse(response); // handle Response
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  // PUT Request
  @override
  Future<dynamic> put({required String url, required dynamic model}) async {
    dynamic responseJson;
    String jsonModel = json.encode(model);

    try {

      Map<String, String> headersMap = await createHeadersMap();
      if (kDebugMode) debugPrint("putUrl:${Uri.parse(url)}");

      var response = await _client
          .put(
            Uri.parse(url),
            body: jsonModel,
            headers: headersMap,
          )
          .timeout(
            _apiTimeOutDuration,
          );
      responseJson = returnResponse(response); // handle Response
      if (kDebugMode) {
        debugPrint("putResponse statusCode:${response.statusCode}");
        debugPrint("putResponse:$response");
        debugPrint("====returnResponse:$responseJson===");
      }
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  // Delete
  @override
  Future<dynamic> delete({String? url}) async {
    dynamic responseJson;
    try {
      var response = await _client
          .delete(Uri.parse(url!), headers: await createHeadersMap())
          .timeout(
            _apiTimeOutDuration,
          );
      responseJson = returnResponse(response); // handle Response
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }
}
