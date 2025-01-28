import "package:flutter/material.dart";
import "package:path/path.dart";
import "package:sqflite/sqflite.dart";
import "./player_model.dart";

dynamic database;

//Insert Data
void insertPlayerData(Player obj) async {
  // Database localDB =  await database;
  int index = await  database.insert("Player", obj.playerMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
  print("data inserted with index $index");
}

//Get Data
Future<List<Map<String, dynamic>>> getPlayerData()  {
  //
  //Database localDB = await database;

  print("In getTableData");
  return database.query("Player");
}

void deletePlayerData(int jerNo) async {
  Database localDB = await database;

  await localDB.delete(
  "Player",
  where: "jerNo = ?",
  whereArgs: [jerNo],
  );
}

void updatePlayerData(Player obj) async{
  Database localDB = await database;

  await localDB.update(
    "Player",
    obj.playerMap(),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Create database + table create
  database = await openDatabase(join(await getDatabasesPath(), "INDPlayerDB.db"),
      version: 1, onCreate: (db, version) {
    db.execute('''
        CREATE TABLE Player(
          playerName TEXT,
          jerNo INT PRIMARY KEY,
          runs INT,
          avg REAL        
        )
        ''');
  });

  print(database.runtimeType);

  Player obj1 =
      Player(playerName: "Virat Kohli", jerNo: 18, runs: 30000, avg: 30.000);
  Player obj2 =
      Player(playerName: "Rohit Sharma", jerNo: 45, runs: 40000, avg: 40.000);


  //insert
  insertPlayerData(obj1);
  insertPlayerData(obj2);
  print(await getPlayerData());


  //update
  updatePlayerData(Player(playerName: obj2.playerName, jerNo: obj2.jerNo, runs: obj2.runs + 10000, avg: obj2.avg ));
  print(await getPlayerData());
  
  //delete
 // deletePlayerData(obj2.jerNo);
  //print(await getPlayerData());
}
