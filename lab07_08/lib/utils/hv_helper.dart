import 'package:hive/hive.dart';
import 'package:lab07_08/model/computer_game.dart';

class HVHelper {
  Future<Box> get box async {
    return await Hive.openBox<ComputerGame>("computer_game_box");
  }

  Future<ComputerGame> insert(ComputerGame computerGame) async {
    var hive = await box;
    hive.put(computerGame.id, computerGame);
    return computerGame;
  }

  Future<List<ComputerGame>> readAll() async {
    var hive = await box;
    return List<ComputerGame>.from(hive.values);
  }

  delete(String uuid) async {
    var hive = await box;
    hive.delete(uuid);
  }
}