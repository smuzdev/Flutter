import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab09/events/game_event.dart';
import 'package:lab09/model/game.dart';

class GameBloc extends Bloc<GameEvent, List<Game>> {

  @override
  List<Game> get initialState => List<Game>();

  @override
  Stream<List<Game>> mapEventToState(GameEvent event) async* {
    switch (event.eventType) {
      case EventType.add:
        List<Game> newState = List.from(state);
        if (event.game != null) {
          newState.add(event.game);
        }
        yield newState;
        break;
      case EventType.delete:
        List<Game> newState = List.from(state);
        newState.removeAt(event.gameIndex);
        yield newState;
        break;
      default:
        throw Exception('Event not found $event');
    }
  }
}
