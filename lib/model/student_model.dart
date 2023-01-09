import 'package:hive/hive.dart';
 part 'student_model.g.dart';

@HiveType(typeId: 1)
class StudentModel {

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String age;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String batch;
  
  @HiveField(4)
  final String img;

  StudentModel({
    required this.name,
    required this.age,
    required this.email,
    required this.batch,
    required this.img,
  });
}
