import 'package:flutter/material.dart';
import "./studentInfo_model.dart";
import "package:firebase_core/firebase_core.dart";
import "package:cloud_firestore/cloud_firestore.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FireBaseApp(),
    );
  }
}

class FireBaseApp extends StatefulWidget {
  const FireBaseApp({super.key});
  @override
  State createState() {
    return _FireBaseAppState();
  }
}

class _FireBaseAppState extends State {
  final TextEditingController _studentNameTextController =
      TextEditingController();
  final TextEditingController _studentAgeTextController =
      TextEditingController();

  List<StudentInfoModel> studentInfoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Firebase App",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            TextField(
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              controller: _studentNameTextController,
              decoration: InputDecoration(
                  label: Text("Name"),
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              controller: _studentAgeTextController,
              decoration: InputDecoration(
                label: Text("Age"),
                labelStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                if (_studentNameTextController.text.isNotEmpty &&
                    _studentAgeTextController.text.isNotEmpty) {
                  FirebaseFirestore.instance.collection('studentsInfo').add({
                    'studentName': _studentNameTextController.text.trim(),
                    'studentAge': _studentAgeTextController.text.trim(),
                  });
                  _studentNameTextController.clear();
                  _studentAgeTextController.clear();

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Data Added Successfully"),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Invalid Data"),
                    ),
                  );
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30)),
                child: const Text(
                  "ADD DATA",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () async {
                QuerySnapshot response = await FirebaseFirestore.instance
                    .collection('studentsInfo')
                    .get();

                studentInfoList.clear();
                for (int i = 0; i < response.docs.length; i++) {
                  studentInfoList.add(StudentInfoModel(
                    studentId: response.docs[i].id,
                    studentName: response.docs[i]['studentName'],
                    studentAge: response.docs[i]['studentAge'],
                  ));
                }
                print("Data added in list");
                print('${studentInfoList}');
                setState(() {});
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 200,
                child: Text(
                  "GET DATA",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
             const SizedBox(height: 30),
            GestureDetector(
              onTap: () async {
                FirebaseFirestore.instance.collection('studentsInfo');
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 200,
                child: Text(
                  "Delete DATA",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            //ListView.builder
            ListView.builder(
                shrinkWrap: true,
                itemCount: studentInfoList.length,
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(children: [
                        Text("ID: ${studentInfoList[index].studentId}"),
                        Text("Name: ${studentInfoList[index].studentName}"),
                        Text("Age: ${studentInfoList[index].studentAge}"),
                      ]));
                }),
          ],
        ),
      ),
    );
  }
}
