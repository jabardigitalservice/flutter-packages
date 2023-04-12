import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newrelic_mobile/newrelic_mobile.dart';
import 'package:performance_monitoring/src/crashlytics.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'config/config.dart';

class PerformanceMonitor {
  static PerformanceMonitor? _instance;
  static PerformanceMonitor get instance {
    return _instance!;
  }

  static bool isFirebaseConfigured() => _instance?.firebaseConfig != null;
  static bool isNewrelicConfigured() => _instance?.newrelicConfig != null;
  static bool isSentryConfigured() => _instance?.sentryConfig != null;

  final FirebaseConfig? firebaseConfig;
  final NewrelicConfig? newrelicConfig;
  final SentryConfig? sentryConfig;

  factory PerformanceMonitor({
    FirebaseConfig? firebaseConfig,
    NewrelicConfig? newrelicConfig,
    SentryConfig? sentryConfig,
  }) {
    _instance ??= PerformanceMonitor._internal(
      firebaseConfig,
      newrelicConfig,
      sentryConfig,
    );
    return _instance!;
  }

  PerformanceMonitor._internal(
    this.firebaseConfig,
    this.newrelicConfig,
    this.sentryConfig,
  );

  Future<void> start(Widget appWidget) async {
    WidgetsFlutterBinding.ensureInitialized();

    if (firebaseConfig != null) {
      await Firebase.initializeApp(
        name: firebaseConfig!.name,
        options: firebaseConfig?.options,
      );

      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
        kReleaseMode
            ? firebaseConfig!.isReleaseCrashlyticsCollectionEnabled
            : firebaseConfig!.isDebugCrashlyticsCollectionEnabled,
      );
    }

    FlutterError.onError = FlutterError.onError = (errorDetails) {
      if (newrelicConfig != null) NewrelicMobile.onError(errorDetails);
      if (firebaseConfig != null) {
        FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      }
    };

    if (sentryConfig != null) {
      await SentryFlutter.init(
        (options) {
          options.tracesSampleRate = sentryConfig?.tracesSampleRate;
          options.dsn = sentryConfig?.dsn;
          options.release = sentryConfig?.appVersion;
          options.environment = sentryConfig?.environment;
          // Exclude exception from ignored packages
          for (var ignoredPackage
              in PerformanceMonitor.instance.sentryConfig!.ignorePackages) {
            options.addInAppExclude(ignoredPackage);
          }
        },
      );
    }

    runZonedGuarded(() async {
      if (newrelicConfig != null) {
        await NewrelicMobile.instance.startAgent(newrelicConfig!.get());
        NewrelicMobile.instance
            .setMaxEventPoolSize(newrelicConfig!.maxEventPoolSize);
        NewrelicMobile.instance
            .setMaxEventBufferTime(newrelicConfig!.maxEventBufferTime);
      }
      runApp(appWidget);
    }, (error, stackTrace) {
      CrashlyticsHandler.captureError(error, stackTrace);
    });
  }
}
