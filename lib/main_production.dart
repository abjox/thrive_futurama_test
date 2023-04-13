import 'configuration/app_configuration.dart';

void main() async {
  await AppConfiguration(
    environment: AppEnvironment.production,
    backendURL: '',
    logsEnabled: false,
  ).run();
}
