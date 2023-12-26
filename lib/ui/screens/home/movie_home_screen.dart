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
    // final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final nowPlayingMoviesSlideshow = ref.watch(movieSlideshowProvider);
    return Column(
      children: [
        const AppCustomBar(),
        const Gap(10),
        MovieSlideShow(movies: nowPlayingMoviesSlideshow),
      ],
    );
  }
}
