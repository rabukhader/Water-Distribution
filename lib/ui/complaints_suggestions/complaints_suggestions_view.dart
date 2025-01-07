import 'package:flutter/material.dart';
import 'package:water_distribution_management/ui/complaints_suggestions/suggestion_form.dart';
import 'package:water_distribution_management/utils/buttons.dart';
import 'package:water_distribution_management/utils/colors.dart';

class ComplaintsSuggestionsView extends StatelessWidget {
  const ComplaintsSuggestionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الشكاوي و الاقتراحات"),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: QPrimaryButton(
                    minSize: 70,
                    label: "الشكاوي المرسلة",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: QPrimaryButton(
                    minSize: 70,
                    label: "الشكاوي غير مرسلة",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: QPrimaryButton(
                    minSize: 70,
                    label: "تقديم شكوى",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: QPrimaryButton(
                    minSize: 70,
                    label: "اقتراحات",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SuggestionForm()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
