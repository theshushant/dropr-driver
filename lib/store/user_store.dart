import 'dart:developer';
import 'package:dropr_driver/models/user.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  User? user;
  @observable
  bool isLoading = false;

  @action
  Future<int> login(Map<String, String> body) async {
    try {
      isLoading = true;
      int otp = await userService.login(body);
      isLoading = false;

      return otp;
    } catch (e) {
      log('Error in store ' + e.toString());
      isLoading = false;
      rethrow;
    }
  }

  @action
  Future<void> loginComplete(Map<String, String> body) async {
    try {
      isLoading = true;
      user = await userService.loginComplete(body);
      isLoading = false;
    } catch (e) {
      log('Error in store $e');
      isLoading = false;
      rethrow;
    }
  }

  @action
  Future<void> sigup(Map<String, String> body) async {
    try {
      isLoading = true;
      user = await userService.signup(body);
      isLoading = false;
    } catch (e) {
      log('Error in store $e');
      isLoading = false;
      rethrow;
    }
  }

  @action
  Future<void> logout() async {
    await reset();
  }

  Future<void> reset() async {
    await preferenceService.reset();
  }
}