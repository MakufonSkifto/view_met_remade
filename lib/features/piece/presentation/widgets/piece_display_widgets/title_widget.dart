import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PieceTitleWidget extends StatelessWidget {
  final String text;

  const PieceTitleWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 6, 0, 0),
      child: Row(
        children: [
          Text(
            "Title: ",
            style: GoogleFonts.merriweatherSans(fontSize: 20, color: Colors.red),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.merriweatherSans(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}