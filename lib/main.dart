import 'package:flutter/material.dart';
import 'package:internal_tools/feature/hris/page/hris_page.dart';

void main() {
  runApp(const MyInternalTools());
}

class MyInternalTools extends StatelessWidget {
  const MyInternalTools({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "HRIS",
      debugShowCheckedModeBanner: false,
      initialRoute: HrisPage.routeName,
      routes: {
        HrisPage.routeName: (context) => const HrisPage()
      },
    );
  }
}