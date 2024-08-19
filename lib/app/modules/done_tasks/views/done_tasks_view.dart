import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:taskify/app/widgets/bottom_menu.dart';
import 'package:taskify/app/widgets/finished_task.dart';
import 'package:taskify/app/widgets/header_widget.dart';
import 'package:taskify/app/widgets/task_item.dart';

import '../controllers/done_tasks_controller.dart';

class DoneTasksView extends GetView<DoneTasksController> {
  const DoneTasksView({Key? key}) : super(key: key);
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
            const Row(
              children: [
                Text(
                  "Tarefas finalizadas",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 15),
            Expanded(
              child: Obx(
                () => controller.taskController.tasksDone.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/no-tasks.png"),
                            const SizedBox(height: 10),
                            Text(
                              "Nenhuma tarefa finalizada.",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: controller.taskController.tasksDone.length,
                        itemBuilder: (context, index) {
                          var task = controller.taskController.tasksDone[index];
                          return FinishedTask(
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
