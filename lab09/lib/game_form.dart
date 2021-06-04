import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab09/bloc/game_bloc.dart';
import 'package:lab09/events/game_event.dart';

import 'GamesList.dart';
import 'games_list_screen.dart';
import 'model/game.dart';

class GameForm extends StatefulWidget {
  @override
  _GameFormState createState() => _GameFormState();
}

class _GameFormState extends State<GameForm> {
  String _gameName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter BLoC'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(36.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Games',
                style: TextStyle(
                  fontSize: 42.0,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Game',
                ),
                style: TextStyle(
                  fontSize: 22.0,
                ),
                onChanged: (text) {
                  setState(() {
                    _gameName = text;
                  });
                },
              ),
              GamesList(),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'button1',
            child: Icon(
              Icons.save,
            ),
            onPressed: () {
              BlocProvider.of<GameBloc>(context).add(
                GameEvent.add(
                  Game(_gameName),
                ),
              );
            },
          ),
          SizedBox(
            height: 16.0,
          ),
          FloatingActionButton(
            heroTag: 'button2',
            child: Icon(
              Icons.navigate_next,
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GamesListScreen()),
            ),
          ),
        ],
      ),
    );
  }
}
