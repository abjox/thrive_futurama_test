import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

import '../core/app_router.dart';
import '../providers/quiz_provider.dart';
import '../redux/app/app_state.dart';
import '../utils/theme.dart';
import 'app_configuration.dart';

class EnvironmentApp extends InheritedWidget {
  final AppEnvironment environment;

  const EnvironmentApp({
    Key? key,
    required this.environment,
    required Widget child,
  }) : super(key: key, child: child);

  static EnvironmentApp? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<EnvironmentApp>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

class ThriveFuturamaApp extends StatelessWidget {
  final AppEnvironment environment;
  final Store<AppState> store;

  const ThriveFuturamaApp({
    Key? key,
    required this.environment,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EnvironmentApp(
      environment: environment,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => QuizProvider(),
          ),
        ],
        child: StoreProvider(
          store: store,
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter().config,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.system,
          ),
        ),
      ),
    );
  }
}
