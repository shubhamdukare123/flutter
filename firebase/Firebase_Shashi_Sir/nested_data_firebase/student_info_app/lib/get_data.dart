import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetData extends StatefulWidget {
  const GetData({super.key});

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  List studentData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    QuerySnapshot response =
        await FirebaseFirestore.instance.collection("C2WStudentInfo").get();
    log("Response: ${response.docs}");
    studentData = response.docs;

    log("$studentData");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Get Data"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
            itemCount: studentData.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  ////await FirebaseFirestore.instance.collection("C2WStudentInfo").dele\\
                  
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all()),
                  child: Column(
                    children: [
                      Text("Name: ${studentData[index]['studName']}"),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("College: ${studentData[index]["collegeName"]}"),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                          "Enrolled Courses: ${studentData[index]["enrolledCourses"]}")
                    ],
                  ),
                ),
              );
            }));
  }
}
