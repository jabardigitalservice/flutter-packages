import 'package:dio/dio.dart';
import 'package:network_file_cached/src/utils.dart';
import 'package:path_provider/path_provider.dart';

class Network {
  static Future<void> downloadPDFFile(String urlPath,
      {void Function(int, int)? onReceiveProgress}) async {
    String savePath = await _getFilePath('${Utils.getRandomString()}.pdf');
    _downloadFile(urlPath, savePath, onReceiveProgress: onReceiveProgress);
  }

  static Future<void> _downloadFile(String urlPath, String savePath,
      {void Function(int, int)? onReceiveProgress}) async {
    Dio dio = Dio();

    dio.download(
      urlPath,
      savePath,
      onReceiveProgress: onReceiveProgress,
      deleteOnError: true,
    );
  }

  static Future<String> _getFilePath(uniqueFileName) async {
    final directory = await getTemporaryDirectory();

    return '${directory.path}/$uniqueFileName';
  }
}
