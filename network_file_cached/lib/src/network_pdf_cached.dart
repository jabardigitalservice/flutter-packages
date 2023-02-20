import 'dart:io';

import 'io.dart';

class NetworkPDFCached {
  static Future<File> load(String url,
  {void Function(int, int)? onReceiveProgress}) async {
    return await IO.downloadFile(url, onReceiveProgress: onReceiveProgress);
  }
}
