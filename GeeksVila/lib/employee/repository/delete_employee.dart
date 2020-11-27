import 'dart:async';
import 'package:GeeksVila/employee/model/employees.dart';
import 'package:requests/requests.dart';

Future<DeleteEmployeeResponse> deleteEmployee(String id) async {
  String _searchURL = "http://dummy.restapiexample.com/api/v1/delete/$id";
  Response response;
  try {
    response = await Requests.delete(
      _searchURL,
      timeoutSeconds: 30,
    );
  } on TimeoutException {
    return DeleteEmployeeResponse(
      status: "Failure",
      message: "Response is taking to much time. Please try after sometime",
    );
  } on FormatException {
    return DeleteEmployeeResponse(
        status: "Failure",
        message: "Response is taking to much time. Please try after sometime");
  }
  DeleteEmployeeResponse deleteEmployeeResponse =
      DeleteEmployeeResponse.fromJson(response.json());
  return deleteEmployeeResponse;
}
