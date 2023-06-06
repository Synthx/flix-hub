import 'package:go_router/go_router.dart';
import 'package:live_coding/screen/screen.dart';

final router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return child;
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
      ],
    ),
  ],
);
