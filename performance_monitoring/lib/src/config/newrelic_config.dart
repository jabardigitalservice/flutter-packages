import 'package:newrelic_mobile/config.dart';

class NewrelicConfig {
  final String accessToken;
  final bool analyticsEventEnabled;
  final bool crashReportingEnabled;
  final bool interactionTracingEnabled;
  final bool networkRequestEnabled;
  final bool networkErrorRequestEnabled;
  final bool httpResponseBodyCaptureEnabled;
  final bool loggingEnabled;
  final bool webViewInstrumentation;
  final bool printStatementAsEventsEnabled;
  final bool httpInstrumentationEnabled;
  final int maxEventPoolSize;
  final int maxEventBufferTime;

  NewrelicConfig({
    required this.accessToken,
    this.analyticsEventEnabled = true,
    this.crashReportingEnabled = true,
    this.httpResponseBodyCaptureEnabled = true,
    this.interactionTracingEnabled = true,
    this.loggingEnabled = true,
    this.networkErrorRequestEnabled = true,
    this.networkRequestEnabled = true,
    this.webViewInstrumentation = true,
    this.printStatementAsEventsEnabled = true,
    this.httpInstrumentationEnabled = true,
    this.maxEventPoolSize = 3000,
    this.maxEventBufferTime = 300,
  });

  Config get() {
    return Config(
      accessToken: accessToken,
      analyticsEventEnabled: analyticsEventEnabled,
      networkErrorRequestEnabled: networkErrorRequestEnabled,
      networkRequestEnabled: networkRequestEnabled,
      crashReportingEnabled: crashReportingEnabled,
      interactionTracingEnabled: interactionTracingEnabled,
      httpResponseBodyCaptureEnabled: httpResponseBodyCaptureEnabled,
      loggingEnabled: loggingEnabled,
      webViewInstrumentation: webViewInstrumentation,
      printStatementAsEventsEnabled: printStatementAsEventsEnabled,
      httpInstrumentationEnabled: httpInstrumentationEnabled,
    );
  }
}
