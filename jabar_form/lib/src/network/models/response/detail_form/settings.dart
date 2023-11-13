import 'dart:convert';

class Settings {
  String? status;
  dynamic periodicTime;
  dynamic periodicDate;
  bool? progressBar;

  Settings({
    this.status,
    this.periodicTime,
    this.periodicDate,
    this.progressBar,
  });

  @override
  String toString() {
    return 'Settings(status: $status, periodicTime: $periodicTime, periodicDate: $periodicDate, progressBar: $progressBar)';
  }

  factory Settings.fromMap(Map<String, dynamic> data) => Settings(
        status: data['status'] as String?,
        periodicTime: data['periodic_time'] as dynamic,
        periodicDate: data['periodic_date'] as dynamic,
        progressBar: data['progress_bar'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'periodic_time': periodicTime,
        'periodic_date': periodicDate,
        'progress_bar': progressBar,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Settings].
  factory Settings.fromJson(String data) {
    return Settings.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Settings] to a JSON string.
  String toJson() => json.encode(toMap());
}
