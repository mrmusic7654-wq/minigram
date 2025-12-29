import 'package:flutter/foundation.dart';
import 'package:minigram/models/user.dart';

class AuthProvider with ChangeNotifier {
  User? _currentUser;
  bool _isLoading = false;
  bool _isInitializing = true;
  String? _error;

  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  bool get isInitializing => _isInitializing;
  bool get isAuthenticated => _currentUser != null;
  String? get error => _error;

  AuthProvider() {
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      // Simulate initialization delay
      await Future.delayed(const Duration(seconds: 2));
      
      // Check if user is already logged in (from storage)
      // final storedUser = await _getStoredUser();
      // if (storedUser != null) {
      //   _currentUser = storedUser;
      // }
      
    } catch (e) {
      _error = e.toString();
    } finally {
      _isInitializing = false;
      notifyListeners();
    }
  }

  Future<void> login(String phone, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call
      
      // Mock user for now
      _currentUser = User(
        id: '1',
        name: 'John Doe',
        phone: phone,
        avatarUrl: null,
        isOnline: true,
        lastSeen: DateTime.now(),
      );
      
    } catch (e) {
      _error = 'Login failed: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _currentUser = null;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
