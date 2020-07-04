import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@preResolve
@singleton
class EnvironmentInfoProvider {
  final DotEnv env;

  const EnvironmentInfoProvider._create(this.env);

  @factoryMethod
  static Future<EnvironmentInfoProvider> create() async {
    final env = DotEnv();
    await env.load('.env');
    return EnvironmentInfoProvider._create(env);
  }

  dynamic getEnvVariable(String key) {
    return env.env[key];
  }
}
