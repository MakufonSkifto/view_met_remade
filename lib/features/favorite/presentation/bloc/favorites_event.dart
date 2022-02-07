part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();
}

class OnPieceFavorited extends FavoritesEvent {
  final Piece piece;

  const OnPieceFavorited({required this.piece});

  @override
  List<Object?> get props => throw UnimplementedError();
}
