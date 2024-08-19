import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:taskify/app/routes/app_pages.dart';

class GetStartedController extends GetxController {
  var username = "".obs;
  var storage = const FlutterSecureStorage();

  void saveUsername() {
    storage.write(
      key: 'username',
      value: username.trim(),
    );
  }

  Future<String> getUsername() {
    return storage
        .read(key: 'username')
        .then((value) => username.value = value ?? '')
        .catchError((error) => print('Error reading secure storage: $error'));
  }

  void registerUser() {
    if (username.value.isEmpty) {
      Get.snackbar(
        'Nome de usuário inválido.',
        'Por favor digite seu nome',
        snackPosition: SnackPosition.TOP,
      );
      return;
    }
    saveUsername();
    Get.toNamed(Routes.HOME);
  }
}
