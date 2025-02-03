import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test_dna/app/modules/home/controllers/home_controller.dart';
import 'package:technical_test_dna/app/widget/text_widget.dart';

class ProfileScreen extends GetView<HomeController> {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      alignment: Alignment.center,
      child: TextWidget(text: 'Halaman Profile'),
    );
  }
}
