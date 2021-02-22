import 'package:flutter/material.dart';
import 'package:lab02/WarriorFactory.dart';
import 'Archer.dart';

void main() {
  runApp(MyApp());

  //region Constructors
  print("GENERAL CONSTRUCTOR");
  var finn = Archer("Finn", "The Bull's eye", "Enchanted Bow");
  finn.printName();
  finn.printGuild();
  finn.printWeapon();

  print("NAMED CONSTRUCTOR (WITHOUT PARAMETERS)");
  var undefined = Archer.undefined();
  undefined.printName();
  undefined.printGuild();
  undefined.printWeapon();

  print("SETTING NEW DATA");
  undefined.name = "Bob";
  undefined.guild = "Aiming for the Hat";
  undefined.weapon = "Standard Bow";
  undefined.printName();
  undefined.printGuild();
  undefined.printWeapon();

  print("NAMED CONSTRUCTOR (WITHOUT 1 PARAMETER)");
  var jabez = Archer.baseWarrior("Jabez");
  jabez.printName();
  jabez.printGuild();
  jabez.printWeapon();
  //endregion

  //region Methods
  print("INTERFACE IMPLEMENTATION");
  finn.fight();
  finn.befriend();
  print("ABSTRACT CLASS IMPLEMENTATION");
  finn.win();
  finn.lose();
  //endregion

  //region Arrays
  print("ARRAYS");
  var let = ["Archer", "Swordsman", "Magician"];
  let.add("Spook");
  if (let.isNotEmpty) {
    for (var s in let) {
      print(s);
    }

    print("The first warrior in array is " + let.first);
    print("The last warrior in array is " + let.last);
  } else {
    print("Array is empty.");
  }
  //endregion

  //region Numerous
  print("COLLECTIONS");
  Set<Archer> archers = {undefined, jabez};
  var eddy = Archer("Eddy", "The Bull's eye", "Standard Bow");
  var maoris = Archer("Maoris", "The Bull's eye", "Big Bow");
  var tandi = Archer("Tandi", "The Bull's eye", "Standard Bow");

  archers.add(eddy);
  archers.add(maoris);
  archers.add(tandi);

  if (archers.isNotEmpty) {
    archers.remove(archers.first);
    for (var archer in archers) {
      print(archer.toString());
    }
    //archers.clear();
  } else {
    print("Collection is empty.");
  }

  print("UNION");
  Set<Archer> archers1 = {finn};
  var unionCollection = archers1.union(archers);

  for (var union in unionCollection) {
    print(union.toString());
  }
  //endregion

  //region Collection
  var guildsMembers = {"The Bull's eye": "Finn", "Aiming for the Hat": "Bob"};

  var count = guildsMembers.length;
  print("Guilds members count is $count");
  print(guildsMembers.entries);
  var isContains = guildsMembers.containsValue("Finn");
  print("Contains value: $isContains");
  guildsMembers.remove("Aiming for the Hat");
  print(guildsMembers.entries);
  //endregion

  //region Functions
  // Without parameters
  int checkArchersCount() {
    return unionCollection.length;
  }

  //Function as parameter
  void archersSquad(Function fun) {
    fun();
    if (count < WarriorFactory.squadMembersCount) {
      print("The squad is too small");
    } else if (count == WarriorFactory.squadMembersCount) {
      print("Awesome squad!");
    } else {
      print("The squad it too big.");
    }
  }

  //Named parameter
  void funWithNamedArg({String name = "Gerda"}) {
    print(name);
  }

  //Optional parameter
  void showArcher(String name, String guild, [String weapon = "Standard bow"]) {
    print("Name: $name \t Guild: $guild \t Weapon: $weapon");
  }

  var archersCount = checkArchersCount();
  print("Archers count is $archersCount");
  archersSquad(checkArchersCount);
  funWithNamedArg();
  showArcher("Micki", "Young Archers");
  //endregion

  //region Continue and Break
  int i = 0;
  while (i < 3) {
    i++;
    print(i);
  }

  print('----');
  while (true) {
    i++;
    if (i > 7) {
      break;
    }
    if (i == 5) {
      continue;
    }
    print(i);
  }

  //endregion

  //region Try Catch
  try {
    int x = 5;
    int y = 0;
    int z = x ~/ y;

    print(z);
  } catch (e) {
    print("Exception $e");
  } finally {
    print("Finally block");
  }
  print("Completion");

  //endregion
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
