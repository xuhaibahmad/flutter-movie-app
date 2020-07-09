import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const KEY_NIGHT_MODE = "night_mode_enabled";
const KEY_CONTENT_FILTER = "content_filter_enabled";

@singleton
@preResolve
class AppRepository {
  final SharedPreferences _prefs;

  const AppRepository(this._prefs);

  bool get nightModeEnabled => _prefs.getBool(KEY_NIGHT_MODE) ?? false;

  bool get contentFilterEnabled => _prefs.getBool(KEY_CONTENT_FILTER) ?? false;

  updateNightMode(bool enable) async {
    return _prefs.setBool(KEY_NIGHT_MODE, enable);
  }

  updateContentFilter(bool enable) async {
    return _prefs.setBool(KEY_CONTENT_FILTER, enable);
  }

  @factoryMethod
  static Future<AppRepository> create() async {
    final prefs = await SharedPreferences.getInstance();
    return AppRepository(prefs);
  }
}
