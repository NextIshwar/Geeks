import 'package:json_annotation/json_annotation.dart';
part 'employees.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Employees {
  String status;
  List<Data> data;

  Employees({
    this.status,
    this.data,
  });
  factory Employees.fromJson(Map<String, dynamic> json) =>
      _$EmployeesFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeesToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Data {
  String id;
  String employeeName;
  String employeeSalary;
  String employeeAge;
  String profileImage;

  Data({
    this.id,
    this.employeeName,
    this.employeeSalary,
    this.employeeAge,
    this.profileImage,
  });
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class DeleteEmployeeResponse {
  String status;
  String message;

  DeleteEmployeeResponse({this.status, this.message});

  factory DeleteEmployeeResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteEmployeeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteEmployeeResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class AddEmployeeResponse {
  String status;
  NewData data;

  AddEmployeeResponse({this.status, this.data});

  factory AddEmployeeResponse.fromJson(Map<String, dynamic> json) =>
      _$AddEmployeeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddEmployeeResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class NewData {
  String name;
  String salary;
  String age;
  int id;

  NewData({this.name, this.salary, this.age, this.id});

  factory NewData.fromJson(Map<String, dynamic> json) =>
      _$NewDataFromJson(json);

  Map<String, dynamic> toJson() => _$NewDataToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class NewEmployee {
  String name;
  String salary;
  String age;

  NewEmployee({this.name, this.salary, this.age});

  factory NewEmployee.fromJson(Map<String, dynamic> json) =>
      _$NewEmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$NewEmployeeToJson(this);
}
