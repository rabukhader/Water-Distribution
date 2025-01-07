import 'package:flutter/material.dart';
import 'package:water_distribution_management/utils/buttons.dart';

class ConfirmMonitoringCoicesSheet extends StatefulWidget {
  static Future<dynamic> show({required BuildContext context}) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      builder: (context) => const ConfirmMonitoringCoicesSheet(),
    );
  }

  const ConfirmMonitoringCoicesSheet({super.key});

  @override
  State<ConfirmMonitoringCoicesSheet> createState() =>
      _ConfirmMonitoringCoicesSheetState();
}

class _ConfirmMonitoringCoicesSheetState
    extends State<ConfirmMonitoringCoicesSheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                const Text(
                  "تأكيد التغييرات",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Confirmation Question
                const Text(
                  "هل أنت متأكد من تطبيق التغييرات على النظام؟",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 30),

                // Buttons
                Row(
                  children: [
                    // Cancel Button
                    Expanded(
                      child: QPrimaryButton(
                        onPressed: () {
                          Navigator.of(context).pop(false); // Return false
                        },
                        label: "إلغاء",
                      ),
                    ),
                    const SizedBox(width: 10),

                    // Confirm Button
                    Expanded(
                      child: QPrimaryButton(
                        onPressed: () {
                          Navigator.of(context).pop(true); // Return true
                        },
                        label: "تأكيد",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
