import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String? _userId;
  String? _phoneNumber;
  bool _isAuthenticated = false;
  bool _isLoading = false;

  String? get userId => _userId;
  String? get phoneNumber => _phoneNumber;
  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;

  Future<void> login(String phoneNumber, String code) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    _phoneNumber = phoneNumber;
    _userId = 'user_${DateTime.now().millisecondsSinceEpoch}';
    _isAuthenticated = true;
    _isLoading = false;
    
    notifyListeners();
  }

  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    _userId = null;
    _phoneNumber = null;
    _isAuthenticated = false;
    _isLoading = false;
    
    notifyListeners();
  }

  Future<bool> checkAuthStatus() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    _isLoading = false;
    notifyListeners();
    
    return _isAuthenticated;
  }
}