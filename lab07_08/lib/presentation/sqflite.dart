import 'package:flutter/material.dart';

import '../model/computer_game.dart';
import '../utils/db_helper.dart';

class SQFLite extends StatefulWidget {
  const SQFLite({Key key}) : super(key: key);

  @override
  _SQFLiteState createState() => _SQFLiteState();
}

class _SQFLiteState extends State<SQFLite> {
  Future<List<ComputerGame>> computerGames;
  TextEditingController nameController = TextEditingController();
  TextEditingController genreController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  String name;
  String genre;
  String year;
  int currentId;

  final formKey = new GlobalKey<FormState>();
  var dbHelper;
  bool isUpdating;

  void initState() {
    super.initState();
    dbHelper = DBHelper();
    isUpdating = false;
    refreshList();
  }

  refreshList() {
    setState(() {
      computerGames = dbHelper.getComputerGames();
    });
  }

  clearFields() {
    nameController.text = '';
    genreController.text = '';
    yearController.text = '';
  }

  validate() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      if (isUpdating) {
        ComputerGame computerGame = ComputerGame(currentId, name, genre, int.parse(year));
        dbHelper.update(computerGame);
        setState(() {
          isUpdating = false;
        });
      } else {
        ComputerGame computerGame = ComputerGame(null, name, genre, int.parse(year));
        dbHelper.save(computerGame);
      }
      clearFields();
      refreshList();
    }
  }

  form() {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            TextFormField(
              controller: nameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (val) => val.length == 0 ? 'Enter Name' : null,
              onSaved: (val) => name = val,
            ),
            TextFormField(
              controller: genreController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Genre'),
              validator: (val) => val.length == 0 ? 'Enter Genre' : null,
              onSaved: (val) => genre = val,
            ),
            TextFormField(
              controller: yearController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Year'),
              validator: (val) => val.length == 0 ? 'Enter Year' : null,
              onSaved: (val) => year = val,
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // ignore: deprecated_member_use
                FlatButton(
                  color: Color(0xFF00A693),
                  onPressed: validate,
                  child: Text(
                    isUpdating ? 'UPDATE' : 'ADD',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                // ignore: deprecated_member_use
                FlatButton(
                  color: Colors.red,
                  onPressed: () {
                    setState(() {
                      isUpdating = false;
                      clearFields();
                    });
                  },
                  child: Text(
                    'CANCEL',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView dataTable(List<ComputerGame> computerGames) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
          columns: [
            DataColumn(
              label: Text('NAME'),
            ),
            DataColumn(
              label: Text('GENRE'),
            ),
            DataColumn(
              label: Text('YEAR'),
            ),
            DataColumn(
              label: Text('DELETE'),
            ),
          ],
          rows: computerGames
              .map(
                (computerGame) => DataRow(
                  cells: [
                    DataCell(
                      Text(computerGame.name),
                      onTap: () {
                        setState(() {
                          isUpdating = true;
                          currentId = computerGame.id;
                        });
                        nameController.text = computerGame.name;
                      },
                    ),
                    DataCell(
                      Text(computerGame.genre),
                      onTap: () {
                        setState(() {
                          isUpdating = true;
                          currentId = computerGame.id;
                        });
                        genreController.text = computerGame.genre;
                      },
                    ),
                    DataCell(
                      Text(computerGame.year.toString()),
                      onTap: () {
                        setState(() {
                          isUpdating = true;
                          currentId = computerGame.id;
                        });
                        yearController.text = computerGame.year.toString();
                      },
                    ),
                    DataCell(
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          dbHelper.delete(computerGame.id);
                          refreshList();
                        },
                      ),
                    ),
                  ],
                ),
              )
              .toList()),
    );
  }

  list() {
    return Expanded(
      child: FutureBuilder(
        future: computerGames,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return dataTable(snapshot.data);
          }
          if (snapshot.data == null || snapshot.data.length == 0) {
            return Text('No Data Found');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00A693),
        title: Text('SQFLite'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            form(),
            list(),
          ],
        ),
      ),
    );
  }
}
