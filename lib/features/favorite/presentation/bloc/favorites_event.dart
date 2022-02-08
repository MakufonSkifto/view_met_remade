part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();
}


class OnFavoritesRequestedEvent extends FavoritesEvent {
  @override
  List<Object?> get props => [];
}
