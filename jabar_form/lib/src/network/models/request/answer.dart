import 'dart:convert';

import 'package:equatable/equatable.dart';

class Answer extends Equatable {
  final String? uuidSurvey;
  final String? uuidQuestion;
  final String? type;
  dynamic value;

  Answer({this.uuidSurvey, this.uuidQuestion, this.type, this.value});

  @override
  String toString() {
    return 'Answer(uuidSurvey: $uuidSurvey, uuidQuestion: $uuidQuestion, type: $type, value: $value)';
  }

  factory Answer.fromMap(Map<String, dynamic> data) => Answer(
        uuidSurvey: data['uuid_survey'] as String?,
        uuidQuestion: data['uuid_question'] as String?,
        type: data['type'] as String?,
        value: data['value'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'uuid_survey': uuidSurvey,
        'uuid_question': uuidQuestion,
        'type': type,
        'value': value,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Answer].
  factory Answer.fromJson(String data) {
    return Answer.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Answer] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [uuidSurvey, uuidQuestion, type, value];
}
