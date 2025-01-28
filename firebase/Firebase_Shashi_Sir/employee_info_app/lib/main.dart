import "dart:developer";

import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_core/firebase_core.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBEZkWQjuymM96BR91k78XTi3qtkbE7Dk8",
          appId: "1:804131642419:android:5f794d9e85de568d589746",
          messagingSenderId: "804131642419",
          projectId: "employeeinfo-c2644"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmployeeFirebase(),
    );
  }
}

class EmployeeFirebase extends StatefulWidget {
  const EmployeeFirebase({super.key});

  @override
  State<EmployeeFirebase> createState() => _EmployeeFirebaseState();
}

class _EmployeeFirebaseState extends State<EmployeeFirebase> {
  TextEditingController empNameTextController = TextEditingController();
  TextEditingController empSalTextController = TextEditingController();
  TextEditingController devTypeTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Demo"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          const SizedBox(height: 20),
          TextField(
            controller: empNameTextController,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                hintText: "Name"),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: empSalTextController,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                hintText: "Salary"),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: devTypeTextController,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                hintText: "Developer Type"),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Map<String, dynamic> data = {
                "empName": empNameTextController.text,
                "empSal": empSalTextController.text,
                "devType": devTypeTextController.text,
              };

              FirebaseFirestore.instance.collection("EmployeeData").add(data);

              empNameTextController.clear();
              empSalTextController.clear();
              devTypeTextController.clear();
            },
            child: Container(
                alignment: Alignment.center,
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text("Add Data")),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () async {
              QuerySnapshot response = await FirebaseFirestore.instance
                  .collection("EmployeeData")
                  .get();
              
              // log("Response: ${response.docs.data()}");
               log("Response: ${response.docs[0].data()}");

               for(dynamic data in response.docs) {
                log("$data");
               }
              
            },
            child: Container(
                alignment: Alignment.center,
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text("Get Data")),
          ),
        ]),
      ),
    );
  }
}
