import 'package:minigram/api/telegram_api.dart';
import 'package:minigram/models/mtproto.dart';

class AuthService {
  final TelegramAPI _api;
  
  AuthService(this._api);
  
  Future<bool> requestCode(String phoneNumber) async {
    try {
      return await _api.sendCode(phoneNumber);
    } catch (e) {
      throw Exception('Failed to request code: $e');
    }
  }
  
  Future<bool> verifyCode({
    required String phoneNumber,
    required String phoneCodeHash,
    required String code,
    String? password,
  }) async {
    try {
      final authData = AuthData(
        phoneNumber: phoneNumber,
        phoneCodeHash: phoneCodeHash,
        password: password,
      );
      return await _api.signIn(authData);
    } catch (e) {
      throw Exception('Failed to verify code: $e');
    }
  }
  
  Future<void> logout() async {
    try {
      await _api.logOut();
    } catch (e) {
      throw Exception('Failed to logout: $e');
    }
  }
  
  Future<bool> checkAuth() async {
    try {
      final chats = await _api.getChats(limit: 1);
      return chats.isNotEmpty;
    } catch (_) {
      return false;
    }
  }
}