class JFValidation {
  static String? validate(rules, value) {
    if (rules[JFValidationType.required.value] && value == null) {
      return 'Wajib diisi!';
    }

    if (rules[JFValidationType.maxLength.value] != null &&
        value!.length > rules[JFValidationType.maxLength.value]) {
      return 'Maksimal ${rules[JFValidationType.maxLength.value]} karakter';
    }

    if (rules[JFValidationType.minLength.value] != null &&
        value!.length < rules[JFValidationType.minLength.value]) {
      return 'Minimal ${rules[JFValidationType.minLength.value]} karakter';
    }

    return null;
  }
}

enum JFValidationType {
  required,
  maxLength,
  minLength,
  contain,
  notContain;
}

extension JFValidationTypeValue on JFValidationType {
  static const _values = [
    'required',
    'max_length',
    'min_length',
    'contain',
    'not_contain',
  ];

  String get value => _values[index];
}
