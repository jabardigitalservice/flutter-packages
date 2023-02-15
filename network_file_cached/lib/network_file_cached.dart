import 'package:flutter/material.dart';
import 'package:network_file_cached/src/network.dart';

class PDFCache extends StatefulWidget {
  const PDFCache({super.key});

  @override
  State<PDFCache> createState() => _PDFCacheState();
}

class _PDFCacheState extends State<PDFCache> {
  bool downloading = false;
  String progress = '0';
  bool isDownloaded = false;

  String uri =
      'https://file-examples.com/storage/fe1aa0c9d563ea1e4a1fd34/2017/10/file-example_PDF_1MB.pdf';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('$progress%'),
              isDownloaded
                  ? Text(
                      'File Downloaded to cache directory!',
                    )
                  : Text(
                      'Click the FloatingActionButton to start Downloading!'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () async {
            await Network.downloadPDFFile(uri, onReceiveProgress: (rcv, total) {
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
