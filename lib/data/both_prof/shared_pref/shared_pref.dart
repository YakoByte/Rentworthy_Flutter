import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManagerUtils {
  static String isLogin = "is_login";
  static String isOnBoarding = "is_onBoarding";
  static String isIndividual = "is_individual";
  static String userId = "userId";
  static String token = "Token";
  static String email = "Email";
  static String userName = "UserName";
  static String asGuest = "asGuest";

  ///setIsLogin
  static Future setIsLogin(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isLogin, value);
  }

  static Future<bool?> getIsLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLogin);
  }

  ///setAGuest
  static Future setAsGuest(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(asGuest, value);
  }

  static Future<bool?> getAsGuest() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(asGuest);
  }

  ///setIsIndividual
  static Future setIsIndividual(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(isIndividual, value);
  }

  static Future<int?> getIsIndividual() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(isIndividual);
  }

  ///setIsOnboarding
  static Future setIsOnboarding(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isOnBoarding, value);
  }

  static Future<bool?> getIsOnboarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isOnBoarding);
  }

  ///setUserId
  static Future setUserId(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(userId, value);
  }

  static Future<String> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userId).toString() ?? '';
  }

  ///setUsername
  static Future setUsername(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(userName, value ?? "");
  }

  static Future<String> getUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userName).toString() ?? '';
  }

  ///setToken
  static Future setToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(token, value);
  }

  static Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(token) ?? '';
  }

  ///setUserEmail
  static Future setUserEmail(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(email, value);
  }

  static Future<String> getUserEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(email).toString() ?? '';
  }

  static Future clearAllPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setIsLogin(false);
    setAsGuest(false);

    setIsIndividual(0);
    setIsOnboarding(false);
    setUserId("");
    setUsername("");
    setToken("");
    setUserEmail("");

    prefs.clear();
  }

  static Future clearOnLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setIsLogin(false);
    setAsGuest(false);
    setIsIndividual(0);
    setUserId("");
    setUsername("");
    setToken("");
    setUserEmail("");
  }
}
