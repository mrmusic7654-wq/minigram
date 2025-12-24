import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:minigram/app.dart';
import 'package:minigram/utils/error_handler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  await dotenv.load(fileName: ".env");
  
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  
  ErrorHandler.setup();
  runApp(const MinigramApp());
}

class MinigramApp extends StatelessWidget {
  const MinigramApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Minigram',
      theme: ThemeData(
        fontFamily: 'Orbitron',
        useMaterial3: true,
      ),
      home: const App(),
    );
  }
}
