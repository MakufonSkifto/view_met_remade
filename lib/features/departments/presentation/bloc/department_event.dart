part of 'department_bloc.dart';

@immutable
abstract class DepartmentEvent {}

class OnDepartmentsRequestedEvent extends DepartmentEvent {}

class OnDepartmentPiecesRequestedEvent extends DepartmentEvent {
  final Department department;

  OnDepartmentPiecesRequestedEvent({required this.department});
}
