import '../entities/movie.dart';

abstract class MovieUseCase {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
