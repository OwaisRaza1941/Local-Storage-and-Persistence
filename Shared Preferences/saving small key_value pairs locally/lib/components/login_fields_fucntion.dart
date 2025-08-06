import 'package:flutter/material.dart';

SizedBox loginFields({
  required TextEditingController controller,
  required String hintText,
  required String? Function(String?)? validator,
}) {
  return SizedBox(
    child: TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
    ),
  );
}
