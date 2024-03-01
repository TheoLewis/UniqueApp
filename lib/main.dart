import 'package:flutter/material.dart';
import 'package:uniquepartners/App/Globals.dart';
import 'Views/HomeView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unique Partners',
      home: HomeView(),
      navigatorKey: Globals.navigatorKey,
    );
  }
}
