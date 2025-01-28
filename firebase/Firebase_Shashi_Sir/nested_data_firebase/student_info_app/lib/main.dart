import 'package:flutter/material.dart';
import "package:student_info_app/add_stud_data.dart";
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyD9eeqfDoR1q0azhiG5sCQxDDsv1F8hOSk",
          appId: "1:1079320805353:android:5ea67361a4bd6e04b5d578",
          messagingSenderId: "1079320805353",
          projectId: "studentsinfo-2ce00"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AddStudData(),
      debugShowCheckedModeBanner: false,
    );
  }
}
