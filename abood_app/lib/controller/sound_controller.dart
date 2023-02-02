// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:abood_app/model/audio_recorder.dart';

import '../utils/constants.dart';

class SoundController extends ChangeNotifier {
  bool _isRecording = false;
  bool get isRecording => _isRecording;
  bool _isRecorderInitilized = false;
  FlutterSoundRecorder? _audioRecorder;

  SoundController() {
    init();
  }

  Future init() async {
    _audioRecorder =
        SoundRecorder(audioRecorder: FlutterSoundRecorder()).audioRecorder;
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException("Microphone permission");
    }
    await _audioRecorder!.openAudioSession();
    _isRecorderInitilized = true;
  }

  // @override
  // void dispose() {
  //   _audioRecorder!.closeAudioSession();
  //   _audioRecorder = null;
  // }

  Future _record() async {
    if (!_isRecorderInitilized) return;
    await _audioRecorder!.startRecorder(
      toFile: filePath,
    );
  }

  Future _stop() async {
    if (!_isRecorderInitilized) return;

    await _audioRecorder!.stopRecorder();
  }

  Future toggleRecording() async {
    if (_audioRecorder!.isStopped) {
      _isRecording = true;
      await _record();
      notifyListeners();
    } else {
      _isRecording = false;
      await _stop();
      notifyListeners();
    }
  }
}
