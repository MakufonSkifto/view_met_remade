part of 'piece_bloc.dart';

@immutable
abstract class PieceEvent {}


class OnPieceRequestedEvent extends PieceEvent {
  final int id;

  OnPieceRequestedEvent(this.id);
}