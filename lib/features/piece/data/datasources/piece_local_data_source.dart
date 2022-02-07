import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../models/piece_model.dart';

abstract class PieceLocalDataSource {
  /// Gets the cached [PieceModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<PieceModel> getCachedPiece(int pieceID);

  Future<void> cachePiece(PieceModel pieceToCache);
}

class PieceLocalDataSourceImpl implements PieceLocalDataSource {
  final SharedPreferences sharedPreferences;

  PieceLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<PieceModel> getCachedPiece(int pieceID) {
    final jsonString = sharedPreferences.getString(pieceID.toString());
    if (jsonString != null) {
      return Future.value(PieceModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cachePiece(PieceModel pieceToCache) {
    return sharedPreferences.setString(
      pieceToCache.objectID.toString(),
      json.encode(pieceToCache.toJson()),
    );
  }
}