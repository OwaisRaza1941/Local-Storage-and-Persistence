import 'package:flutter/material.dart';
import 'package:local_storage_and_persistence/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Welcome to MyApp", style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          Text("Swipe to learn more..."),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setBool("isOnboardingShown", true);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
              );
            },
            child: Text("Get Started"),
          ),
        ],
      ),
    );
  }
}
