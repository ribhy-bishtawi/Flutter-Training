import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/recorded_audio_provider.dart';
import './screens/audio_recorder_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RecordedAudioProvider(),
      child: MaterialApp(
        title: 'Audio Recorder',
        home: AudioRecorderScreen(),
      ),
    );
  }
}
