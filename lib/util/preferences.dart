import 'package:shared_preferences/shared_preferences.dart';

class Preferences{
  static const String bottombarIndexKey = "bottombar_index_key";

  static SharedPreferences? prefs;

  static getSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  static int getInt(String key){
    getSharedPreferences();
    return prefs?.getInt(key) ?? 0;
  }

  static setInt(String key, int value){
    getSharedPreferences();
    prefs?.setInt(key, value);
  }
}