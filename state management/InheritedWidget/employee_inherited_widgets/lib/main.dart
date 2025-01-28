import 'package:flutter/material.dart';
import "package:employee_inherited_widgets/controller/employee.dart";
import "package:employee_inherited_widgets/view/employee_screen1.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Employee(
      empId: 103,
      empName: "Shubham Dukare",
      empSal: 1,
      child: MaterialApp(
        home: EmployeeScreen1(),
      ),
    );
  }
}
