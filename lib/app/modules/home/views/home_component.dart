import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:technical_test_dna/app/helper/constants.dart';
import 'package:technical_test_dna/app/widget/widget.dart';

class MenuComponenet extends StatelessWidget {
  final String title;
  final HeroIcons icon;
  final VoidCallback onTap;
  const MenuComponenet({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(33, 66, 8, 14),
                blurRadius: 8,
                offset: Offset(0, 2),
                spreadRadius: 1,
              )
            ],
          ),
          padding: const EdgeInsets.all(4),
          child: TextWidget(
            text: title,
            fontSize: 11,
          ),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFB4DAFA),
            ),
            padding: const EdgeInsets.all(12),
            child: HeroIcon(
              icon,
              size: 24,
              color: Constants.get.primaryColor,
            ),
          ),
        )
      ],
    );
  }
}

class FiturComponent extends StatelessWidget {
  final int id;
  final String nama;
  final bool isActive;
  const FiturComponent({
    super.key,
    required this.id,
    required this.nama,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    if (isActive) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: const Color(0xFFD1E8FA),
        ),
        child: TextWidget(
          text: nama,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Constants.get.primaryColor,
        ),
      );
    }
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: TextWidget(
        text: nama,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
      ),
    );
  }
}

class SubFiturComponent extends StatelessWidget {
  final HeroIcons icon;
  final String title;
  final VoidCallback onTap;
  const SubFiturComponent({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SizedBox(
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeroIcon(
              icon,
              size: 24,
              color: Colors.grey,
            ),
            const SizedBox(height: 6),
            TextWidget(
              text: title,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              align: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

class MenuBottomComponent extends StatelessWidget {
  final String title;
  final int value;
  final HeroIcons icon;
  final int currentValue;
  final Function(int) onSelect;
  const MenuBottomComponent({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.currentValue,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = value == currentValue;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onSelect(value);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 4,
            decoration: BoxDecoration(
              color: isActive ? Constants.get.primaryColor : Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 12),
          HeroIcon(
            icon,
            color: isActive ? Constants.get.primaryColor : Colors.grey,
            size: 24,
          ),
          const SizedBox(height: 8),
          TextWidget(
            text: title,
            color: isActive ? Constants.get.primaryColor : Colors.grey,
          )
        ],
      ),
    );
  }
}
