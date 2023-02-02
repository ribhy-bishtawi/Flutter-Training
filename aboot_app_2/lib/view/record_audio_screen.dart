import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/recorded_audio_provider.dart';
import '../controller/audio_recorder_controller.dart';

class RecordAudioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RecordedAudioProvider>(
      builder: (context, recordedAudioProvider, _) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (recordedAudioProvider.recordedAudio != null)
                  Text(
                    "File Path: ${recordedAudioProvider.recordedAudio.filePath}\nDuration: ${recordedAudioProvider.recordedAudio.duration} sec",
                  ),
                RaisedButton(
                  onPressed: () {
                    // Trigger recording
                  },
                  child: Text("Record"),
                ),
                RaisedButton(
                  onPressed: () {
                    // Trigger API call
                  },
                  child: Text("Upload"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
