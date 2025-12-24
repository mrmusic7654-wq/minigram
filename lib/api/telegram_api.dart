// lib/api/telegram_api.dart
import 'dart:typed_data';
import 'package:mtproto/mtproto.dart'; // You'd use a MTProto package

class TelegramAPI {
  final String apiId; // From https://my.telegram.org
  final String apiHash;
  
  late MTProtoClient _client;
  
  TelegramAPI({required this.apiId, required this.apiHash});
  
  Future<void> initialize() async {
    _client = MTProtoClient(
      apiId: apiId,
      apiHash: apiHash,
      server: '149.154.167.50:443', // Telegram production
    );
  }
  
  Future<bool> login(String phoneNumber) async {
    // Send code
    final sentCode = await _client.auth.sendCode(
      phoneNumber: phoneNumber,
      apiId: int.parse(apiId),
      apiHash: apiHash,
    );
    
    // Sign in with code
    final auth = await _client.auth.signIn(
      phoneNumber: phoneNumber,
      phoneCodeHash: sentCode.phoneCodeHash,
      phoneCode: '123456', // User input
    );
    
    return auth is AuthAuthorization;
  }
  
  Future<List<Chat>> getChats() async {
    final dialogs = await _client.messages.getDialogs(
      limit: 100,
    );
    
    return dialogs.chats.map((chat) {
      return Chat.fromTL(chat);
    }).toList();
  }
  
  Future<void> sendMessage({
    required String chatId,
    required String message,
  }) async {
    await _client.messages.sendMessage(
      peer: InputPeerChat(chatId: int.parse(chatId)),
      message: message,
    );
  }
  
  Future<void> sendVoiceMessage({
    required String chatId,
    required Uint8List audioData,
  }) async {
    final file = await _client.uploadFile(audioData);
    
    await _client.messages.sendMedia(
      peer: InputPeerChat(chatId: int.parse(chatId)),
      media: InputMediaUploadedDocument(
        file: file,
        mimeType: 'audio/ogg',
        attributes: [
          DocumentAttributeAudio(
            voice: true,
            duration: 0, // Calculate from audio
          ),
        ],
      ),
    );
  }
}