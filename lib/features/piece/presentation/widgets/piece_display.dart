import 'package:flutter/material.dart';
import 'package:view_met_remade/features/piece/presentation/widgets/piece_display_widgets/add_to_favorites_widget.dart';

import 'package:view_met_remade/features/piece/presentation/widgets/piece_display_widgets/image_widget.dart';
import 'package:view_met_remade/features/piece/presentation/widgets/piece_display_widgets/link_widget.dart';
import 'package:view_met_remade/features/piece/presentation/widgets/piece_display_widgets/text_widget.dart';

import '../../domain/entities/piece.dart';

class PieceDisplay extends StatelessWidget {
  final Piece piece;

  const PieceDisplay(this.piece, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PieceImageWidget(image: piece.primaryImageSmall),
        PieceTextWidget(title: "Title: ", content: piece.title),
        PieceTextWidget(title: "Object Name: ", content: piece.objectName),
        PieceTextWidget(title: "Artist: ", content: piece.artistDisplayName),
        PieceTextWidget(title: "Object ID: ", content: piece.objectID.toString()),
        PieceTextWidget(title: "Is Highlighted: ", content: piece.isHighlight.toString()),
        PieceTextWidget(title: "Date: ", content: piece.objectDate),
        PieceTextWidget(title: "Accession Year: ", content: piece.accessionYear),
        PieceTextWidget(title: "Accession Number: ", content: piece.accessionNumber),
        PieceTextWidget(title: "Department: ", content: piece.department),
        PieceTextWidget(title: "Culture: ", content: piece.culture),
        PieceTextWidget(title: "Dimensions: ", content: piece.dimensions),
        PieceTextWidget(title: "Credit Line: ", content: piece.creditLine),
        PieceTextWidget(title: "Country: ", content: piece.country),
        PieceLinkWidget(link: piece.objectURL),
        PieceFavoritesWidget(piece: piece)
      ],
    );
  }
}