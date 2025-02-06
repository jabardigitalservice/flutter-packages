import 'dart:async';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

enum FrcValueType { string, number, bool, json }

class MultiFrc {
  MultiFrc._();

  static final streams = <({
    String key,
    String? projectId,
    StreamController controller,
    FrcValueType type,
  })>[];

  /// init Firebase Remote Config Helper
  static Future<void> init({List<FirebaseOptions>? options}) async {
    for (var option in (options ?? <FirebaseOptions>[])) {
      final projectIds = Firebase.apps.map((e) => e.options.projectId);
      if (projectIds.contains(option.projectId)) continue;

      await Firebase.initializeApp(name: option.projectId, options: option);
      if (kIsWeb) continue;

      final instance = FirebaseRemoteConfig.instanceFor(
        app: Firebase.app(option.projectId),
      );
      instance.onConfigUpdated.listen((event) async {
        await instance.activate();
        for (var key in event.updatedKeys) {
          final streamIndex = streams.indexWhere((e) => e.key == key);
          final rcValue = instance.getValue(key);
          final newValue = switch (streams[streamIndex].type) {
            FrcValueType.string => rcValue.asString(),
            FrcValueType.number => rcValue.asDouble(),
            FrcValueType.bool => rcValue.asBool(),
            FrcValueType.json => jsonDecode(rcValue.asString()),
          };
          Future.microtask(() => streams[streamIndex].controller.add(newValue));
        }
      });
    }
  }

  /// get apps
  static List<FirebaseApp> apps(String? name) {
    return name == null ? Firebase.apps : [Firebase.app(name)];
  }

  /// Fetch string from any firebase apps
  static String getString(String key, {String? appName}) {
    for (var app in apps(appName)) {
      final instance = FirebaseRemoteConfig.instanceFor(app: app);
      final value = instance.getString(key);
      if (value.isNotEmpty) return value;
    }

    return '';
  }

  /// Fetch int from any firebase apps
  static num getNumber(String key, {String? appName}) {
    for (var app in apps(appName)) {
      final instance = FirebaseRemoteConfig.instanceFor(app: app);
      final value = instance.getDouble(key);
      if (value != 0.0) return value;
    }

    return 0;
  }

  /// Fetch bool from any firebase apps
  static bool getBool(String key, {String? appName}) {
    for (var app in apps(appName)) {
      final instance = FirebaseRemoteConfig.instanceFor(app: app);
      final value = instance.getBool(key);
      if (value) return true;
    }

    return false;
  }

  /// Fetch json from any firebase apps
  static Map<String, dynamic> getJson(String key, {String? appName}) {
    for (var app in apps(appName)) {
      final instance = FirebaseRemoteConfig.instanceFor(app: app);
      final value = instance.getValue(key).asString();
      if (value.isNotEmpty) return jsonDecode(value);
    }

    return {};
  }

  /// Stream string values from any firebase projects
  static Stream<String> getStringAsStream(String key, {String? appName}) {
    return _getFrcValueAsStream<String>(
      key,
      FrcValueType.string,
      appName: appName,
    );
  }

  /// Stream number values from any firebase projects
  static Stream<num> getNumberAsStream(String key, {String? appName}) {
    return _getFrcValueAsStream<num>(
      key,
      FrcValueType.number,
      appName: appName,
    );
  }

  /// Stream boolean values from any firebase projects
  static Stream<bool> getBoolAsStream(
    String key, {
    String? appName,
  }) {
    return _getFrcValueAsStream<bool>(
      key,
      FrcValueType.bool,
      appName: appName,
    );
  }

  /// Stream json values from any firebase projects
  static Stream<Map<String, dynamic>> getJsonAsStream(
    String key, {
    String? appName,
  }) {
    return _getFrcValueAsStream<Map<String, dynamic>>(
      key,
      FrcValueType.json,
      appName: appName,
    );
  }

  /// remove and dispose stream
  static Future<void> removeStream(String key) async {
    final streamIndex = streams.indexWhere((e) => e.key == key);
    if (streamIndex == -1) return;

    await streams[streamIndex].controller.close();
    streams.removeAt(streamIndex);
  }

  /// Create firebase options
  static FirebaseOptions options({
    required String apiKey,
    required String appId,
    required String messagingSenderId,
    required String projectId,
    String? authDomain,
    String? databaseURL,
    String? storageBucket,
    String? measurementId,
    // ios specific
    String? trackingId,
    String? deepLinkURLScheme,
    String? androidClientId,
    String? iosClientId,
    String? iosBundleId,
    String? appGroupId,
  }) {
    return FirebaseOptions(
      apiKey: apiKey,
      appId: appId,
      messagingSenderId: messagingSenderId,
      projectId: projectId,
      authDomain: authDomain,
      databaseURL: databaseURL,
      storageBucket: storageBucket,
      measurementId: measurementId,
      trackingId: trackingId,
      deepLinkURLScheme: deepLinkURLScheme,
      androidClientId: androidClientId,
      iosClientId: storageBucket,
      iosBundleId: iosBundleId,
      appGroupId: storageBucket,
    );
  }

  /// generic stream values from any firebase projects
  static Stream<T> _getFrcValueAsStream<T>(
    String key,
    FrcValueType type, {
    String? appName,
  }) {
    for (var app in apps(appName)) {
      // check if app has the key
      final instance = FirebaseRemoteConfig.instanceFor(app: app);
      final isTheOne = instance.getAll().containsKey(key);
      if (!isTheOne) continue;

      // check if the stream already exists
      final streamIndex = streams.indexWhere((e) => e.key == key);
      if (streamIndex != -1) {
        return streams[streamIndex].controller.stream as Stream<T>;
      }

      // create new stream
      final controller = StreamController<T>.broadcast();
      streams.add((
        key: key,
        projectId: app.name,
        controller: controller,
        type: type,
      ));

      // emit the initial value
      Future.microtask(() {
        final rcValue = instance.getValue(key);
        final value = switch (type) {
          FrcValueType.string => rcValue.asString(),
          FrcValueType.number => rcValue.asDouble(),
          FrcValueType.bool => rcValue.asBool(),
          FrcValueType.json => jsonDecode(rcValue.asString()),
        };
        controller.add(value as T);
      });
      break;
    }

    return streams.last.controller.stream as Stream<T>;
  }
}
