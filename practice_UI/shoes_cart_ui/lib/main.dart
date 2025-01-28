import "package:flutter/material.dart";
import "package:shoes_cart_ui/view/my_cart_screen.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CartUI(),
    );
  }
}