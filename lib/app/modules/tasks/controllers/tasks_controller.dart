import 'dart:convert';

import 'package:get/get.dart';
import 'package:taskify/app/models/task_model.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TasksController extends GetxController {
  var taskName = "".obs;
  var taskList = <TaskModel>[].obs;
  var tasksDone = <TaskModel>[].obs;
  final storage = const FlutterSecureStorage();
  var isTaskOpen = false.obs;

  void toggleTaskOpen() {
    isTaskOpen.value = !isTaskOpen.value;
  }

  void getStoragedTasks() async {
    String? value = await storage.read(key: "tasks");

    if (value != null && value.isNotEmpty) {
      List<dynamic> jsonTasks = jsonDecode(value);
      taskList.value = jsonTasks
          .map((jsonTask) =>
              TaskModel.fromJson(jsonTask as Map<String, dynamic>))
          .toList();
    }
  }

  void addTask() {
    if (taskName.value.isEmpty) {
      Get.snackbar(
        "Formulário inválido",
        "Preencha todos os campos!",
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    taskList.add(
      TaskModel(
        id: const Uuid().v4(),
        title: taskName.value,
        isDone: false,
      ),
    );

    var tasksJson = jsonEncode(taskList.map((task) => task.toJson()).toList());
    storage.write(key: "tasks", value: tasksJson);

    Get.snackbar(
      "Sucesso!",
      "Tarefa criada com sucesso!",
      snackPosition: SnackPosition.TOP,
    );
  }

  void deleteTask(String id) {
    taskList.removeWhere((task) => task.id == id);
    var tasksJson = jsonEncode(taskList.map((task) => task.toJson()).toList());
    storage.write(key: "tasks", value: tasksJson);
  }

  void deleteFinishedTask(String id) {
    tasksDone.removeWhere((task) => task.id == id);
    var doneTasksJson =
        jsonEncode(tasksDone.map((task) => task.toJson()).toList());
    storage.write(key: "done_tasks", value: doneTasksJson);
  }

  void markTaskAsDone(String id, bool isDone) {
    var taskIndex = taskList.indexWhere((task) => task.id == id);
    if (taskIndex != -1) {
      taskList[taskIndex].isDone = isDone; // mark task as done
      tasksDone.add(taskList[taskIndex]); // add task to done list tasks
      taskList.remove(taskList[taskIndex]); // remove task from list tasks
      // Convert the updated taskList to JSON
      var tasksJson =
          jsonEncode(taskList.map((task) => task.toJson()).toList());

      // Separate tasks into done and not done lists
      var doneTasksJson = jsonEncode(
        tasksDone.map((task) => task.toJson()).toList(),
      );
      // Save updated tasks to storage
      storage.write(key: "tasks", value: tasksJson);
      storage.write(key: "done_tasks", value: doneTasksJson);
    }
  }
}
