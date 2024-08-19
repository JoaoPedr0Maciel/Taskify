import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/app/routes/app_pages.dart';
import '../controllers/get_started_controller.dart';

class GetStartedView extends GetView<GetStartedController> {
  const GetStartedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize:
                MainAxisSize.min, // Ajusta o tamanho da coluna ao conteúdo
            mainAxisAlignment:
                MainAxisAlignment.center, // Centraliza verticalmente
            crossAxisAlignment:
                CrossAxisAlignment.center, // Centraliza horizontalmente
            children: [
              const SizedBox(height: 80),
              const Text(
                'Bem vindo a Taskify',
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 33, 150, 243),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Organize todas as suas tarefas em um só lugar!",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 50),
              Image.asset("assets/todo-get-started.png"),
              const SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  width: double.infinity,
                  child: TextField(
                    cursorColor: Colors.blue,
                    onChanged: (value) => controller.username.value = value,
                    decoration: const InputDecoration(
                      hintText: 'Qual seu nome?',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
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
                      controller.registerUser();
                    },
                    child: const Text(
                      "Começar!",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
