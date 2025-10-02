import 'package:flutter/material.dart';
import 'package:using_the_sqflite/components/add_note_fields.dart';
import 'package:using_the_sqflite/data/local/db_helper.dart';

class AddNoteFAB extends StatelessWidget {
  final DBHelper dbRef;
  final VoidCallback refreshNotes;

  AddNoteFAB({required this.dbRef, required this.refreshNotes, super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController desController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Add Note",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 20),
                  addNoteTextFields(
                    controller: titleController,
                    lableText: " Title ",
                    hintText: "Enter title here",
                  ),
                  SizedBox(height: 20),
                  addNoteTextFields(
                    controller: desController,
                    lableText: " Description ",
                    hintText: "Enter description here",
                    maxlines: 4,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () async {
                            var title = titleController.text;
                            var des = desController.text;

                            if (title.isNotEmpty && des.isNotEmpty) {
                              bool check = await dbRef.addNote(
                                mTitle: title,
                                mDes: des,
                              );
                              if (check) {
                                refreshNotes();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Please fill all required fields!",
                                    ),
                                  ),
                                );
                              }
                              Navigator.pop(context);
                            }
                          },
                          child: Text("Add"),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Cancel"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Icon(Icons.add),
    );
  }
}
