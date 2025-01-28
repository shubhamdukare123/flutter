import "dart:developer";
import "dart:convert";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;

class APIBinding extends StatefulWidget {
  const APIBinding({super.key});

  @override
  State<APIBinding> createState() => _APIBindingState();
}

class _APIBindingState extends State<APIBinding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Binding"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(onPressed: postDeviceData),
    );
  }

  void getDeviceData() async {
    Uri url = Uri.parse("https://api.restful-api.dev/objects/7");
    http.Response responseData = await http.get(url);
    log(responseData.body);
  }

  void postDeviceData() async {
    Uri url = Uri.parse("https://api.restful-api.dev/objects");

    Map data = {
      "name": "Samsung Galaxy S23",
      "data": {
        "color": "Green",
        "price": 80000,
      }
    };

    http.Response responseData = await http.post(url,
        headers: {"content-type": "Application/json"}, body: json.encode(data));
    log(responseData.body);
  }
}
