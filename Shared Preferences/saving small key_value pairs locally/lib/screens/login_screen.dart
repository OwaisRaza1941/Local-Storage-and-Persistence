import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_storage_and_persistence/components/login_fields_fucntion.dart';
import 'package:local_storage_and_persistence/screens/home_screen.dart';
import 'package:local_storage_and_persistence/services/local_storage_services.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final String keyName = 'loginState';

    final fromKey = GlobalKey<FormState>();

    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Login Screen"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Form(
          key: fromKey,
          child: Column(
            children: [
              loginFields(
                hintText: "Enter your name",
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter your name";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20),
              loginFields(
                hintText: "Email",
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter email ";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20),
              loginFields(
                hintText: "Password",
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Password";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (fromKey.currentState!.validate()) {
                      LocalStorage.setBool(LocalStorageKeys.loginKey, true);
                      // final prefs = await SharedPreferences.getInstance();
                      // await prefs.setBool(keyName, true);
                    }
                    Get.to(HomeScreen());
                  },
                  child: Text("Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
