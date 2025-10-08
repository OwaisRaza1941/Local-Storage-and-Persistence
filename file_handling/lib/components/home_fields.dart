import 'package:flutter/material.dart';

TextField homeFields({
  required String hinText,
  required String labelText,
  TextEditingController? controller,
  int? maxlines,
}) {
  return TextField(
    controller: controller,
    style: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    cursorColor: Colors.white,
    decoration: InputDecoration(
      hintText: hinText,
      hintStyle: TextStyle(color: Colors.white),
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.white),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.white, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.white, width: 2),
      ),
    ),
    maxLines: maxlines,
  );
}
