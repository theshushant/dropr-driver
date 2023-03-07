import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dropr_driver/utils/globals.dart';

String baseUrl = 'https://api.dropr.com.au';

abstract class APIService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> get(
    String url, {
    Map<String, dynamic>? params,
    bool useAuthHeaders = true,
  }) async {
    try {
      await _getHeaders(useAuthHeaders: useAuthHeaders);
      var data = await _dio.get(
        _getUrlWithParams(url, params: params),
      );
      return _getResponse(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> post(
    String url, {
    required dynamic body,
    bool useAuthHeaders = true,
    Map<String, dynamic>? params,
    bool isUpload = false,
  }) async {
    try {
      await _getHeaders(useAuthHeaders: useAuthHeaders, isUpload: isUpload);
      log("Headers:${_dio.options.headers}");
      final response = await _dio.post(
        _getUrlWithParams(url, params: params),
        data: isUpload ? body : json.encode(body),
      );
      log("post response:$response");
      Map<String, dynamic> result = _getResponse(response);
      return result;
    } catch (e) {
      log('Error: $e');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> delete(String url,
      {bool useAuthHeaders = true, Map<String, dynamic>? params}) async {
    try {
      await _getHeaders(useAuthHeaders: useAuthHeaders);
      final response = await _dio.delete(
        _getUrlWithParams(url, params: params),
      );
      Map<String, dynamic> result = _getResponse(response);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> put(
    String url, {
    required Map<String, dynamic> body,
    bool useAuthHeaders = true,
    Map<String, dynamic>? params,
  }) async {
    try {
      await _getHeaders(useAuthHeaders: useAuthHeaders);
      final response = await _dio.put(_getUrlWithParams(url, params: params),
          data: json.encode(body));

      return _getResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  // Future<Map<String, dynamic>> delete(String url,
  //     {bool useAuthHeaders = true, Map<String, dynamic> params}) async {
  //   try {
  //     final response = await http.delete(_getUrlWithParams(url, params: params),
  //         headers: await _getHeaders(useAuthHeaders: useAuthHeaders));
  //
  //     return _getResponse(response);
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  // Helper Methods for API Services
  String _getUrl(String url) {
    return baseUrl + url;
  }

  Future<void> _getHeaders(
      {bool useAuthHeaders = true, bool isUpload = false}) async {
    final token = await preferenceService.getAuthToken();
    log('token:$token');
    _dio.options.headers['content-Type'] =
        isUpload ? 'multipart/form-data' : 'application/json';
    if (useAuthHeaders) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    } else {
      _dio.options.headers.remove("Authorization");
    }
  }

  String _getUrlWithParams(String url, {Map<String, dynamic>? params}) {
    var absUrl = _getUrl(url);

    if (params != null) {
      var paramsString = '';
      params.forEach((key, value) {
        paramsString += '&$key=$value';
      });

      return '$absUrl?${paramsString.substring(1)}';
    }
    print("here url is this $absUrl");

    return absUrl;
  }

  Map<String, dynamic> _getResponse(Response response) {
    log('api service');
    log(response.realUri.origin + response.realUri.path);
    log(response.statusCode.toString());
    log(response.data.toString());
    // log(response.toString().toString());

    if (response.statusCode == 204 || response.data.isEmpty) {
      return {'data': 'No Result Found'};
    }

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return response.data;
    } else {
      return {};
      // throw NetworkError(
      //   title: StringValues.serverError,
      //   statusCode: response.statusCode,
      // );
    }
  }
}
