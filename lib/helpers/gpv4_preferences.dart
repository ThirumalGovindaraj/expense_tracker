/*
import 'package:shared_preferences/shared_preferences.dart';

class GPV4Preferences {
  // static GPV4Preferences _instance = GPV4Preferences._internal();

  static final instance = GPV4Preferences._();

  GPV4Preferences._();

  // factory GPV4Preferences() => _instance;

  static const _logoutTimeKey = "log_out_time";
  static const _accessTokenKey = "access_token_key";
  static const _baseUrlKey = "base_url_key";
  static const _eWalletBaseUrlKey = "wallet_base_url_key";
  static const _signatureKey = "signature_key";

  String? _logOutTime;
  String? _accessToken;
  String? _baseUrl;
  String? _eWalletBaseUrl;
  String? _signature;

  String? get baseUrl => _baseUrl;

  String? get signature => _signatureKey;

  String? get logoutTime => _logOutTime;

  String? get accessToken => _accessToken;

  String? get eWalletBaseUrl => _eWalletBaseUrl;

  init() async {
    _baseUrl = await GPV4Preferences.getBaseURL();
    _logOutTime = await GPV4Preferences.getLogoutTime();
    _accessToken = await GPV4Preferences.getAccessToken();
    _signature = await GPV4Preferences.getSignature();
    _eWalletBaseUrl = await GPV4Preferences.getEWalletBaseURL();
  }

  static Future<String?> getAccessToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? latLong = localStorage.getString(_accessTokenKey);
    return latLong ?? "";
  }

  static Future<void> setAccessToken(String accessToken) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    await localStorage.setString(_accessTokenKey, accessToken);
    await GPV4Preferences.instance.init();
  }

  static Future<String?> getSignature() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? latLong = localStorage.getString(_signatureKey);
    return latLong ?? "";
  }

  static Future<void> setSignature(String accessToken) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    await localStorage.setString(_signatureKey, accessToken);
    await GPV4Preferences.instance.init();
  }

  static Future<String?> getBaseURL() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? latLong = localStorage.getString(_baseUrlKey);
    return latLong;
  }

  static Future<void> setBaseURL(String accessToken) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    await localStorage.setString(_baseUrlKey, accessToken);
    await GPV4Preferences.instance.init();
  }

  static Future<String?> getEWalletBaseURL() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? latLong = localStorage.getString(_eWalletBaseUrlKey);
    return latLong;
  }

  static Future<void> setEWalletBaseURL(String eWalletBaseUrl) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    await localStorage.setString(_eWalletBaseUrlKey, eWalletBaseUrl);
    await GPV4Preferences.instance.init();
  }

/////////////
  static Future<String?> getLogoutTime() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? latLong = localStorage.getString(_logoutTimeKey);
    return latLong;
  }

  static Future<void> setLogoutTime(String latLong) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    await localStorage.setString(_logoutTimeKey, latLong);
    await GPV4Preferences.instance.init();
  }

*/
/*
* Login time getter and setter
* *//*


  static Future<void> logoutClearPreferences() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    await localStorage.remove(_accessTokenKey);
    // await localStorage.remove(_baseUrlKey);

    await GPV4Preferences.instance.init();
  }
}
*/
