import 'dart:async';
import 'package:GeeksVila/employee/model/employees.dart';
import 'package:requests/requests.dart';

Future<AddEmployeeResponse> addEmployee({String name, salary, age}) async {
  String _searchURL = "http://dummy.restapiexample.com/api/v1/create";
  NewEmployee req = NewEmployee(
    name: name,
    salary: salary,
    age: age,
  );
  Response response;
  try {
    response = await Requests.post(
      _searchURL,
      json: req,
      timeoutSeconds: 30,
    );
  } on TimeoutException {
    return AddEmployeeResponse(
      status: "Failure",
    );
  }
  AddEmployeeResponse newEmployeeResponse =
      AddEmployeeResponse.fromJson(response.json());
  return newEmployeeResponse;
}
