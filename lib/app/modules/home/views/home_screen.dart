import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:technical_test_dna/app/helper/helper.dart';
import 'package:technical_test_dna/app/modules/home/controllers/home_controller.dart';
import 'package:technical_test_dna/app/modules/home/views/home_component.dart';
import 'package:technical_test_dna/app/widget/widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //sticky header
          headerBuilder(context),

          //scroll content
          bodyBuilder(context),
        ],
      ),
    );
  }

  Widget headerBuilder(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                Constants.get.logo,
                width: 50,
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //nama dan gambar
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          left: 8,
                          top: 6,
                          bottom: 6,
                          right: 45,
                        ),
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                        ),
                        child: TextWidget(
                          text: 'Operator Caliana',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(0.5),
                        child: HeroIcon(
                          HeroIcons.userCircle,
                          style: HeroIconStyle.solid,
                          size: 40,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 12),

                  //notifikasi
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(6),
                    child: HeroIcon(
                      HeroIcons.bell,
                      color: Colors.grey,
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget bodyBuilder(BuildContext context) {
    return Expanded(
      //body scroll
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),

            //realtime section
            Obx(() {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: controller.currentDate.value,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      align: TextAlign.start,
                    ),
                    const SizedBox(height: 6),
                    TextWidget(
                      text: controller.currentTime.value,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      align: TextAlign.start,
                    )
                  ],
                ),
              );
            }),
            const SizedBox(height: 40),

            //search section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GestureDetector(
                onTap: () {},
                behavior: HitTestBehavior.opaque,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      HeroIcon(
                        HeroIcons.magnifyingGlass,
                        size: 24,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 16),
                      TextWidget(
                        text: 'Cari',
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),

            //menu section
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: 'Fitur',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 12),
                  Obx(() {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: Constants.get.listFitur.map((e) {
                          return GestureDetector(
                            onTap: () {
                              controller.menuSelected.value = e['id'];
                            },
                            child: FiturComponent(
                              id: e['id'],
                              nama: e['nama'],
                              isActive:
                                  e['id'] == controller.menuSelected.value,
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SubFiturComponent(
                        title: 'Dasbor',
                        icon: HeroIcons.chartBar,
                        onTap: () {},
                      ),
                      SubFiturComponent(
                        title: 'Daftar Pengunjung',
                        icon: HeroIcons.clipboardDocument,
                        onTap: () {},
                      ),
                      SubFiturComponent(
                        title: 'Residen',
                        icon: HeroIcons.homeModern,
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            //section pengunjung
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextWidget(
                text: 'Hari ini',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              alignment: Alignment.center,
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  TextWidget(
                    text: 'Belum Ada Pengunjung Baru',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    align: TextAlign.center,
                  ),
                  const SizedBox(height: 2),
                  TextWidget(
                    text: 'Pengunjung yang menunggu akan ditampilkan di sini',
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    align: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Button(
                    title: 'Refresh',
                    paddingY: 10,
                    titleColor: Constants.get.primaryColor,
                    color: Colors.white,
                    borderColor: Constants.get.primaryColor,
                    borderRadius: 30,
                    width: MediaQuery.of(context).size.width / 3,
                    onPressed: () {},
                  )
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
