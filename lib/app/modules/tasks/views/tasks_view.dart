import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:taskify/app/widgets/bottom_menu.dart';
import 'package:taskify/app/widgets/header_widget.dart';

import '../controllers/tasks_controller.dart';

class TasksView extends GetView<TasksController> {
  const TasksView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(),
      bottomNavigationBar: const BottomMenu(),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Text(
              "O que temos para hoje?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              child: TextField(
                cursorColor: Colors.blue,
                onChanged: (value) => controller.taskName.value = value,
                decoration: const InputDecoration(
                  hintText: 'Título da tarefa',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  controller.addTask();
                },
                child: const Text(
                  "Criar tarefa",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
