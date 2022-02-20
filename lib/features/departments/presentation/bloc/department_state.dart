part of 'department_bloc.dart';

@immutable
abstract class DepartmentState {}

class DepartmentInitial extends DepartmentState {}

class Loading extends DepartmentState {}

class Loaded extends DepartmentState {
  final List<Department> departments;

  Loaded({required this.departments});
}

class Error extends DepartmentState {
  final String message;

  Error({required this.message});
}