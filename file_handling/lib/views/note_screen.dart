import 'package:file_handling/controller/file_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotesScreen extends StatelessWidget {
  NotesScreen({super.key});

  final NotesController controller = Get.put(NotesController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController desController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Notes JSON (GetX Version)"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: desController,
              decoration: InputDecoration(labelText: "Description"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                await controller.saveNotes(
                  mTitle: titleController.text,
                  mDes: desController.text,
                );
                titleController.clear();
                desController.clear();
              },
              child: Text("Save Note"),
            ),
            SizedBox(height: 20),

            Expanded(
              child: Obx(() {
                if (controller.allNotes.isEmpty) {
                  return Center(child: Text("No Notes Found"));
                }
                return ListView.builder(
                  itemCount: controller.allNotes.length,
                  itemBuilder: (context, index) {
                    final note = controller.allNotes[index];
                    return ListTile(
                      title: Text(note.title ?? ""),
                      subtitle: Text(note.description ?? ""),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
