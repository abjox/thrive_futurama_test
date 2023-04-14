import 'configuration/app_configuration.dart';

void main() async {
  await AppConfiguration(
    environment: AppEnvironment.development,
    backendURL: 'https://api.sampleapis.com/futurama',
  ).run();
}
