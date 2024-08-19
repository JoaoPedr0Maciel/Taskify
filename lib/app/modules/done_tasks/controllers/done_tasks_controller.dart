import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:taskify/app/models/task_model.dart';
import 'package:taskify/app/modules/tasks/controllers/tasks_controller.dart';

class DoneTasksController extends GetxController {
  var storage = const FlutterSecureStorage();
  var doneTask = <TaskModel>[].obs;

  var taskController = Get.find<TasksController>();
}
