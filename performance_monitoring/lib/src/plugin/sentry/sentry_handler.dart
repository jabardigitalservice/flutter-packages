import 'package:flutter/foundation.dart';
import 'package:performance_monitoring/src/performance.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class SentryHandler {
  // Check if the error thrown contains any of the strings
  // from the list of ignored error strings.
  static bool _ignore(dynamic error) {
    for (var ignoredError
        in PerformanceMonitor.instance.sentryConfig!.ignoreErrors) {
      if (error.toString().contains(ignoredError)) {
        return true;
      }
    }
    return false;
  }

  // Report the errors thrown to Sentry.io
  // except those that are ignored and not on release mode.
  static Future<void> reportError(dynamic error, dynamic stackTrace) async {
    if (!PerformanceMonitor.instance.sentryConfig!.isReleaseModeOnly ||
        (PerformanceMonitor.instance.sentryConfig!.isReleaseModeOnly &&
            kReleaseMode)) {
      await Sentry.captureException(error, stackTrace: stackTrace);
    } else {
      debugPrint(_ignore(error)
          ? 'Sentry -> Reporting Error '
          : 'Sentry -> Ignoring Error : $error');
      if (error is FlutterErrorDetails) {
        // In development mode simply print to console.
        FlutterError.dumpErrorToConsole(error);
      }
    }
  }
}
