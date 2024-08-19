import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/app/routes/app_pages.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: const EdgeInsets.only(left: 40, right: 40),
      color: Colors.white,
      height: 80,
      child: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.HOME);
                  },
                  child: Image.asset("assets/todo.png"),
                ),
                Text(
                  "Todo",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[600]),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.TASKS);
                  },
                  child: Image.asset("assets/plus.png"),
                ),
                Text(
                  "Add",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[600]),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.DONE_TASKS);
                  },
                  child: Image.asset("assets/checked.png"),
                ),
                Text(
                  "Feitas",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[600]),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
