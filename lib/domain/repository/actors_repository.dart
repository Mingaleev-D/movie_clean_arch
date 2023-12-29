import 'package:movie_clean_arch/domain/entities/actor.dart';

abstract class ActorsRepository {
  Future<List<Actor>> getActorsByMovieId(String movieId);
}
