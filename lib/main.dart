import 'package:flutter/material.dart';
import 'package:my_holidays/pages/detail_chat_page.dart';
import 'package:my_holidays/pages/home/main_page.dart';
import 'package:my_holidays/pages/onboarding_page.dart';
import 'package:my_holidays/pages/sign_in_page.dart';
import 'package:my_holidays/pages/sign_up_page.dart';
import 'package:my_holidays/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/onboarding': (context) => OnboardingPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/home': (context) => MainPage(),
        '/detail-chat': (context) => DetailChatPage(),
      },
    );
  }
}
