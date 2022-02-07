// Injection Container for Piece

import 'package:get_it/get_it.dart';
import 'package:view_met_remade/features/piece/domain/repositories/piece_repository.dart';

import '../../features/piece/data/datasources/piece_local_data_source.dart';
import '../../features/piece/data/datasources/piece_remote_data_source.dart';
import '../../features/piece/data/repositories/piece_repository_impl.dart';
import '../../features/piece/presentation/bloc/piece_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // bloc
  sl.registerFactory(() => PieceBloc(
      pieceRepository: sl()
    ),
  );

  // repository
  sl.registerLazySingleton<PieceRepository>(() => PieceRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl()
  ));
  
  // data sources
  sl.registerLazySingleton<PieceRemoteDataSource>(() => PieceRemoteDataSourceImpl(
      client: sl()
  ));
  sl.registerLazySingleton<PieceLocalDataSource>(() => PieceLocalDataSourceImpl(
      sharedPreferences: sl()
  ));
}