import 'dart:async';
import 'package:GeeksVila/employee/model/employees.dart';
import 'package:requests/requests.dart';

Future<Employees> getEmployeeResponse() async {
  String _searchURL = "http://dummy.restapiexample.com/api/v1/employees";
  Response response;
  try {
    response = await Requests.get(
      _searchURL,
      timeoutSeconds: 10,
    );
  } on TimeoutException {
    Employees(
      status: "Failure",
    );
  }
  Employees employees = Employees.fromJson(response.json());
  return employees;
}
