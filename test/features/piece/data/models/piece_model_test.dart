import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:view_met_remade/features/piece/data/models/piece_model.dart';
import 'package:view_met_remade/features/piece/domain/entities/piece.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tPieceModel = PieceModel(
      title: "Coin, 10 Centavos",
      objectName: "Centavos",
      artistDisplayName: "Unknown",
      objectID: 31,
      isHighlight: false,
      objectDate: "1885",
      accessionNumber: "16.74.40",
      accessionYear: "1916",
      department: "The American Wing",
      culture: "Mexican",
      dimensions: "Diam. 3/4 in. (1.9 cm)",
      creditLine: "Gift of Mrs. Russell Sage, 1916",
      objectURL: "https://www.metmuseum.org/art/collection/search/31",
      primaryImageSmall: "Unknown",
      country: "Mexico"
  );

  test(
    "Should be a subclass of Piece entity",
    () async {
      expect(tPieceModel, isA<Piece>());
    }
  );

  group("fromJson", () {
    test(
      "Should return a valid Piece model",
      () async {
        final Map<String, dynamic> jsonMap = json.decode(fixture('piece.json'));
        final result = PieceModel.fromJson(jsonMap);

        expect(result, tPieceModel);
      },
    );
  });

  group("toJson", () {
    test(
      "Should return a valid Piece JSON",
      () async {
        final result = tPieceModel.toJson();
        final Map<String, dynamic> expectedJsonMap = json.decode(fixture('piece.json'));

        expect(result, expectedJsonMap);
      },
    );
  });
}