import 'package:get/get.dart';

import '../modules/done_tasks/bindings/done_tasks_binding.dart';
import '../modules/done_tasks/views/done_tasks_view.dart';
import '../modules/get_started/bindings/get_started_binding.dart';
import '../modules/get_started/controllers/get_started_controller.dart';
import '../modules/get_started/views/get_started_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/tasks/bindings/tasks_binding.dart';
import '../modules/tasks/views/tasks_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static late String INITIAL;

  static Future<void> determineInitialRoute() async {
    final getStartedController = Get.put(GetStartedController());
    await getStartedController.getUsername();

    INITIAL = getStartedController.username.value.isEmpty
        ? _Paths.GET_STARTED
        : _Paths.HOME;
  }

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeView(),
        binding: HomeBinding(),
        bindings: [
          TasksBinding(),
        ]),
    GetPage(
      name: _Paths.TASKS,
      page: () => const TasksView(),
      binding: TasksBinding(),
    ),
    GetPage(
      name: _Paths.GET_STARTED,
      page: () => const GetStartedView(),
      binding: GetStartedBinding(),
    ),
    GetPage(
      name: _Paths.DONE_TASKS,
      page: () => const DoneTasksView(),
      binding: DoneTasksBinding(),
    ),
  ];
}
