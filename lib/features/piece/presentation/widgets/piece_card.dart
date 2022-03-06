import 'package:flutter/material.dart';
import 'package:view_met_remade/features/piece/presentation/widgets/piece_display_widgets/image_widget.dart';

import '../../domain/entities/piece.dart';
import '../pages/piece_page.dart';

class PieceCard extends StatelessWidget {
  final Piece piece;

  const PieceCard({Key? key, required this.piece}) : super(key: key);

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
            ],
          ),
        ],
      ),
    );
  }
}