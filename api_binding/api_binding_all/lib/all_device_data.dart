import "package:flutter/material.dart";

// ignore: must_be_immutable
class AllDeviceData extends StatelessWidget {
  List<dynamic> deviceData = [];
  String title;
  AllDeviceData({super.key, required this.deviceData, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(title),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          itemCount: deviceData.length,
          itemBuilder: (context, index) {
            return Row(children: [
              Text(deviceData[index]['id']),
              const SizedBox(width: 10),
              Text(deviceData[index]['name']),
            ]);
          }),
    );
  }
}
