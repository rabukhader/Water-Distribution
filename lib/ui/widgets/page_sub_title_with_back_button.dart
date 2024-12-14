import 'package:flutter/material.dart';
import 'package:water_distribution_management/utils/buttons.dart';
import 'package:water_distribution_management/utils/colors.dart';

class PageSubTitleWithBackButton extends StatelessWidget {
  final String subTitle;
  const PageSubTitleWithBackButton({super.key, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Centered Text
         Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Text(
              subTitle,
              style: const TextStyle(fontSize: 24, color: kPrimaryColor),
            ),
          ),
        ),
        // Button near the top right with margin
        Positioned(
          top: 1, // Adjust the vertical position
          right: 10, // Adjust the horizontal position
          child: QPrimaryButton.icon(
            label: "للخلف",
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            icon: const Icon(
              Icons.arrow_back,
              size: 22,
            ),
            onPressed: () => Navigator.pop(context),
            toRight: true,
            minSize: 10,
            color: kPrimaryColor,
            distanceToIcon: 10,
          ),
        ),
      ],
    );
  }
}
