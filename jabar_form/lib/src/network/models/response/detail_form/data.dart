import 'dart:convert';

import 'questions.dart';
import 'collaborator.dart';
import 'settings.dart';

class Data {
  String? title;
  String? description;
  String? slug;
  dynamic banner;
  dynamic estimatedFillTime;
  bool? isActive;
  String? updatedAt;
  dynamic deletedAt;
  int? views;
  String? googleSpreadsheetId;
  String? uuidUser;
  dynamic submittedMessage;
  Settings? settings;
  List<Collaborator>? collaborators;
  int? respondentCounts;
  bool? deletedPermanent;
  String? uuid;
  List<Question>? questions;

  Data({
    this.title,
    this.description,
    this.slug,
    this.banner,
    this.estimatedFillTime,
    this.isActive,
    this.updatedAt,
    this.deletedAt,
    this.views,
    this.googleSpreadsheetId,
    this.uuidUser,
    this.submittedMessage,
    this.settings,
    this.collaborators,
    this.respondentCounts,
    this.deletedPermanent,
    this.uuid,
    this.questions,
  });

  @override
  String toString() {
    return 'Data(title: $title, description: $description, slug: $slug, banner: $banner, estimatedFillTime: $estimatedFillTime, isActive: $isActive, updatedAt: $updatedAt, deletedAt: $deletedAt, views: $views, googleSpreadsheetId: $googleSpreadsheetId, uuidUser: $uuidUser, submittedMessage: $submittedMessage, settings: $settings, collaborators: $collaborators, respondentCounts: $respondentCounts, deletedPermanent: $deletedPermanent, uuid: $uuid)';
  }

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        title: data['title'] as String?,
        description: data['description'] as String?,
        slug: data['slug'] as String?,
        banner: data['banner'] as dynamic,
        estimatedFillTime: data['estimated_fill_time'] as dynamic,
        isActive: data['is_active'] as bool?,
        updatedAt: data['updated_at'] as String?,
        deletedAt: data['deleted_at'] as dynamic,
        views: data['views'] as int?,
        googleSpreadsheetId: data['google_spreadsheet_id'] as String?,
        uuidUser: data['uuid_user'] as String?,
        submittedMessage: data['submitted_message'] as dynamic,
        settings: data['settings'] == null
            ? null
            : Settings.fromMap(data['settings'] as Map<String, dynamic>),
        collaborators: (data['collaborators'] as List<dynamic>?)
            ?.map((e) => Collaborator.fromMap(e as Map<String, dynamic>))
            .toList(),
        respondentCounts: data['respondent_counts'] as int?,
        deletedPermanent: data['deleted_permanent'] as bool?,
        uuid: data['uuid'] as String?,
        questions: (data['questions'] as List<dynamic>?)
            ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'title': title,
        'description': description,
        'slug': slug,
        'banner': banner,
        'estimated_fill_time': estimatedFillTime,
        'is_active': isActive,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
        'views': views,
        'google_spreadsheet_id': googleSpreadsheetId,
        'uuid_user': uuidUser,
        'submitted_message': submittedMessage,
        'settings': settings?.toMap(),
        'collaborators': collaborators?.map((e) => e.toMap()).toList(),
        'respondent_counts': respondentCounts,
        'deleted_permanent': deletedPermanent,
        'uuid': uuid,
        'questions': questions,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());
}
