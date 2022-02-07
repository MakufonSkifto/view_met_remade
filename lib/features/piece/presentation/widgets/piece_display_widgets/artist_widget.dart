import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PieceArtistWidget extends StatelessWidget {
  final String artist;

  const PieceArtistWidget({Key? key, required this.artist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 6, 0, 0),
      child: Row(
        children: [
          Text(
            "Artist: ",
            style: GoogleFonts.merriweatherSans(fontSize: 20, color: Colors.red),
          ),
          Expanded(
            child: Text(
              artist,
              style: GoogleFonts.merriweatherSans(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}