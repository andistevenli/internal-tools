import 'package:flutter/material.dart';
import 'package:internal_tools/core/hris/domain/entity/location_model.dart';
import 'package:internal_tools/core/hris/domain/use-case/hris_interactor.dart';
import 'package:internal_tools/feature/di/feature_injector.dart';
import 'package:internal_tools/feature/hris/controller/hris_controller.dart';
import 'package:internal_tools/feature/hris/widget/hris_location_dialog.dart';
import 'package:internal_tools/utils/url.dart';
// import 'package:web_socket_channel/io.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HrisPage extends ConsumerStatefulWidget {
  const HrisPage({super.key});

  static const String routeName = "/hris_page";

  @override
  ConsumerState<HrisPage> createState() => _HrisPageState();
}

class _HrisPageState extends ConsumerState<HrisPage> {
  late final WebViewController controller;
  late final LocationModel locationModel;
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

  void getCurrentLocation() async {
    locationModel = await featureInject<HrisInteractor>().getCurrentLocation();
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(hrisUrl))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) => const Center(
            child: CircularProgressIndicator(),
          ),
          onPageStarted: (url) {},
          onPageFinished: (url) {},
          onWebResourceError: (error) {},
          onUrlChange: (change) {
            if (change.url!.endsWith('/leave')) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return LocationDialog(locationModel: locationModel);
                },
              );
            }
          },
        ),
      );
    // _subscribeToWebSocket();
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
        child: Consumer(
          builder: (context, ref, child) => ref.watch(hrisController).when(
                data: (data) {
                  return WebViewWidget(controller: controller);
                },
                error: (error, stackTrace) => const Center(
                  child: Text("Yah Error Nih"),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
