import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_manager/views/widgets/profile_image.dart';
import 'package:student_manager/controllers/db_controller.dart';
import 'package:student_manager/views/widgets/delete_widget.dart';
import 'package:student_manager/views/pages/edit_student_screen.dart';

class ListStudentWidget extends GetView {
  const ListStudentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final datas = Get.find<StudentController>();
    return Scaffold(
      body: Obx(
        () => datas.studentDataController.isEmpty
            ? const Center(
                child: Text(
                  'No Data found',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.separated(
                  itemBuilder: (ctx, index) {
                    final dataAtIndex = datas.studentDataController[index];
                    return ListTile(
                      leading: CustomProfileImage(
                        radius: 40,
                        img: dataAtIndex.img,
                        size: const Size(50, 50),
                      ),
                      title: Text(dataAtIndex.name),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.to(
                                EditStudentWidget(
                                  name: dataAtIndex.name,
                                  age: dataAtIndex.age,
                                  email: dataAtIndex.email,
                                  batch: dataAtIndex.batch,
                                  img: dataAtIndex.img,
                                  index: index,
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.edit,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              delete(ctx, index);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                         Get.to(
                                EditStudentWidget(
                                  name: dataAtIndex.name,
                                  age: dataAtIndex.age,
                                  email: dataAtIndex.email,
                                  batch: dataAtIndex.batch,
                                  img: dataAtIndex.img,
                                  index: index,
                                ),
                              );
                      },
                    );
                  },
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: datas.studentDataController.length,
                ),
              ),
      ),
    );
  }
}
