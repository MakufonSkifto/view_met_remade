import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../piece/data/models/piece_model.dart';

abstract class FavoritesDataSource {
  /// Gets the cached [PieceModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<List<String>> getFavorites();

  Future addToFavorites(PieceModel pieceToFavorite);
}

const favoritesList = "FAVORITES_LIST";

class FavoritesDataSourceImpl implements FavoritesDataSource {
  final SharedPreferences sharedPreferences;

  FavoritesDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<String>> getFavorites() {
    final jsonString = sharedPreferences.getStringList(favoritesList);

    if (jsonString != null) {
      return Future.value(jsonString);
    } else {
      throw CacheException();
    }
  }

  @override
  Future addToFavorites(PieceModel pieceToCache) {
    final jsonString = sharedPreferences.getStringList(favoritesList);

    if (jsonString != null) {
      jsonString.add(json.encode(pieceToCache.toJson()));

      sharedPreferences.setStringList(
        favoritesList,
        jsonString,
      );

      return Future.value(jsonString);
    } else {
      sharedPreferences.setStringList(
        favoritesList,
        [json.encode(pieceToCache.toJson())],
      );

      return Future.value([json.encode(pieceToCache.toJson())]);
    }
  }
}