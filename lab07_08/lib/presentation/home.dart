import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lab07_08/presentation/file_system.dart';
import 'package:lab07_08/presentation/hive_db.dart';
import 'package:lab07_08/presentation/shared_preferences.dart';
import 'package:lab07_08/presentation/sqflite.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    SQFLite(),
    SharedPreferences(),
    FileSystem(),
    HiveDatabase(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar,
      body: _widgetOptions.elementAt(_currentIndex),
    );
  }

  BottomNavigationBar get bottomNavigationBar {
    return BottomNavigationBar(
      backgroundColor: Color(0xFFF5F5F5),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xFF00A693),
      elevation: 1.0,
      unselectedItemColor: Colors.black54,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/files.svg',
            color: Color(0xFF00A693),
            width: 24.0,
          ),
          label: 'SQFLite',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/server.svg',
            color: Color(0xFF00A693),
            width: 24.0,
          ),
          label: 'Shared Prefs',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/system.svg',
            color: Color(0xFF00A693),
            width: 24.0,
          ),
          label: 'File System',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/hive.svg',
            color: Color(0xFF00A693),
            width: 24.0,
          ),
          label: 'Hive',
        ),
      ],
      onTap: _onItemTapped,
    );
  }
}
