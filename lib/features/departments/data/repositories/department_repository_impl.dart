import 'package:dartz/dartz.dart';
import 'package:view_met_remade/features/departments/domain/entities/department.dart';
import 'package:view_met_remade/features/departments/domain/repositories/department_repository.dart';

import '../../../../core/exceptions/failures.dart';
import '../../../piece/domain/entities/piece.dart';
import '../datasources/department_data_source.dart';

class DepartmentRepositoryImpl extends DepartmentRepository {
  final DepartmentDataSource dataSource;

  DepartmentRepositoryImpl({
    required this.dataSource
  });

  @override
  Future<Either<Failure, List<Department>>> getDepartments() {
    return dataSource.getDepartments();
  }

  @override
  Future<Either<Failure, List<Piece>>> getDepartmentPieces(Department department) {
    return dataSource.getDepartmentPieces(department);
  }
}