import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:view_met_remade/features/departments/presentation/pages/departments_list.dart';
import 'package:view_met_remade/features/favorite/presentation/pages/favorites_page.dart';

import '../widgets/welcome_text.dart';

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
            IconButton(
              iconSize: 30,
              color: Colors.white,
              icon: const Icon(Icons.info),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => AboutPage()),
                // );
              },
            ),
            IconButton(
              iconSize: 30,
              color: Colors.white,
              icon: const Icon(Icons.favorite),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FavoritesPage()),
                );
              },
            ),
          ],
        ),
      body: SafeArea(
        top: false,
        child: Center(
          child: Column(
            children: <Widget>[
              Stack(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 400,
                      child: Image.asset(
                          "assets/MET.jpg",
                          fit: BoxFit.fill,
                          color: const Color.fromRGBO(117, 117, 117, 0.5),
                          colorBlendMode: BlendMode.modulate
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 150, 0, 20),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            'View MET',
                            style: GoogleFonts.playfairDisplaySc(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        )
                    ),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Column(
                  children: <Widget>[
                    Text("Departments", style: GoogleFonts.merriweatherSans(fontSize: 18, color: Colors.white.withOpacity(.90))),
                    Scrollbar(
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height - 438,
                          child: const DepartmentsList()
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}