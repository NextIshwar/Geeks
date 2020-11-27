import 'package:GeeksVila/bloc/bloc.dart';
import 'package:GeeksVila/bloc/events.dart';
import 'package:GeeksVila/bloc/states.dart';
import 'package:GeeksVila/employee/add_employee_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.greenAccent,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Employee Details"),
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.black,
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
                  "Go to Add Employee Page",
                  style: TextStyle(
                      color: Colors.grey[200], fontWeight: FontWeight.w700),
                ),
              ),
            ),
            BlocBuilder<EmployeeBloc, EmployeeState>(
              builder: (context, state) {
                if (state is EmployeeLoadingState) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.greenAccent,
                    ),
                  );
                } else if (state is EmployeeDeletedState) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    alignment: Alignment.center,
                    child: AlertDialog(
                      title: Text("Employee has been removed"),
                      actions: [
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                    create: (_) => EmployeeBloc(
                                        initialState: EmployeeLoadingState())
                                      ..add(EmployeeDetailsEvent()),
                                    child: EmployeePage()),
                              ),
                            );
                          },
                          child: Text("Ok"),
                        )
                      ],
                    ),
                  );
                } else if (state is ErrorState)
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    alignment: Alignment.center,
                    child: AlertDialog(
                      title: Text("Something went wrong. Please try again"),
                      actions: [
                        RaisedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                    create: (_) => EmployeeBloc(
                                        initialState: EmployeeLoadingState())
                                      ..add(EmployeeDetailsEvent()),
                                    child: EmployeePage()),
                              ),
                            );
                          },
                          child: (Text("OK")),
                        )
                      ],
                    ),
                  );
                else
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.80,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                    ),
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Table(
                          border: TableBorder.all(
                            color: Colors.grey[600],
                          ),
                          children: [
                            TableRow(
                              children: [
                                Text(
                                  'Id',
                                  style: TextStyle(
                                      color: Colors.grey[200],
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.05),
                                ),
                                Text(
                                  'Name',
                                  style: TextStyle(
                                      color: Colors.grey[200],
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.05),
                                ),
                                Text(
                                  'Age',
                                  style: TextStyle(
                                      color: Colors.grey[200],
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.05),
                                ),
                                Text(
                                  'Salary',
                                  style: TextStyle(
                                      color: Colors.grey[200],
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.05),
                                ),
                                Text(
                                  '',
                                  style: TextStyle(
                                      color: Colors.grey[200],
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.05),
                                ),
                              ],
                              decoration: BoxDecoration(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.70,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Table(
                                  border: TableBorder.all(color: Colors.black),
                                  children:
                                      List.generate(state.data.length, (index) {
                                    return TableRow(
                                      children: [
                                        Text(
                                          state.data[index].id,
                                          style: TextStyle(
                                              color: Colors.grey[850],
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          state.data[index].employeeName,
                                          style: TextStyle(
                                              color: Colors.grey[850],
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          state.data[index].employeeAge,
                                          style: TextStyle(
                                              color: Colors.grey[850],
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          state.data[index].employeeSalary,
                                          style: TextStyle(
                                              color: Colors.grey[850],
                                              fontWeight: FontWeight.w700),
                                        ),
                                        FlatButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                  opaque: false,
                                                  pageBuilder: (_, __, ___) =>
                                                      AlertDialog(
                                                    backgroundColor:
                                                        Colors.grey[200],
                                                    title: Text(
                                                      "Please confirm to proceed",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[850]),
                                                    ),
                                                    content: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        FlatButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            "Cancel",
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red),
                                                          ),
                                                        ),
                                                        FlatButton(
                                                          onPressed: () {
                                                            BlocProvider.of<
                                                                        EmployeeBloc>(
                                                                    context)
                                                                .add(
                                                              EmployeeDeleteEvent(
                                                                  id: state
                                                                      .data[
                                                                          index]
                                                                      .id),
                                                            );
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            "Delete",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .greenAccent),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              "Delete",
                                              style: TextStyle(
                                                  fontSize: width * 0.03,
                                                  color: Colors.redAccent[700],
                                                  fontWeight: FontWeight.w700),
                                            ))
                                      ],
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
              },
            ),
          ],
        ),
      ),
    );
  }
}
