import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/exceptions/failures.dart';
import '../../../../../core/injectors/injection_container_favorite.dart';
import '../../../../favorite/domain/repositories/favorites_repository.dart';
import '../../../data/models/piece_model.dart';
import '../../../domain/entities/piece.dart';

class PieceFavoritesWidget extends StatelessWidget {
  final Piece piece;

  const PieceFavoritesWidget({Key? key, required this.piece}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 6, 0, 7),
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red)
        ),
        onPressed: () async {
          var add = await _addToFavorites();

          add.fold(
            (failure) {
              _showSnackBar(context, "Failed to add to favorites list.");
            },
            (success) {
              _showSnackBar(context, "Successfully added ${piece.title} to favorites!");
            }
          );
        },
        child: Text("Add to Favorites", style: GoogleFonts.merriweatherSans(color: Colors.white)),
      ),
    );
  }

  Future<Either<Failure, List<String>>> _addToFavorites() async {
    FavoritesRepository repo = sl<FavoritesRepository>();

    var add = await repo.addToFavorites(PieceModel(
        title: piece.title,
        objectName: piece.objectName,
        artistDisplayName: piece.artistDisplayName,
        objectID: piece.objectID,
        isHighlight: piece.isHighlight,
        objectDate: piece.objectDate,
        accessionYear: piece.accessionYear,
        accessionNumber: piece.accessionNumber,
        department: piece.department,
        culture: piece.culture,
        dimensions: piece.dimensions,
        creditLine: piece.creditLine,
        objectURL: piece.objectURL,
        primaryImageSmall: piece.primaryImageSmall,
        country: piece.country
    ));

    return add;
  }

  void _showSnackBar(BuildContext context, String message) {
    SnackBar snackBar = SnackBar(
      content: Text(message),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}