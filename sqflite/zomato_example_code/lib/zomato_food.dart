class Zomato {
  final int orderNo;
  final String custName;
  final String hotelName;
  final String food;
  final double bill;

  Zomato(
      {required this.orderNo,
      required this.custName,
      required this.hotelName,
      required this.food,
      required this.bill});

  Map<String, dynamic> zomatoMap() {
    return {
      "orderNo": orderNo,
      "custName": custName,
      "hotelName": hotelName,
      "food": food,
      "bill": bill,
    };
  }
}
