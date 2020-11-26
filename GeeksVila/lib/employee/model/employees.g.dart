// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employees.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employees _$EmployeesFromJson(Map<String, dynamic> json) {
  return Employees(
    status: json['status'] as String,
    data: (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Data.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$EmployeesToJson(Employees instance) => <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    id: json['id'] as String,
    employeeName: json['employee_name'] as String,
    employeeSalary: json['employee_salary'] as String,
    employeeAge: json['employee_age'] as String,
    profileImage: json['profile_image'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'employee_name': instance.employeeName,
      'employee_salary': instance.employeeSalary,
      'employee_age': instance.employeeAge,
      'profile_image': instance.profileImage,
    };

DeleteEmployeeResponse _$DeleteEmployeeResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteEmployeeResponse(
    status: json['status'] as String,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$DeleteEmployeeResponseToJson(
        DeleteEmployeeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

AddEmployeeResponse _$AddEmployeeResponseFromJson(Map<String, dynamic> json) {
  return AddEmployeeResponse(
    status: json['status'] as String,
    data: json['data'] == null
        ? null
        : NewData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AddEmployeeResponseToJson(
        AddEmployeeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

NewData _$NewDataFromJson(Map<String, dynamic> json) {
  return NewData(
    name: json['name'] as String,
    salary: json['salary'] as String,
    age: json['age'] as String,
    id: json['id'] as int,
  );
}

Map<String, dynamic> _$NewDataToJson(NewData instance) => <String, dynamic>{
      'name': instance.name,
      'salary': instance.salary,
      'age': instance.age,
      'id': instance.id,
    };

NewEmployee _$NewEmployeeFromJson(Map<String, dynamic> json) {
  return NewEmployee(
    name: json['name'] as String,
    salary: json['salary'] as String,
    age: json['age'] as String,
  );
}

Map<String, dynamic> _$NewEmployeeToJson(NewEmployee instance) =>
    <String, dynamic>{
      'name': instance.name,
      'salary': instance.salary,
      'age': instance.age,
    };
