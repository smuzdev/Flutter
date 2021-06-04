import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab09/bloc/game_bloc.dart';
import 'package:lab09/events/game_event.dart';

import 'model/game.dart';

class GamesList extends StatelessWidget {
  const GamesList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: BlocConsumer<GameBloc, List<Game>>(
        buildWhen: (List<Game> previous, List<Game> current) {
            return true;
        },
        listenWhen: (List<Game> previous, List<Game> current) {
          if (current.length > previous.length) {
            return true;
          } else {
            return false;
          }
        },
        builder: (context, gamesList) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.all(16.0),
            itemCount: gamesList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(gamesList[index].name),
                  onTap: () => BlocProvider.of<GameBloc>(context)
                      .add(GameEvent.delete(index)),
                ),
              );
            },
          );
        },
        listener: (BuildContext context, gamesList) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('Added'),
            ),
          );
        },
      ),
    );
  }
}
