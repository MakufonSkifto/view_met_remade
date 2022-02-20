import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failures.dart';
import '../entities/department.dart';

abstract class DepartmentRepository {
  Future<Either<Failure, List<Department>>> getDepartments();
}