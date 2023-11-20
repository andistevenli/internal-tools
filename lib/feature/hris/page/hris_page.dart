import 'package:flutter/material.dart';
import 'package:internal_tools/feature/hris/widget/hris_web_view.dart';
import 'package:internal_tools/utils/url.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HrisPage extends StatefulWidget {
  const HrisPage({super.key});

  static const String routeName = "/hris_page";

  @override
  State<HrisPage> createState() => _HrisPageState();
}

class _HrisPageState extends State<HrisPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(hrisUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: HrisWebView(controller: controller),
      ),
    );
  }
}
