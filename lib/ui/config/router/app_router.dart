import 'package:go_router/go_router.dart';
import 'package:movie_clean_arch/ui/screens/screens.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: MovieHomeScreen.homeMovieName,
      builder: (context, state) => const MovieHomeScreen(),
    ),
  ],
);
