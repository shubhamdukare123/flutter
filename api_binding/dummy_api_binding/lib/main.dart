import "package:flutter/material.dart";
import "package:dummy_api_binding/api_binding.dart";
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: APIBinding(),
    );
  }
}