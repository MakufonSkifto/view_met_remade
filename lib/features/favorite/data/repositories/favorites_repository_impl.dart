import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failures.dart';
import '../../../piece/domain/entities/piece.dart';
import '../../domain/repositories/favorites_repository.dart';
import '../datasources/favorites_data_source.dart';


class PieceRepositoryImpl implements FavoritesRepository {
  final FavoritesDataSource dataSource;

  PieceRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, List<Piece>>> getFavorites() async {
    return await _getFavorites();
  }

  Future<Either<Failure, List<Piece>>> _getFavorites() async {
    try {
      final localPiece = await dataSource.getFavorites();
      return Right(localPiece);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}