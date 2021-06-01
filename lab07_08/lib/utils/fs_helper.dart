import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:lab07_08/model/computer_game.dart';
import 'package:path_provider/path_provider.dart';

class FSHelper {
  List<ComputerGame> _computerGames;

  Future<List<ComputerGame>> get computerGames async {
    if (_computerGames != null) {
      return _computerGames;
    }
    _computerGames = await _initFS();
    return _computerGames;
  }

  _initFS() async {
    var path = join((await getApplicationSupportDirectory()).path, "data.json");
    var file = File(path);
    if (file.existsSync()) {
      Iterable json = jsonDecode(file.readAsStringSync());
      return json.map((e) => ComputerGame.fromMap(e)).toList();
    } else {
      file.create();
      var foods = List<ComputerGame>.empty(growable: true);
      _flush();
      return foods;
    }
  }

  _flush() async {
    var path = join((await getApplicationSupportDirectory()).path, "data.json");
    var file = File(path);
    var listFoodMap = _computerGames.map((e) => e.toMap()).toList();
    file.writeAsString(jsonEncode(listFoodMap));
  }

  Future<ComputerGame> insert(ComputerGame food) async {
    (await computerGames).add(food);
    _flush();
    return food;
  }

  delete(String id) async {
    (await computerGames).removeWhere((element) => element.id == id);
    _flush();
  }

  Future<List<ComputerGame>> readAll() async {
    return await computerGames;
  }
}


