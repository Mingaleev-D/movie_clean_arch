import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_clean_arch/ui/config/helpers/human_formats.dart';

import '../../domain/entities/movie.dart';

typedef SearchMovieCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMovieCallback searchMovie;

  SearchMovieDelegate({required this.searchMovie});

  @override
  String get searchFieldLabel => 'Поиск фильмов';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      //* в пакете анимации есть @animate условие if не обязательно
      // if (query.isNotEmpty)
      FadeIn(
          animate: query.isNotEmpty,
          child: IconButton(
              onPressed: () => query = '', icon: const Icon(Icons.clear)))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return FadeIn(
      child: IconButton(
          onPressed: () => close(context, null),
          icon: const Icon(Icons.arrow_circle_left_outlined)),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text(' buildResults ');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: searchMovie(query),
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];
        return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return _MovieSearchItem(movie: movie);
            });
      },
    );
  }
}

class _MovieSearchItem extends StatelessWidget {
  const _MovieSearchItem({required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          SizedBox(
            width: size.width * 0.2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                movie.posterPath,
                loadingBuilder: (context, child, loadingProgress) =>
                    FadeIn(child: child),
              ),
            ),
          ),
          const Gap(10),
          SizedBox(
            width: size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title, style: textStyle.titleMedium),
                (movie.overview.length > 140)
                    ? Text('${movie.overview.substring(0, 140)}...')
                    : Text(movie.overview),
                Row(
                  children: [
                    Icon(
                      Icons.star_half_outlined,
                      color: Colors.yellow.shade800,
                    ),
                    const Gap(5),
                    Text(
                      HumanFormats.number(movie.voteAverage, 1),
                      style: textStyle.bodyMedium?.copyWith(
                        color: Colors.yellow.shade800,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
