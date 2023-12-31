import 'package:dio/dio.dart';
import 'package:movie_clean_arch/data/mappers/movie_mapper.dart';
import 'package:movie_clean_arch/data/model/movie_details_response.dart';
import 'package:movie_clean_arch/data/model/movie_response.dart';
import 'package:movie_clean_arch/domain/entities/movie.dart';
import 'package:movie_clean_arch/domain/usecase/movie_usecase.dart';
import 'package:movie_clean_arch/ui/config/constants/app_constants.dart';

class MovieDBDatasource extends MovieUseCase {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/',
    queryParameters: {'api_key': AppConstants.theMovieKey, 'language': 'ru-RU'},
  ));

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieResponse = MovieResponse.fromJson(json);
    final List<Movie> movies = movieResponse.results
        .map((movie) => MovieMapper.movieResponseToMovieEntity(movie))
        .toList();
    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('movie/now_playing', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response =
        await dio.get('movie/popular', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response =
        await dio.get('movie/top_rated', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response =
        await dio.get('movie/upcoming', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }

  //*DetailById
  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('movie/$id');

    if (response.statusCode != 200) throw Exception('Movie $id not found');
    final moviesDetails = MovieDetailsResponse.fromJson(response.data);
    final Movie movie =
        MovieMapper.movieDetailsResponseToMovieEntity(moviesDetails);
    return movie;
  }

  @override
  Future<List<Movie>> searchMovie(String query) async {
    final response =
        await dio.get('search/movie', queryParameters: {'query': query});
    return _jsonToMovies(response.data);
  }
}
