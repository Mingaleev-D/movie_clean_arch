import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_clean_arch/domain/entities/movie.dart';

import '../movies/movie_repository_provider.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');
final searchMoviesProvider =
    StateNotifierProvider<SearchMoviesNotifier, List<Movie>>((ref) {
  final movieRepository = ref.read(movieRepositoryProvider);
  return SearchMoviesNotifier(
    searchMovies: movieRepository.searchMovie,
    ref: ref,
  );
});

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMoviesNotifier extends StateNotifier<List<Movie>> {
  SearchMoviesNotifier({
    required this.searchMovies,
    required this.ref,
  }) : super([]);
  final SearchMoviesCallback searchMovies;
  final Ref ref;

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final List<Movie> movies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);
    state = movies;
    return movies;
  }
}
