import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/welcome_text.dart';
import '../widgets/about_button.dart';
import '../widgets/favorites_button.dart';
import '../widgets/view_met_image.dart';
import '../widgets/view_met_text.dart';
import '../widgets/departments_list_widget.dart';


class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          AboutButton(),
          FavoriteButton()
        ],
      ),
      body: SafeArea(
        top: false,
        child: Center(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ViewMetImage(),
                  ViewMetText(),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 200, 0, 20),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: WelcomeText(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 280, 0, 20),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 300,
                            child: TextField(
                              controller: _controller,
                              onSubmitted: (String value) {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (BuildContext context) => SearchPage(text: _controller.text)
                                //     )
                                // );
                              },
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.search),
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(99),
                                    ),
                                  ),
                                  filled: true,
                                  hintStyle: GoogleFonts.merriweatherSans(color: Colors.black),
                                  hintText: "Search View MET",
                                  fillColor: Colors.white
                              ),
                            ),
                          )
                      ),
                    ),
                  ]
              ),
              DepartmentsListWidget()
            ],
          ),
        ),
      )
    );
  }
}
