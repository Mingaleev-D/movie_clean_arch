import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_clean_arch/data/datasource/actor_datasource.dart';
import 'package:movie_clean_arch/data/repository/actors_repository_impl.dart';

final actorsRepositoryProvider = Provider<ActorsRepositoryImpl>((ref) {
  return ActorsRepositoryImpl(ActorDatasource());
});
