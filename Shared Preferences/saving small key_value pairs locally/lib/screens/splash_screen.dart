import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_storage_and_persistence/screens/home_screen.dart';
import 'package:local_storage_and_persistence/screens/login_screen.dart';
import 'package:local_storage_and_persistence/screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkAppFlow();
  }

  void checkAppFlow() async {
    final prefs = await SharedPreferences.getInstance();
    bool? isOnboardingShown = prefs.getBool('isOnboardingShown');
    bool? isLoggedIn = prefs.getBool('isLoggedIn');

    await Future.delayed(Duration(seconds: 2)); // Show splash for 2s

    if (isOnboardingShown != true) {
      Get.offAll(() => OnboardingScreen()); // Onboarding screen
    } else if (isLoggedIn == true) {
      Get.offAll(() => HomeScreen()); // Already logged in
    } else {
      Get.offAll(() => LoginScreen()); // Not logged in
    }
  }

  // logout functionality

  // Future<void> checkLoginStatus() async {a
  //   final prefs = await SharedPreferences.getInstance();
  //   bool? isLoggedIn = prefs.getBool("isLoggedIn");

  //   Timer(Duration(seconds: 2), () {
  //     if (isLoggedIn == true) {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => HomeScreen()),
  //       );
  //     } else {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => LoginScreen()),
  //       );
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Text(
          "Splash Screen",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
    );
  }
}
