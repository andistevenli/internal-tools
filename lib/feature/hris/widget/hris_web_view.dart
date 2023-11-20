import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HrisWebView extends StatefulWidget {
  final WebViewController controller;

  const HrisWebView({
    super.key,
    required this.controller,
  });

  @override
  State<HrisWebView> createState() => _HrisWebViewState();
}

class _HrisWebViewState extends State<HrisWebView> {
  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: widget.controller);
  }
}
