import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeChangeCtrl extends GetxController {
  RxBool isDarked = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadThemeFromPrefs();
  }

  void changeTheme() async {
    isDarked.value = !isDarked.value;
    Get.changeThemeMode(isDarked.value ? ThemeMode.dark : ThemeMode.light);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("themeValue", isDarked.value);
  }

  void loadThemeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    isDarked.value = prefs.getBool("themeValue") ?? false;
    Get.changeThemeMode(isDarked.value ? ThemeMode.dark : ThemeMode.light);
  }

  void resetTheme() async {
    isDarked.value = false;
    Get.changeThemeMode(ThemeMode.light);

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("themeValue");
  }
}
