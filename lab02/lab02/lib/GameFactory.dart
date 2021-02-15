abstract class GameFactory {
  GameFactory(this._name, this._genre, this._year);

  String _name;
  String _genre;
  int _year;

  String get name => _name;

  String get genre => genre;

  int get year => year;

  void printName() {
    print(_name.toString());
  }

  void printGenre() {
    print(_genre.toString());
  }

  void printYear() {
    print(_year.toString());
  }

  void win();

  void lose();
}
