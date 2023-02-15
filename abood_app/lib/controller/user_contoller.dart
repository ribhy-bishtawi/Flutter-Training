// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:abood_app/model/repo/api_status.dart';
import 'package:abood_app/model/repo/user_serivce.dart';
import 'package:abood_app/model/response.dart';

class UsersController extends ChangeNotifier {
  late bool _loading = false;
  ResponseModel _userListModel = ResponseModel(
      id: "",
      recognitionStatus: 0,
      offset: 0,
      duration: 0,
      displayText: "displayText",
      nBest: []);
  List<NBest> _nBest = [];

  // UsersController() {
  //   getUsers();
  // }

  bool get loading => _loading;
  ResponseModel get userListModel => _userListModel;
  List<NBest> get nBestList => _nBest;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(ResponseModel userListModel) {
    _userListModel = userListModel;
  }

  setNBestList(List<NBest> nBestUser) {
    _nBest = nBestUser;
  }

  getUsers() async {
    setLoading(true);
    var response = await UserService.postRecord();
    if (response is Success) {
      ResponseModel responseModel = response.response as ResponseModel;
      setUserListModel(responseModel);
      setNBestList(responseModel.nBest);
    }
    // TODO
    // if(response is Failure)
    setLoading(false);
    notifyListeners();
  }
}
