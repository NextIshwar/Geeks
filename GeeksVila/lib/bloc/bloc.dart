import 'package:GeeksVila/bloc/events.dart';
import 'package:GeeksVila/bloc/states.dart';
import 'package:GeeksVila/employee/repository/add_employee.dart';
import 'package:GeeksVila/employee/repository/delete_employee.dart';
import 'package:GeeksVila/employee/repository/employee_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  EmployeeBloc({EmployeeState initialState}) : super(initialState);

  @override
  Stream<EmployeeState> mapEventToState(EmployeeEvent event) async* {
    if (event is EmployeeDetailsEvent) {
      yield EmployeeLoadingState();
      var employeeDetails = await getEmployeeResponse();
      if (employeeDetails.status != "success") {
        yield ErrorState();
      } else {
        yield ShowEmployeeState(data: employeeDetails.data);
      }
    }
    if (event is EmployeeDeleteEvent) {
      yield EmployeeLoadingState();
      try {
        var deleteResponse = await deleteEmployee(event.id);
        if (deleteResponse.status != "success") {
          yield ErrorState();
        }

        yield EmployeeDeletedState();
      } on FormatException {
        yield ErrorState();
      }
    }
    if (event is AddEmployeeEvent) {
      yield EmployeeLoadingState();
      try {
        var response = await addEmployee(
            name: event.name, age: event.age, salary: event.salary);
        if (response.status != "success") {
          yield ErrorState();
        } else {
          yield EmployeeAddedState(
              success: "Employee has been succesfully added",
              id: response.data.id.toString());
        }
      } on FormatException {
        yield ErrorState();
      }
    }
  }
}
