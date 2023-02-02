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

  // static Future<void> postRecord() async {
  //   ByteData byteData = await rootBundle.load(filePath);
  //   List<int> data = byteData.buffer.asUint8List();

  //   var url = Uri.parse(VIDEO_API);

  //   final response = await http.post(
  //     url,
  //     headers: {'Content-Type': 'application/octet-stream'},
  //     body: data,
  //   );

  //   if (response.statusCode == 200) {
  //     print('Record successfully posted.');
  //   } else {
  //     throw Exception('Failed to post record.');
  //   }
  // }

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
