import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:view_met_remade/features/piece/data/models/piece_model.dart';

import '../../../piece/domain/entities/piece.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitial()) {
    on<OnPieceFavorited>(_onPieceFavorited);
  }

  void _onPieceFavorited(OnPieceFavorited event, Emitter<FavoritesState> emit) {

  }
}
