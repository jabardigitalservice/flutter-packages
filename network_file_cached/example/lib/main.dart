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
  bool downloading = false;
  String progress = '0';
  bool isDownloaded = false;

  String uri = 'https://s.id/1zvyC';

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: FutureBuilder(
    //     future: Mime.readFile(),
    //     builder: (context, snapshoot) {
    //       if (snapshoot.hasData) {
    //         return Center(
    //           child: Text(snapshoot.data.toString()),
    //         );
    //       }
    //       return const Center(
    //         child: Text('Loading ...'),
    //       );
    //     },
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example apps'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('$progress%'),
              isDownloaded
                  ? const Text(
                      'File Downloaded to cache directory!',
                    )
                  : const Text(
                      'Click the FloatingActionButton to start Downloading!'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () async {
            await NetworkPDFCached.load(uri, onReceiveProgress: (rcv, total) {
              print(
                  'received: ${rcv.toStringAsFixed(0)} out of total: ${total.toStringAsFixed(0)}');

              setState(() {
                progress = ((rcv / total) * 100).toStringAsFixed(0);
              });

              if (progress == '100') {
                setState(() {
                  isDownloaded = true;
                });
              } else if (double.parse(progress) < 100) {}
            }).then((value) => setState(() {
                  if (progress == '100') {
                    isDownloaded = true;
                  }

                  downloading = false;
                }));
          }),
    );
  }
}
