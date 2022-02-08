// Injection Container for Favorites

import 'package:get_it/get_it.dart';
import 'package:view_met_remade/features/favorite/data/datasources/favorites_data_source.dart';
import 'package:view_met_remade/features/favorite/domain/repositories/favorites_repository.dart';

import '../../features/favorite/data/repositories/favorites_repository_impl.dart';
import '../../features/favorite/presentation/bloc/favorites_bloc.dart';


final sl = GetIt.instance;

Future<void> init() async {
  // bloc
  sl.registerFactory(() => FavoritesBloc(sl()));

  // repository
  sl.registerLazySingleton<FavoritesRepository>(() => FavoritesRepositoryImpl(
      dataSource: sl()
  ));

  // data source
  sl.registerLazySingleton<FavoritesDataSource>(() => FavoritesDataSourceImpl(
      sharedPreferences: sl()
  ));
}