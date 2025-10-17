import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_storage_and_persistence/screens/home_screen.dart';
import 'package:local_storage_and_persistence/screens/login_screen.dart';
import 'package:local_storage_and_persistence/screens/onboarding_screen.dart';
import 'package:local_storage_and_persistence/services/local_storage_services.dart';

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

  Future<void> checkAppFlow() async {
    // final prefs = await SharedPreferences.getInstance();

    bool? isOnBoarding = LocalStorage.getBool(LocalStorageKeys.isONBoarding);
    bool? isLoggined = LocalStorage.getBool(LocalStorageKeys.loginKey);

    await Future.delayed(Duration(seconds: 2));

    if (isOnBoarding != true) {
      Get.offAll(OnboardingScreen());
    } else if (isLoggined == true) {
      Get.offAll(HomeScreen());
    } else {
      Get.offAll(LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Text(
          "Splash Screen",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
