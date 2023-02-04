import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SecurityViewModel extends GetxController {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var oldPassword = false.obs;
  var newPassword = false.obs;
  var confirmPassword = false.obs;

  @override
  void onInit() {
    oldPasswordController.text = "123456";
    newPasswordController.text = "12345678";
    confirmPasswordController.text = "12345678";

    super.onInit();
  }
}
