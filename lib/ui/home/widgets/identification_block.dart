import 'package:flutter/material.dart';
import 'package:water_distribution_management/utils/colors.dart';

class IdentificationBlock extends StatelessWidget {
  const IdentificationBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: const Column(
        children: [
          Row(
            children: [Text("رقم الاشتراك : "), Text("123456789")],
          ),
          Row(
            children: [Text("اسم المشترك : "), Text("معتز حمدي عبد الله")],
          ),
        ],
      ),
    );
  }
}
