import 'package:flutter/material.dart';

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
        primarySwatch: Colors.red,
      ),
      home: page,
    );
  }
}