import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_clean_arch/domain/entities/movie.dart';
import 'package:movie_clean_arch/ui/delegates/search_movie_delegate.dart';
import '../../providers/providers.dart';

class AppCustomBar extends ConsumerWidget {
  const AppCustomBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                const Text('🎞️'),
                const Gap(10),
                Text(
                  'Фильмы в кино',
                  style: titleStyle,
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      final movieRepository = ref.read(movieRepositoryProvider);
                      final searchQuery = ref.read(searchQueryProvider);
                      showSearch<Movie?>(
                          query: searchQuery,
                          context: context,
                          delegate: SearchMovieDelegate(searchMovie: (query) {
                            ref
                                .read(searchQueryProvider.notifier)
                                .update((state) => query);
                            return movieRepository.searchMovie(query);
                          })).then((movie) {
                        if (movie == null) return;
                        context.push('/movie_details_screen/${movie.id}');
                      });
                    },
                    icon: const Icon(Icons.search_outlined)),
              ],
            )),
      ),
    );
  }
}
