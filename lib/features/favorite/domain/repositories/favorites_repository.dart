import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failures.dart';
import '../../../piece/domain/entities/piece.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, List<Piece>>> getFavorites();
}