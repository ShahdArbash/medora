import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const _storage = FlutterSecureStorage();

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  //  حفظ التوكنات
  static Future<void> saveTokens({
    required String accessToken,
    // required String refreshToken,
  }) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
    // await _storage.write(key: _refreshTokenKey, value: refreshToken);
  }

  //  جلب access token
  static Future<String?> getToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  //  تسجيل خروج
  static Future<void> clearAll() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }

  //هل المستخدم مسجل
  static Future<bool> isLoggedIn() async {
    final token = await _storage.read(key: _accessTokenKey);

    if (token == null) return false;

    return true;
  }

  static Future<void> clearAccessToken() async {
    await _storage.delete(key: _accessTokenKey);
  }

  static Future<void> updateAccessToken(String token) async {
    await _storage.write(key: _accessTokenKey, value: token);
  }
}
