import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failures.dart';
import '../../../piece/domain/entities/piece.dart';
import '../entities/department.dart';

abstract class DepartmentRepository {
  Future<Either<Failure, List<Department>>> getDepartments();
  Future<Either<Failure, List<Piece>>> getDepartmentPieces(Department department);
}