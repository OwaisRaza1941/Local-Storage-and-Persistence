import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_storage_and_persistence/screens/login_screen.dart';
import 'package:local_storage_and_persistence/services/local_storage_services.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  // final String keyName = 'OnboardingScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome to MyApp", style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Text("Swipe to learn more..."),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () async {
                // final prefs = await SharedPreferences.getInstance();
                // await prefs.setBool(keyName, true);

                LocalStorage.setBool(LocalStorageKeys.isONBoarding, true);
                Get.offAll(LoginScreen());
              },
              child: Text("Get Started"),
            ),
          ],
        ),
      ),
    );
  }
}
