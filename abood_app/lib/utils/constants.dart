// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

const String USER_LIST =
    'https://mocki.io/v1/e3e069dd-1f0c-4f8e-ba50-9a8c93944c90';
const String VIDEO_API =
    'https://webhook.site/880665c0-0462-4d57-b163-11a2981e5d8c';
// https://webhook.site/880665c0-0462-4d57-b163-11a2981e5d8c
// https://isef.bishtawi.me

const USER_INVALID_RESPONSE = 100;
const NO_INTERNET = 101;
const INVALID_FORMAT = 102;
const UNKNOWN_ERROR = 103;
const MAIN_COLOR = Color.fromARGB(255, 215, 227, 235);
const TEXT_COLOR = Color.fromARGB(255, 44, 44, 45);
const LINEAR_GRADIENT_COLOR_1 = Color.fromARGB(255, 252, 92, 43);
const LINEAR_GRADIENT_COLOR_2 = Color.fromARGB(255, 240, 146, 29);

// const filePath = 'audio_example.wav';
class PathConstants {
  static Future<String> get videoPath async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/video.mp4';
  }
}
