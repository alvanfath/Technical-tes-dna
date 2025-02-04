import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test_dna/app/helper/helper.dart';

class RegisterController extends GetxController {
  final count = 0.obs;

  final nikController = TextEditingController();
  final noKartuControler = TextEditingController();
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final isValid = false.obs;
  void validatorBuilder() {
    final nama = namaController.text;
    final email = emailController.text;
    if (nama.isNotEmpty && email.isNotEmpty && Validator.isValidEmail(email)) {
      isValid.value = true;
    } else {
      isValid.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    nikController.addListener(validatorBuilder);
    namaController.addListener(validatorBuilder);
    noKartuControler.addListener(validatorBuilder);
    emailController.addListener(validatorBuilder);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
