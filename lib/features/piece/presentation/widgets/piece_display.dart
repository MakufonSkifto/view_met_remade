import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:view_met_remade/features/piece/presentation/widgets/piece_display_widgets/artist_widget.dart';
import 'package:view_met_remade/features/piece/presentation/widgets/piece_display_widgets/name_widget.dart';
import 'package:view_met_remade/features/piece/presentation/widgets/piece_display_widgets/title_widget.dart';

import '../../../favorite/presentation/bloc/favorites_bloc.dart';
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
          imageUrl: piece.primaryImageSmall,
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
            onPressed: () {
              BlocProvider.of<FavoritesBloc>(context).add(OnPieceFavorited(piece: piece));
            },
            child: Text("Add to Favorites", style: GoogleFonts.merriweatherSans(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}