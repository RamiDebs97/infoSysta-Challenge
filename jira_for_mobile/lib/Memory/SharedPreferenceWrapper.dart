import 'package:jira_for_mobile/Models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceWrapper {
  static final String emailTag = 'email';
  static final String tokenTag = 'token';
  static final String urlTag = 'url';
  static final String isLoggedInTag = 'isLoggedIn';

  static Future<bool> saveData(email, token, url, isLoggedIn) {
    return SharedPreferences.getInstance().then((pref) {
      pref.setString(emailTag, email);
      pref.setString(tokenTag, token);
      pref.setString(urlTag, url);
      pref.setBool(isLoggedInTag, isLoggedIn);
      return true;
    });
  }

  static Future<bool> deleteAllDataFromSharedPreference() {
    return SharedPreferences.getInstance().then((pref) {
      return pref.clear();
    });
  }

  static Future<User> getUserData() {
    User user = User(null, null, null, false);
    return SharedPreferences.getInstance().then((pref) {
      String emailStr = pref.getString(emailTag);
      String tokenStr = pref.getString(tokenTag);
      String urlStr = pref.getString(urlTag);
      bool isLoggedIn = pref.getBool(isLoggedInTag);

      if (emailStr != null && emailStr != "") {
        user = User(emailStr, tokenStr, urlStr, isLoggedIn);
      }
      return user;
    });
  }
}
