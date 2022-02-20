import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:view_met_remade/features/departments/domain/repositories/department_repository.dart';
import 'package:view_met_remade/features/departments/domain/usecases/get_departments.dart';

import '../../domain/entities/department.dart';

part 'department_event.dart';
part 'department_state.dart';

class DepartmentBloc extends Bloc<DepartmentEvent, DepartmentState> {
  final DepartmentRepository repository;

  DepartmentBloc(this.repository) : super(DepartmentInitial()) {
    on<OnDepartmentsRequestedEvent>(_onDepartmentsRequestedEvent);
  }

  void _onDepartmentsRequestedEvent(event, emit) async {
    emit(Loading());

    var getDepartments = GetDepartments(repository);
    var departmentsList = await getDepartments();

    departmentsList.fold(
      (failure) {
        emit(Error(message: "An error occured while getting departments!"));
      },
      (departments) {
        emit(Loaded(departments: departments));
      }
    );
  }
}
