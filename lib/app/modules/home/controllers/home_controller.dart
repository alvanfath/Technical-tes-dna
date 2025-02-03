import 'dart:async';

import 'package:get/get.dart';
import 'package:technical_test_dna/app/helper/helper.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  //variable untuk realtime jam menit detik
  final RxString currentDate = DateTime.now().toString().obs;
  final RxString currentTime = ''.obs;
  late Timer _timer;

  final isOverlay = false.obs;
  final menuSelected = 1.obs;
  final pageSelected = 1.obs;
  @override
  void onInit() {
    super.onInit();
    currentDate.value = DateFormatHelper.dateFormat(
      tanggal: DateTime.now().toString(),
      format: 'EEEE, dd MMMM yyyy',
    );
    _startClock();
  }

  void _startClock() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      DateTime now = DateTime.now();
      currentDate.value = DateFormatHelper.dateFormat(
        tanggal: DateTime.now().toString(),
        format: 'EEEE, dd MMMM yyyy',
      );
      currentTime.value = DateFormatHelper.dateFormat(
        tanggal: now.toString(),
        format: 'hh:mm:ss a',
      );
    });
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
