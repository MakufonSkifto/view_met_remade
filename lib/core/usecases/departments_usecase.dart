import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../features/departments/domain/entities/department.dart';
import '../../features/piece/domain/entities/piece.dart';
import '../exceptions/failures.dart';

abstract class DepartmentsListUseCase<Type, Params> {
  Future<Either<Failure, List<Department>>> call();
}

abstract class DepartmentPiecesUseCase<Type, Params> {
  Future<Either<Failure, List<Piece>>> call(Params params);
}


class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}