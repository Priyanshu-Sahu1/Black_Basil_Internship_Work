//import 'package:admin_flutter_project/screen/dashboard_screen.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend_code_snippet/screen/dashboard_screen.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }

  void loadData() async {
    var data = await rootBundle.loadString('http://127.0.0.1:7777/totaluser');
    print(data);
  }
}
