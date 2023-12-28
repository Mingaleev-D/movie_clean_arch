import 'package:movie_clean_arch/data/mappers/movie_mapper.dart';
import 'package:movie_clean_arch/data/model/credits_response.dart';
import 'package:movie_clean_arch/domain/entities/actor.dart';
import 'package:movie_clean_arch/ui/config/constants/app_constants.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
        name: cast.name,
        profilePath: cast.profilePath != null
            ? '${AppConstants.baseUrlImage}${cast.profilePath}'
            : baseUrlError,
        id: cast.id,
        character: cast.character,
      );
}
