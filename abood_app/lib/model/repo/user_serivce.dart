import 'dart:io';
import 'dart:typed_data';

import 'package:abood_app/model/repo/api_status.dart';
import 'package:flutter/services.dart';
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

  static void postRecord() async {
    // 1. Get the path to the recorded audio file

    // 2. Read the contents of the file
    final filePath = await PathConstants.videoPath;

    final bytes = await File(filePath).readAsBytes();

    // 3. Create a multipart form data request
    final request = http.MultipartRequest('POST', Uri.parse(VIDEO_API));

    // 4. Add the file to the request
    request.files.add(http.MultipartFile.fromBytes('file', bytes,
        filename: 'audio_example.wav'));

    // 5. Send the request
    final response = await request.send();

    // Handle the response from the server
  }
}
