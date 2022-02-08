import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewMet extends StatelessWidget {
  final Widget page;

  const ViewMet({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "View MET",
      theme: ThemeData(
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        brightness: Brightness.dark,
        textTheme: GoogleFonts.merriweatherSansTextTheme(),
        primarySwatch: Colors.red,
      ),
      home: page,
    );
  }
}