import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/repositories/piece_repository.dart';
import '../datasources/piece_local_data_source.dart';
import '../datasources/piece_remote_data_source.dart';
import '../../domain/entities/piece.dart';


class PieceRepositoryImpl implements PieceRepository {
  final PieceRemoteDataSource remoteDataSource;
  final PieceLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PieceRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Piece>> getPiece(
      int id,
      ) async {
    return await _getPiece(id);
  }

  Future<Either<Failure, Piece>> _getPiece(
      int id,
      ) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePiece = await remoteDataSource.getPiece(id);
        localDataSource.cachePiece(remotePiece);
        return Right(remotePiece);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPiece = await localDataSource.getCachedPiece(id);
        return Right(localPiece);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}