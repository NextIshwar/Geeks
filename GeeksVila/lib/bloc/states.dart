import 'package:GeeksVila/employee/model/employees.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class EmployeeState extends Equatable {
  @override
  List<Object> get props => null;
}

class EmployeeLoadingState extends EmployeeState {}

class ShowEmployeeState extends EmployeeState {
  final List<Data> data;
  ShowEmployeeState({this.data});

  @override
  List<Object> get props => [data];
}

class EmployeeDeletedState extends EmployeeState {}

class ErrorState extends EmployeeState {}

class EmployeeAddedState extends EmployeeState {
  final String success, id;
  EmployeeAddedState({@required this.success, this.id});
}