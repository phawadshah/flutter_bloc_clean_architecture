import 'package:dartz/dartz.dart';
import 'package:sgm_block/core/data/error/exception.dart';
import 'package:sgm_block/core/data/error/failure.dart';
import 'package:sgm_block/core/domain/entities/media.dart';
import 'package:sgm_block/core/domain/entities/media_details.dart';
import 'package:sgm_block/core/domain/entities/media_list.dart';
import 'package:sgm_block/features/movies/data/datasources/movies_remote_datasource.dart';

import 'package:sgm_block/features/movies/domain/repository/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesRemoteDataSource _moviesRemoteDataSource;
  MoviesRepositoryImpl({required MoviesRemoteDataSource moviesRemoteDataSource})
      : _moviesRemoteDataSource = moviesRemoteDataSource;
  @override
  Future<Either<Failure, List<List<Media>>>> getMovies() async {
    try {
      final res = await _moviesRemoteDataSource.getMovies();
      return Right(res);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } catch (exception) {
      return Left(ServerFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, MediaDetails>> getMovieDetails(int id) async {
    try {
      final res = await _moviesRemoteDataSource.getMoviesDetails(id);
      return Right(res);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } catch (exception) {
      return Left(ServerFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, MediaList>> getMoviesList(
      String category, int page) async {
    try {
      final res = await _moviesRemoteDataSource.getMoviesList(category, page);
      return Right(res);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } catch (exception) {
      return Left(ServerFailure(exception.toString()));
    }
  }
}
