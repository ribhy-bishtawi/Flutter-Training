// ignore_for_file: constant_identifier_names

import 'package:path_provider/path_provider.dart';

const String USER_LIST =
    'https://mocki.io/v1/e3e069dd-1f0c-4f8e-ba50-9a8c93944c90';
const String VIDEO_API =
    'https://webhook.site/4292751f-0914-4067-9a65-f3567e7550dc';

const USER_INVALID_RESPONSE = 100;
const NO_INTERNET = 101;
const INVALID_FORMAT = 102;
const UNKNOWN_ERROR = 103;

// const filePath = 'audio_example.wav';
class PathConstants {
  static Future<String> get videoPath async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/video.mp4';
  }
}
