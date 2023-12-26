import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_clean_arch/ui/providers/movies/movie_providers.dart';
import 'package:movie_clean_arch/ui/widgets/widgets.dart';

class MovieHomeScreen extends StatelessWidget {
  const MovieHomeScreen({super.key});

  static const homeMovieName = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
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
    return Column(
      children: [
        const AppCustomBar(),
        Expanded(
          child: ListView.builder(
            itemCount: nowPlayingMovies.length,
            itemBuilder: (context, index) {
              final movie = nowPlayingMovies[index];
              return ListTile(
                title: Text(movie.title),
              );
            },
          ),
        ),
      ],
    );
  }
}
