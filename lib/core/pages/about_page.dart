import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/view_met_text.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/MET.jpg",
              ),
              opacity: .20,
              fit: BoxFit.cover,
            )
          ),
          child: Column(
            children: <Widget>[
              const ViewMetText(),
              Text("Made with Flutter by MakufonSkifto", style: GoogleFonts.merriweatherSans(fontSize: 18, color: Colors.white.withOpacity(.90))),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text("View MET has no connections with\n The Metropolitan Museum of Art itself whatsoever.", textAlign: TextAlign.center,style: GoogleFonts.merriweather(fontSize: 15, color: Colors.white.withOpacity(.90))),
                  )
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: GoogleFonts.merriweatherSans(fontSize: 15, color: Colors.white.withOpacity(.90)),
                        children: [
                          const TextSpan(
                            text: "Special thanks to ",
                          ),
                          TextSpan(
                            text: "metmuseum",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                await launch("https://metmuseum.github.io/", forceSafariVC: false);
                              },
                            style: GoogleFonts.merriweatherSans(
                                color: Colors.blue
                            ),
                          ),
                          const TextSpan(
                            text: " for providing all the information used in View MET",
                          ),
                        ],
                      ),
                    ),
                  )
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 70, 0, 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text("Version 2.0.0a", textAlign: TextAlign.center,style: GoogleFonts.merriweatherSans(fontSize: 15, color: Colors.white.withOpacity(.90))),
                  )
              ),
            ],
          ),
        )
      ),
    );
  }
}