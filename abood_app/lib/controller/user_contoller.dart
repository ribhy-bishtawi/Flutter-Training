// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:abood_app/model/repo/api_status.dart';
import 'package:abood_app/model/repo/user_serivce.dart';
import 'package:abood_app/model/response.dart';

class UsersController extends ChangeNotifier {
  late bool _loading = false;
  List<UserModel> _userListModel = [];

  UsersController() {
    getUsers();
  }

  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
  }

  getUsers() async {
    setLoading(true);
    var response = await UserService.getResponse();
    if (response is Success) {
      setUserListModel(response.response as List<UserModel>);
    }
    // TODO
    // if(response is Failure)
    setLoading(false);
  }
}
