class ComputerGame {
  int id;
  String name;
  String genre;
  int year;

  ComputerGame(this.id, this.name, this.genre, this.year);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
      'genre': genre,
      'year': year,
    };
    return map;
  }

  ComputerGame.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    genre = map['genre'];
    year = map['year'];
  }
}
