import 'dart:convert';
import 'dart:io';

import 'package:abood_app/model/repo/api_status.dart';
import 'package:dio/dio.dart';
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
    // 1. Get the path to the recorded audio file

    // 2. Read the contents of the file
    final filePath = await PathConstants.videoPath;

    File videoFile = File(filePath);
    var video = await videoFile.readAsBytes();
    var request = http.MultipartRequest('POST', Uri.parse(VIDEO_API))
      ..fields['audio_data'] = '$video'
      ..fields['reftext'] = 'hello'
      ..fields['language'] = 'en-US'
      ..headers['Content-Type'] = 'application/octet-stream';

    // var body =
    //     'audio_data=${videoFile.readAsBytesSync()}&reftext=hello&language=en-US'; // Encode the video file as a form value
    // var response = await http
    //     .post(Uri.parse(VIDEO_API),
    //         headers: <String, String>{
    //           'Content-Type': 'application/json; charset=UTF-8',
    //           'Connection': 'Keep-Alive'
    //         },
    //         body: body)
    //     .timeout(Duration(seconds: 20));
    var response = await http.Response.fromStream(
        await request.send().timeout(Duration(seconds: 100)));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonData = json.decode(jsonString);
      print(jsonData);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    // var response = await request.send();

    return response;
    ;

    // 3. Create a multipart form data request

    // 4. Add the file to the request

    // 5. Send the request

    // Handle the response from the server
  }
}
