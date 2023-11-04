import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceKey {
  static String todoData = 'todo_data';
}

class SharePreferenceService extends GetxService {
  SharedPreferences? prefs;

  @override
  void onInit() async {
    super.onInit();

    // Obtain shared preferences.
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setInt(String key, int val) => prefs!.setInt(key, val);

  Future<bool> setBool(String key, bool val) => prefs!.setBool(key, val);

  Future<bool> setDouble(String key, double val) => prefs!.setDouble(key, val);

  Future<bool> setString(String key, String val) => prefs!.setString(key, val);

  Future<bool> setStringList(String key, List<String> val) => prefs!.setStringList(key, val);

  int? getInt(String key) => prefs!.getInt(key);

  bool? getBool(String key) => prefs!.getBool(key);

  double? getDouble(String key) => prefs!.getDouble(key);

  String? getString(String key) => prefs!.getString(key);

  List<String>? getStringList(String key) => prefs!.getStringList(key);

  Future<bool> removeKey(String key) => prefs!.remove(key);
}
