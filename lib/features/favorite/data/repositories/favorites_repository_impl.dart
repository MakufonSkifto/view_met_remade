import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failures.dart';
import '../../../piece/data/models/piece_model.dart';
import '../../domain/repositories/favorites_repository.dart';
import '../datasources/favorites_data_source.dart';


class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesDataSource dataSource;

  FavoritesRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, List<String>>> getFavorites() async {
    return await _getFavorites();
  }

  @override
  Future<Either<Failure, List<String>>> addToFavorites(PieceModel pieceToFavorite) async {
    return await _addToFavorites(pieceToFavorite);
  }

  @override
  Future<Either<Failure, List<String>>> removeFromFavorites(PieceModel pieceToRemove) async {
    return await _removeFromFavorites(pieceToRemove);
  }

  Future<Either<Failure, List<String>>> _getFavorites() async {
    try {
      final localPiece = await dataSource.getFavorites();
      return Right(localPiece);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  Future<Either<Failure, List<String>>> _addToFavorites(PieceModel pieceToFavorite) async {
    try {
      final localPiece = await dataSource.addToFavorites(pieceToFavorite);
      return Right(localPiece);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  Future<Either<Failure, List<String>>> _removeFromFavorites(PieceModel pieceToRemove) async {
    try {
      final localPiece = await dataSource.removeFromFavorites(pieceToRemove);
      return Right(localPiece);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}