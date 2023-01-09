import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_manager/views/widgets/bottom_sheet.dart';
import 'package:student_manager/constants/constants.dart';
import 'package:student_manager/controllers/db_controller.dart';
import 'package:student_manager/model/student_model.dart';

class ScreenAddDetails extends GetView {
  ScreenAddDetails({Key? key}) : super(key: key);

  final _name = TextEditingController();
  final _age = TextEditingController();
  final _email = TextEditingController();
  final _batch = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: Colors.white,
          title: const Text('Add Student'),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  kHeight10,
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      } else {
                        return null;
                      }
                    },
                    controller: _name,
                    decoration: const InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  kHeight10,
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your age';
                      } else {
                        return null;
                      }
                    },
                    controller: _age,
                    decoration: const InputDecoration(
                      hintText: 'Age',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  kHeight10,
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else {
                        return null;
                      }
                    },
                    controller: _email,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  kHeight10,
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your batch';
                      } else {
                        return null;
                      }
                    },
                    controller: _batch,
                    decoration: const InputDecoration(
                      hintText: 'Batch',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  kHeight10,
                  TextButton(
                    onPressed: () {
                      Get.bottomSheet(
                        customBottomSheet(),
                      );
                    },
                    child: const Text('Add Image'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        saveDetails();
                        Get.back();
                      }
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void saveDetails() {
    final controller = Get.find<StudentController>();

    StudentModel data = StudentModel(
      name: _name.text,
      age: _age.text,
      email: _email.text,
      batch: _batch.text,
      img: controller.img,
    );
    controller.addStudent(data);
  }
}
