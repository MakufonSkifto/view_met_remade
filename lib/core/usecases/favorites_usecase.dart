import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../exceptions/failures.dart';

abstract class FavoritesUseCase<Type, Params> {
  Future<Either<Failure, List<String>>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}