import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dropr_driver/services/api_service.dart';
import 'package:dropr_driver/utils/globals.dart';

class UtilityService extends APIService {
  UtilityService._();

  factory UtilityService.getInstance() => _instance;
  static final UtilityService _instance = UtilityService._();

  Future<Map<String, String>> getUrl(String contentType) async {
    Map<String, dynamic> response = await post(
      '/public/pre-signed-url',
      body: {
        "for": "profile-image",
        "content_type": contentType,
      },
      useAuthHeaders: true,
    );
    log("here url$response");
    return {
      "file_url": response["file_url"],
      "signed_url": response["signed_url"]
    };
  }

  Future<void> uploadFile(File file, String url) async {
    String fileName = file.path.split('/').last;
    log("fileName$fileName");
    // FormData formData = FormData.fromMap({
    //   "file": await MultipartFile.fromFile(
    //     file.path,
    //     filename: fileName,
    //     contentType: new MediaType("image", "jpg")
    //   ),
    // });
    log("here url is this$url");
    Dio dio = Dio();
  //  var len = await file.length();
    final token = await preferenceService.getAuthToken();
     // dio.options.headers['content-Type'] = 'multipart/form-data';
    dio.options.headers['Authorization'] = 'Bearer $token';
    dynamic response = await dio.post(url, data: file.openRead());
    log(response.toString());
  }
}
