import 'package:flutter/material.dart';
import 'package:my_holidays/pages/booking_page.dart';
import 'package:my_holidays/pages/cart_page.dart';
import 'package:my_holidays/pages/detail_chat_page.dart';
import 'package:my_holidays/pages/home/edit_profile_page.dart';
import 'package:my_holidays/pages/home/main_page.dart';
import 'package:my_holidays/pages/onboarding_page.dart';
import 'package:my_holidays/pages/sign_in_page.dart';
import 'package:my_holidays/pages/sign_up_page.dart';
import 'package:my_holidays/pages/splash_page.dart';
import 'package:my_holidays/pages/tours_page.dart';
import 'package:my_holidays/providers/auth_provider.dart';
import 'package:my_holidays/services/auth_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/onboarding': (context) => const OnboardingPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/home': (context) => const MainPage(),
          '/detail-chat': (context) => const DetailChatPage(),
          '/edit-profile': (context) => const EditProfilePage(),
          '/tours': (context) => ToursPage(),
          '/cart': (context) => const CartPage(),
          '/booking': (context) => const BookingPage(),
        },
      ),
    );
  }
}
