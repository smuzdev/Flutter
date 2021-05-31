import 'package:flutter/material.dart';
import 'package:lab07_08/presentation/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Computer Games',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

