import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:my_holidays/providers/tour_provider.dart';
import 'package:my_holidays/theme.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // Todo: implement initState

    getInit();

    super.initState();
  }

  getInit() async {
    await Provider.of<TourProvider>(context, listen: false).getTours();
    Navigator.pushNamedAndRemoveUntil(context, '/onboarding', (route) => false);

    // Timer(const Duration(seconds: 2), () {
    //   Navigator.pushNamedAndRemoveUntil(
    //       context, '/onboarding', (route) => false);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Container(
          width: 130,
          height: 150,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/image_splash.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
