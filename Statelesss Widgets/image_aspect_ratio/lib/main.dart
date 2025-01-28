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
        body: Center(
            child: Container(
          height: 300,
          width: 300,
          color: Colors.amber,
          child: Image.network(
              "https://24ai.tech/en/wp-content/uploads/sites/3/2023/10/01_product_1_sdelat-izobrazhenie-1-1-3-scaled.jpg"),
        )),
      ),
    );
  }
}
