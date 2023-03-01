
## Usage
Usage example with PDFView to display cached pdf files.

```dart

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:network_file_cached/network_file_cached.dart';

void main() async {
  await NetworkFileCached.init(
    expired: const Duration(minutes: 5),
  );
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
        body: FutureBuilder(
            future: NetworkFileCached.downloadFile(uri),
            builder: (context, snapshoot) {
              if (snapshoot.hasData) {
                return PDFView(
                  pdfData: snapshoot.data?.readAsBytesSync(),
                );
              }
              if (snapshoot.hasError) {
                return Text(snapshoot.error.toString());
              }
              return const Text('LOADING...');
            }));
  }
}
