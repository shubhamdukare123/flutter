import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListViewDemo(),
    );
  }
}

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({super.key});

  @override
  State<ListViewDemo> createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  @override
  Widget build(BuildContext context) {
    print("Height:  ${MediaQuery.of(context).size.height}");
    print("Width:  ${MediaQuery.of(context).size.width}");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ListView Demo"),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        // color: Colors.pink,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
            ),
            Container(
              height: 100,
              width: 100,
              
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
