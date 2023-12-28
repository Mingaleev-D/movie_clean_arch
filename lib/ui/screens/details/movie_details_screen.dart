import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:movie_clean_arch/domain/entities/movie.dart';
import 'package:movie_clean_arch/ui/providers/details/movie_details_provider.dart';

class MovieDetailsScreen extends ConsumerStatefulWidget {
  static const movieDetailsScreenName = 'movie_details_screen';

  const MovieDetailsScreen({super.key, required this.movieId});

  final String movieId;

  @override
  MovieDetailsScreenState createState() => MovieDetailsScreenState();
}

class MovieDetailsScreenState extends ConsumerState<MovieDetailsScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(movieDetailProvider.notifier).loadMovie(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(movieDetailProvider);
    final movie = movies[widget.movieId];

    // if (movie != null) {
    //   return const Scaffold(
    //     body: Center(
    //       child: CircularProgressIndicator(
    //         strokeWidth: 2,
    //       ),
    //     ),
    //   );
    // }

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppBar(movie: movie!),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => _MovieViewDetails(movie: movie),
                childCount: 1),
          )
        ],
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  const _CustomSliverAppBar({required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        title: Text(
          movie.title,
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.start,
        ),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(movie.posterPath, fit: BoxFit.cover),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black87],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.7, 1.0]),
                ),
              ),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.transparent,
                      ],
                      begin: Alignment.topLeft,
                      stops: [0.0, 0.4]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MovieViewDetails extends StatelessWidget {
  const _MovieViewDetails({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  movie.backdropPath,
                  width: size.width * 0.3,
                ),
              ),
              const Gap(10),
              SizedBox(
                width: (size.width - 40) * 0.7,
                child: Column(
                  children: [Text(movie.overview)],
                ),
              )
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(8),
            child: Wrap(
              children: [
                ...movie.genreIds.map((gender) => Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Chip(
                        label: Text(gender),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ))
              ],
            )),
        const Gap(100),
        const Placeholder(),
      ],
    );
  }
}
