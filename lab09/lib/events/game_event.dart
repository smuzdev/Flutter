import 'package:lab09/model/game.dart';

enum EventType { add, delete }

class GameEvent {
  Game game;
  int gameIndex;
  EventType eventType;

  GameEvent();

  GameEvent.add(Game game) {
    this.eventType = EventType.add;
    this.game = game;
  }

  GameEvent.delete(int index) {
    this.eventType = EventType.delete;
    this.gameIndex = index;
  }
}
