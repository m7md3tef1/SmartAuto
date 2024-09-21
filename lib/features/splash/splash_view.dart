import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartauto/features/auth/login/login.dart';
import 'package:smartauto/features/home/view.dart';

import '../../core/const/utils.dart';

class SplashScreen extends StatefulWidget {
  final Widget? nextScreen;

  const SplashScreen({super.key, this.nextScreen});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.yellow),
        ),
        body: AnimatedSplashScreen(
            duration: 2500,
            splashIconSize: 300,
            splash: Image.asset('assets/images/Logo.png'),
            splashTransition: SplashTransition.fadeTransition,
            nextScreen:
                token == '' ? const SmartAutoLoginScreen() : const HomeView(),
            backgroundColor: Colors.yellow));
  }
}
