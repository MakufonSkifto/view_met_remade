import 'package:flutter/material.dart';
import 'package:view_met_remade/features/piece/presentation/pages/piece_page.dart';

import '../../../piece/data/models/piece_model.dart';
import '../../../piece/presentation/widgets/piece_display_widgets/image_widget.dart';

class FavoritesPieceCard extends StatelessWidget {
  final PieceModel piece;

  const FavoritesPieceCard({Key? key, required this.piece}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: PieceImageWidget(
              image: piece.primaryImageSmall,
            ),
            title: Text(piece.title),
            subtitle: Text(
              "by ${piece.artistDisplayName}",
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PiecePage(id: piece.objectID)),
                  );
                },
                child: const Text("Details", style: TextStyle(color: Colors.red)),
              ),
              TextButton(
                onPressed: () {

                },
                child: const Text("Remove from Favorites", style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}