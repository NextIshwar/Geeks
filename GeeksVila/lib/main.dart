import 'package:GeeksVila/bloc/bloc.dart';
import 'package:GeeksVila/bloc/events.dart';
import 'package:GeeksVila/bloc/states.dart';
import 'package:GeeksVila/employee/add_employee_page.dart';
import 'package:GeeksVila/employee/employee_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Center(child: Text("Welcome to Vila")),
          ),
          body: Vila()),
    );
  }
}

class Vila extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.greenAccent,
          image: DecorationImage(image: AssetImage("images/Employee.png"))),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height * 0.06,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                        create: (_) =>
                            EmployeeBloc(initialState: EmployeeLoadingState())
                              ..add(EmployeeDetailsEvent()),
                        child: EmployeePage()),
                  ),
                );
              },
              child: Text(
                "Employee",
                style: TextStyle(
                    color: Colors.grey[200], fontWeight: FontWeight.w700),
              ),
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: width * 0.1,
          ),
          Container(
            height: height * 0.06,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                        create: (_) => EmployeeBloc(),
                        child: AddEmployeePage()),
                  ),
                );
              },
              child: Text(
                "Add Employee",
                style: TextStyle(
                    color: Colors.grey[200], fontWeight: FontWeight.w700),
              ),
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
