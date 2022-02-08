import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:view_met_remade/core/exceptions/failures.dart';
import 'package:view_met_remade/features/favorite/domain/repositories/favorites_repository.dart';
import 'package:view_met_remade/features/piece/data/models/piece_model.dart';
import 'package:view_met_remade/features/piece/presentation/widgets/piece_display_widgets/artist_widget.dart';
import 'package:view_met_remade/features/piece/presentation/widgets/piece_display_widgets/name_widget.dart';
import 'package:view_met_remade/features/piece/presentation/widgets/piece_display_widgets/title_widget.dart';

import '../../../../core/injectors/injection_container_favorite.dart';
import '../../domain/entities/piece.dart';

class PieceDisplay extends StatelessWidget {
  final Piece piece;

  const PieceDisplay(this.piece, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CachedNetworkImage(
          placeholder: (_, __) => const CircularProgressIndicator(),
          imageUrl:  (piece.primaryImageSmall != "Unknown"
              ? piece.primaryImageSmall
              : "https://thumbs.dreamstime.com/b/vector-yellow-hazard-warning-symbol-danger-icon-sign-warn-isolated-white-background-use-web-typography-app-road-155959729.jpg").toString(),
        ),
        PieceTitleWidget(text: piece.title),
        PieceNameWidget(name: piece.objectName),
        PieceArtistWidget(artist: piece.artistDisplayName),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 6, 0, 0),
          child: Row(
            children: [
              Text(
                "Object ID: ",
                style: GoogleFonts.merriweatherSans(fontSize: 20, color: Colors.red),
              ),
              Expanded(
                child: Text(
                  piece.objectID.toString(),
                  style: GoogleFonts.merriweatherSans(fontSize: 20),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 6, 0, 0),
          child: Row(
            children: [
              Text(
                "Is Highlighted: ",
                style: GoogleFonts.merriweatherSans(fontSize: 20, color: Colors.red),
              ),
              Expanded(
                child: Text(
                  piece.isHighlight.toString(),
                  style: GoogleFonts.merriweatherSans(fontSize: 20),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 6, 0, 0),
          child: Row(
            children: [
              Text(
                "Date: ",
                style: GoogleFonts.merriweatherSans(fontSize: 20, color: Colors.red),
              ),
              Expanded(
                child: Text(
                  piece.objectDate,
                  style: GoogleFonts.merriweatherSans(fontSize: 20),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 6, 0, 0),
          child: Row(
            children: [
              Text(
                "Accession Year: ",
                style: GoogleFonts.merriweatherSans(fontSize: 20, color: Colors.red),
              ),
              Expanded(
                child: Text(
                  piece.accessionYear,
                  style: GoogleFonts.merriweatherSans(fontSize: 20),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 6, 0, 0),
          child: Row(
            children: [
              Text(
                "Accession Number: ",
                style: GoogleFonts.merriweatherSans(fontSize: 20, color: Colors.red),
              ),
              Expanded(
                child: Text(
                  piece.accessionNumber,
                  style: GoogleFonts.merriweatherSans(fontSize: 20),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 6, 0, 0),
          child: Row(
            children: [
              Text(
                "Department: ",
                style: GoogleFonts.merriweatherSans(fontSize: 20, color: Colors.red),
              ),
              Expanded(
                child: Text(
                  piece.department,
                  style: GoogleFonts.merriweatherSans(fontSize: 20),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 6, 0, 0),
          child: Row(
            children: [
              Text(
                "Culture: ",
                style: GoogleFonts.merriweatherSans(fontSize: 20, color: Colors.red),
              ),
              Expanded(
                child: Text(
                  piece.culture,
                  style: GoogleFonts.merriweatherSans(fontSize: 20),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 6, 0, 0),
          child: Row(
            children: [
              Text(
                "Dimensions: ",
                style: GoogleFonts.merriweatherSans(fontSize: 20, color: Colors.red),
              ),
              Expanded(
                child: Text(
                  piece.dimensions,
                  style: GoogleFonts.merriweatherSans(fontSize: 20),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 6, 0, 0),
          child: Row(
            children: [
              Text(
                "Credit Line: ",
                style: GoogleFonts.merriweatherSans(fontSize: 20, color: Colors.red),
              ),
              Expanded(
                child: Text(
                  piece.creditLine,
                  style: GoogleFonts.merriweatherSans(fontSize: 20),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 6, 0, 0),
          child: Row(
            children: [
              Text(
                "Object URL: ",
                style: GoogleFonts.merriweatherSans(fontSize: 20, color: Colors.red),
              ),
              RichText(
                text: TextSpan(
                  text: "Link",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      await launch(piece.objectURL, forceSafariVC: false);
                    },
                  style: GoogleFonts.merriweatherSans(fontSize: 20, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
        Padding(
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
        ),
      ],
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