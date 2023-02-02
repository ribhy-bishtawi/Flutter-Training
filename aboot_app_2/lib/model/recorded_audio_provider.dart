class RecordedAudio {
  final String filePath;
  final int duration;

  RecordedAudio({this.filePath, this.duration});
}

class RecordedAudioProvider with ChangeNotifier {
  RecordedAudio _recordedAudio;

  RecordedAudio get recordedAudio => _recordedAudio;

  set recordedAudio(RecordedAudio recordedAudio) {
    _recordedAudio = recordedAudio;
    notifyListeners();
  }
}
