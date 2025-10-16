import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_storage_and_persistence/controller/theme_change_ctrl.dart';
import 'package:local_storage_and_persistence/screens/splash_screen.dart';
import 'package:local_storage_and_persistence/services/local_storage_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeChangeCtrl themeController = Get.put(ThemeChangeCtrl());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: themeController.isDarked.value
            ? ThemeMode.dark
            : ThemeMode.light,
        home: SplashScreen(),
      );
    });
  }
}
