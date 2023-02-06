import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileViewModel extends GetxController {
  final nameController = TextEditingController();
  final sexController = TextEditingController();
  final birthdayController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void onInit() {
    nameController.text = "Blang Vibol";
    sexController.text = "M";
    birthdayController.text = "24-10-1996";
    phoneController.text = "098234561";
    emailController.text = "vibolsmart@gmail.com";
    super.onInit();
  }
}
