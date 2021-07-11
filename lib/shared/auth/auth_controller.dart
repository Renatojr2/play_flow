import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:payflow/shared/model/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel _user;

  UserModel get user => _user;

  void setUser(BuildContext context, UserModel user) {
    if (user != null) {
      saveUser(user);
      _user = user;
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString('user', user.toJson());
    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    if (instance.containsKey('user')) {
      final user = await instance.get('user') as String;
      setUser(context, UserModel.fromMap(user));
      return;
    } else {
      setUser(context, null);
    }
  }
}
