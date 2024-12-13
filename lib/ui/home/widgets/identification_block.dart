import 'package:flutter/material.dart';
import 'package:water_distribution_management/utils/colors.dart';

class IdentificationBlock extends StatelessWidget {
  final String fullName;
  final String userNumber;
  const IdentificationBlock(
      {super.key, required this.fullName, required this.userNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Column(
        children: [
          Row(
            children: [const Text("رقم الاشتراك : "), Text(userNumber)],
          ),
          Row(
            children: [const Text("اسم المشترك : "), Text(fullName)],
          ),
        ],
      ),
    );
  }
}
