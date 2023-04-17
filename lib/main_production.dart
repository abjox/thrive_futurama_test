import 'configuration/app_configuration.dart';

void main() async {
  await AppConfiguration(
    environment: AppEnvironment.production,
    backendURL: 'https://api.sampleapis.com/futurama',
  ).run();
}
