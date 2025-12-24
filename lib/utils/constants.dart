class AppConstants {
  // App Info
  static const String appName = 'Minigram';
  static const String appVersion = '1.0.0';
  static const String appBuildNumber = '1';

  // API Constants
  static const String telegramApiId = 'YOUR_API_ID';
  static const String telegramApiHash = 'YOUR_API_HASH';
  static const String telegramServer = '149.154.167.50';
  static const int telegramPort = 443;

  // Storage Keys
  static const String authTokenKey = 'auth_token';
  static const String userIdKey = 'user_id';
  static const String phoneKey = 'phone_number';
  static const String themeKey = 'app_theme';

  // Animation Durations
  static const Duration messageAnimation = Duration(milliseconds: 300);
  static const Duration splashDuration = Duration(seconds: 2);
  static const Duration typingIndicatorDuration = Duration(milliseconds: 1500);

  // UI Constants
  static const double messageBubbleRadius = 12.0;
  static const double cardBorderRadius = 16.0;
  static const double buttonBorderRadius = 12.0;
  static const double avatarRadius = 24.0;
  static const double bottomNavHeight = 70.0;

  // File Size Limits (in bytes)
  static const int maxImageSize = 5 * 1024 * 1024; // 5MB
  static const int maxVideoSize = 20 * 1024 * 1024; // 20MB
  static const int maxFileSize = 100 * 1024 * 1024; // 100MB
  static const int maxAudioSize = 10 * 1024 * 1024; // 10MB

  // Cache Settings
  static const int maxCacheSize = 100 * 1024 * 1024; // 100MB
  static const Duration cacheDuration = Duration(days: 7);

  // Pagination
  static const int chatsPerPage = 20;
  static const int messagesPerPage = 50;
  static const int contactsPerPage = 50;

  // Network
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const int maxRetries = 3;

  // Security
  static const int pinMaxLength = 6;
  static const int phoneMinLength = 10;
  static const int phoneMaxLength = 15;
}

class Routes {
  static const String splash = '/';
  static const String login = '/login';
  static const String main = '/main';
  static const String chatList = '/chats';
  static const String chat = '/chat';
  static const String groups = '/groups';
  static const String discover = '/discover';
  static const String calls = '/calls';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String contacts = '/contacts';
  static const String newChat = '/new-chat';
  static const String groupInfo = '/group-info';
}