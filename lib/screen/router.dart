import 'package:go_router/go_router.dart';
import 'package:live_coding/data/data.dart';
import 'package:live_coding/screen/screen.dart';

final router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => Splash(
        child: child,
      ),
      routes: [
        GoRoute(
          path: '/',
          name: HomeScreen.name,
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: 'movies/:id',
              name: MovieDetailScreen.name,
              builder: (context, state) => MovieDetailScreen(
                id: int.parse(state.pathParameters['id']!),
                preview: state.extra as MoviePreview?,
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
