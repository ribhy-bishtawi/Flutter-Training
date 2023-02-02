import 'dart:convert';

ResponseModel responseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  ResponseModel({
    required this.id,
    required this.recognitionStatus,
    required this.offset,
    required this.duration,
    required this.displayText,
    required this.nBest,
  });

  String id;
  int recognitionStatus;
  int offset;
  int duration;
  String displayText;
  List<NBest> nBest;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        id: json["Id"],
        recognitionStatus: json["RecognitionStatus"],
        offset: json["Offset"],
        duration: json["Duration"],
        displayText: json["DisplayText"],
        nBest: List<NBest>.from(json["NBest"].map((x) => NBest.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "RecognitionStatus": recognitionStatus,
        "Offset": offset,
        "Duration": duration,
        "DisplayText": displayText,
        "NBest": List<dynamic>.from(nBest.map((x) => x.toJson())),
      };
}

class NBest {
  NBest({
    required this.confidence,
    required this.lexical,
    required this.itn,
    required this.maskedItn,
    required this.display,
    required this.pronunciationAssessment,
    required this.words,
  });

  double confidence;
  String lexical;
  String itn;
  String maskedItn;
  String display;
  NBestPronunciationAssessment pronunciationAssessment;
  List<Word> words;

  factory NBest.fromJson(Map<String, dynamic> json) => NBest(
        confidence: json["Confidence"]?.toDouble(),
        lexical: json["Lexical"],
        itn: json["ITN"],
        maskedItn: json["MaskedITN"],
        display: json["Display"],
        pronunciationAssessment: NBestPronunciationAssessment.fromJson(
            json["PronunciationAssessment"]),
        words: List<Word>.from(json["Words"].map((x) => Word.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Confidence": confidence,
        "Lexical": lexical,
        "ITN": itn,
        "MaskedITN": maskedItn,
        "Display": display,
        "PronunciationAssessment": pronunciationAssessment.toJson(),
        "Words": List<dynamic>.from(words.map((x) => x.toJson())),
      };
}

class NBestPronunciationAssessment {
  NBestPronunciationAssessment({
    required this.accuracyScore,
    required this.fluencyScore,
    required this.completenessScore,
    required this.pronScore,
  });

  int accuracyScore;
  int fluencyScore;
  int completenessScore;
  int pronScore;

  factory NBestPronunciationAssessment.fromJson(Map<String, dynamic> json) =>
      NBestPronunciationAssessment(
        accuracyScore: json["AccuracyScore"],
        fluencyScore: json["FluencyScore"],
        completenessScore: json["CompletenessScore"],
        pronScore: json["PronScore"],
      );

  Map<String, dynamic> toJson() => {
        "AccuracyScore": accuracyScore,
        "FluencyScore": fluencyScore,
        "CompletenessScore": completenessScore,
        "PronScore": pronScore,
      };
}

class Word {
  Word({
    required this.word,
    required this.offset,
    required this.duration,
    required this.pronunciationAssessment,
    required this.syllables,
    required this.phonemes,
  });

  String word;
  int offset;
  int duration;
  WordPronunciationAssessment pronunciationAssessment;
  List<Syllable> syllables;
  List<Phoneme> phonemes;

  factory Word.fromJson(Map<String, dynamic> json) => Word(
        word: json["Word"],
        offset: json["Offset"],
        duration: json["Duration"],
        pronunciationAssessment: WordPronunciationAssessment.fromJson(
            json["PronunciationAssessment"]),
        syllables: List<Syllable>.from(
            json["Syllables"].map((x) => Syllable.fromJson(x))),
        phonemes: List<Phoneme>.from(
            json["Phonemes"].map((x) => Phoneme.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Word": word,
        "Offset": offset,
        "Duration": duration,
        "PronunciationAssessment": pronunciationAssessment.toJson(),
        "Syllables": List<dynamic>.from(syllables.map((x) => x.toJson())),
        "Phonemes": List<dynamic>.from(phonemes.map((x) => x.toJson())),
      };
}

class Phoneme {
  Phoneme({
    required this.phoneme,
    required this.pronunciationAssessment,
    required this.offset,
    required this.duration,
  });

  String phoneme;
  PhonemePronunciationAssessment pronunciationAssessment;
  int offset;
  int duration;

  factory Phoneme.fromJson(Map<String, dynamic> json) => Phoneme(
        phoneme: json["Phoneme"],
        pronunciationAssessment: PhonemePronunciationAssessment.fromJson(
            json["PronunciationAssessment"]),
        offset: json["Offset"],
        duration: json["Duration"],
      );

  Map<String, dynamic> toJson() => {
        "Phoneme": phoneme,
        "PronunciationAssessment": pronunciationAssessment.toJson(),
        "Offset": offset,
        "Duration": duration,
      };
}

class PhonemePronunciationAssessment {
  PhonemePronunciationAssessment({
    required this.accuracyScore,
    required this.nBestPhonemes,
  });

  int accuracyScore;
  List<NBestPhoneme> nBestPhonemes;

  factory PhonemePronunciationAssessment.fromJson(Map<String, dynamic> json) =>
      PhonemePronunciationAssessment(
        accuracyScore: json["AccuracyScore"],
        nBestPhonemes: List<NBestPhoneme>.from(
            json["NBestPhonemes"].map((x) => NBestPhoneme.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "AccuracyScore": accuracyScore,
        "NBestPhonemes":
            List<dynamic>.from(nBestPhonemes.map((x) => x.toJson())),
      };
}

class NBestPhoneme {
  NBestPhoneme({
    required this.phoneme,
    required this.score,
  });

  String phoneme;
  int score;

  factory NBestPhoneme.fromJson(Map<String, dynamic> json) => NBestPhoneme(
        phoneme: json["Phoneme"],
        score: json["Score"],
      );

  Map<String, dynamic> toJson() => {
        "Phoneme": phoneme,
        "Score": score,
      };
}

class WordPronunciationAssessment {
  WordPronunciationAssessment({
    required this.accuracyScore,
    required this.errorType,
  });

  int accuracyScore;
  String errorType;

  factory WordPronunciationAssessment.fromJson(Map<String, dynamic> json) =>
      WordPronunciationAssessment(
        accuracyScore: json["AccuracyScore"],
        errorType: json["ErrorType"],
      );

  Map<String, dynamic> toJson() => {
        "AccuracyScore": accuracyScore,
        "ErrorType": errorType,
      };
}

class Syllable {
  Syllable({
    required this.syllable,
    required this.pronunciationAssessment,
    required this.offset,
    required this.duration,
  });

  String syllable;
  SyllablePronunciationAssessment pronunciationAssessment;
  int offset;
  int duration;

  factory Syllable.fromJson(Map<String, dynamic> json) => Syllable(
        syllable: json["Syllable"],
        pronunciationAssessment: SyllablePronunciationAssessment.fromJson(
            json["PronunciationAssessment"]),
        offset: json["Offset"],
        duration: json["Duration"],
      );

  Map<String, dynamic> toJson() => {
        "Syllable": syllable,
        "PronunciationAssessment": pronunciationAssessment.toJson(),
        "Offset": offset,
        "Duration": duration,
      };
}

class SyllablePronunciationAssessment {
  SyllablePronunciationAssessment({
    required this.accuracyScore,
  });

  int accuracyScore;

  factory SyllablePronunciationAssessment.fromJson(Map<String, dynamic> json) =>
      SyllablePronunciationAssessment(
        accuracyScore: json["AccuracyScore"],
      );

  Map<String, dynamic> toJson() => {
        "AccuracyScore": accuracyScore,
      };
}
