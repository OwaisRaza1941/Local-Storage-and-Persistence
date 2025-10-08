import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    requestPermission();
    super.initState();
  }

  requestPermission() async {
    await Permission.storage.request();
    await Permission.photos.request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("File Handling"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                Directory temp = await getTemporaryDirectory();
                Directory? downloads = await getDownloadsDirectory();
                Directory appSupport = await getApplicationSupportDirectory();
                // List<Directory>? external =
                //     await getExternalStorageDirectories();

                print("Temp: ${temp.path}");
                print("Downloads: ${downloads?.path}");
                print("AppSupport: ${appSupport.path}");
                // print("External: ${external.path}");
              },
              child: Text("Testing"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                Directory? dir = await getDownloadsDirectory();
                File file1 = File("${dir?.path}/smaple.txt");
                await file1.writeAsString("hello World!");
              },
              child: Text("Writes Files"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                Directory? dir = await getDownloadsDirectory();
                File file1 = File("${dir?.path}/smaple.txt");

                final data = await file1.readAsString();
                print("Data: $data");
              },
              child: Text("Read Files"),
            ),
          ],
        ),
      ),
    );
  }
}
