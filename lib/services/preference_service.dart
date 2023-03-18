import 'dart:convert';
import 'package:dropr_driver/models/employee.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  PreferenceService._();

  factory PreferenceService.getInstance() => _instance;

  static final PreferenceService _instance = PreferenceService._();

  static const String _user = 'User';
  static const String _token = 'token';

  Future<SharedPreferences> _getInstance() async {
    return SharedPreferences.getInstance();
  }

  Future<void> setAuthUser(Employee user) async {
    (await _getInstance())
        .setString(PreferenceService._user, json.encode(user.toJson()));
  }

  Future<Employee?> getAuthUser() async {
    final String? token =
        (await _getInstance()).getString(PreferenceService._user);
    dynamic user;
    if (token!.isNotEmpty) {
      user = Employee.fromJson(json.decode(token));
    } else {
      user = null;
    }

    return user;
  }

  Future<void> setAuthToken(String token) async {
    (await _getInstance()).setString(PreferenceService._token, token);
  }

  Future<String?> getAuthToken() async {
    return (await _getInstance()).getString(PreferenceService._token);
  }

  Future<void> reset() async {
    (await _getInstance()).clear();
  }
}
