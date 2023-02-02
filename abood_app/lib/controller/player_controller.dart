// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:abood_app/model/audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';

import '../utils/constants.dart';

class PlayerController extends ChangeNotifier {
  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;
  bool _isRecorderInitilized = false;
  FlutterSoundPlayer? _audioPlayer;

  PlayerController() {
    init();
  }

  Future init() async {
    _audioPlayer =
        SoundPLayer(audioRecorder: FlutterSoundPlayer()).audioRecorder;
    await _audioPlayer!.openAudioSession();
    _isRecorderInitilized = true;
  }

  // @override
  // void dispose() {
  //   _audioRecorder!.closeAudioSession();
  //   _audioRecorder = null;
  // }

  void setIsPlaying() {
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  Future _play(VoidCallback whenFinished) async {
    final filePath = await PathConstants.videoPath;

    await _audioPlayer!.startPlayer(
      fromURI: filePath,
      whenFinished: whenFinished,
    );
  }

  Future _stop() async {
    await _audioPlayer!.stopPlayer();
  }

  Future toggleRecording({required VoidCallback whenFinished}) async {
    if (_audioPlayer!.isStopped) {
      _isPlaying = true;
      await _play(whenFinished);
      notifyListeners();
    } else {
      _isPlaying = false;
      await _stop();
      notifyListeners();
    }
  }
}
