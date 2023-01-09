import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_manager/controllers/db_controller.dart';

void delete(ctx, intex) {
  final controller = Get.find<StudentController>();
  showDialog(
    context: ctx,
    builder: (ctx1) {
      return AlertDialog(
        title: const Text('Are You Sure?'),
        content: const Text('Do you really want to delete these records?'),
        actions: [
          TextButton(
            onPressed: () {
              controller.deleteStudent(intex);
              Get.back();
            },
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('No'),
          )
        ],
      );
    },
  );
}
