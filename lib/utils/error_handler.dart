import 'package:flutter/material.dart';

class ErrorHandler {
  static void setup() {
    // Setup error handling for the app
    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      // You can also send to crash reporting service
      _logError(details.exception.toString(), details.stack);
    };

    // Platform errors
    // PlatformDispatcher.instance.onError = (error, stack) {
    //   _logError(error.toString(), stack);
    //   return true;
    // };
  }

  static void _logError(String error, StackTrace? stack) {
    // Log error to console or send to analytics
    debugPrint('Error: $error');
    if (stack != null) {
      debugPrint('Stack trace: $stack');
    }
    
    // You can add Firebase Crashlytics or Sentry here
    // FirebaseCrashlytics.instance.recordError(error, stack);
  }

  static void showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static void handleApiError(dynamic error, BuildContext context) {
    String errorMessage = 'An error occurred';
    
    if (error is String) {
      errorMessage = error;
    } else if (error.toString().contains('socket') || error.toString().contains('network')) {
      errorMessage = 'No internet connection';
    } else if (error.toString().contains('timeout')) {
      errorMessage = 'Request timeout';
    }
    
    showErrorSnackbar(context, errorMessage);
  }
}
