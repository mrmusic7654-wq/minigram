import 'package:flutter/foundation.dart';

@immutable
class User {
  final String id;
  final String name;
  final String phone;
  final String avatar;
  final bool isPremium;
  final int level;
  final int xp;
  final DateTime lastSeen;
  final String status;

  const User({
    required this.id,
    required this.name,
    required this.phone,
    required this.avatar,
    this.isPremium = false,
    this.level = 1,
    this.xp = 0,
    required this.lastSeen,
    this.status = 'Online',
  });

  bool get isOnline => DateTime.now().difference(lastSeen).inMinutes < 5;
}