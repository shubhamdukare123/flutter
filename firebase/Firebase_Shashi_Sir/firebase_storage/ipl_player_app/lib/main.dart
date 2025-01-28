import "dart:developer";
import "dart:io";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_storage/firebase_storage.dart";
import "package:flutter/material.dart";
import "package:image_picker/image_picker.dart";
import "package:firebase_core/firebase_core.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyB0WzZxyLlMHfLSbrIXcIG3lHjT_NOrd4Y",
    appId: "1:926222623983:android:c818f54564054770b9a71a",
    messagingSenderId: "926222623983",
    projectId: "iplplayers-af971",
    storageBucket: "iplplayers-af971.firebasestorage.app",
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IPLTeams(),
    );
  }
}

class IPLTeams extends StatefulWidget {
  const IPLTeams({super.key});

  @override
  State<IPLTeams> createState() => _IPLTeamsState();
}

class _IPLTeamsState extends State<IPLTeams> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jerNoController = TextEditingController();
  TextEditingController iplTeamController = TextEditingController();

  XFile? selectedImg;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IPL Teams"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            GestureDetector(
                onTap: () async {
                  ImagePicker imagePicker = ImagePicker();
                  selectedImg =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  setState(() {});

                  log(selectedImg!.path);
                  log(selectedImg!.name);
                },
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: selectedImg == null
                      ? Image.network(
                          "https://cdn-icons-png.flaticon.com/512/166/166364.png")
                      : Image.file(File(selectedImg!.path)),
                )),
            const SizedBox(
              height: 15,
            ),
            TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    hintText: "Enter Player Name",
                    border: OutlineInputBorder())),
            const SizedBox(
              height: 15,
            ),
            TextField(
                controller: jerNoController,
                decoration: const InputDecoration(
                    hintText: "Enter Jersey Number",
                    border: OutlineInputBorder())),
            const SizedBox(
              height: 15,
            ),
            TextField(
                controller: iplTeamController,
                decoration: const InputDecoration(
                    hintText: "Enter Team Name", border: OutlineInputBorder())),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () async {
                      if (nameController.text.isNotEmpty &&
                          jerNoController.text.isNotEmpty &&
                          iplTeamController.text.isNotEmpty) {
                        await FirebaseStorage.instance
                            .ref()
                            .child(
                                "${iplTeamController.text}/${nameController.text}")
                            .putFile(File(selectedImg!.path));

                        String url = await FirebaseStorage.instance
                            .ref()
                            .child(
                                "${iplTeamController.text}/${nameController.text}")
                            .getDownloadURL();
                        log("URL: $url");

                        Map<String, dynamic> data = {
                          "playerName": nameController.text,
                          "jerNo": jerNoController.text,
                          "teamName": iplTeamController.text,
                          "profilePic": url,
                        };

                        await FirebaseFirestore.instance
                            .collection("iplTeams")
                            .add(data);

                        nameController.clear();
                        jerNoController.clear();
                        iplTeamController.clear();
                        selectedImg = null;
                        setState(() {});
                      }
                    },
                    child: const Text("Add Data")),
                    
                ElevatedButton(
                    onPressed: () async {
                      QuerySnapshot<Map<String, dynamic>> responseData =
                          await FirebaseFirestore.instance
                              .collection("iplTeams")
                              .get();

                      for (var player in responseData.docs) {
                        log("PlayerName: ${player["playerName"]}");
                      }
                    },
                    child: const Text("Get Data"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
