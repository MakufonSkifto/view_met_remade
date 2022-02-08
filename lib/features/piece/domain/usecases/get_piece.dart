import 'package:dartz/dartz.dart';
import 'package:view_met_remade/features/piece/domain/entities/piece.dart';
import 'package:view_met_remade/features/piece/domain/repositories/piece_repository.dart';

import '../../../../core/exceptions/failures.dart';
import '../../../../core/usecases/piece_usecase.dart';

class GetPiece extends PieceUseCase<Piece, int> {
  final PieceRepository repository;

  GetPiece(this.repository);

  @override
  Future<Either<Failure, Piece>> call(int params) async {
    return await repository.getPiece(params);
  }
}