import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_manager/controllers/db_controller.dart';
import 'package:student_manager/views/pages/add_details_screen.dart';
import 'package:student_manager/views/widgets/list_student_widget.dart';

class ScreenHome extends GetView {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StudentController controller = Get.put(StudentController());
    controller.getAllStudents();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            ScreenAddDetails(),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text('Student Records'),
      ),
      body: const ListStudentWidget(),
    );
  }
}
