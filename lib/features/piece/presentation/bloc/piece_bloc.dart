import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:view_met_remade/features/piece/domain/repositories/piece_repository.dart';
import 'package:view_met_remade/features/piece/domain/usecases/get_piece.dart';

import '../../domain/entities/piece.dart';

part 'piece_event.dart';
part 'piece_state.dart';

class PieceBloc extends Bloc<PieceEvent, PieceState> {
  final PieceRepository pieceRepository;

  PieceBloc({required this.pieceRepository}) : super(PieceInitial()) {
    on<OnPieceRequestedEvent>(_onPieceRequested);
  }

  void _onPieceRequested(OnPieceRequestedEvent event, Emitter<PieceState> emit) async {
    emit(Loading());

    var getPiece = GetPiece(pieceRepository);
    var piece = await getPiece(event.id);

    piece.fold(
      (failure) {
        _emitError(emit, "Something happened!");
      },
      (piece) {
        _emitLoaded(emit, piece);
      },
    );
  }

  void _emitError(Emitter<PieceState> emit, String message) {
    emit(Error(message: message));
  }

  void _emitLoaded(Emitter<PieceState> emit, Piece piece) {
    emit(Loaded(piece: piece));
  }
}
