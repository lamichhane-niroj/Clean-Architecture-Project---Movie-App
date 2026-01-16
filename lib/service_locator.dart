import 'package:get_it/get_it.dart';
import 'package:spotify_clone/core/network/dio_client.dart';
import 'package:spotify_clone/data/auth/data_sources/auth_service.dart';
import 'package:spotify_clone/data/auth/repositories/auth.dart';
import 'package:spotify_clone/data/movie/data_sources/movie_service.dart';
import 'package:spotify_clone/data/movie/repositories/movie.dart';
import 'package:spotify_clone/data/tv/data_sources/tv_content_service.dart';
import 'package:spotify_clone/data/tv/repositories/tv_content.dart';
import 'package:spotify_clone/domain/auth/repositories/auth.dart';
import 'package:spotify_clone/domain/auth/usecases/is_signed_in.dart';
import 'package:spotify_clone/domain/auth/usecases/signin.dart';
import 'package:spotify_clone/domain/auth/usecases/signup.dart';
import 'package:spotify_clone/domain/movie/repositories/movie.dart';
import 'package:spotify_clone/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:spotify_clone/domain/movie/usecases/get_trending_movies.dart';
import 'package:spotify_clone/domain/tv/repositories/tv_content.dart';
import 'package:spotify_clone/domain/tv/usecases/get_popular_tv_content.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // services
  sl.registerSingleton<AuthService>(AuthServiceImpl());
  sl.registerSingleton<MovieService>(MovieServiceImpl());
  sl.registerSingleton<TvContentService>(TvContentServiceImpl());

  // repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());
  sl.registerSingleton<TvContentRepository>(TvContentRepositoryImpl());

  // usecase
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsSignedInUseCase>(IsSignedInUseCase());
  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
  sl.registerSingleton<GetNowPlayingMoviesUseCase>(GetNowPlayingMoviesUseCase());
  sl.registerSingleton<GetPopularTvContentUseCase>(GetPopularTvContentUseCase());
}
