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

  Error({required this.message});

  @override
  List<Object?> get props => [message];
}

class Loaded extends FavoritesState {
  final PieceModel piece;

  Loaded({required this.piece});

  @override
  List<Object?> get props => throw UnimplementedError();
}
