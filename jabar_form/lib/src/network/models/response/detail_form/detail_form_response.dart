import 'dart:convert';

import 'package:dio/dio.dart';

import 'data.dart';

class DetailFormResponse {
  String? message;
  int? statusCode;
  int? success;
  Data? data;

  DetailFormResponse({
    this.message,
    this.statusCode,
    this.success,
    this.data,
  });

  @override
  String toString() {
    return 'DetailFormResponse(message: $message, statusCode: $statusCode, success: $success, data: $data)';
  }

  factory DetailFormResponse.fromMap(Response response) {
    return DetailFormResponse(
      message: response.data['message'] as String?,
      statusCode: response.data['status_code'] as int?,
      success: response.data['success'] as int?,
      data: Data.fromMap(response.data),
    );
  }

  Map<String, dynamic> toMap() => {
        'message': message,
        'status_code': statusCode,
        'success': success,
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DetailFormResponse].
  factory DetailFormResponse.fromJson(String data) {
    return DetailFormResponse.fromMap(json.decode(data) as Response);
  }

  /// `dart:convert`
  ///
  /// Converts [DetailFormResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
