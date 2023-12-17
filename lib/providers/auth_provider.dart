import 'package:flutter/material.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _dataUser;

  UserModel get dataUser => _dataUser;

  set dataUser(UserModel dataUser) {
    _dataUser = dataUser;
    notifyListeners();
  }

// function to register return boolean if register success or not
  Future<bool> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      UserModel dataUser = await AuthService().register(
        name: name,
        email: email,
        username: username,
        password: password,
      );

      _dataUser = dataUser;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
