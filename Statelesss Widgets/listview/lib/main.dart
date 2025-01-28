import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("ListView Widget"),
            centerTitle: true,
          ),
          body: ListView(children: [
            Container(
              // padding: EdgeInsets.all(10),
              //
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  color: Colors.amber),
              height: 500,
              width: 100,
              // color: Colors.amber,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.blue,
                  height: 600,
                  width: 120,
                ),
              ),
            ),
            Container(
              height: 500,
              width: 100,
              color: Colors.red,
            ),
            Container(
              height: 1000,
              color: Colors.purple,
              child: Container(
                height: 100,
                width: 100,
                color: Colors.blue,
              ),
            ),
          ])),
    );
  }
}
