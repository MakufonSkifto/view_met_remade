part of 'piece_bloc.dart';

@immutable
abstract class PieceState {}

class PieceInitial extends PieceState {}

class Loading extends PieceState {}

class Loaded extends PieceState {
  final Piece piece;

  Loaded({required this.piece});
}

class Error extends PieceState {
  final String message;

  Error({required this.message});
}
