import 'package:flutter/foundation.dart';

class AppProvider extends ChangeNotifier {
  /// Bottom navigation index
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  /// Dummy unread count
  int _totalUnread = 0;

  int get totalUnread => _totalUnread;

  void setUnread(int value) {
    _totalUnread = value;
    notifyListeners();
  }

  /// Chat list placeholder (safe empty list)
  final List<dynamic> _chats = [];

  List<dynamic> get chats => _chats;
}
