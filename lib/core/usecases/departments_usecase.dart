import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../features/departments/domain/entities/department.dart';
import '../exceptions/failures.dart';

abstract class DepartmentsUseCase<Type, Params> {
  Future<Either<Failure, List<Department>>> call();
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}