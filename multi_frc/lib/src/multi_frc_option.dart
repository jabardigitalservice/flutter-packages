import 'package:firebase_core/firebase_core.dart';

class MultiFrcOption {
  MultiFrcOption({this.android, this.ios, this.web});
  final FirebaseOptions? android;
  final FirebaseOptions? ios;
  final FirebaseOptions? web;
}
