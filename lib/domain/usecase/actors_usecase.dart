import 'package:movie_clean_arch/domain/entities/actor.dart';

abstract class ActorsUseCase {
  Future<List<Actor>> getActorsByMovieId(String movieId);
}
