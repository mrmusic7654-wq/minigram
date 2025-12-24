import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppAnimations {
  static Widget loading({double size = 100}) {
    return Lottie.asset(
      'assets/animations/loading.json',
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }

  static Widget typing({double size = 40}) {
    return Lottie.asset(
      'assets/animations/typing.json',
      width: size,
      height: size,
      fit: BoxFit.contain,
      repeat: true,
    );
  }

  static Widget success({double size = 100, VoidCallback? onComplete}) {
    return Lottie.asset(
      'assets/animations/success.json',
      width: size,
      height: size,
      fit: BoxFit.contain,
      onLoaded: (composition) {
        if (onComplete != null) {
          Future.delayed(composition.duration, onComplete);
        }
      },
    );
  }

  static Widget error({double size = 100}) {
    return Lottie.asset(
      'assets/animations/error.json',
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }

  static Widget send({double size = 50}) {
    return Lottie.asset(
      'assets/animations/send.json',
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }

  static Widget recording({double size = 80}) {
    return Lottie.asset(
      'assets/animations/recording.json',
      width: size,
      height: size,
      fit: BoxFit.contain,
      repeat: true,
    );
  }
}