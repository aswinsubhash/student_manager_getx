
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_manager/controllers/db_controller.dart';

Widget customBottomSheet() {
  final controller = Get.find<StudentController>();
  return Container(
    height: 150,
    color: Colors.white,
    child: Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Choose From",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    controller.takePhoto(ImageSource.camera);
                    Get.back();
                  },
                  icon: const Icon(Icons.camera),
                  color: Colors.black,
                ),
                const Text("Camera")
              ],
            ),
            const SizedBox(
              width: 70,
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    controller.takePhoto(ImageSource.gallery);
                    Get.back();
                  },
                  icon: const Icon(Icons.image),
                  color: Colors.black,
                ),
                const Text('Gallery'),
              ],
            )
          ],
        ),
      ],
    ),
  );
}
