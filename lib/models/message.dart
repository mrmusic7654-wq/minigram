import 'package:flutter/foundation.dart';

enum MessageType { text, voice, image, video, document }
enum MessageStatus { sending, sent, delivered, read, failed }

@immutable
class Message {
  final String id;
  final String chatId;
  final String senderId;
  final MessageType type;
  final String text;
  final String? mediaUrl;
  final int? duration;
  final int size;
  final MessageStatus status;
  final DateTime timestamp;
  final bool isEdited;
  final bool isDeleted;

  const Message({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.type,
    required this.text,
    this.mediaUrl,
    this.duration,
    this.size = 0,
    this.status = MessageStatus.sent,
    required this.timestamp,
    this.isEdited = false,
    this.isDeleted = false,
  });

  bool get isMe => senderId == 'me';
}