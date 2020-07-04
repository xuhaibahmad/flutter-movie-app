import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
@preResolve
class AppRepository {
  final SharedPreferences prefs;

  AppRepository(this.prefs);

  @factoryMethod
  static Future<AppRepository> create() async {
    final prefs = await SharedPreferences.getInstance();
    return AppRepository(prefs);
  }
}
