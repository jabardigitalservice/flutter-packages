import 'dart:convert';

class Collaborator {
  String? email;
  String? status;
  String? name;

  Collaborator({this.email, this.status, this.name});

  @override
  String toString() {
    return 'Collaborator(email: $email, status: $status, name: $name)';
  }

  factory Collaborator.fromMap(Map<String, dynamic> data) => Collaborator(
        email: data['email'] as String?,
        status: data['status'] as String?,
        name: data['name'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'email': email,
        'status': status,
        'name': name,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Collaborator].
  factory Collaborator.fromJson(String data) {
    return Collaborator.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Collaborator] to a JSON string.
  String toJson() => json.encode(toMap());
}
