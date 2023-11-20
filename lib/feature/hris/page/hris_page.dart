import 'package:flutter/material.dart';
import 'package:internal_tools/feature/hris/widget/hris_web_view.dart';
import 'package:internal_tools/utils/url.dart';
// import 'package:web_socket_channel/io.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:geolocator/geolocator.dart';

class HrisPage extends StatefulWidget {
  const HrisPage({super.key});

  static const String routeName = "/hris_page";

  @override
  State<HrisPage> createState() => _HrisPageState();
}

class _HrisPageState extends State<HrisPage> {
  late final WebViewController controller;
  // final _channel = IOWebSocketChannel.connect(hrisUrl);

  // void _subscribeToWebSocket() {
  //   _channel.stream.listen(
  //     (message) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(message),
  //         ),
  //       );
  //     },
  //     onError: (error) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(error),
  //         ),
  //       );
  //     },
  //   );
  // }

  Future<void> getCurrentPosition() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      showPositionSnackBar(
          "Longitue : ${position.longitude}\nLatitue : ${position.latitude}");
    } catch (e) {
      throw Exception(e);
    }
  }

  void showPositionSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(hrisUrl));
    // _subscribeToWebSocket();
    getCurrentPosition();
  }

  // @override
  // void dispose() {
  //   _channel.sink.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: HrisWebView(controller: controller),
      ),
    );
  }
}
