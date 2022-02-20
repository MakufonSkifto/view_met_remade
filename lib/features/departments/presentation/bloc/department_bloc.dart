import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:view_met_remade/features/departments/domain/repositories/department_repository.dart';
import 'package:view_met_remade/features/departments/domain/usecases/get_departments.dart';

import '../../../piece/domain/entities/piece.dart';
import '../../domain/entities/department.dart';
import '../../domain/usecases/get_department_pieces.dart';

part 'department_event.dart';
part 'department_state.dart';

class DepartmentBloc extends Bloc<DepartmentEvent, DepartmentState> {
  final DepartmentRepository repository;

  DepartmentBloc(this.repository) : super(DepartmentInitial()) {
    on<OnDepartmentsRequestedEvent>(_onDepartmentsRequestedEvent);
    on<OnDepartmentPiecesRequestedEvent>(_onDepartmentPiecesRequestedEvent);
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
        emit(LoadedDepartments(departments: departments));
      }
    );
  }

  void _onDepartmentPiecesRequestedEvent(event, emit) async {
    emit(Loading());

    var getDepartmentPieces = GetDepartmentPieces(repository);
    var piecesList = await getDepartmentPieces(event.department);

    piecesList.fold(
        (failure) {
          emit(Error(message: "An error occured while getting pieces!"));
        },
        (pieces) {
          emit(LoadedPieces(pieces: pieces));
        }
    );
  }
}
