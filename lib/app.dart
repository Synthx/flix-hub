import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_coding/core/core.dart';
import 'package:live_coding/screen/screen.dart';
import 'package:live_coding/store/store.dart';
import 'package:live_coding/theme/theme.dart';

class LiveCoding extends StatelessWidget {
  const LiveCoding({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AttributeStore(
            attributeService: getIt(),
          ),
        ),
        BlocProvider(
          create: (context) => ConfigStore(
            configurationService: getIt(),
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'Live Coding',
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
        routerConfig: router,
      ),
    );
  }
}
