//import "dart:async";
import "package:flutter/material.dart";
import "package:sqflite/sqflite.dart";
import "package:path/path.dart";


class Dog {
  final int id;
  final String name;
  final int age;

  Dog({required this.id, required this.name, required this.age});
}

dynamic database;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  database = openDatabase(
    join(await getDatabasesPath(), "doggie_database.db" ),
  );
}

