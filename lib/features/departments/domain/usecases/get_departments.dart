import 'package:dartz/dartz.dart';

import 'package:view_met_remade/core/exceptions/failures.dart';
import 'package:view_met_remade/features/departments/domain/entities/department.dart';

import '../../../../core/usecases/departments_usecase.dart';
import '../repositories/department_repository.dart';

class GetDepartments extends DepartmentsListUseCase<List<Department>, NoParams> {
  final DepartmentRepository repository;

  GetDepartments(this.repository);

  @override
  Future<Either<Failure, List<Department>>> call() {
    return repository.getDepartments();
  }
}