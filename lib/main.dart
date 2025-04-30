import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'core/env.dart';
import 'package:get_it/get_it.dart';
final services = GetIt.instance;
Future<void> main() async {
  await dotenv.load(fileName: ".env");
  Main();
}
class Main extends Env {
  @override
  final String appName = dotenv.env['APP_NAME'] ?? '';

  @override
  final String baseUrl = dotenv.env['BASE_URL'] ?? '';

  @override
  final String logo = 'assets/images/logo.png';

  @override
  final String vapidKey =
      'BBFizcWLnxNkU9l_TJVkw6R_0G22fUGdULa072WBcBvZNXRBExhX4b2YeFHbpxrM4w7J0cyn3E0Fmi5bdvJS8CI';

  @override
  final String websocketUrl = dotenv.env['WEBSOCKET_URL'] ?? '';

  @override
  EnvType environmentType =
      dotenv.env['ENVIRONMENT'] == 'development'
          ? EnvType.development
          : EnvType.production;
}
