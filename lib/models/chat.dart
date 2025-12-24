import 'package:flutter/foundation.dart';

enum ChatType { private, group, channel }

@immutable
class Chat {
  final String id;
  final ChatType type;
  final String name;
  final String avatar;
  final bool isOnline;
  final int unreadCount;
  final bool isPinned;
  final Message lastMessage;
  final DateTime updatedAt;

  const Chat({
    required this.id,
    required this.type,
    required this.name,
    required this.avatar,
    this.isOnline = false,
    this.unreadCount = 0,
    this.isPinned = false,
    required this.lastMessage,
    required this.updatedAt,
  });

  Chat copyWith({
    String? id,
    ChatType? type,
    String? name,
    String? avatar,
    bool? isOnline,
    int? unreadCount,
    bool? isPinned,
    Message? lastMessage,
    DateTime? updatedAt,
  }) {
    return Chat(
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      isOnline: isOnline ?? this.isOnline,
      unreadCount: unreadCount ?? this.unreadCount,
      isPinned: isPinned ?? this.isPinned,
      lastMessage: lastMessage ?? this.lastMessage,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
