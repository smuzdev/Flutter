abstract class WarriorFactory {
  String _name;
  String _guild;
  String _weapon;
  static int squadMembersCount = 5;

  //region Getters and Setters
  String get name => _name;

  set name(String name) => _name = name;

  String get guild => _guild;

  set guild(String guild) => _guild = guild;

  String get weapon => _weapon;

  set weapon(String weapon) => _weapon = weapon;

  //endregion

  //region Constructors
  WarriorFactory(this._name, this._guild, this._weapon);

  WarriorFactory.undefined() {
    _name = "undefined";
    _guild = "undefined";
    _weapon = "undefined";
  }

  WarriorFactory.baseWarrior(String name) {
    _name = name;
    _guild = "no guild";
    _weapon = "no weapon";
  }

  WarriorFactory.mixin(String name, String guild) {
    _name = name;
    _guild = guild;
  }

  //endregion

  // Abstract methods
  void win();

  void lose();

  void printName() {
    print("Warrior name: " + _name.toString());
  }

  void printGuild() {
    print("Warrior guild: " + _guild.toString());
  }

  void printWeapon() {
    print("Warrior weapon: " + _weapon.toString());
  }
}
