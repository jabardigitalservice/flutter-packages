import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:network_file_cached/network_file_cached.dart';

void main() async {
  await NetworkFileCached.init(
    expired: const Duration(seconds: 5),
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
  Future<File>? file;

  @override
  void initState() {
    super.initState();
    file = getFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example apps'),
        ),
        body: FutureBuilder(
            future: file,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return PDFView(
                  pdfData: snapshot.data?.readAsBytesSync(),
                );
              }
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return const Text('LOADING...');
            }));
  }

  Future<File> getFile() {
    return NetworkFileCached.downloadFile(uri);
  }
}
