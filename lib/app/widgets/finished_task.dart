import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/app/modules/tasks/controllers/tasks_controller.dart';

class FinishedTask extends StatelessWidget {
  final String title;
  final String id;

  const FinishedTask({
    required this.title,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<TasksController>();

    return Dismissible(
      key: Key(id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        taskController.deleteFinishedTask(id);
        Get.snackbar(
          "Tarefa deletada",
          "$title foi deletada com sucesso",
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      background: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.centerLeft,
        child: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
      secondaryBackground: Container(
        height: 50,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          taskController.toggleTaskOpen();
        },
        child: Container(
          height: 50,
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xfff5f7f9),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.arrow_circle_left_outlined),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title.length > 23 ? title.substring(0, 24) : title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
