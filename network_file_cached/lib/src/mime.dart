import 'dart:io';

import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;

import 'db.dart';

class Mime {
  static Future<String> changeExtensionFile(String tmpPathFile) async {
    File data = File(tmpPathFile);
    final mime = lookupMimeType('temp', headerBytes: await data.readAsBytes());
    final ext = _getExtensionsFromType(mime);
    if (ext != null) {
      String dir = path.dirname(data.path);
      String newPath =
          path.join(dir, path.basenameWithoutExtension(data.path) + ext);
      await data.rename(newPath);
      return newPath;
    }
    return tmpPathFile;
  }

  static String? _getExtensionsFromType(String? type) {
    if (type == null || type.isEmpty) return null;

    if (database.containsKey(type)) {
      return database[type];
    }

    return null;
  }
}
