import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


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
        : const Icon(Icons.dangerous, size: 50, color: Colors.red);
  }
}