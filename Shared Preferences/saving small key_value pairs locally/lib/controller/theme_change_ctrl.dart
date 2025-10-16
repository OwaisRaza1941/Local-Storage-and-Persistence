import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_storage_and_persistence/services/local_storage_services.dart';

class ThemeChangeCtrl extends GetxController {
  RxBool isDarked = false.obs;

  changeTheme() async {
    isDarked.value = !isDarked.value;
    Get.changeThemeMode(isDarked.value ? ThemeMode.dark : ThemeMode.light);

    LocalStorage.setBool(LocalStorageKeys.themeValue, isDarked.value);
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setBool('themeValue', isDarked.value);
  }

  void loadThemeFromPrefs() async {
    final savedTheme = LocalStorage.getBool(LocalStorageKeys.themeValue);
    isDarked.value = savedTheme ?? false;

    // final prefs = await SharedPreferences.getInstance();
    // isDarked.value = prefs.getBool("themeValue") ?? false;
    Get.changeThemeMode(isDarked.value ? ThemeMode.dark : ThemeMode.light);
  }

  @override
  void onInit() {
    super.onInit();
    loadThemeFromPrefs();
  }

  void resetTheme() async {
    isDarked.value = false;
    Get.changeThemeMode(ThemeMode.light);

    LocalStorage.remove(LocalStorageKeys.themeValue);
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.remove("themeValue");
  }
}
