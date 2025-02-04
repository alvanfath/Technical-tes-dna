import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:technical_test_dna/app/helper/helper.dart';
import 'package:technical_test_dna/app/routes/app_pages.dart';
import 'package:technical_test_dna/app/widget/button_widget.dart';
import 'package:technical_test_dna/app/widget/text_field.dart';
import 'package:technical_test_dna/app/widget/text_widget.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.bottomSheet(
          BackComponent(onBack: () {}),
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: TextWidget(
            text: 'Formulir Registrasi',
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    TextWidget(
                      text: '1',
                      color: Colors.grey,
                      align: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    TextWidget(
                      text: 'Data Pribadi',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              TextF(
                icon: HeroIcons.identification,
                controller: controller.nikController,
                hint: 'Nomor Kartu Identitas',
                isRequired: false,
                hintText: 'Masukan Nomor Kartu Identitas',
              ),
              const SizedBox(height: 16),
              TextF(
                icon: HeroIcons.identification,
                controller: controller.noKartuControler,
                hint: 'Nomor Kartu Akses',
                isRequired: false,
                keyboardType: TextInputType.number,
                hintText: 'Masukan Nomor Kartu Akses',
              ),
              const SizedBox(height: 16),
              TextF(
                icon: HeroIcons.user,
                controller: controller.namaController,
                hint: 'Nama',
                isRequired: true,
                hintText: 'Masukan Nama',
              ),
              const SizedBox(height: 16),
              TextF(
                icon: HeroIcons.atSymbol,
                controller: controller.emailController,
                hint: 'Email',
                keyboardType: TextInputType.emailAddress,
                isRequired: true,
                hintText: 'Masukan Email',
                validator: (String? value) {
                  if (value != null) {
                    if (!Validator.isValidEmail(value)) {
                      return 'format email tidak valid';
                    }
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              Obx(() {
                final isvalid = controller.isValid.value;
                return Button(
                  color: isvalid
                      ? Constants.get.primaryColor
                      : const Color(0xFFD6D6D6),
                  title: 'Selanjutnya',
                  onPressed: () {},
                );
              }),
              const SizedBox(height: 16),
              Button(
                color: Colors.white,
                borderColor: Constants.get.primaryColor,
                titleColor: Constants.get.primaryColor,
                title: 'Batal',
                onPressed: () {
                  Get.bottomSheet(
                    BackComponent(
                      onBack: () {
                        Get.offAllNamed(Routes.HOME);
                      },
                    ),
                    isDismissible: false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BackComponent extends StatelessWidget {
  final VoidCallback onBack;
  const BackComponent({
    super.key,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 46),
            child: TextWidget(
              text: 'Semua data tidak akan disimpan. Yakin ingin membatalkan',
              align: TextAlign.center,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Get.back();
                  onBack();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(
                          width: 1,
                          color: const Color.fromARGB(255, 230, 230, 230)),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: TextWidget(
                    text: 'Ya, batalkan',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Get.back();
                    onBack();
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: TextWidget(
                      text: 'Tidak, kembali',
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
