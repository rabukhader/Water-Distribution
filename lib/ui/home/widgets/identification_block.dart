import 'package:flutter/material.dart';
import 'package:water_distribution_management/utils/colors.dart';

class IdentificationBlock extends StatelessWidget {
  final String fullName;
  final String? userNumber;
  final bool isControl;
  const IdentificationBlock(
      {super.key,
      required this.fullName,
      this.userNumber,
      this.isControl = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Column(
        children: [
          isControl
              ? const SizedBox()
              : Row(
                  children: [
                    const Text("رقم الاشتراك : "),
                    Text(
                      userNumber ?? "",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
          Row(
            children: [
              const Text("اسم المشترك : "),
              Text(
                fullName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          isControl
              ? const Row(
                  children: [
                    Text("نوع الحساب  : "),
                    Text(
                      "مشرف",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
