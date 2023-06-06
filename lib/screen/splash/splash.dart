import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'splash_store.dart';

class SplashScreen extends StatelessWidget {
  final Widget child;

  const SplashScreen({
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
      child: const Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
