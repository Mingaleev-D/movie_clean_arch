import 'package:movie_clean_arch/data/model/movie_response.dart';
import 'package:movie_clean_arch/ui/config/constants/app_constants.dart';

import '../../domain/entities/movie.dart';
import '../model/movie_details_response.dart';

const baseUrlError =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKphT_Ml58kUSGztm-5fXnd_OZwfQzYV15SQ';

class MovieMapper {
  static Movie movieResponseToMovieEntity(MovieResult movieResult) => Movie(
      adult: movieResult.adult,
      backdropPath: (movieResult.backdropPath != '')
          ? '${AppConstants.baseUrlImage}${movieResult.backdropPath}'
          : baseUrlError,
      genreIds: movieResult.genreIds.map((e) => e.toString()).toList(),
      id: movieResult.id,
      originalLanguage: movieResult.originalLanguage,
      originalTitle: movieResult.originalTitle,
      overview: movieResult.overview ?? '',
      popularity: movieResult.popularity,
      posterPath: (movieResult.posterPath != '')
          ? '${AppConstants.baseUrlImage}${movieResult.posterPath}'
          : baseUrlError,
      releaseDate: movieResult.releaseDate,
      title: movieResult.title,
      video: movieResult.video,
      voteAverage: movieResult.voteAverage,
      voteCount: movieResult.voteCount);

  //*MapperMovieDetails
  static Movie movieDetailsResponseToMovieEntity(
          MovieDetailsResponse movieDetailsResponse) =>
      Movie(
          adult: movieDetailsResponse.adult,
          backdropPath: (movieDetailsResponse.backdropPath != '')
              ? '${AppConstants.baseUrlImage}${movieDetailsResponse.backdropPath}'
              : baseUrlError,
          genreIds:
              movieDetailsResponse.genres.map((genre) => genre.name).toList(),
          id: movieDetailsResponse.id,
          originalLanguage: movieDetailsResponse.originalLanguage,
          originalTitle: movieDetailsResponse.originalTitle,
          overview: movieDetailsResponse.overview ?? '',
          popularity: movieDetailsResponse.popularity,
          posterPath: (movieDetailsResponse.posterPath != '')
              ? '${AppConstants.baseUrlImage}${movieDetailsResponse.posterPath}'
              : baseUrlError,
          releaseDate: movieDetailsResponse.releaseDate,
          title: movieDetailsResponse.title,
          video: movieDetailsResponse.video,
          voteAverage: movieDetailsResponse.voteAverage,
          voteCount: movieDetailsResponse.voteCount);
}
