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

  Future removeFromFavorites(PieceModel pieceToRemove);
}

const favoritesListString = "FAVORITES_LIST";

class FavoritesDataSourceImpl implements FavoritesDataSource {
  final SharedPreferences sharedPreferences;

  FavoritesDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<String>> getFavorites() {
    final favoritesList = sharedPreferences.getStringList(favoritesListString);

    if (favoritesList != null) {
      return Future.value(favoritesList);
    } else {
      sharedPreferences.setStringList(favoritesListString, []);
      return Future.value([]);
    }
  }

  @override
  Future addToFavorites(PieceModel pieceToCache) {
    final favoritesList = sharedPreferences.getStringList(favoritesListString);

    if (favoritesList != null) {
      favoritesList.add(json.encode(pieceToCache.toJson()));

      sharedPreferences.setStringList(
        favoritesListString,
        favoritesList,
      );

      return Future.value(favoritesList);
    } else {
      sharedPreferences.setStringList(
        favoritesListString,
        [json.encode(pieceToCache.toJson())],
      );

      return Future.value([json.encode(pieceToCache.toJson())]);
    }
  }

  @override
  Future removeFromFavorites(PieceModel pieceToRemove) {
    final favoritesList = sharedPreferences.getStringList(favoritesListString);

    if (favoritesList != null) {
      favoritesList.remove(json.encode(pieceToRemove.toJson()));

      sharedPreferences.setStringList(
        favoritesListString,
        favoritesList,
      );

      return Future.value(favoritesList);
    } else {
      throw CacheException();
    }
  }
}