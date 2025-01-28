import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:student_info_app/get_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddStudData extends StatefulWidget {
  const AddStudData({super.key});

  @override
  State<AddStudData> createState() => _AddStudDataState();
}

class _AddStudDataState extends State<AddStudData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController collegeController = TextEditingController();
  TextEditingController courseController = TextEditingController();

  Map courseData = {};
  bool isOffline = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("C2W Student"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: "Enter Your Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: collegeController,
                decoration: const InputDecoration(
                  hintText: "Enter College Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                flex: 0,
                child: Text("Enrolled Courses: $courseData"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: courseController,
                decoration: const InputDecoration(
                  hintText: "Enter Course Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        isOffline = true;
                        setState(() {});
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          isOffline == true ? Colors.blue : Colors.white,
                        ),
                      ),
                      child: const Text("Offline")),
                  ElevatedButton(
                      onPressed: () {
                        isOffline = false;
                        setState(() {});
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          isOffline == false ? Colors.blue : Colors.white,
                        ),
                      ),
                      child: const Text("Online")),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (courseController.text.isNotEmpty) {
                      String mode = "";
                      if (isOffline) {
                        mode = "Offline";
                      } else {
                        mode = "Online";
                      }

                      courseData[courseController.text] = mode;
                      courseController.clear();
                      setState(() {});
                    }
                  },
                  child: const Text("Add Course"),
                ),
              ),
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        if (nameController.text.trim().isNotEmpty &&
                            collegeController.text.trim().isNotEmpty &&
                            courseData.isNotEmpty) {
                          Map<String, dynamic> data = {
                            "studName": nameController.text,
                            "collegeName": collegeController.text,
                            "enrolledCourses": courseData,
                          };

                          DocumentReference docRef = await FirebaseFirestore
                              .instance
                              .collection("C2WStudentInfo")
                              .add(data);

                          nameController.clear();
                          collegeController.clear();
                          courseData = {};
                          isOffline = true;
                          setState(() {});

                          log("DocumentRef : $docRef");
                        }
                      },
                      child: const Text("Add Data")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const GetData();
                        }));
                      },
                      child: const Text("Get Data")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
