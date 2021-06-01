import 'dart:convert';

import 'package:lab07_08/model/computer_game.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPHelper {
  Future<ComputerGame> create(ComputerGame computerGame) async {
    final prefs = await SharedPreferences.getInstance();
    final res = await prefs.setString(computerGame.id, jsonEncode(computerGame.toMap()));
    return res ? computerGame : Future.error("Failed to create game.");
  }

  Future<List<ComputerGame>> readAll() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getKeys().map((e) {
      var json = prefs.getString(e);
      return ComputerGame.fromMap(jsonDecode(json));
    }).toList();
  }

  delete(String id) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove(id);
  }

}