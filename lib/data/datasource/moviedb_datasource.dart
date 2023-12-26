import 'package:dio/dio.dart';
import 'package:movie_clean_arch/data/mappers/movie_mapper.dart';
import 'package:movie_clean_arch/data/model/movie_response.dart';
import 'package:movie_clean_arch/domain/entities/movie.dart';
import 'package:movie_clean_arch/domain/usecase/movie_usecase.dart';
import 'package:movie_clean_arch/ui/config/constants/app_constants.dart';

class MovieDBDatasource extends MovieUseCase {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/',
    queryParameters: {'api_key': AppConstants.theMovieKey, 'language': 'ru-RU'},
  ));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('movie/now_playing');
    final movieResponse = MovieResponse.fromJson(response.data);
    final List<Movie> movies = movieResponse.results
        .map((movie) => MovieMapper.movieResponseToMovieEntity(movie))
        .toList();
    return movies;
  }
}