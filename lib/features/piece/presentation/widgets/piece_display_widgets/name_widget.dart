import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PieceNameWidget extends StatelessWidget {
  final String name;

  const PieceNameWidget({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 6, 0, 0),
      child: Row(
        children: [
          Text(
            "Object Name: ",
            style: GoogleFonts.merriweatherSans(fontSize: 20, color: Colors.red),
          ),
          Expanded(
            child: Text(
              name,
              style: GoogleFonts.merriweatherSans(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}