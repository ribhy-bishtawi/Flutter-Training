// To parse this JSON data, do
//
//     final responseModel = responseModelFromJson(jsonString);

import 'dart:convert';

ResponseModel responseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  ResponseModel({
    required this.duration,
    required this.nBest,
    required this.offset,
    required this.recognitionStatus,
  });

  num duration;
  List<NBest> nBest;
  num offset;
  String recognitionStatus;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        duration: json["Duration"],
        nBest: List<NBest>.from(json["NBest"].map((x) => NBest.fromJson(x))),
        offset: json["Offset"],
        recognitionStatus: json["RecognitionStatus"],
      );

  Map<String, dynamic> toJson() => {
        "Duration": duration,
        "NBest": List<dynamic>.from(nBest.map((x) => x.toJson())),
        "Offset": offset,
        "RecognitionStatus": recognitionStatus,
      };
}

class NBest {
  NBest({
    required this.accuracyScore,
    required this.completenessScore,
    required this.display,
    required this.fluencyScore,
    required this.itn,
    required this.lexical,
    required this.maskedItn,
    required this.pronScore,
    required this.words,
  });

  num accuracyScore;
  num completenessScore;
  String display;
  num fluencyScore;
  String itn;
  String lexical;
  String maskedItn;
  num pronScore;
  List<Word> words;

  factory NBest.fromJson(Map<String, dynamic> json) => NBest(
        accuracyScore: json["AccuracyScore"],
        completenessScore: json["CompletenessScore"],
        display: json["Display"],
        fluencyScore: json["FluencyScore"],
        itn: json["ITN"],
        lexical: json["Lexical"],
        maskedItn: json["MaskedITN"],
        pronScore: json["PronScore"],
        words: List<Word>.from(json["Words"].map((x) => Word.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "AccuracyScore": accuracyScore,
        "CompletenessScore": completenessScore,
        "Display": display,
        "FluencyScore": fluencyScore,
        "ITN": itn,
        "Lexical": lexical,
        "MaskedITN": maskedItn,
        "PronScore": pronScore,
        "Words": List<dynamic>.from(words.map((x) => x.toJson())),
      };
}

class Word {
  Word({
    required this.accuracyScore,
    required this.duration,
    required this.errorType,
    required this.offset,
    required this.phonemes,
    required this.syllables,
    required this.word,
  });

  num accuracyScore;
  num duration;
  String errorType;
  num offset;
  List<Phoneme> phonemes;
  List<Phoneme> syllables;
  String word;

  factory Word.fromJson(Map<String, dynamic> json) => Word(
        accuracyScore: json["AccuracyScore"],
        duration: json["Duration"],
        errorType: json["ErrorType"],
        offset: json["Offset"],
        phonemes: List<Phoneme>.from(
            json["Phonemes"].map((x) => Phoneme.fromJson(x))),
        syllables: List<Phoneme>.from(
            json["Syllables"].map((x) => Phoneme.fromJson(x))),
        word: json["Word"],
      );

  Map<String, dynamic> toJson() => {
        "AccuracyScore": accuracyScore,
        "Duration": duration,
        "ErrorType": errorType,
        "Offset": offset,
        "Phonemes": List<dynamic>.from(phonemes.map((x) => x.toJson())),
        "Syllables": List<dynamic>.from(syllables.map((x) => x.toJson())),
        "Word": word,
      };
}

class Phoneme {
  Phoneme({
    required this.accuracyScore,
    required this.duration,
    required this.offset,
    this.phoneme,
    this.syllable,
  });

  num accuracyScore;
  num duration;
  num offset;
  String? phoneme;
  String? syllable;

  factory Phoneme.fromJson(Map<String, dynamic> json) => Phoneme(
        accuracyScore: json["AccuracyScore"],
        duration: json["Duration"],
        offset: json["Offset"],
        phoneme: json["Phoneme"],
        syllable: json["Syllable"],
      );

  Map<String, dynamic> toJson() => {
        "AccuracyScore": accuracyScore,
        "Duration": duration,
        "Offset": offset,
        "Phoneme": phoneme,
        "Syllable": syllable,
      };
}
