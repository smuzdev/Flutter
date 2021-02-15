import 'IComputerGame.dart';
import 'GameFactory.dart';

class Game extends GameFactory implements IComputerGame {
  Game(name, genre, year) : super(name, genre, year);

  @override
  void win() {
    print("Victory! You're God!");
  }

  @override
  void lose() {
    print("Game over...");
  }

  @override
  void printName() {
    super.printName();
  }

  @override
  void printGenre() {
    super.printGenre();
  }

  @override
  void printYear() {
    super.printYear();
  }

  @override
  void play() {
    print("Try again! You will win!");
  }

  @override
  void quit() {
    print("Go to sleep...");
  }
}
