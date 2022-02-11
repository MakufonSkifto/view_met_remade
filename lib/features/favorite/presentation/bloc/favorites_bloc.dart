import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:view_met_remade/features/favorite/domain/repositories/favorites_repository.dart';
import 'package:view_met_remade/features/favorite/domain/usecases/get_favorites.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoritesRepository repository;

  FavoritesBloc(this.repository) : super(FavoritesInitial()) {
    on<OnFavoritesRequestedEvent>(_onFavoritesRequestedEvent);
  }

  void _onFavoritesRequestedEvent(OnFavoritesRequestedEvent event, Emitter<FavoritesState> emit) async {
    emit(Loading());

    var getFavorites = GetFavorites(repository);
    var favoritesList = await getFavorites();

    favoritesList.fold(
      (failure) {
        emit(const Error(message: "An error occured while removing from favorites!"));
      },
      (favorites) {
        emit(Loaded(favoritedPieces: favorites));
      }
    );
  }
}
