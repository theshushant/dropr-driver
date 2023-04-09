import 'dart:developer';

import 'package:dropr_driver/models/employee.dart';
import 'package:dropr_driver/services/api_service.dart';
import 'package:dropr_driver/utils/globals.dart';

class UserService extends APIService {
  UserService._();

  factory UserService.getInstance() => _instance;
  static final UserService _instance = UserService._();

  Future<int> login(Map<String, String> body) async {
    log("login function with body:$body");
    dynamic response = await post('/auth/initiate-verification/employee',
        body: body, useAuthHeaders: false);
    log("login response:$response");
    return response["data"]["otp"];
  }

  Future<Employee> loginComplete(Map<String, String> body) async {
    Map<String, dynamic> response =
        await post('/auth/carrier-login', body: body, useAuthHeaders: false);
    preferenceService.setAuthToken(response["auth_token"]);
    log('here user is ${response['employee']}');
    return Employee.fromJson(response["employee"]);
  }

  Future<Employee> registerYourself(Map<String, dynamic> body) async {
    log("here data is this $body");
    Map<String, dynamic> response = await put(
      '/employees/me',
      body: body,
    );
    log("here data is this ${response["data"]}");
    return Employee.fromJson(response["data"]);
  }

  Future<Employee> showMe() async {
    Map<String, dynamic> response = await get('/employees/me');
    log("here data is this ${response["data"]}");
    return Employee.fromJson(response['data']);
  }

  Future<void> startSession() async {
    Map<String, dynamic> response =
        await post('/employees/me/start-session', body: {});
    log("here data is this ${response["data"]}");
  }

  Future<void> endSession() async {
    Map<String, dynamic> response =
        await post('/employees/me/end-session', body: {});
    log("here data is this ${response["data"]}");
  }
}
