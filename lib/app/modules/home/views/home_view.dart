import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:technical_test_dna/app/modules/home/views/home_component.dart';
import 'package:technical_test_dna/app/modules/home/views/home_screen.dart';
import 'package:technical_test_dna/app/modules/home/views/profile_screen.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final pageSelected = controller.pageSelected.value;
      final List<Widget> listWidget = [
        const HomeScreen(),
        const ProfileScreen(),
      ];
      return Stack(
        children: [
          Scaffold(
            body: listWidget[pageSelected - 1],
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                controller.isOverlay.value = true;
              },
              backgroundColor: Colors.white,
              shape: CircleBorder(),
              child: HeroIcon(
                HeroIcons.plus,
                size: 24,
                color: Colors.black,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: bottomBuilder(context),
          ),
          if (controller.isOverlay.value) ...[
            overlayBuilder(context),
          ]
        ],
      );
    });
  }

  Widget overlayBuilder(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        controller.isOverlay.value = false;
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white.withOpacity(0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.8,
              child: MenuComponenet(
                title: 'Registrasi',
                icon: HeroIcons.documentArrowUp,
                onTap: () {},
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.8,
              child: MenuComponenet(
                title: 'Pra Registrasi',
                icon: HeroIcons.documentPlus,
                onTap: () {},
              ),
            ),
            const SizedBox(
              height: 120,
            )
          ],
        ),
      ),
    );
  }

  Widget bottomBuilder(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 12,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      color: Colors.white,
      child: Obx(
        () {
          final pageSelected = controller.pageSelected.value;
          return SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MenuBottomComponent(
                  title: 'Beranda',
                  value: 1,
                  icon: HeroIcons.home,
                  currentValue: pageSelected,
                  onSelect: (value) {
                    controller.pageSelected.value = value;
                  },
                ),
                MenuBottomComponent(
                  title: 'Profile',
                  value: 2,
                  icon: HeroIcons.user,
                  currentValue: pageSelected,
                  onSelect: (value) {
                    controller.pageSelected.value = value;
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
