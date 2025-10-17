import 'package:flutter/material.dart';
import 'package:using_the_sqflite/screes/home_screen.dart';
import 'package:using_the_sqflite/utils/permission.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await requeestPermission();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
