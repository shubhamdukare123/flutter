import 'package:flutter/material.dart';
import "package:employee_inherited_widgets/controller/employee.dart";

class EmployeeScreen1 extends StatefulWidget {
  EmployeeScreen1({super.key});

  @override
  State createState() => _EmployeeScreen1State();
}

class _EmployeeScreen1State extends State<EmployeeScreen1> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Inherited Widgets"),
          backgroundColor: Colors.blue,
          centerTitle: true),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 20),
        Text(
          "Empoyee ID: ${context.dependOnInheritedWidgetOfExactType<Employee>()!.empId}",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Employee Name : ${context.dependOnInheritedWidgetOfExactType<Employee>()!.empName}",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Employee Salary : ${context.dependOnInheritedWidgetOfExactType<Employee>()!.empSal} ",
          style: TextStyle(fontSize: 20),
        ),
      ]),
      floatingActionButton:
          FloatingActionButton(onPressed: () {
            setState((){
              context.dependOnInheritedWidgetOfExactType<Employee>()!.empName = "Saish Dukare";

              context.dependOnInheritedWidgetOfExactType<Employee>()!.empId = 200;
              context.dependOnInheritedWidgetOfExactType<Employee>()!.empSal = "Saish Dukare";
            });

          }, child: Icon(Icons.add)),
    );
  }
}
