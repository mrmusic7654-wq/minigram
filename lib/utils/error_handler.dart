import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ErrorHandler {
  static void setup() {
    // Setup Flutter error handling
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      logError(details.exception, details.stack);
    };

    // Setup Dart error handling
    PlatformDispatcher.instance.onError = (error, stack) {
      logError(error, stack);
      return true;
    };
  }

  static void logError(dynamic error, StackTrace? stack, {String? context}) {
    // Log errors to console (in production, send to server)
    debugPrint('═══════════════════════════════════════════════════');
    if (context != null) {
      debugPrint('Error Context: $context');
    }
    debugPrint('Error: $error');
    debugPrint('Stack Trace: $stack');
    debugPrint('═══════════════════════════════════════════════════');
    
    // Here you can add Firebase Crashlytics, Sentry, etc.
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
}
