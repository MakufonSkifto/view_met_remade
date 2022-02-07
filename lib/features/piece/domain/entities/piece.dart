import 'package:equatable/equatable.dart';

class Piece extends Equatable {
  final String title;
  final String objectName;
  final String? artistDisplayName;
  final int objectID;
  final bool isHighlight;
  final String objectDate;
  final String accessionYear;
  final String accessionNumber;
  final String department;
  final String culture;
  final String dimensions;
  final String creditLine;
  final String objectURL;
  final String? primaryImageSmall;
  final String country;

  Piece({
    required this.title,
    required this.objectName,
    required this.artistDisplayName,
    required this.objectID,
    required this.isHighlight,
    required this.objectDate,
    required this.accessionYear,
    required this.accessionNumber,
    required this.department,
    required this.culture,
    required this.dimensions,
    required this.creditLine,
    required this.objectURL,
    required this.primaryImageSmall,
    required this.country
  });

  @override
  List<Object?> get props => [
    title,
    objectName,
    artistDisplayName,
    objectID,
    isHighlight,
    objectDate,
    accessionYear,
    accessionNumber,
    department,
    culture,
    dimensions,
    creditLine,
    objectURL,
    primaryImageSmall,
    country
  ];
}