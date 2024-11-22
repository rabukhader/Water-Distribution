import 'package:flutter/material.dart';
import 'package:water_distribution_management/utils/colors.dart';
import 'package:water_distribution_management/utils/icons.dart';

class LogoBlock extends StatelessWidget {
  final bool isMinimized;
  const LogoBlock({super.key, this.isMinimized = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          height: isMinimized ? 60 : 95,
          child: const Image(
            image: AssetImage(kLogo),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 12),
          color: kGrayColor,
          width: 2,
          height: isMinimized ? 60 : 80,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 800),
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: isMinimized ? 12 : 18,
                fontWeight: FontWeight.w600,
              ),
              child: const Text("بلدية جنين"),
            ),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 800),
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: isMinimized ? 26 : 34,
                fontWeight: FontWeight.w700,
              ),
              child: const Text("مصلحة المياه"),
            ),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 800),
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: isMinimized ? 18 : 26,
                fontWeight: FontWeight.w500,
              ),
              child: const Text("التحكم الاكتروني"),
            ),
          ],
        ),
      ],
    );
  }
}
