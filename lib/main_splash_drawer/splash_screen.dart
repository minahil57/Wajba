import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:wajba_new/user_authentication/sign_in.dart';
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'lib/assets/images/logo/logo.png',
      nextScreen:  login_page(),
      splashIconSize: 300,
      splashTransition: SplashTransition.sizeTransition,
      backgroundColor: Colors.white,
    );
  }
}