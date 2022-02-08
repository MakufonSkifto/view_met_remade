part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();
}

class FavoritesInitial extends FavoritesState {
  @override
  List<Object> get props => [];
}

class Error extends FavoritesState {
  final String message;

  const Error({required this.message});

  @override
  List<Object?> get props => [message];
}

class Loaded extends FavoritesState {
  final List<String> favoritedPieces;

  const Loaded({required this.favoritedPieces});

  @override
  List<Object?> get props => [favoritedPieces];
}


class Loading extends FavoritesState {
  @override
  List<Object?> get props => [];
}
