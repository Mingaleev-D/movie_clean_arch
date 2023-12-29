import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../movies/movie_providers.dart';
import '../movies/movie_slideshow_provider.dart';

final initLoaderProvider = Provider<bool>((ref) {
  final step = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final step2 = ref.watch(movieSlideshowProvider).isEmpty;
  final step3 = ref.watch(popularMoviesProvider).isEmpty;
  final step4 = ref.watch(upcomingMoviesProvider).isEmpty;
  final step5 = ref.watch(topRatedMoviesProvider).isEmpty;

  if (step || step2 || step3 || step4 || step5) return true;

  return false;
});
