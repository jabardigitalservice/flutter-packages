class SentryConfig {
  final String dsn;
  final String? environment;
  final double tracesSampleRate;
  final String appVersion;
  final List<String> ignorePackages;
  final List<String> ignoreErrors;
  final bool isReleaseModeOnly;

  SentryConfig({
    required this.dsn,
    this.environment,
    this.tracesSampleRate = 1.0,
    required this.appVersion,
    this.ignorePackages = const [],
    this.ignoreErrors = const [],
    this.isReleaseModeOnly = true,
  });
}
