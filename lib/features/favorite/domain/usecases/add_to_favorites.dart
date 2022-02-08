import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failures.dart';
import '../../../../core/usecases/favorites_usecase.dart';
import '../../../piece/data/models/piece_model.dart';
import '../../../piece/domain/entities/piece.dart';
import '../repositories/favorites_repository.dart';

class AddToFavorites extends FavoritesUseCase<Piece, PieceModel> {
  final FavoritesRepository repository;

  AddToFavorites(this.repository);

  @override
  Future<Either<Failure, List<String>>> call(PieceModel params) async {
    return await repository.addToFavorites(params);
  }
}