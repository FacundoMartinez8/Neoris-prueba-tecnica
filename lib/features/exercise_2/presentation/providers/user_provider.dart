import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart'; // Importar SchedulerBinding
import 'package:tecnica_neoris/core/models/credentials_model.dart';
import 'package:tecnica_neoris/core/models/user_model.dart';
import 'package:tecnica_neoris/features/exercise_2/data/data_source_user.dart';

class UserProvider extends ChangeNotifier {
  DataSourceLogin dataSourceLogin = DataSourceLogin();
  bool isLogged = false;

  User userProfile = User(email: '', name: '');

  Future<bool> login(Credenciales credenciales, BuildContext context) async {
    isLogged = await dataSourceLogin.login(credenciales);

    notifyListeners();
    return isLogged;
  }

  Future<void> getUser(String email) async {
    userProfile = await dataSourceLogin.getUser(email);
    notifyListeners();
  }
}
