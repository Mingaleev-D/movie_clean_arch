import 'package:flutter/material.dart';

class MovieHomeScreen extends StatelessWidget {
  const MovieHomeScreen({super.key});

  static const homeMovieName = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('HomeMovieScreen'),
      ),
    );
  }
}
