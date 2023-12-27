import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_clean_arch/data/datasource/moviedb_datasource.dart';

import '../../../data/repository/movie_repository_impl.dart';

final movieRepositoryProvider = Provider<MovieRepositoryImpl>((ref) {
  return MovieRepositoryImpl(MovieDBDatasource());
});
