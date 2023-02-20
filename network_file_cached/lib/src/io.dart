import 'dart:io';

import 'package:dio/dio.dart';
import 'package:network_file_cached/utils.dart';
import 'package:path_provider/path_provider.dart';

import 'mime.dart';

class IO {
  static Future<File> downloadFile(String urlPath,
      {void Function(int, int)? onReceiveProgress}) async {
    Dio dio = Dio();

    String savePath = await getFilePath('${Utils.getRandomString()}.tmp');

    await dio.download(
      urlPath,
      savePath,
      onReceiveProgress: onReceiveProgress,
      deleteOnError: true,
    );
    return await Mime.changeExtensionFile(savePath);
  }

  static Future<String> getFilePath(uniqueFileName) async {
    final directory = await getTemporaryDirectory();

    return '${directory.path}/$uniqueFileName';
  }
}
