import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:minigram/models/user.dart';
import 'package:minigram/api/auth_service.dart';
import 'package:minigram/utils/error_handler.dart';

class AuthProvider with ChangeNotifier {
  // Secure storage for tokens
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  
  // State variables
  User? _currentUser;
  bool _isLoading = false;
  bool _isInitializing = true;
  bool _isVerifying = false;
  String? _errorMessage;
  String? _verificationCode;
  String? _phoneNumber;
  String? _authToken;
  String? _refreshToken;
  DateTime? _tokenExpiry;
  
  // Getters
  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  bool get isInitializing => _isInitializing;
  bool get isVerifying => _isVerifying;
  bool get isAuthenticated => _currentUser != null && _authToken != null;
  String? get errorMessage => _errorMessage;
  String? get phoneNumber => _phoneNumber;
  
  // Private constructor helper
  AuthProvider() {
    _initializeAuth();
  }
  
  // Initialize authentication state
  Future<void> _initializeAuth() async {
    try {
      await Future.delayed(const Duration(milliseconds: 800));
      
      // Check for stored tokens
      final storedToken = await _storage.read(key: 'auth_token');
      final storedUser = await _storage.read(key: 'user_data');
      final storedPhone = await _storage.read(key: 'phone_number');
      
      if (storedToken != null && storedUser != null) {
        _authToken = storedToken;
        _phoneNumber = storedPhone;
        
        // Parse user data
        // In real app, you'd parse JSON here
        _currentUser = User(
          id: '1',
          name: 'User',
          phone: storedPhone ?? '+1234567890',
          avatar: 'https://ui-avatars.com/api/?name=User&background=random',
          isOnline: true,
          lastSeen: DateTime.now(),
          bio: 'Minigram user',
          status: 'Available',
        );
      }
      
    } catch (error, stackTrace) {
      ErrorHandler.logError(error, stackTrace, context: 'Auth Initialization');
      _errorMessage = 'Failed to initialize authentication';
    } finally {
      _isInitializing = false;
      notifyListeners();
    }
  }
  
  // Request OTP for phone number
  Future<bool> requestOtp(String phone) async {
    _isLoading = true;
    _errorMessage = null;
    _phoneNumber = phone;
    notifyListeners();
    
    try {
      await Future.delayed(const Duration(seconds: 1));
      
      // Simulate API call
      final success = await AuthService.requestOtp(phone);
      
      if (success) {
        _verificationCode = '123456'; // Simulated code
        return true;
      } else {
        _errorMessage = 'Failed to send OTP';
        return false;
      }
      
    } catch (error, stackTrace) {
      ErrorHandler.logError(error, stackTrace, context: 'Request OTP');
      _errorMessage = 'Network error: ${error.toString()}';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  // Verify OTP and login
  Future<bool> verifyOtp(String code) async {
    if (_phoneNumber == null) {
      _errorMessage = 'Phone number not set';
      return false;
    }
    
    _isVerifying = true;
    _errorMessage = null;
    notifyListeners();
    
    try {
      await Future.delayed(const Duration(seconds: 1));
      
      // Simulate verification
      if (code == _verificationCode || code == '123456') {
        // Successful verification
        _authToken = 'mock_jwt_token_${DateTime.now().millisecondsSinceEpoch}';
        _refreshToken = 'mock_refresh_token_${DateTime.now().millisecondsSinceEpoch}';
        _tokenExpiry = DateTime.now().add(const Duration(days: 7));
        
        // Create user
        _currentUser = User(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          name: 'Minigram User',
          phone: _phoneNumber!,
          avatar: 'https://ui-avatars.com/api/?name=Minigram&background=0D8ABC&color=fff',
          isOnline: true,
          lastSeen: DateTime.now(),
          bio: 'Welcome to Minigram!',
          status: 'Online',
          isVerified: true,
          createdAt: DateTime.now(),
        );
        
        // Store tokens securely
        await _storage.write(key: 'auth_token', value: _authToken);
        await _storage.write(key: 'refresh_token', value: _refreshToken);
        await _storage.write(key: 'phone_number', value: _phoneNumber);
        await _storage.write(key: 'user_data', value: _currentUser!.toJson().toString());
        
        return true;
      } else {
        _errorMessage = 'Invalid verification code';
        return false;
      }
      
    } catch (error, stackTrace) {
      ErrorHandler.logError(error, stackTrace, context: 'Verify OTP');
      _errorMessage = 'Verification failed: ${error.toString()}';
      return false;
    } finally {
      _isVerifying = false;
      notifyListeners();
    }
  }
  
  // Logout user
  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      
      // Clear all stored data
      await _storage.delete(key: 'auth_token');
      await _storage.delete(key: 'refresh_token');
      await _storage.delete(key: 'phone_number');
      await _storage.delete(key: 'user_data');
      
      // Reset state
      _currentUser = null;
      _authToken = null;
      _refreshToken = null;
      _phoneNumber = null;
      _tokenExpiry = null;
      _verificationCode = null;
      _errorMessage = null;
      
    } catch (error, stackTrace) {
      ErrorHandler.logError(error, stackTrace, context: 'Logout');
      _errorMessage = 'Logout failed';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  // Refresh token if expired
  Future<bool> refreshAuthToken() async {
    if (_refreshToken == null) return false;
    
    try {
      // Simulate token refresh
      await Future.delayed(const Duration(milliseconds: 300));
      _authToken = 'refreshed_token_${DateTime.now().millisecondsSinceEpoch}';
      _tokenExpiry = DateTime.now().add(const Duration(days: 7));
      
      await _storage.write(key: 'auth_token', value: _authToken);
      return true;
      
    } catch (error, stackTrace) {
      ErrorHandler.logError(error, stackTrace, context: 'Refresh Token');
      return false;
    }
  }
  
  // Check if token is expired
  bool get isTokenExpired {
    if (_tokenExpiry == null) return true;
    return DateTime.now().isAfter(_tokenExpiry!);
  }
  
  // Clear error message
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
  
  // Update user profile
  Future<bool> updateProfile({
    String? name,
    String? bio,
    String? status,
    String? avatar,
  }) async {
    if (_currentUser == null) return false;
    
    _isLoading = true;
    notifyListeners();
    
    try {
      await Future.delayed(const Duration(seconds: 1));
      
      // Update user
      _currentUser = _currentUser!.copyWith(
        name: name,
        bio: bio,
        status: status,
        avatar: avatar,
      );
      
      // Store updated user
      await _storage.write(key: 'user_data', value: _currentUser!.toJson().toString());
      
      return true;
      
    } catch (error, stackTrace) {
      ErrorHandler.logError(error, stackTrace, context: 'Update Profile');
      _errorMessage = 'Failed to update profile';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  // Dispose resources
  @override
  void dispose() {
    // Clean up if needed
    super.dispose();
  }
}
