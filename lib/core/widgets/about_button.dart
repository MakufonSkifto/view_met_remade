import 'package:flutter/material.dart';

class AboutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30,
      color: Colors.white,
      icon: const Icon(Icons.info),
      onPressed: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => AboutPage()),
        // );
      },
    );
  }
}
