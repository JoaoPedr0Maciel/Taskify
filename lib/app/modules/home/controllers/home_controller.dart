import 'package:get/get.dart';
import 'package:taskify/app/modules/get_started/controllers/get_started_controller.dart';
import 'package:taskify/app/modules/tasks/controllers/tasks_controller.dart';

class HomeController extends GetxController {
  final taskController = Get.find<TasksController>();
  final getStartedController = Get.find<GetStartedController>();

  @override
  void onReady() {
    super.onReady();
    taskController.getStoragedTasks();
  }
}
