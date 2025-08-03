import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyName, nameController.text);
    setState(() {
      displayName = nameController.text;
    });
  }

  TextEditingController nameController = TextEditingController();
  static const keyName = "name";
  String displayName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(" Saving small key-value pairs locally"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Enter your name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  saveData();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Data saved successfully!")),
                  );
                },
                child: Text("Save Data"),
              ),
            ),
            SizedBox(height: 20),
            Text("Save Value : $displayName"),
          ],
        ),
      ),
    );
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    String? storedName = prefs.getString(keyName);
    if (storedName != null) {
      setState(() {
        displayName = storedName;
      });
    }
  }
}
