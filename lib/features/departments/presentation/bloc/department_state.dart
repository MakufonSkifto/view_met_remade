part of 'department_bloc.dart';

@immutable
abstract class DepartmentState {}

class DepartmentInitial extends DepartmentState {}

class Loading extends DepartmentState {}

class LoadedDepartments extends DepartmentState {
  final List<Department> departments;

  LoadedDepartments({required this.departments});
}

class LoadedPieces extends DepartmentState {
  final List<Piece> pieces;

  LoadedPieces({required this.pieces});
}

class Error extends DepartmentState {
  final String message;

  Error({required this.message});
}