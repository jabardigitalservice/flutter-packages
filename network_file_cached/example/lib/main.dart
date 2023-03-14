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

class FileCache extends StatelessWidget {
  const FileCache({super.key});

  final String url = 'https://s.id/1zvyC';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example apps'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FileCacheSample(url: url),
                  ),
                );
              },
              child: const Text('Sample PDF View'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FileCacheLoadingIndicator(url: url),
                  ),
                );
              },
              child: const Text('PDF View With Loading Indicator'),
            )
          ],
        ),
      ),
    );
  }
}

class FileCacheSample extends StatefulWidget {
  const FileCacheSample({super.key, required this.url});

  final String url;

  @override
  State<FileCacheSample> createState() => _FileCacheSampleState();
}

class _FileCacheSampleState extends State<FileCacheSample> {
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
        },
      ),
    );
  }

  Future<File> getFile() {
    return NetworkFileCached.downloadFile(widget.url);
  }
}

class FileCacheLoadingIndicator extends StatefulWidget {
  const FileCacheLoadingIndicator({super.key, required this.url});

  final String url;

  @override
  State<FileCacheLoadingIndicator> createState() =>
      _FileCacheLoadingIndicatorState();
}

class _FileCacheLoadingIndicatorState extends State<FileCacheLoadingIndicator> {
  bool downloading = false;
  double progress = 0;
  bool isDownloaded = false;
  File? file;
  String errorMessage = '';

  @override
  void initState() {
    load(widget.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example apps'),
      ),
      body: errorMessage.isNotEmpty
          ? Center(
              child: Text(errorMessage),
            )
          : file == null
              ? Center(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      CircularProgressIndicator(
                        value: (progress == 0) ? null : progress / 100,
                      ),
                      if (progress != 0)
                        Text(
                          progress.toStringAsFixed(0),
                          style: const TextStyle(fontSize: 12),
                        )
                    ],
                  ),
                )
              : PDFView(
                  pdfData: file!.readAsBytesSync(),
                ),
    );
  }

  Future<void> load(String url) async {
    await NetworkFileCached.downloadFile(url, onReceiveProgress: (rcv, total) {
      setState(() {
        progress = ((rcv / total) * 100);
      });
    }).then((value) {
      setState(() {
        file = value;
      });
    }).onError((error, stackTrace) {
      setState(() {
        errorMessage = error.toString();
      });
      throw Exception(error);
    });
  }
}
