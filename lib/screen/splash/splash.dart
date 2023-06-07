import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_coding/theme/theme.dart';

import 'splash_store.dart';

class Splash extends StatelessWidget {
  final Widget child;

  const Splash({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashStore(
        attributeStore: context.read(),
        configStore: context.read(),
      )..init(),
      child: BlocSelector<SplashStore, bool, bool>(
        selector: (state) => state,
        builder: (context, loading) {
          if (loading) {
            return const SplashScreen();
          }

          return child;
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(kSafeArea),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
