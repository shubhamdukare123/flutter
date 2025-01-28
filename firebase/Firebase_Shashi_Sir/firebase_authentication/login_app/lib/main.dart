import 'package:flutter/material.dart';
import "package:login_app/login_screen.dart";
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAPAi0AjqRfIcF2-8ZIeeaJ_DBZsbidHec",
          appId: "1:888020707726:android:aac1a4e092b1367c90dcdf",
          messagingSenderId: "888020707726",
          projectId: "login-auth-app-549f1"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}
