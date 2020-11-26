import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class EmployeeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class EmployeeDetailsEvent extends EmployeeEvent {}

class AddEmployeeEvent extends EmployeeEvent {
  final String name, salary, age;
  AddEmployeeEvent(
      {@required this.name, @required this.age, @required this.salary});
}

class EmployeeDeleteEvent extends EmployeeEvent {
  final String id;
  EmployeeDeleteEvent({@required this.id});
}
