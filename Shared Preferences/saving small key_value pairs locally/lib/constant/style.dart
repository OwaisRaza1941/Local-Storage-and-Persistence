import 'package:flutter/material.dart';

class Style {
  static const logoutButtonStyle = Padding(
    padding: EdgeInsets.all(8.0),
    child: Row(
      children: [Icon(Icons.logout), SizedBox(width: 20), Text("Logout")],
    ),
  );

  static final homeDrawerHeader = DrawerHeader(
    padding: EdgeInsets.zero,
    decoration: const BoxDecoration(color: Colors.blue),
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 40, backgroundColor: Colors.black),
          SizedBox(height: 10),
          Text(
            'Owais Raza',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'Flutter Developer',
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
        ],
      ),
    ),
  );
}
