import 'package:flutter/material.dart';
import 'package:network_file_cached/network_file_cached.dart';

void main() {
  runApp(
    const MaterialApp(
      home: FileCache(),
    ),
  );
}

class FileCache extends StatefulWidget {
  const FileCache({super.key});

  @override
  State<FileCache> createState() => _FileCacheState();
}

class _FileCacheState extends State<FileCache> {
  String uri = 'https://s.id/1zvyC';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example apps'),
        ),
        body: NetworkPDFCached(filePath: uri));
  }
}
