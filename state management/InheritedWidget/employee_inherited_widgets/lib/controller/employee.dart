import 'package:flutter/material.dart';

class Employee extends InheritedWidget {
   int empId;
   String empName;
   int empSal;

   Employee({
    super.key,
    required this.empId,
    required this.empName,
    required this.empSal,
    required super.child,
  });

  @override
  bool updateShouldNotify(Employee oldWidget) {
    // return empId != oldWidget.empId &&
    //     empName != oldWidget.empName &&
    //     empSal != oldWidget.empSal;

    return true;
  }
}
