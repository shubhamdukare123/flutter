import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:login_app/register_screen.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Firebase: Authentication"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    hintText: "Enter email", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                    hintText: "Enter password", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  if (emailController.text.trim().isNotEmpty &&
                      passwordController.text.trim().isNotEmpty) {
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .signInWithEmailAndPassword(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim());
                      log("UserCredential Response: $userCredential");
                    } on FirebaseAuthException catch (authObj) {
                      log("Exception Message: " + authObj.message!);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(authObj.message!)),
                      );
                    }
                  }
                },
                child: Container(
                  height: 50,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text("Login", style: TextStyle(fontSize: 30)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const RegisterScreen();
                  }));
                },
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: const Text("New User? SignUp",
                      style: TextStyle(fontSize: 30, color: Colors.blue)),
                ),
              )
            ],
          ),
        ));
  }
}
