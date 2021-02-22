import 'IComputerGame.dart';
import 'WarriorFactory.dart';

class Archer extends WarriorFactory implements IComputerGame {
  Archer(name, guild, weapon) : super(name, guild, weapon);

  Archer.undefined() : super.undefined();

  Archer.baseWarrior(name) : super.baseWarrior(name);

  @override
  void fight() {
    print("Archer $name will stab you with arrows of his $weapon!");
  }

  @override
  void befriend() {
    print("Archer $name offers to join the guild '$guild'");
  }

  @override
  void win() {
    print("Victory! It was too easy!");
  }

  @override
  void lose() {
    print("Today is not my day...");
  }

  @override
  void printName() {
    super.printName();
  }

  @override
  void printGuild() {
    super.printGuild();
  }

  @override
  void printWeapon() {
    super.printWeapon();
  }

  @override
  String toString() {
    return "Name: " +
        name.toString() +
        "\t" +
        "Guild: " +
        guild.toString() +
        "\t" +
        "Weapon: " +
        weapon.toString();
  }
}
