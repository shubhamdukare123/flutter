import "package:flutter/material.dart";
import "package:sqflite/sqflite.dart";
import "package:path/path.dart";

class Zomato {
  int? orderNo;
  final String custName;
  final String hotelName;
  final String food;
  final double bill;

  Zomato({
    this.orderNo,
    required this.custName,
    required this.hotelName,
    required this.food,
    required this.bill,
  });

  Map<String, dynamic> zomatoMap() {
    return {
      'custName': custName,
      'hotelName': hotelName,
      'food': food,
      'bill': bill,
    };
  }

  @override
  String toString() {
    return "orderNo : $orderNo, custName: $custName, hotelName: $hotelName, food: $food, bill: $bill";
  }
}

dynamic database;

void insertOrderData(Zomato order) async {
  final localDB = await database;
  // print("In insertOrderData");
  // print("localDB : $localDB");
  // print("database : ${await database}");

  await localDB.insert(
    "OrderFood",
    order.zomatoMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  
  );
  print("Insert Order Done");
}

Future<List<Zomato>> getOrderData() async {
  final dynamic localDB = await database;
  List<Map<String, dynamic>> orderMap = await localDB.query("OrderFood");
  //print("GetOrderprint");
  //print("OrderMap : ${orderMap}");

  return List.generate( orderMap.length, (i)  {
    //print("List Generated ");
    return Zomato(
      orderNo: orderMap[i]['orderNo'],
      custName:  orderMap[i]['custName'],
      hotelName: orderMap[i]['hotelName'],
      food: orderMap[i]['food'],
      bill: orderMap[i]['bill'],
    );
  });
}

void deleteOrderData(int data) async{
  final localDB = await database;
  localDB.delete(
    'OrderFood',
    where: "orderNo = ?",
    whereArgs: [data],

  );
}

void updateOrderData(Zomato obj) async {
  final localDB = await database;
  await localDB.update(
    'OrderFood',
    obj.zomatoMap(),
    where: "orderNo = ?",
    whereArgs : [obj.orderNo],
  );

}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  database = openDatabase(join(await getDatabasesPath(), "Swiggy.db"),
      version: 1, onCreate: (db, version) async {
    await db.execute('''
            CREATE TABLE OrderFood(
              orderNo INTEGER PRIMARY KEY,
              custName TEXT,
              hotelName TEXT,
              food TEXT,
              bill REAL
            )
            ''');
  });

  //insert
  Zomato order1 = Zomato(
    custName: "Shubham Dukare",
    hotelName: "Behrooz Biryani",
    food: "Chicken Biryani",
    bill: 480.00,
  );

  //insertOrderData(order1);
  print("Get Order :  ${await getOrderData()}");
  //deleteOrderData(3);
  //print("After Deletion");

  updateOrderData(Zomato(orderNo: 1, custName : "Anuja Gavhane", hotelName: "Rajgad", food: "Veg Biryani", bill: 100.00));
  print("After Update");
  print("Get Order :  ${await getOrderData()}");


}
