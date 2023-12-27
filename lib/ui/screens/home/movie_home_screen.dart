import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class MovieHomeScreen extends StatelessWidget {
  const MovieHomeScreen({super.key});

  static const homeMovieName = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: AppBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNexPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final nowPlayingMoviesSlideshow = ref.watch(movieSlideshowProvider);
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: AppCustomBar(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                MovieSlideShow(movies: nowPlayingMoviesSlideshow),
                const Gap(10),
                MovieHorizontListView(
                    movies: nowPlayingMovies,
                    title: 'Сейчас в кино',
                    subTitle: 'Смотрите сейчас',
                    loadNextPage: () {
                      ref.read(nowPlayingMoviesProvider.notifier).loadNexPage();
                    }),
                MovieHorizontListView(
                    movies: nowPlayingMovies,
                    title: 'Сейчас в кино',
                    subTitle: 'Смотрите сейчас',
                    loadNextPage: () {
                      ref.read(nowPlayingMoviesProvider.notifier).loadNexPage();
                    }),
                const Gap(30),
              ],
            );
          }, childCount: 10),
        )
      ],
    );
  }
}
