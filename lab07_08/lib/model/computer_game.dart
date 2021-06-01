import 'package:hive/hive.dart';
//part 'computer_game.g.dart';

@HiveType(typeId: 0)
class ComputerGame extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String genre;
  @HiveField(3)
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
