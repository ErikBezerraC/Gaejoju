import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  Future<void> setUserStatus(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('USER', value);
  }

  Future<bool> getUserStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? status = prefs.getBool('USER');

    // if (status == null) {
    //   return false;
    // } else {
    //   return status; // true ou false
    // }

    return status ?? false;
  }
}