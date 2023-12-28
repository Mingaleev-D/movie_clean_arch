import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const movieDetailsScreenName = 'movie_details_screen';
  const MovieDetailsScreen({super.key, required this.movieId});

  final String movieId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieId: $movieId'),
      ),
    );
  }
}
