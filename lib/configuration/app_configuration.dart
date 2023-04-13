import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../redux/store.dart';
import 'thrive_futurama_app.dart';

enum AppEnvironment {
  development,
  production,
}

class AppConfiguration {
  final AppEnvironment environment;
  final String backendURL;
  final bool logsEnabled;

  AppConfiguration({
    required this.environment,
    required this.backendURL,
    this.logsEnabled = true,
  });

  Future _initializeDependencies() {
    final locator = GetIt.instance;

    locator.registerSingleton<Logger>(Logger(
      printer: PrettyPrinter(
        colors: false,
        methodCount: 0,
        lineLength: 48,
      ),
      level: logsEnabled ? Level.verbose : Level.nothing,
    ));

    return locator.allReady();
  }

  Widget _instantiateHomeWidget() {
    return Container();
  }

  Widget _instantiateReduxApp(Widget home) {
    return ThriveFuturamaApp(
      environment: environment,
      store: createStore(),
      home: home,
    );
  }

  Future run() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _initializeDependencies();

    final home = _instantiateHomeWidget();

    runZonedGuarded(
      () {
        runApp(_instantiateReduxApp(home));
      },
      (error, trace) {
        GetIt.I<Logger>().e('Root error occured', error, trace);
      },
    );
  }
}
