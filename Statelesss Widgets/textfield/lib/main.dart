import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String? myName;

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("TextField"),
            backgroundColor: Colors.blue,
          ),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                    obscureText: true,
                    controller: nameController,
                    style: TextStyle(fontSize: 30, color: Colors.amber),
                    decoration: InputDecoration(
                      hintText: "Enter Name",
                      hintStyle: TextStyle(color: Colors.green[100]),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.visibility),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    onChanged: (String val) {
                      print("Value: $val");
                    },
                    onEditingComplete: () {
                      print("Editing Complete");
                    },
                    onSubmitted: (val) {
                      print("Submitted : $val");
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  myName = nameController.text.trim();
                  print(myName);
                  nameController.clear();
                  setState(() {});
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text("Add Data",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Text(
                "Name: $myName",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 30),
              ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Text("Data: ");
                  }),
            ],
          )),
    );
  }
}
