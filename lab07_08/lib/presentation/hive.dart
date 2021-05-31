import 'package:flutter/material.dart';

class Hive extends StatefulWidget {
  const Hive({Key key}) : super(key: key);

  @override
  _HiveState createState() => _HiveState();
}

class _HiveState extends State<Hive> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Hive'),
      ),
    );
  }
}
