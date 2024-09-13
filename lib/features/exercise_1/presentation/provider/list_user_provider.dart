import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecnica_neoris/core/models/user_model.dart';
import 'package:tecnica_neoris/features/exercise_1/data/data_source_list.dart';

class ListUserProvider extends ChangeNotifier {
  List<User> listuser = [];
  List<User> listUserfiltered = [];
  DataSourceList dataSourceList = DataSourceList();
  bool filterActive = false;

  Future<void> getListUser() async {
    listuser = (await dataSourceList.getUser());
    notifyListeners();
  }

  void filterUsersByName(String name, List<User> users) {
    listUserfiltered = users.where((user) => user.name.toLowerCase().contains(name.toLowerCase())).toList();

    notifyListeners();
  }
}
