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
}
