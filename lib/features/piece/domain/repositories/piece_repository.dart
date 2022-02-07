import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failures.dart';
import '../entities/piece.dart';

abstract class PieceRepository {
  Future<Either<Failure, Piece>> getPiece(int id);
}