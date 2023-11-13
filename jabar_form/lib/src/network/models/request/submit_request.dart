import 'dart:convert';

import 'answer.dart';

class SubmitRequest {
  List<Answer>? answers;
  int? submittedTime;

  SubmitRequest({this.answers, this.submittedTime});

  @override
  String toString() {
    return 'SubmitRequest(answers: $answers, submittedTime: $submittedTime)';
  }

  factory SubmitRequest.fromMap(Map<String, dynamic> data) {
    return SubmitRequest(
      answers: (data['answers'] as List<dynamic>?)
          ?.map((e) => Answer.fromMap(e as Map<String, dynamic>))
          .toList(),
      submittedTime: data['submitted_time'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'answers': answers?.map((e) => e.toMap()).toList(),
        'submitted_time': submittedTime,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SubmitRequest].
  factory SubmitRequest.fromJson(String data) {
    return SubmitRequest.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubmitRequest] to a JSON string.
  String toJson() => json.encode(toMap());
}
