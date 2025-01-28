import "dart:developer";
import "dart:convert";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:api_binding_all/all_device_data.dart";

class ApiBinding extends StatefulWidget {
  const ApiBinding({super.key});

  @override
  State<ApiBinding> createState() => _ApiBindingState();
}

class _ApiBindingState extends State<ApiBinding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Binding"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: getAllDeviceData,
                child: const Text("Get All Device Data")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: getSingleDeviceData,
                child: const Text("Get Single Device Data")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: getDeviceDataByID,
                child: const Text("Get Single Device Data by Id")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: postDeviceData,
                child: const Text("Post Device Data")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: putDeviceData,
                child: const Text("Update Device Data")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: deleteDeviceData,
                child: const Text("Delete Device Data")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: patchDeviceData,
                child: const Text("Patch Device Data")),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  //GET ALL DEVICE DATA
  void getAllDeviceData() async {
    Uri url = Uri.parse("https://api.restful-api.dev/objects");
    http.Response responseData = await http.get(url);
    //log(responseData.body);
    List<dynamic> jsonData = json.decode(responseData.body);
    //log("${jsonData[0]['name']}");

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return AllDeviceData(deviceData: jsonData, title: "All Device Data");
      }),
    );
  }

  //GET DEVICE DATA BY ID
  void getDeviceDataByID() async {
    Uri url = Uri.parse("https://api.restful-api.dev/objects?id=3&id=5&id=10");
    http.Response responseData = await http.get(url);
    //log(responseData.body);
    List<dynamic> jsonData = json.decode(responseData.body);
    //log("${jsonData[0]['name']}");

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return AllDeviceData(deviceData: jsonData, title: "Device Data By Id");
      }),
    );
  }

  //GET SINGLE DEVICE DATA
  void getSingleDeviceData() async {
    Uri url = Uri.parse("https://api.restful-api.dev/objects/7");

    http.Response responseData = await http.get(url);

    Map jsonData = json.decode(responseData.body);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return AllDeviceData(
            title: "Single Deivce Data", deviceData: [jsonData]);
      }),
    );
  }

  //POST DEVICE DATA
  void postDeviceData() async {
    Uri url = Uri.parse("https://api.restful-api.dev/objects");

    Map deviceData = {
      "name": "Redmi Note 7 Pro",
      "data": {
        "color": "black",
        "price": 14000.00,
      }
    };

    http.Response responseData = await http.post(url,
        body: json.encode(
            deviceData), // ENCODE to convert map into proper json format
        headers: {"content-type": "application/json"});
    log(responseData.body);
  }

  void putDeviceData() async {
    Uri url = Uri.parse(
        "https://api.restful-api.dev/objects/ff808181932badb60193fa0e123926a3");

    Map deviceData = {
      "name": "Redmi Note 8 Pro",
      "data": {
        "color": "black",
        "price": 14000.00,
      }
    };

    http.Response responseData = await http.put(url,
        body: json.encode(
            deviceData), // ENCODE to convert map into proper json format
        headers: {"content-type": "application/json"});
    log(responseData.body);
  }

  void deleteDeviceData() async {
    Uri url = Uri.parse(
        "https://api.restful-api.dev/objects/ff808181932badb60193fa0e123926a3");
    http.Response responseData = await http.delete(url);
    log(responseData.body);
  }

  void patchDeviceData() async {
    Uri url = Uri.parse(
        "https://api.restful-api.dev/objects/ff808181932badb60193fa1913cc26a6");

    Map deviceData = {
      "name": "Redmi Note 12 Pro (Patch Name)",
    };

    http.Response responseData =
        await http.patch(url, body: json.encode(deviceData), headers: {
      "content-type": "application/json",
    });
    log(responseData.body);
  }
}
