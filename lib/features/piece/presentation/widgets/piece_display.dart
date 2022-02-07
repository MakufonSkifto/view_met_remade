import 'package:flutter/material.dart';

import '../../../piece/domain/entities/piece.dart';

class PieceDisplay extends StatelessWidget {
  final Piece piece;

  const PieceDisplay(this.piece, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(piece.objectName);
  }
}