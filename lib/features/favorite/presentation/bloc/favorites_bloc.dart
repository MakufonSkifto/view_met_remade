import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:view_met_remade/features/favorite/domain/repositories/favorites_repository.dart';
import 'package:view_met_remade/features/favorite/domain/usecases/add_to_favorites.dart';

import '../../../piece/data/models/piece_model.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoritesRepository repository;

  // TODO: implement OnFavoritesGet

  FavoritesBloc(this.repository) : super(FavoritesInitial()) {
    on<FavoritesEvent>((event, emit) {});
  }
}
