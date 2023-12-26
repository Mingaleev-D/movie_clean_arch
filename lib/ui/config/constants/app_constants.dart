import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static String theMovieKey = dotenv.env['THE_MOVIE_KEY'] ?? 'No key found';
  static String baseUrlImage = 'https://image.tmdb.org/t/p/w500';
}
