import 'package:flutter/material.dart';
import 'package:local_storage_and_persistence/screens/widgets/drawer_items.dart';
import 'package:local_storage_and_persistence/services/local_storage_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  // static const keyName = "name";
  String displayName = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  saveData() async {
    LocalStorage.setString(LocalStorageKeys.userValueKey, nameController.text);
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setString(keyName, nameController.text);
    setState(() {
      displayName = nameController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Home Screen"),
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu),
          ),
        ),
      ),
      drawer: Drawer(child: DrawerItems()),
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
                    SnackBar(
                      content: Text("Data Sve Successfully!"),
                      backgroundColor: Colors.black,
                    ),
                  );
                },
                child: Text("Save Data"),
              ),
            ),
            SizedBox(height: 20),
            Text("Save Value: $displayName"),
          ],
        ),
      ),
    );
  }

  Future<void> loadData() async {
    String? storedName = LocalStorage.getString(LocalStorageKeys.userValueKey);
    
    // final prefs = await SharedPreferences.getInstance();
    // String? storedName = prefs.getString(keyName);
    if (storedName != null) {
      setState(() {
        displayName = storedName;
      });
    }
  }
}
