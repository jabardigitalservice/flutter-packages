import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:newrelic_mobile/newrelic_mobile.dart';
import 'package:performance_monitoring/src/performance.dart';
import 'package:performance_monitoring/src/plugin/sentry/sentry_handler.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class CrashlyticsHandler {
  static void captureError(Object error, StackTrace stackTrace) {
    if (PerformanceMonitor.isFirebaseConfigured()) {
      FirebaseCrashlytics.instance.recordError(error, stackTrace);
    }
    if (PerformanceMonitor.isNewrelicConfigured()) {
      NewrelicMobile.instance.recordError(error, stackTrace);
    }
    if (PerformanceMonitor.isSentryConfigured()) {
      SentryHandler.reportError(error, stackTrace);
    }
  }

  // Report custom
  static Future<void> captureCustomError(
    String tag,
    String message, {
    bool fatal = false,
  }) async {
    if (PerformanceMonitor.isFirebaseConfigured()) {
      await FirebaseCrashlytics.instance.log('$tag: $message');
    }
    if (PerformanceMonitor.isNewrelicConfigured()) {
      NewrelicMobile.instance
          .recordError('$tag: $message', StackTrace.fromString(message));
    }
    if (PerformanceMonitor.isSentryConfigured()) {
      await Sentry.captureMessage('$tag: $message', level: SentryLevel.error);
    }
  }
}
