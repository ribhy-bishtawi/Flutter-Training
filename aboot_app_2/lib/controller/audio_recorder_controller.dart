import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';

import '../model/recorded_audio.dart';
import '../model/recorded_audio_provider.dart';

class RecordAudioController {
  final RecordedAudioProvider _recordedAudioProvider;

  RecordAudioController(this._recordedAudioProvider);

  Future<void> recordAudio() async {
    // Use the audio_recorder package to record the audio
    // ...

    // Update the recorded audio in the provider
    _recordedAudioProvider.recordedAudio = RecordedAudio(
      filePath: "path/to/recorded/audio.mp3",
      duration: 10,
    );
  }

  Future<void> uploadAudio() async {
    // Use the dio package to call the API and pass the audio data
    // ...
  }
}
