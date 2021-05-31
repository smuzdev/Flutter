import 'package:flutter/material.dart';

class SharedPreferences extends StatefulWidget {
  const SharedPreferences({Key key}) : super(key: key);

  @override
  _SharedPreferencesState createState() => _SharedPreferencesState();
}

class _SharedPreferencesState extends State<SharedPreferences> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Shared preference'),
      ),
    );
  }
}
