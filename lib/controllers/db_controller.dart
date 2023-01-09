import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_manager/model/student_model.dart';

class StudentController extends GetxController {
  RxList<StudentModel> studentDataController = <StudentModel>[].obs;
  void addStudent(StudentModel value) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    studentDB.add(value);
    studentDataController.add(value);
  }

  Future<void> getAllStudents() async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    studentDataController.clear();
    studentDataController.addAll(studentDB.values);
  }

  Future<void> deleteStudent(int intex) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    studentDB.deleteAt(intex);
    getAllStudents();
  }

  Future<void> updateStudent(int intex, StudentModel value) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    studentDB.putAt(intex, value);
    getAllStudents();
  }

  String img = '';

  takePhoto(ImageSource source) async {
    final pickImage = await ImagePicker().pickImage(source: source);
    if (pickImage == null) {
      return;
    } else {
      final bytes = File(pickImage.path).readAsBytesSync();
      img = base64Encode(bytes);
    }
  }
}
