import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
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
                      showSearch(
                          context: context,
                          delegate: SearchMovieDelegate(
                            searchMovie: movieRepository.searchMovie,
                          ));
                    },
                    icon: const Icon(Icons.search_outlined)),
              ],
            )),
      ),
    );
  }
}
