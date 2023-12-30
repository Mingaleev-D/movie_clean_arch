import 'package:go_router/go_router.dart';
import 'package:movie_clean_arch/ui/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:screen',
      name: MovieHomeScreen.homeMovieName,
      builder: (context, state) {
        final pageIndex = state.pathParameters['screen'] ?? '0';
        return MovieHomeScreen(
          pageIndex: int.parse(pageIndex),
        );
      },
      routes: [
        GoRoute(
            path: 'movie_details_screen/:id',
            name: MovieDetailsScreen.movieDetailsScreenName,
            builder: (context, state) {
              final movieId = state.pathParameters['id'] ?? 'no-id';
              return MovieDetailsScreen(movieId: movieId);
            }),
      ],
    ),
    GoRoute(
      path: '/',
      redirect: (_, __) => '/home/0',
    )
  ],
);
