import 'package:flutter/material.dart';

import 'PlatformMethodChannalScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Platform Method Channal',
      debugShowCheckedModeBanner: false,
      home: PlatformPage(),
      theme: ThemeData(fontFamily: 'CynthoNext'),
    );
  }
}
