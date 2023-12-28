import 'package:dio/dio.dart';
import 'package:movie_clean_arch/data/model/credits_response.dart';
import 'package:movie_clean_arch/domain/entities/actor.dart';
import 'package:movie_clean_arch/domain/usecase/actors_usecase.dart';
import 'package:movie_clean_arch/ui/config/constants/app_constants.dart';

import '../mappers/actor_mapper.dart';

class ActorDatasource extends ActorsUseCase {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/',
    queryParameters: {'api_key': AppConstants.theMovieKey, 'language': 'ru-RU'},
  ));
  @override
  Future<List<Actor>> getActorsByMovieId(String movieId) async {
    final response = await dio.get('movie/$movieId/credits');
    final creditResponse = CreditsResponse.fromJson(response.data);
    List<Actor> actors = creditResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();
    return actors;
  }
}
