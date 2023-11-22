import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internal_tools/core/hris/data/di/data_injector.dart';
import 'package:internal_tools/core/hris/domain/di/domain_injector.dart';
import 'package:internal_tools/feature/di/feature_injector.dart';
import 'package:internal_tools/feature/hris/page/hris_page.dart';

void main() {
  setupDataInjector();
  setupDomainInjector();
  setupFeatureInjector();
  runApp(
    const ProviderScope(
      child: MyInternalTools(),
    ),
  );
}

class MyInternalTools extends StatelessWidget {
  const MyInternalTools({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "HRIS",
      debugShowCheckedModeBanner: false,
      initialRoute: HrisPage.routeName,
      routes: {HrisPage.routeName: (context) => const HrisPage()},
    );
  }
}
