import 'dart:typed_data';
import 'package:minigram/api/telegram_api.dart';
import 'package:minigram/models/chat.dart';
import 'package:minigram/models/message.dart';

class ChatService {
  final TelegramAPI _api;
  
  ChatService(this._api);
  
  Future<List<Chat>> loadChats({int limit = 100}) async {
    try {
      final data = await _api.getChats(limit: limit);
      return _parseChats(data);
    } catch (e) {
      throw Exception('Failed to load chats: $e');
    }
  }
  
  Future<List<Message>> loadMessages(
    String chatId, {
    int limit = 50,
  }) async {
    try {
      final data = await _api.getMessages(chatId, limit: limit);
      return _parseMessages(data);
    } catch (e) {
      throw Exception('Failed to load messages: $e');
    }
  }
  
  Future<void> sendTextMessage({
    required String chatId,
    required String text,
  }) async {
    try {
      await _api.sendMessage(chatId: chatId, message: text);
    } catch (e) {
      throw Exception('Failed to send message: $e');
    }
  }
  
  Future<void> sendVoiceMessage({
    required String chatId,
    required Uint8List audioData,
    required String fileName,
  }) async {
    try {
      await _api.sendMedia(
        chatId: chatId,
        fileData: audioData,
        fileName: fileName,
        mimeType: 'audio/ogg',
      );
    } catch (e) {
      throw Exception('Failed to send voice message: $e');
    }
  }
  
  Future<void> deleteMessage(String chatId, String messageId) async {
    try {
      await _api.deleteMessage(chatId, messageId);
    } catch (e) {
      throw Exception('Failed to delete message: $e');
    }
  }
  
  List<Chat> _parseChats(List<dynamic> data) {
    // Parse API response to Chat objects
    return [];
  }
  
  List<Message> _parseMessages(List<dynamic> data) {
    // Parse API response to Message objects
    return [];
  }
}