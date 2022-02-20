import 'package:dartz/dartz.dart';

import 'package:view_met_remade/core/exceptions/failures.dart';

import '../../../../core/usecases/departments_usecase.dart';
import '../../../piece/domain/entities/piece.dart';
import '../entities/department.dart';
import '../repositories/department_repository.dart';

class GetDepartmentPieces extends DepartmentPiecesUseCase<List<Piece>, Department> {
  final DepartmentRepository repository;

  GetDepartmentPieces(this.repository);

  @override
  Future<Either<Failure, List<Piece>>> call(Department params) {
    return repository.getDepartmentPieces(params);
  }
}