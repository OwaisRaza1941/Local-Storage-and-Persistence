import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_storage_and_persistence/constant/style.dart';
import 'package:local_storage_and_persistence/controller/theme_change_ctrl.dart';
import 'package:local_storage_and_persistence/screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Style.homeDrawerHeader,
        ListTile(
          onTap: () {},
          leading: Icon(Icons.language, color: Colors.blueGrey),
          title: Text('Language change'),
        ),
        ListTile(
          onTap: () async {
            Get.find<ThemeChangeCtrl>().changeTheme();
          },

          leading: Icon(Icons.light_mode, color: Colors.blueGrey),
          title: Text('Change Theme'),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.home, color: Colors.blueGrey),
          title: Text('Home'),
        ),
        SizedBox(
          width: 250,
          child: ElevatedButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();

              await prefs.remove("isLoggedIn");
              await prefs.remove("username");
              await prefs.remove("email");
              await prefs.remove("password");
              await prefs.remove("name");
              await prefs.remove("themeValue");
              await prefs.remove("isOnboardingShown");

              Get.find<ThemeChangeCtrl>().resetTheme();

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => OnboardingScreen()),
                (route) => false,
              );
            },

            child: Style.logoutButtonStyle,
          ),
        ),
      ],
    );
  }
}
