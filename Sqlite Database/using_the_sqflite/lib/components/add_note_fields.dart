import 'package:flutter/material.dart';

TextField addNoteTextFields({
  int? maxlines,
  required String hintText,
  required String lableText,
  required TextEditingController controller,
}) {
  return TextField(
    controller: controller,
    maxLines: maxlines,
    decoration: InputDecoration(
      hintText: hintText,
      labelText: lableText,
      border: OutlineInputBorder(),
    ),
  );
}
