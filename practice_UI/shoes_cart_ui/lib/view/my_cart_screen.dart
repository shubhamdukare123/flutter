import "package:flutter/material.dart";

class CartUI extends StatefulWidget {
  const CartUI({super.key});

  @override
  State<CartUI> createState() => _CartUIState();
}

class _CartUIState extends State<CartUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Cart",
          style: TextStyle(
            fontSize: 30,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey,
            height: 1,
          ),
          const SizedBox(
            height: 20,
          ),
          shoesCard(ShoesData(
            name: "Nike Shoes",
            description: "With iconic style and legendary comfort, on repeat.",
            price: 570.00,
          )),
        ],
      ),
    );
  }
}

Widget shoesCard(ShoesData obj) {
  return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            //height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.yellow,
            ),
            child: Image.asset(
              "assets/shoesImage.jpg",
              height: 100,
              width: 100,
            ),
          ),
        ],
      ));
}

class ShoesData {
  String name;
  String description;
  double price;

  ShoesData(
      {required this.name, required this.description, required this.price});
}
