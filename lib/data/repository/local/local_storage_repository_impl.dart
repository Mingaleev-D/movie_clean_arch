import 'package:movie_clean_arch/domain/entities/movie.dart';
import 'package:movie_clean_arch/domain/repository/local_storage_repository.dart';
import 'package:movie_clean_arch/domain/usecase/local_storage_usecase.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageUseCase localStorageUseCase;

  LocalStorageRepositoryImpl(this.localStorageUseCase);

  @override
  Future<bool> isFavorite(int movieId) {
    return localStorageUseCase.isFavorite(movieId);
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    return localStorageUseCase.loadMovies(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    return localStorageUseCase.toggleFavorite(movie);
  }
}
