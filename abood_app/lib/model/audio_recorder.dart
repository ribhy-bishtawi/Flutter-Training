// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';

class SoundRecorder extends ChangeNotifier {
  FlutterSoundRecorder? audioRecorder;
  SoundRecorder({
    required this.audioRecorder,
  });
}
