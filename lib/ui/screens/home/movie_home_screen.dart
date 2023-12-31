import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:movie_clean_arch/ui/screens/screens.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class MovieHomeScreen extends StatelessWidget {
  const MovieHomeScreen({super.key, required this.pageIndex});

  static const homeMovieName = 'home_screen';
  final int pageIndex;
  final viewRoutes = const <Widget>[
    HomeView(),
    //  SizedBox(),
    FavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: pageIndex,
      ),
    );
  }
}

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNexPage();
    ref.read(popularMoviesProvider.notifier).loadNexPage();
    ref.read(upcomingMoviesProvider.notifier).loadNexPage();
    ref.read(topRatedMoviesProvider.notifier).loadNexPage();
  }

  @override
  Widget build(BuildContext context) {
    final initLoading = ref.watch(initLoaderProvider);
    if (initLoading) return const FullScreenLoader();

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final nowPlayingMoviesSlideshow = ref.watch(movieSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    // return const FullScreenLoader();
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
                    loadNextPage: () {
                      ref.read(nowPlayingMoviesProvider.notifier).loadNexPage();
                    }),
                MovieHorizontListView(
                    movies: popularMovies,
                    title: 'Популярные',
                    loadNextPage: () {
                      ref.read(popularMoviesProvider.notifier).loadNexPage();
                    }),
                MovieHorizontListView(
                    movies: upcomingMovies,
                    title: 'Предстоящие',
                    loadNextPage: () {
                      ref.read(upcomingMoviesProvider.notifier).loadNexPage();
                    }),
                MovieHorizontListView(
                    movies: topRatedMovies,
                    title: 'Высокий рейтинг',
                    loadNextPage: () {
                      ref.read(topRatedMoviesProvider.notifier).loadNexPage();
                    }),
                const Gap(30),
              ],
            );
          }, childCount: 1),
        )
      ],
    );
  }
}
