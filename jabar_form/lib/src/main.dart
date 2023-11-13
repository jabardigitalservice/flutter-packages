class JabarForm {
  JabarForm._internal();

  /// TAG for logging
  static const String tag = 'JabarForm';

  /// Provide the [_accessToken] for the jabar form survey API request
  static String _accessToken = '';

  /// The [JabarForm] for this current instance.
  static JabarForm? _instance;

  /// Returns an instance using the default [JabarForm].
  static JabarForm get instance {
    _instance ??= JabarForm._internal();
    return _instance!;
  }

  String getAccessToken() {
    return _accessToken;
  }

  // Add an init method to set the _accessToken
  static void init(String accessToken) {
    _accessToken = accessToken;
    _instance = JabarForm._internal();
  }
}
