import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:taskify/app/routes/app_pages.dart';
import 'package:taskify/app/widgets/bottom_menu.dart';
import 'package:taskify/app/widgets/header_widget.dart';
import 'package:taskify/app/widgets/task_item.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomMenu(),
      appBar: CustomHeader(),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Seja bem vindo, ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                Text(
                  controller.getStartedController.username.value,
                  style: TextStyle(
                    color: Colors.blue[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
              ],
            ),
            controller.taskController.taskList.isNotEmpty
                ? Text(
                    "Você tem ${controller.taskController.taskList.length} tarefas a fazer.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  )
                : const Text(""),
            const Divider(),
            const SizedBox(height: 15),
            Expanded(
              child: Obx(
                () => controller.taskController.taskList.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/no-tasks.png"),
                            const SizedBox(height: 10),
                            Text(
                              "Você ainda não possui tarefas.",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: controller.taskController.taskList.length,
                        itemBuilder: (context, index) {
                          var task = controller.taskController.taskList[index];
                          return TaskItem(
                            title: task.title!,
                            id: task.id!,
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
