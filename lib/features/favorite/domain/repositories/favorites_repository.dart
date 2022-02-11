import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failures.dart';
import '../../../piece/data/models/piece_model.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, List<String>>> getFavorites();

  Future<Either<Failure, List<String>>> addToFavorites(PieceModel pieceToFavorite);

  Future<Either<Failure, List<String>>> removeFromFavorites(PieceModel pieceToRemove);
}