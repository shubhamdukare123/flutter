import "package:flutter/material.dart";
import "package:sqflite/sqflite.dart";
import "package:path/path.dart";

























dynamic database;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //print(await getDatabasesPath());

  database = openDatabase(
    join(await getDatabasesPath(), "Employee.db"),
    version: 1,
    onCreate: (database, version) {
      
    }
  );
}