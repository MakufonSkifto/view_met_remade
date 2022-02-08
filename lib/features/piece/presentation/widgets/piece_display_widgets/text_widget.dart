import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PieceTextWidget extends StatelessWidget {
  final String title;
  final String content;

  const PieceTextWidget({
    Key? key,
    required this.title,
    required this.content
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.fromLTRB(8, 6, 0, 0),
      child: Row(
        children: [
          Text(
            title,
            style: GoogleFonts.merriweatherSans(fontSize: 20, color: Colors.red),
          ),
          Expanded(
            child: Text(
              content,
              style: GoogleFonts.merriweatherSans(fontSize: 20, color: Colors.white.withOpacity(.90)),
            ),
          )
        ],
      ),
    );
  }
}