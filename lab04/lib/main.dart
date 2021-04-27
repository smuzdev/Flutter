import 'package:flutter/material.dart';
import 'package:lab04/constants.dart';

import 'screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Skateboard Shop',
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(bodyColor: greyTextColor ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      );
  }
}