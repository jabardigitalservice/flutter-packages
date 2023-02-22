import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'io.dart';

class NetworkPDFCached extends StatefulWidget {
  const NetworkPDFCached({
    Key? key,
    required this.filePath,
    this.onViewCreated,
    this.onRender,
    this.onPageChanged,
    this.onError,
    this.onPageError,
    this.onLinkHandler,
    this.gestureRecognizers,
    this.enableSwipe = true,
    this.swipeHorizontal = false,
    this.password,
    this.nightMode = false,
    this.autoSpacing = true,
    this.pageFling = true,
    this.pageSnap = true,
    this.fitEachPage = true,
    this.defaultPage = 0,
    this.fitPolicy = FitPolicy.WIDTH,
    this.preventLinkNavigation = false,
  }) : super(key: key);

  @override
  State<NetworkPDFCached> createState() => _NetworkPDFCachedState();

  final String filePath;

  final bool enableSwipe;
  final bool swipeHorizontal;
  final String? password;
  final bool nightMode;
  final bool autoSpacing;
  final bool pageFling;
  final bool pageSnap;
  final int defaultPage;
  final FitPolicy fitPolicy;
  final bool fitEachPage;
  final bool preventLinkNavigation;

  final PDFViewCreatedCallback? onViewCreated;
  final RenderCallback? onRender;
  final PageChangedCallback? onPageChanged;
  final ErrorCallback? onError;
  final PageErrorCallback? onPageError;
  final LinkHandlerCallback? onLinkHandler;

  final Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers;
}

class _NetworkPDFCachedState extends State<NetworkPDFCached> {
  bool downloading = false;
  double progress = 0;
  bool isDownloaded = false;
  String path = '';
  String errorMessage = '';

  @override
  void initState() {
    load(widget.filePath);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return errorMessage.isNotEmpty
        ? Center(
            child: Text(errorMessage),
          )
        : path.isEmpty
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
                filePath: path,
                enableSwipe: widget.enableSwipe,
                swipeHorizontal: widget.swipeHorizontal,
                password: widget.password,
                nightMode: widget.nightMode,
                autoSpacing: widget.autoSpacing,
                pageFling: widget.pageFling,
                pageSnap: widget.pageSnap,
                defaultPage: widget.defaultPage,
                fitPolicy: widget.fitPolicy,
                fitEachPage: widget.fitEachPage,
                preventLinkNavigation: widget.preventLinkNavigation,
                onRender: widget.onRender,
                onError: widget.onError,
                onPageError: widget.onPageError,
                onViewCreated: widget.onViewCreated,
                onLinkHandler: widget.onLinkHandler,
                onPageChanged: widget.onPageChanged,
                gestureRecognizers: widget.gestureRecognizers,
              );
  }

  Future<String> load(String url) async {
    path = await IO.downloadFile(url, onReceiveProgress: (rcv, total) {
      setState(() {
        progress = ((rcv / total) * 100);
      });
    }).onError((error, stackTrace) {
      setState(() {
        errorMessage = error.toString();
      });
      return '';
    });
    setState(() {});
    return path;
  }
}
