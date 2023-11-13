import 'dart:convert';

class SubmitFormResponse {
  String? message;
  int? statusCode;
  int? success;
  String? data;

  SubmitFormResponse({
    this.message,
    this.statusCode,
    this.success,
    this.data,
  });

  @override
  String toString() {
    return 'SubmitFormResponse(message: $message, statusCode: $statusCode, success: $success, data: $data)';
  }

  factory SubmitFormResponse.fromMap(Map<String, dynamic> data) {
    return SubmitFormResponse(
      message: data['message'] as String?,
      statusCode: data['status_code'] as int?,
      success: data['success'] as int?,
      data: data['data'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'message': message,
        'status_code': statusCode,
        'success': success,
        'data': data,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SubmitFormResponse].
  factory SubmitFormResponse.fromJson(String data) {
    return SubmitFormResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubmitFormResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
