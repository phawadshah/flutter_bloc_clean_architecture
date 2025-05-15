import 'dart:convert';
import 'dart:developer';
import 'package:sgm_block/core/data/network/api_base_helper.dart';
import 'package:sgm_block/core/data/network/api_urls.dart';
import 'package:sgm_block/features/tv_shows/data/models/tv_show_details_model.dart';
import 'package:sgm_block/features/tv_shows/data/models/tv_show_episode_model.dart';
import 'package:sgm_block/features/tv_shows/data/models/tv_shows_list_model.dart';
import 'package:sgm_block/features/tv_shows/data/models/tv_shows_model.dart';
import 'package:sgm_block/features/tv_shows/domain/enitites/tv_show_episode.dart';

abstract class TvShowsRemoteDatasource {
  Future<List<List<TvShowModel>>> getTvShows();
  Future<TvShowDetailsModel> getTvShowDetails(int id);
  Future<TvShowsListModel> getTvShowsList(String category, int page);
  Future<List<TvShowEpisode>> getTvShowEpisodes(int tvShowId, int season);
}

class TvShowsRemoteDatasourceImpl extends TvShowsRemoteDatasource {
  ApiHelper apiHelper = ApiHelper();

  @override
  Future<List<List<TvShowModel>>> getTvShows() async {
    return Future.wait([
      _getTrendingTvShows(),
      _getAiringTodyTvShows(page: 4),
      _getOnTheAirTvShows(page: 2),
      _getPopularTvShows(),
      _getTopRatedTvShows(page: 1),
    ]);
  }

  @override
  Future<TvShowDetailsModel> getTvShowDetails(int id) async {
    var response = await apiHelper.get(APiUrls.getTvShowDetails(id));
    return TvShowDetailsModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<TvShowsListModel> getTvShowsList(String category, int page) {
    var response = apiHelper.get(APiUrls.getTvShowsList(category, page: page));
    return response
        .then((value) => TvShowsListModel.fromJson(jsonDecode(value.body)));
  }

  @override
  Future<List<TvShowEpisode>> getTvShowEpisodes(
      int tvShowId, int season) async {
    var response =
        await apiHelper.get(APiUrls.getTvShowEpisodes(tvShowId, season - 1));
    return List<TvShowEpisode>.from(
        (jsonDecode(response.body)['episodes'] as List)
            .map((episdoe) => TvShowEpisodeModel.fromJson(episdoe)));
  }

  Future<List<TvShowModel>> _getTrendingTvShows({int page = 1}) async {
    var response = await apiHelper.get(APiUrls.getTrendingTvShows(page: page));
    return List<TvShowModel>.from((jsonDecode(response.body)['results'] as List)
        .map((tvShowMap) => TvShowModel.fromJson(tvShowMap)));
  }

  Future<List<TvShowModel>> _getAiringTodyTvShows({int page = 1}) async {
    var response =
        await apiHelper.get(APiUrls.getAiringTodayTvShows(page: page));
    return List<TvShowModel>.from((jsonDecode(response.body)['results'] as List)
        .map((tvShowMap) => TvShowModel.fromJson(tvShowMap)));
  }

  Future<List<TvShowModel>> _getOnTheAirTvShows({int page = 1}) async {
    var response = await apiHelper.get(APiUrls.getOnTheAirTvShows(page: page));
    return List<TvShowModel>.from((jsonDecode(response.body)['results'] as List)
        .map((tvShowMap) => TvShowModel.fromJson(tvShowMap)));
  }

  Future<List<TvShowModel>> _getPopularTvShows({int page = 1}) async {
    var response = await apiHelper.get(APiUrls.getPopularTvShows(page: page));
    return List<TvShowModel>.from((jsonDecode(response.body)['results'] as List)
        .map((tvShowMap) => TvShowModel.fromJson(tvShowMap)));
  }

  Future<List<TvShowModel>> _getTopRatedTvShows({int page = 1}) async {
    var response = await apiHelper.get(APiUrls.getTopRatedTvShows(page: page));
    return List<TvShowModel>.from((jsonDecode(response.body)['results'] as List)
        .map((tvShowMap) => TvShowModel.fromJson(tvShowMap)));
  }
}
