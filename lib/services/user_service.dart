import 'package:dropr_driver/models/employee.dart';
import 'package:dropr_driver/services/api_service.dart';
import 'package:dropr_driver/utils/globals.dart';

class UserService extends APIService {
  UserService._();

  factory UserService.getInstance() => _instance;
  static final UserService _instance = UserService._();

  Future<int> login(Map<String, String> body) async {
    Map<String, dynamic> response = await post(
      '/auth/initiate-verification/employee',
      body: body,
    );
    return response["data"]["otp"];
  }

  Future<Employee> loginComplete(Map<String, String> body) async {
    print("here data is this " + body.toString());
    Map<String, dynamic> response = await post(
      '/auth/carrier-login',
      body: body,
      useAuthHeaders: false
    );
    print("here data is this " + response.toString());
    preferenceService.setAuthToken(response["auth_token"]);
    return Employee.fromJson(response["employee"]);
  }

  Future<Employee> registerYourself(Map<String,dynamic> body) async {
    print("here data is this " + body.toString());
    Map<String, dynamic> response = await put(
      '/employees/me',
      body: body,
    );
    print("here data is this " + response["data"].toString());
    return Employee.fromJson(response["data"]);
  }
}
