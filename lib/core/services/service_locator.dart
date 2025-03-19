import 'package:get_it/get_it.dart';
import 'package:sgm_block/features/movies/data/datasources/movies_remote_datasource.dart';
import 'package:sgm_block/features/movies/data/repository/movies_repository_impl.dart';
import 'package:sgm_block/features/movies/domain/repository/movies_repository.dart';
import 'package:sgm_block/features/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:sgm_block/features/movies/domain/usecases/get_movies_list_usecase.dart';
import 'package:sgm_block/features/movies/domain/usecases/get_movies_usecase.dart';
import 'package:sgm_block/features/movies/presentation/controllers/movies_bloc/movies_bloc.dart';
import 'package:sgm_block/features/movies/presentation/controllers/movies_details_bloc/movie_details_bloc.dart';
import 'package:sgm_block/features/movies/presentation/controllers/movies_list_bloc/movies_list_bloc.dart';
import 'package:sgm_block/features/persons/data/datasource/person_remote_datasource.dart';
import 'package:sgm_block/features/persons/data/repository/person_repository_impl.dart';
import 'package:sgm_block/features/persons/domain/repository/person_repository.dart';
import 'package:sgm_block/features/persons/domain/usecases/get_person_usecase.dart';
import 'package:sgm_block/features/persons/presentation/person_bloc/person_bloc.dart';
import 'package:sgm_block/features/tv_shows/data/datasource/tv_shows_remote_datasource.dart';
import 'package:sgm_block/features/tv_shows/data/repository/tv_shows_repository_impl.dart';
import 'package:sgm_block/features/tv_shows/domain/repository/tv_shows_repository.dart';
import 'package:sgm_block/features/tv_shows/domain/usercase/get_tv_show_details_usecase.dart';
import 'package:sgm_block/features/tv_shows/domain/usercase/get_tv_shows_list_usecase.dart';
import 'package:sgm_block/features/tv_shows/domain/usercase/get_tv_shows_usecase.dart';
import 'package:sgm_block/features/tv_shows/presentation/controllers/tv_show_details_bloc/tv_show_details_bloc.dart';
import 'package:sgm_block/features/tv_shows/presentation/controllers/tv_shows_bloc/tv_shows_bloc.dart';
import 'package:sgm_block/features/tv_shows/presentation/controllers/tv_shows_list_bloc/tv_shows_list_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    /// ==============================================================
    /// ======================= Data source ==========================
    /// ==============================================================

    sl.registerLazySingleton<MoviesRemoteDataSource>(
        () => MoviesRemoteDatasourceImpl());
    sl.registerLazySingleton<TvShowsRemoteDatasource>(
        () => TvShowsRemoteDatasourceImpl());
    sl.registerLazySingleton<PersonRemoteDatasource>(
        () => PersonRemoteDatasourceImpl());

    /// ==============================================================
    /// ======================= Repositories =========================
    /// ==============================================================

    sl.registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImpl(
        moviesRemoteDataSource: sl<MoviesRemoteDataSource>()));
    sl.registerLazySingleton<TvShowsRepository>(() => TvShowsRepositoryImpl(
        tvShowsRemoteDataSource: sl<TvShowsRemoteDatasource>()));
    sl.registerLazySingleton<PersonRepository>(() => PersonRepositoryImpl(
        personRemoteDatasource: sl<PersonRemoteDatasource>()));

    /// ==============================================================
    /// =========================== Usecases =========================
    /// ==============================================================

    /// ===== Movies
    sl.registerLazySingleton<GetMoviesUsecase>(
        () => GetMoviesUsecase(movieRepository: sl<MoviesRepository>()));
    sl.registerLazySingleton<GetMovieDetailsUseCase>(
        () => GetMovieDetailsUseCase(moviesRepository: sl<MoviesRepository>()));
    sl.registerLazySingleton<GetMoviesListUsecase>(
        () => GetMoviesListUsecase(moviesRepository: sl<MoviesRepository>()));

    /// ===== TvShows
    sl.registerLazySingleton(
        () => GetTvShowsUsecase(tvShowsRepository: sl<TvShowsRepository>()));
    sl.registerLazySingleton<GetTvShowDetailsUsecase>(() =>
        GetTvShowDetailsUsecase(tvShowsRepository: sl<TvShowsRepository>()));
    sl.registerLazySingleton(() =>
        GetTvShowsListUsecase(tvShowsRepository: sl<TvShowsRepository>()));

    /// ===== Persons
    sl.registerLazySingleton<GetPersonUsecase>(
        () => GetPersonUsecase(personRepository: sl<PersonRepository>()));

    /// ==============================================================
    /// =============================== Bloc =========================
    /// ==============================================================

    /// ===== Movies
    sl.registerFactory<MoviesBloc>(
        () => MoviesBloc(getMoviesUseCase: sl<GetMoviesUsecase>()));
    sl.registerFactory<MovieDetailsBloc>(() =>
        MovieDetailsBloc(getMovieDetailsUseCase: sl<GetMovieDetailsUseCase>()));
    sl.registerFactory<MoviesListBloc>(
        () => MoviesListBloc(getMoviesListUsecase: sl<GetMoviesListUsecase>()));

    /// ===== TvShows
    sl.registerFactory<TvShowsBloc>(
        () => TvShowsBloc(getTvShowsUseCase: sl<GetTvShowsUsecase>()));
    sl.registerFactory<TvShowDetailsBloc>(() => TvShowDetailsBloc(
        getTvShowDetailsUsecase: sl<GetTvShowDetailsUsecase>()));
    sl.registerFactory<TvShowsListBloc>(() =>
        TvShowsListBloc(getTvShowsListUsecase: sl<GetTvShowsListUsecase>()));

    /// ===== Persons
    sl.registerFactory<PersonBloc>(
        () => PersonBloc(getPersonUsecase: sl<GetPersonUsecase>()));
  }
}
