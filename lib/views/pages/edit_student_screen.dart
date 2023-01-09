import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_manager/views/widgets/profile_image.dart';
import 'package:student_manager/constants/constants.dart';
import 'package:student_manager/controllers/db_controller.dart';
import 'package:student_manager/model/student_model.dart';
import 'package:student_manager/views/pages/home_screen.dart';

class EditStudentWidget extends GetView {
  final String name;
  final String age;
  final String email;
  final String batch;
  final int index;
  final String img;

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final batchController = TextEditingController();

  EditStudentWidget({
    Key? key,
    required this.name,
    required this.age,
    required this.email,
    required this.batch,
    required this.index,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    nameController.text = name;
    ageController.text = age;
    emailController.text = email;
    batchController.text = batch;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    CustomProfileImage(
                      img: img,
                      radius: 45,
                      size: const Size(80, 80),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                kHeight10,
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Name',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        TextField(
                          style: const TextStyle(fontSize: 20),
                          controller: nameController,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Age',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        TextField(
                          controller: ageController,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        TextField(
                          controller: emailController,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 35,
                      vertical: 5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Batch',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        TextField(
                          controller: batchController,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    onSaveButtonClicked();
                  },
                  child: const Text('Update'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onSaveButtonClicked() {
    final controller = Get.find<StudentController>();

    final editedDatas = StudentModel(
      name: nameController.text,
      age: ageController.text,
      email: emailController.text,
      batch: batchController.text,
      img: img,
    );
    controller.updateStudent(index, editedDatas);
    Get.offAll(
      const ScreenHome(),
    );
  }
}
