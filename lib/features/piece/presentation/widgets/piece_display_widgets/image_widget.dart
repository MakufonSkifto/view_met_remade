import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class PieceImageWidget extends StatelessWidget {
  final String image;

  const PieceImageWidget({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return image != "Unknown"
        ?  CachedNetworkImage(
          placeholder: (_, __) => const CircularProgressIndicator(),
          imageUrl: image
        )
        : Text(
          "Failed to load image",
          style: GoogleFonts.merriweatherSans(
              fontSize: 16, color: Colors.white.withOpacity(.60)
          ));
  }
}