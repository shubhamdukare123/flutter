import "package:flutter/material.dart";
import "package:sqflite/sqflite.dart";
import "package:path/path.dart";
import "./zomato_food.dart";

dynamic database;

void insertOrderData(Zomato order) async {
  Database localDB = await database;

  await localDB.insert(
    "Food",
    order.zomatoMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Map<String, dynamic>>> getOrderData() async {
  Database localDB = await database;
  return await localDB.query("Food");
}


void deleteOrderData(int orderNo) async{
  Database localDB = await database;

  localDB.delete("Food",
    where: "orderNo = ?",
    whereArgs: [orderNo],
  );
}

void updateOrderData(Zomato order) async {
  Database localDB = await database;

  await localDB.update("Food", order.zomatoMap(),
    where: "orderNo = ?",
    whereArgs: [order.orderNo],
  );

}





void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  database =  openDatabase(join(await getDatabasesPath(), "ZomatoB.db"),
      version: 1, onCreate: (db, version) async {
    await db.execute(
      '''
          CREATE TABLE Food(
          orderNo INT PRIMARY KEY,
          custName TEXT,
          hotelName TEXT,
          food TEXT,
          bill REAL
        )''');
  });

  

  Zomato order1 = Zomato(
    orderNo: 100,
    custName: "Anuja",
    hotelName: "Rajgad Hotel",
    food: "Anda Malwani Thali",
    bill: 180.00,
  );


  Zomato order2 = Zomato(
    orderNo: 200,
    custName: "Siddhi",
    hotelName: "Rajgad Hotel",
    food: "Chicken Biryani",
    bill: 100.00,
  );

  insertOrderData(order1);
  insertOrderData(order2);

  print(await getOrderData());
  deleteOrderData(order2.orderNo);
  print(await getOrderData());
  updateOrderData(Zomato(orderNo: 100, custName: "Anuja", hotelName: "Rajgad Hotel", food: "${order1.food}, Roti", bill: order1.bill + 15.00 ));
  print(await getOrderData());
  
}
