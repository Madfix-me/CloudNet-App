
import 'package:cloudnet/utils/app_config.dart';
import 'package:cloudnet/utils/app_starter.dart';

Future<void> main() async {
  AppConfig().setEnvironment(Environment.alpha);
  startApp();
}
