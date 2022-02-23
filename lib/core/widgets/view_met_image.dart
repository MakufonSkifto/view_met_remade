import 'package:flutter/material.dart';

class ViewMetImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 400,
      child: Image.asset(
          "assets/MET.jpg",
          fit: BoxFit.fill,
          color: const Color.fromRGBO(117, 117, 117, 0.5),
          colorBlendMode: BlendMode.modulate
      ),
    );
  }
}
