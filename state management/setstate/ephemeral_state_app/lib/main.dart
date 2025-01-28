import 'package:flutter/material.dart';
import 'dart:developer';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext ctx) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EphemeralStateApp(),
    );
  }
}

class EphemeralStateApp extends StatefulWidget {
  const EphemeralStateApp({super.key});

  @override
  State<EphemeralStateApp> createState() => _EphemeralStateAppState();
}

class _EphemeralStateAppState extends State<EphemeralStateApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ephemeral State App"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        
          children: [
            Course(courseName: "Java"),
            const SizedBox(
              height: 50,
            ),
            Course(courseName: "Flutter"),
          ]),
    );
  }
}

class Course extends StatefulWidget {
  final String courseName;

  const Course({super.key, required this.courseName});

  @override
  State createState() => _CourseState();
}

class _CourseState extends State {
  Widget build(BuildContext context) {
    log("In CourseState build");
    return Row(
      children: [
        ElevatedButton(child: const Text("Java"), onPressed: () {}),
      ],
    );
  }
}
