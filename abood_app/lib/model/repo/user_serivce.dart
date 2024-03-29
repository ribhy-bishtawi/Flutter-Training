import 'dart:io';

import 'package:abood_app/model/repo/api_status.dart';
import 'package:http/http.dart' as http;

import '../../utils/constants.dart';
import '../response.dart';

class UserService {
  static Future<Object> getResponse() async {
    try {
      var url = Uri.parse(USER_LIST);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return Success(response: responseModelFromJson(response.body));
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: "Invalid Response");
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: "No Internet");
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: "Invalid Format");
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: "Unknown Erorr");
    }
  }

  static Future<Object> postRecord() async {
    final filePath = await PathConstants.videoPath;

    File videoFile = File(filePath);

    var request = http.MultipartRequest('POST', Uri.parse(VIDEO_API))
      ..fields['reftext'] = 'hello'
      ..fields['language'] = 'en-US'
      ..files.add(http.MultipartFile('audio_data',
          videoFile.readAsBytes().asStream(), videoFile.lengthSync(),
          filename: filePath));

    var response = await http.Response.fromStream(
        await request.send().timeout(Duration(seconds: 100)));
    if (response.statusCode == 200) {
      return Success(response: responseModelFromJson(response.body));
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return response.body;
  }
}
