import 'package:flutter/foundation.dart';
import 'package:minigram/models/user.dart';

enum MessageType {
  text,
  image,
  video,
  audio,
  document,
  location,
  contact,
}

class Message {
  final String id;
  final String chatId;
  final User sender;
  final String content;
  final MessageType type;
  final DateTime timestamp;
  final bool isRead;
  final bool isSent;
  final bool isEdited;
  final List<String>? mediaUrls;
  final String? replyToId;
  final Map<String, dynamic>? metadata;

  Message({
    required this.id,
    required this.chatId,
    required this.sender,
    required this.content,
    this.type = MessageType.text,
    required this.timestamp,
    this.isRead = false,
    this.isSent = true,
    this.isEdited = false,
    this.mediaUrls,
    this.replyToId,
    this.metadata,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      chatId: json['chatId'],
      sender: User.fromJson(json['sender']),
      content: json['content'],
      type: MessageType.values[json['type']],
      timestamp: DateTime.parse(json['timestamp']),
      isRead: json['isRead'],
      isSent: json['isSent'],
      isEdited: json['isEdited'] ?? false,
      mediaUrls: json['mediaUrls'] != null 
          ? List<String>.from(json['mediaUrls'])
          : null,
      replyToId: json['replyToId'],
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'chatId': chatId,
      'sender': sender.toJson(),
      'content': content,
      'type': type.index,
      'timestamp': timestamp.toIso8601String(),
      'isRead': isRead,
      'isSent': isSent,
      'isEdited': isEdited,
      'mediaUrls': mediaUrls,
      'replyToId': replyToId,
      'metadata': metadata,
    };
  }
}
