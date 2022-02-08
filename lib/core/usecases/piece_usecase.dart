import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../features/piece/domain/entities/piece.dart';
import '../exceptions/failures.dart';

abstract class PieceUseCase<Type, Params> {
  Future<Either<Failure, Piece>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}