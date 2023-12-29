import 'package:go_router/go_router.dart';
import 'package:movie_clean_arch/ui/screens/screens.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        name: MovieHomeScreen.homeMovieName,
        builder: (context, state) => const MovieHomeScreen(),
        routes: [
          GoRoute(
              path: 'movie_details_screen/:id',
              name: MovieDetailsScreen.movieDetailsScreenName,
              builder: (context, state) {
                final movieId = state.pathParameters['id'] ?? 'no-id';
                return MovieDetailsScreen(movieId: movieId);
              }),
        ]),
  ],
);
