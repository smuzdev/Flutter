import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lab07_08/presentation/home.dart';
import 'package:sqflite/sqflite.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getDatabasesPath();
  Hive.init(appDocumentDir);
  //Hive.registerAdapter(ComputerGameAdapter());
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

