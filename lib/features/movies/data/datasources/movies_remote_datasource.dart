import 'dart:convert';
import 'dart:developer';
import 'package:sgm_block/core/data/network/api_base_helper.dart';
import 'package:sgm_block/core/data/network/api_urls.dart';
import 'package:sgm_block/features/movies/data/models/movie_details_model.dart';
import 'package:sgm_block/features/movies/data/models/movie_model.dart';
import 'package:sgm_block/features/movies/data/models/movies_list_model.dart';

abstract class MoviesRemoteDataSource {
  Future<List<List<MovieModel>>> getMovies();
  Future<MovieDetailsModel> getMoviesDetails(int id);
  Future<MoviesListModel> getMoviesList(String category, int page);
}

class MoviesRemoteDatasourceImpl extends MoviesRemoteDataSource {
  ApiHelper apiHelper = ApiHelper();
  @override
  Future<List<List<MovieModel>>> getMovies() async {
    return Future.wait([
      _getTrendingMovies(),
      _getNowPlayingMovies(page: 1),
      _getPopularMovies(page: 2),
      _getTopRatedMovies(),
      _getUpcomingMovies(page: 3),
    ]);
  }

  @override
  Future<MovieDetailsModel> getMoviesDetails(int id) async {
    var response = await apiHelper.get(APiUrls.getMovieDetails(id));
    return MovieDetailsModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<MoviesListModel> getMoviesList(String category, int page) async {
    var response = await apiHelper.get(APiUrls.getMoviesList(category, page));
    return MoviesListModel.fromJson(jsonDecode(response.body));
  }

  Future<List<MovieModel>> _getTrendingMovies({int page = 1}) async {
    var response = await apiHelper.get(APiUrls.getTrendingMovies(page: page));
    return List<MovieModel>.from((jsonDecode(response.body)['results'] as List)
        .map((movie) => MovieModel.fromJson(movie))).toList();
  }

  Future<List<MovieModel>> _getNowPlayingMovies({int page = 1}) async {
    var response = await apiHelper.get(APiUrls.getNowPlayingMovies(page: page));
    return List<MovieModel>.from((jsonDecode(response.body)['results'] as List)
        .map((movie) => MovieModel.fromJson(movie))).toList();
  }

  Future<List<MovieModel>> _getPopularMovies({int page = 1}) async {
    var response = await apiHelper.get(APiUrls.getPopularMovies(page: page));
    return List<MovieModel>.from((jsonDecode(response.body)['results'] as List)
        .map((movie) => MovieModel.fromJson(movie))).toList();
  }

  Future<List<MovieModel>> _getTopRatedMovies({int page = 1}) async {
    var response = await apiHelper.get(APiUrls.getTopRatedMovies(page: page));
    return List<MovieModel>.from((jsonDecode(response.body)['results'] as List)
        .map((movie) => MovieModel.fromJson(movie))).toList();
  }

  Future<List<MovieModel>> _getUpcomingMovies({int page = 1}) async {
    var response = await apiHelper.get(APiUrls.getUpcomingMovies(page: page));
    return List<MovieModel>.from((jsonDecode(response.body)['results'] as List)
        .map((movie) => MovieModel.fromJson(movie))).toList();
  }
}
