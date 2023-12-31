import 'package:movie_clean_arch/domain/entities/movie.dart';

abstract class LocalStorageRepository {
  Future<void> toggleFavorite(Movie movie);

  Future<bool> isFavorite(int movieId);

  Future<List<Movie>> loadMovies({int limit = 10, offset = 0});
}
