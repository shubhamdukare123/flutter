import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                "Register",
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
                          .createUserWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );

                      log("Response UserCredential : $userCredential");
                      Navigator.of(context).pop();
                    } on FirebaseAuthException catch (authObj) {
                      log("Exception Message: " + authObj.message!);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(authObj.message!)),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Invalid Fields")),
                    );
                  }
                },
                child: Container(
                  height: 50,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text("Register", style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),
        ));
  }
}
