import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return builder();
  }

  Widget builder() {
    var now = DateTime.now();

    if (now.hour <= 11 && now.hour >= 5) {
      return Text("Good Morning", style: GoogleFonts.playfairDisplaySc(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold));
    }
    else if (now.hour <= 17 && now.hour >= 12) {
      return Text("Good Afternoon", style: GoogleFonts.playfairDisplaySc(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold));
    }
    else if (now.hour <= 21 && now.hour >= 18 && now.hour >= 19 && now.hour >= 5 || now.hour == 0) {
      return Text("Good Evening", style: GoogleFonts.playfairDisplaySc(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold));
    }
    else {
      return Text("Hello", style: GoogleFonts.playfairDisplaySc(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold));
    }
  }
}