import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_clean_arch/domain/entities/movie.dart';

import 'movie_repository_provider.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMovieCallback = ref.watch(movieRepositoryProvider).getNowPlaying;
  return MoviesNotifier(fetchMovieCallback: fetchMovieCallback);
});
final popularMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMovieCallback = ref.watch(movieRepositoryProvider).getPopular;
  return MoviesNotifier(fetchMovieCallback: fetchMovieCallback);
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;
  MovieCallback fetchMovieCallback;

  MoviesNotifier({required this.fetchMovieCallback}) : super([]);

  Future<void> loadNexPage() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    final List<Movie> movies = await fetchMovieCallback(page: currentPage);
    state = [...state, ...movies];
    isLoading = false;
  }
}
