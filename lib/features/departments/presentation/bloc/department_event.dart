part of 'department_bloc.dart';

@immutable
abstract class DepartmentEvent {}

class OnDepartmentsRequestedEvent extends DepartmentEvent {}