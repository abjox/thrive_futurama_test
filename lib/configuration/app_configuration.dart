import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:thrive_futurama/core/network/futurama_http_overrides.dart';

import '../core/network/network_service.dart';
import '../core/services/connectivity_service.dart';
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

    locator.registerLazySingleton<NetworkServiceProtocol>(() {
      final dio = Dio(); // Provide a dio instance
      HttpOverrides.global = FuturamaHttpOverrides();
      final client = NetworkServiceProtocol(dio, baseUrl: backendURL);
      return client;
    });

    locator.registerSingleton<ConnectivityServiceProtocol>(
      ConnectivityService(),
    );

    return locator.allReady();
  }

  Widget _instantiateReduxApp() {
    return ThriveFuturamaApp(
      environment: environment,
      store: createStore(),
    );
  }

  Future<void> run() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _initializeDependencies();
    runZonedGuarded(
      () {
        runApp(_instantiateReduxApp());
      },
      (error, trace) {
        GetIt.I<Logger>().e('Root error occured:', error, trace);
      },
    );
  }
}
