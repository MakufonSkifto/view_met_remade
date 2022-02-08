import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class PieceLinkWidget extends StatelessWidget {
  final String link;

  const PieceLinkWidget({Key? key, required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  await launch(link, forceSafariVC: false);
                },
              style: GoogleFonts.merriweatherSans(fontSize: 20, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}