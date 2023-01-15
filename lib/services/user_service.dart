import 'package:dropr_driver/models/user.dart';
import 'package:dropr_driver/services/api_service.dart';
import 'package:dropr_driver/utils/globals.dart';

class UserService extends APIService {
  UserService._();

  factory UserService.getInstance() => _instance;
  static final UserService _instance = UserService._();

  Future<int> login(Map<String, String> body) async {
    Map<String, dynamic> response = await post(
      '/auth/initiate-verification',
      body: body,
    );
    return response["data"]["otp"];
  }

  Future<User> loginComplete(Map<String, String> body) async {
    Map<String, dynamic> response = await post(
      '/auth/authenticate',
      body: body,
    );
    print("here data is this " + response["data"]);
    return User.fromJson(response["data"]);
  }

  Future<User> signup(Map<String, String> body) async {
    Map<String, dynamic> response = await post(
      '/auth/carrier-signup',
      body: body,
      useAuthHeaders: false,
    );
    preferenceService.setAuthToken(response["auth_token"]);
    return User.fromJson(response["employee"]);
  }
}
