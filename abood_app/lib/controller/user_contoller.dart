// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:english_words/english_words.dart';

import 'package:flutter/material.dart';

import 'package:abood_app/model/repo/api_status.dart';
import 'package:abood_app/model/repo/user_serivce.dart';
import 'package:abood_app/model/response.dart';

class UsersController extends ChangeNotifier {
  late bool _loading = false;
  late bool _randomWord = false;

  ResponseModel _userListModel = ResponseModel(
    offset: 0.0,
    duration: 0.0,
    nBest: [],
    recognitionStatus: '',
  );
  List<NBest> _nBest = [];
  late String _randomWordString = '';
  final List<String> arabicWords = [
    'كتاب',
    'مدرسة',
    'طالب',
    'جامعة',
    'شمس',
    'قمر',
    'نجمة',
    'سماء',
    'بحر',
    'جبل',
  ];

  // UsersController() {
  //   getUsers();
  // }

  bool get loading => _loading;
  bool get randomWord => _randomWord;
  String get randomWordString => _randomWordString;

  ResponseModel get userListModel => _userListModel;
  List<NBest> get nBestList => _nBest;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(ResponseModel userListModel) {
    _userListModel = userListModel;
  }

  setRandomWord(bool randomWord) {
    _randomWord = randomWord;
    notifyListeners();
  }

  setNBestList(List<NBest> nBestUser) {
    _nBest = nBestUser;
  }

  setRandomWordString() {
    setRandomWord(true);
    final Random random = Random();
    int index = random.nextInt(arabicWords.length);

    _randomWordString = arabicWords[index];
    setRandomWord(false);
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
