import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _animation,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: const Color(0xFFF7931A),
                    width: 3,
                  ),
                ),
                child: const Icon(
                  Icons.bubble_chart,
                  color: Color(0xFFF7931A),
                  size: 50,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'MINIGRAM',
              style: TextStyle(
                fontFamily: 'Orbitron',
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF7931A),
                letterSpacing: 5,
              ),
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              color: Color(0xFFF7931A),
            ),
          ],
        ),
      ),
    );
  }
}