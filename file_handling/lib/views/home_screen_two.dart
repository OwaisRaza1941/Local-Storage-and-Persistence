import 'package:file_handling/components/custom_button.dart';
import 'package:file_handling/components/home_fields.dart';
import 'package:file_handling/constants/styles.dart';
import 'package:file_handling/controller/file_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenTwo extends StatelessWidget {
  HomeScreenTwo({super.key});

  final TextEditingController tileController = TextEditingController();
  final TextEditingController desController = TextEditingController();

  final FileController controller = Get.put(FileController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Focus.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("File Handler", style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: Styles.containerDecoration,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Text(
                          controller.noteText.value,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 50),

                CustomButtons(
                  btnText: "Add Notes",
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: Color.fromARGB(255, 255, 30, 210),
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 30,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              homeFields(
                                hinText: "Title",
                                labelText: "Add your title",
                                controller: tileController,
                              ),
                              SizedBox(height: 20),
                              homeFields(
                                hinText: "Description",
                                labelText: "Add your Description",
                                maxlines: 5,
                                controller: desController,
                              ),
                              SizedBox(height: 20),
                              CustomButtons(
                                btnText: "Save",
                                onPressed: () async {
                                  // agar dono fields empty hain
                                  if (tileController.text.isEmpty &&
                                      desController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Please fill all required fields!",
                                        ),
                                      ),
                                    );
                                    return; // 👈 ye line imp hai — niche ka code ab execute nahi hoga
                                  }

                                  // agar filled hain tabhi save kare
                                  await controller.saveText(
                                    text:
                                        "${tileController.text}\n${desController.text}",
                                  );

                                  tileController.clear();
                                  desController.clear();

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Note saved successfully!"),
                                    ),
                                  );
                                },
                              ),

                              SizedBox(height: 10),
                              CustomButtons(
                                btnText: "Read Files",
                                onPressed: () async {
                                  await controller.readText();
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
