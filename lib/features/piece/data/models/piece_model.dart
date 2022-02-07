import '../../domain/entities/piece.dart';

class PieceModel extends Piece {
  PieceModel({
    required String title,
    required String objectName,
    required String? artistDisplayName,
    required int objectID,
    required bool isHighlight,
    required String objectDate,
    required String accessionYear,
    required String accessionNumber,
    required String department,
    required String culture,
    required String dimensions,
    required String creditLine,
    required String objectURL,
    required String? primaryImageSmall,
    required String country,
    }) : super(
    title: title,
    objectName: objectName,
    artistDisplayName: artistDisplayName,
    objectID: objectID,
    isHighlight: isHighlight,
    objectDate: objectDate,
    accessionYear: accessionYear,
    accessionNumber: accessionNumber,
    department: department,
    culture: culture,
    dimensions: dimensions,
    creditLine: creditLine,
    objectURL: objectURL,
    primaryImageSmall: primaryImageSmall,
    country: country
  );

  factory PieceModel.fromJson(Map<String, dynamic> data) {
    return PieceModel(
      title: data["title"],
      objectName: data["objectName"],
      artistDisplayName: data["artistDisplayName"] != ""
        ? data["artistDisplayName"]
        : null,
      objectID: data["objectID"],
      isHighlight: data["isHighlight"],
      objectDate: data["objectDate"],
      accessionYear: data["accessionYear"],
      accessionNumber: data["accessionNumber"],
      department: data["department"],
      culture: data["culture"],
      dimensions: data["dimensions"],
      creditLine: data["creditLine"],
      objectURL: data["objectURL"],
      primaryImageSmall: data["primaryImageSmall"] != ""
          ? data["primaryImageSmall"]
          : null,
      country: data["country"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "objectName": objectName,
      "artistDisplayName": artistDisplayName,
      "objectID": objectID,
      "isHighlight": isHighlight,
      "objectDate": objectDate,
      "accessionYear": accessionYear,
      "accessionNumber": accessionNumber,
      "department": department,
      "culture": culture,
      "dimensions": dimensions,
      "creditLine": creditLine,
      "objectURL": objectURL,
      "primaryImageSmall": primaryImageSmall,
      "country": country
    };
  }
}