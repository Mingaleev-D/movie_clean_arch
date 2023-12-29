import 'package:movie_clean_arch/domain/entities/movie.dart';
import 'package:movie_clean_arch/domain/repository/movie_repository.dart';

import '../datasource/moviedb_datasource.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieDBDatasource movieDBDatasource;

  MovieRepositoryImpl(this.movieDBDatasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return movieDBDatasource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return movieDBDatasource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return movieDBDatasource.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return movieDBDatasource.getUpcoming(page: page);
  }

  //*DetailsById
  @override
  Future<Movie> getMovieById(String id) {
    return movieDBDatasource.getMovieById(id);
  }

  @override
  Future<List<Movie>> searchMovie(String query) {
    return movieDBDatasource.searchMovie(query);
  }
}
