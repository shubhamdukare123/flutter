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
        body: ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            //callback function
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                width: 100,
                color: Colors.amber,
                child: Text("$index"),
              );
            }),
      ),
    );
  }
}
