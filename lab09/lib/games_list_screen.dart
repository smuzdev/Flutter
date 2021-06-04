import 'package:flutter/material.dart';

import 'GamesList.dart';

class GamesListScreen extends StatelessWidget {
  const GamesListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Games List'),
        centerTitle: true,
      ),
      body: GamesList(),
    );
  }
}
