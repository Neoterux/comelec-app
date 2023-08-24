import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:comelec/common/pages/bottom_nav_bar_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool isDeviceConfigured, hasAccountAccess;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      builder: (context, child) => Material(child: child),
      routes: {
        "/": (ctx) => const BottomNavBarPage(),
      },
    );
  }
}
