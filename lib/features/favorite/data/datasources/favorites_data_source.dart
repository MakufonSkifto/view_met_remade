import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../piece/data/models/piece_model.dart';

abstract class FavoritesDataSource {
  /// Gets the cached [PieceModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<List<PieceModel>> getFavorites();

  Future<void> addToFavorites(PieceModel pieceToFavorite);
}

const favoritesList = "FAVORITES_LIST";

class FavoritesDataSourceImpl implements FavoritesDataSource {
  final SharedPreferences sharedPreferences;

  FavoritesDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<PieceModel>> getFavorites() {
    final jsonString = sharedPreferences.getStringList(favoritesList) as List<PieceModel>?;
    if (jsonString != null) {
      List<PieceModel> favorites = [];

      for (PieceModel piece in jsonString) {
        favorites.add(piece);
      }

      return Future.value(favorites);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> addToFavorites(PieceModel pieceToCache) {
    final jsonString = sharedPreferences.getStringList(favoritesList);

    if (jsonString != null) {
      jsonString.add(json.encode(pieceToCache.toJson()));

      return _setStringList(
        pieceToCache.objectID.toString(),
        jsonString,
      );
    } else {
      return _setStringList(
        pieceToCache.objectID.toString(),
        [json.encode(pieceToCache.toJson())],
      );
    }
  }

  _setStringList(String name, List<String> content) {
    sharedPreferences.setStringList(
      name,
      content,
    );
  }
}