import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

class EncryptionUtils {
  static String generateKey() {
    final random = List<int>.generate(32, (i) => i);
    return base64Url.encode(random);
  }

  static String encryptMessage(String message, String key) {
    try {
      final iv = IV.fromLength(16);
      final encrypter = Encrypter(AES(Key.fromBase64(key)));
      final encrypted = encrypter.encrypt(message, iv: iv);
      return encrypted.base64;
    } catch (e) {
      return message;
    }
  }

  static String decryptMessage(String encrypted, String key) {
    try {
      final iv = IV.fromLength(16);
      final encrypter = Encrypter(AES(Key.fromBase64(key)));
      final decrypted = encrypter.decrypt64(encrypted, iv: iv);
      return decrypted;
    } catch (e) {
      return encrypted;
    }
  }

  static String hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  static String generateMessageHash(String message) {
    final bytes = utf8.encode(message + DateTime.now().millisecondsSinceEpoch.toString());
    final digest = md5.convert(bytes);
    return digest.toString();
  }

  static Uint8List encryptFile(Uint8List data, String key) {
    // Simple XOR encryption for demonstration
    // In production, use proper encryption like AES
    final keyBytes = utf8.encode(key);
    final result = Uint8List(data.length);
    
    for (int i = 0; i < data.length; i++) {
      result[i] = data[i] ^ keyBytes[i % keyBytes.length];
    }
    
    return result;
  }

  static Uint8List decryptFile(Uint8List encrypted, String key) {
    // XOR decryption (same as encryption)
    return encryptFile(encrypted, key);
  }

  static bool verifySignature(String data, String signature, String publicKey) {
    // Simplified signature verification
    final expectedHash = hashPassword(data);
    return signature == expectedHash;
  }

  static String generateSessionToken() {
    final random = List<int>.generate(64, (i) => DateTime.now().millisecond + i);
    return base64Url.encode(random);
  }
}