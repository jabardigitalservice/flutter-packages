import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:network_file_cached/src/io.dart';
import 'package:network_file_cached/src/record.dart';
import 'package:path_provider/path_provider.dart';

/// Download file from network with caching functionality
class NetworkFileCached {
  NetworkFileCached._internal(this._expired);

  /// TAG for logging
  static const String TAG = 'NetworkFileCached';

  /// The duration of the file to be cached before being updated
  final Duration _expired;

  /// Provide the [_url] for the file to cache
  static late String _url;

  /// Model helper for cached files
  static CacheRecord? _record;

  /// Boxes contain all of cache data
  static Box? _box;

  /// The [NetworkFileCached] for this current instance.
  static NetworkFileCached? _instance;

  /// Returns an instance using the default [NetworkFileCached].
  static NetworkFileCached get instance {
    if (_instance == null) {
      throw Exception(
          'NetworkFileCached must be initialized first. \nNetworkFileCached.init()');
    }
    return _instance!;
  }

  /// Initialize [NetworkFileCached] by giving it a expired duration.
  static Future<NetworkFileCached> init(
      {Duration expired = const Duration(hours: 12)}) async {
    assert(!expired.isNegative);

    WidgetsFlutterBinding.ensureInitialized();

    var cahceDir = await getTemporaryDirectory();

    Hive.init(cahceDir.path);
    Hive.registerAdapter(CacheRecordAdapter());
    _box = await Hive.openBox('NetworkFileCached');
    _instance = NetworkFileCached._internal(expired);
    return _instance!;
  }

  /// Download the file with default http method is "GET",
  /// [url] is the file url.
  /// [onReceiveProgress] is the callback to listen downloading progress.
  static Future<File> downloadFile(String url,
      {void Function(int, int)? onReceiveProgress}) async {
    if (_instance == null) {
      throw Exception(
          'NetworkFileCached must be initialized first. \nNetworkFileCached.init()');
    }

    _url = url;

    _record = _box?.get(url);

    if (_record == null) {
      debugPrint('$TAG = Downloading... Create a new cache');
      await instance._downloadAndPut(onReceiveProgress);
      debugPrint('$TAG = New cache has been created');
    } else if (_record != null &&
        _record!.createdAt.add(instance._expired).isBefore(DateTime.now())) {
      await instance._deleteCache();
    }

    debugPrint('$TAG = Cache loaded');

    return File(_record!.path);
  }

  /// Download the file and save it in local.
  /// Put meta data to box.
  Future<void> _downloadAndPut(
      void Function(int, int)? onReceiveProgress) async {
    String path =
        await IO.downloadFile(_url, onReceiveProgress: onReceiveProgress);
    _record = CacheRecord(_url, path, DateTime.now());
    _box?.put(_url, _record);
  }

  /// Delete the local file and meta data record from box.
  Future<void> _deleteCache() async {
    debugPrint('$TAG = Some cache has expired, update cache');
    CacheRecord oldValue = _box?.get(_url);
    _box?.delete(_url);
    await _downloadAndPut(null);
    try {
      await File(oldValue.path).delete();
      debugPrint('$TAG = Cache has been updated, old cache deleted');
    } catch (e) {
      debugPrint('$TAG = ${e.toString()}');
    }
  }

  /// Closes the box.
  static Future<void> close() async {
    await Hive.close();
  }
}
