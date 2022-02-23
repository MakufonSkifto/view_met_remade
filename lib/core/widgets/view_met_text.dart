import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewMetText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 150, 0, 20),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          'View MET',
          style: GoogleFonts.playfairDisplaySc(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      )
    );
  }
}
