import 'package:dartz/dartz.dart';
import 'package:sgm_block/core/data/error/exception.dart';
import 'package:sgm_block/core/data/error/failure.dart';
import 'package:sgm_block/core/domain/entities/media.dart';
import 'package:sgm_block/core/domain/entities/media_details.dart';
import 'package:sgm_block/core/domain/entities/media_list.dart';
import 'package:sgm_block/features/tv_shows/data/datasource/tv_shows_remote_datasource.dart';
import 'package:sgm_block/features/tv_shows/domain/repository/tv_shows_repository.dart';

class TvShowsRepositoryImpl extends TvShowsRepository {
  final TvShowsRemoteDatasource _tvShowsRemoteDataSource;
  TvShowsRepositoryImpl({
    required TvShowsRemoteDatasource tvShowsRemoteDataSource,
  }) : _tvShowsRemoteDataSource = tvShowsRemoteDataSource;

  @override
  Future<Either<Failure, List<List<Media>>>> getTvShows() async {
    try {
      final res = await _tvShowsRemoteDataSource.getTvShows();
      return Right(res);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } catch (exception) {
      return Left(ServerFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, MediaList>> getTvShowsList(
      String category, int page) async {
    try {
      final res = await _tvShowsRemoteDataSource.getTvShowsList(category, page);
      return Right(res);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } catch (exception) {
      return Left(ServerFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, MediaDetails>> getTvShowDetails(int id) async {
    try {
      final res = await _tvShowsRemoteDataSource.getTvShowDetails(id);
      return Right(res);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } catch (exception) {
      return Left(ServerFailure(exception.toString()));
    }
  }
}
