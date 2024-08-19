import 'package:get/get.dart';

import '../controllers/done_tasks_controller.dart';

class DoneTasksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoneTasksController>(
      () => DoneTasksController(),
    );
  }
}
