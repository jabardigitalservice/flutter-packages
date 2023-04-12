import 'package:firebase_core/firebase_core.dart';

class FirebaseConfig {
  final String? name;
  final FirebaseOptions? options;
  final bool isReleaseCrashlyticsCollectionEnabled;
  final bool isDebugCrashlyticsCollectionEnabled;

  FirebaseConfig({
    this.name,
    this.options,
    this.isDebugCrashlyticsCollectionEnabled = false,
    this.isReleaseCrashlyticsCollectionEnabled = true,
  });
}
