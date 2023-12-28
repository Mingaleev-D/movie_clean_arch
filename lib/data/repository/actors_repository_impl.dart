import 'package:movie_clean_arch/data/datasource/actor_datasource.dart';
import 'package:movie_clean_arch/domain/entities/actor.dart';
import 'package:movie_clean_arch/domain/repository/actors_repository.dart';

class ActorsRepositoryImpl implements ActorsRepository {
  final ActorDatasource actorsDatasource;

  ActorsRepositoryImpl(this.actorsDatasource);

  @override
  Future<List<Actor>> getActorsByMovieId(String movieId) {
    return actorsDatasource.getActorsByMovieId(movieId);
  }
}
