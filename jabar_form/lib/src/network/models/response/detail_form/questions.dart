import 'package:equatable/equatable.dart';

class Question extends Equatable {
  String uuid;
  String uuidSurvey;
  String name;
  String type;
  String label;
  List<dynamic>? options;
  Map<String, dynamic>? rules;
  String? tag;
  bool isActive;
  bool? isHidden;
  // Add other fields from the JSON data

  Question({
    required this.uuid,
    required this.uuidSurvey,
    required this.name,
    required this.type,
    required this.label,
    this.options,
    this.rules,
    this.tag,
    required this.isActive,
    this.isHidden = false,
    // Add other fields in the constructor
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      uuid: json['uuid'],
      uuidSurvey: json['uuid_survey'],
      name: json['name'],
      type: json['type'],
      label: json['label'],
      options: json['options'],
      rules: json['rules'],
      tag: json['tag'],
      isActive: json['is_active'],
      isHidden: json['is_hidden'] ?? false,
      // Add other fields from the JSON data
    );
  }

  @override
  List<Object?> get props => [
        uuid,
        uuidSurvey,
        name,
        type,
        label,
        options,
        rules,
        tag,
        isActive,
        isHidden,
        // Add other fields
      ];
}
