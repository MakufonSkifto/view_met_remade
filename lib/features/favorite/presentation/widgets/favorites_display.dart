import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:view_met_remade/features/favorite/presentation/widgets/favorites_piece_card.dart';
import 'package:view_met_remade/features/piece/data/models/piece_model.dart';

class FavoritesDisplay extends StatelessWidget {
  final List<String> favorites;

  const FavoritesDisplay({Key? key, required this.favorites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return favorites.isEmpty
        ? buildEmptyText()
        : buildListView();
  }

  Widget buildListView() {
    return ListView.builder(
      itemCount: favorites.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        Map<String, dynamic> data = json.decode(favorites[index]);

        return FavoritesPieceCard(piece: PieceModel.fromJson(data));
      },
    );
  }

  Widget buildEmptyText() {
    return Center(
      child: Text("Your favorites list is empty!", style: TextStyle(color: Colors.white.withOpacity(.90))),
    );
  }
}