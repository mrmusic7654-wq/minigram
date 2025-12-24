import 'package:flutter/material.dart';
import 'package:minigram/models/chat.dart';
import 'package:minigram/models/message.dart';

class ChatProvider with ChangeNotifier {
  final List<Chat> _chats = [];
  final Map<String, List<Message>> _messages = {};
  String? _selectedChatId;

  List<Chat> get chats => _chats;
  String? get selectedChatId => _selectedChatId;
  
  List<Message> getMessages(String chatId) {
    return _messages[chatId] ?? [];
  }

  Future<void> loadChats() async {
    await Future.delayed(const Duration(seconds: 1));
    
    _chats.addAll([
      Chat(
        id: '1',
        type: ChatType.private,
        name: 'Alice Johnson',
        avatar: 'https://randomuser.me/api/portraits/women/1.jpg',
        isOnline: true,
        unreadCount: 2,
        isPinned: true,
        lastMessage: Message(
          id: 'm1',
          chatId: '1',
          senderId: '1',
          type: MessageType.text,
          text: 'Hey, how are you doing?',
          timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
        ),
        updatedAt: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
      Chat(
        id: '2',
        type: ChatType.group,
        name: 'Design Team',
        avatar: 'https://randomuser.me/api/portraits/men/2.jpg',
        isOnline: false,
        unreadCount: 15,
        isPinned: false,
        lastMessage: Message(
          id: 'm2',
          chatId: '2',
          senderId: '3',
          type: MessageType.text,
          text: 'Meeting at 3 PM tomorrow',
          timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        ),
        updatedAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
    ]);
    
    notifyListeners();
  }

  Future<void> loadMessages(String chatId) async {
    await Future.delayed(const Duration(seconds: 1));
    
    if (!_messages.containsKey(chatId)) {
      _messages[chatId] = [
        Message(
          id: '1',
          chatId: chatId,
          senderId: 'other',
          type: MessageType.text,
          text: 'Hello there!',
          timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
        ),
        Message(
          id: '2',
          chatId: chatId,
          senderId: 'me',
          type: MessageType.text,
          text: 'Hi! How are you?',
          timestamp: DateTime.now().subtract(const Duration(minutes: 4)),
        ),
        Message(
          id: '3',
          chatId: chatId,
          senderId: 'other',
          type: MessageType.voice,
          text: 'Voice message',
          duration: 30,
          timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
        ),
      ];
    }
    
    notifyListeners();
  }

  Future<void> sendMessage(String chatId, String text) async {
    final message = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      chatId: chatId,
      senderId: 'me',
      type: MessageType.text,
      text: text,
      timestamp: DateTime.now(),
      status: MessageStatus.sent,
    );

    if (!_messages.containsKey(chatId)) {
      _messages[chatId] = [];
    }
    
    _messages[chatId]!.add(message);
    
    final chatIndex = _chats.indexWhere((chat) => chat.id == chatId);
    if (chatIndex != -1) {
      final chat = _chats[chatIndex];
      _chats[chatIndex] = chat.copyWith(
        lastMessage: message,
        updatedAt: DateTime.now(),
        unreadCount: 0,
      );
    }
    
    notifyListeners();
  }

  void selectChat(String chatId) {
    _selectedChatId = chatId;
    notifyListeners();
  }

  void markAsRead(String chatId) {
    final chatIndex = _chats.indexWhere((chat) => chat.id == chatId);
    if (chatIndex != -1) {
      final chat = _chats[chatIndex];
      _chats[chatIndex] = chat.copyWith(unreadCount: 0);
      notifyListeners();
    }
  }
}