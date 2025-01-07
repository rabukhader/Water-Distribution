import 'package:flutter/material.dart';
import 'package:water_distribution_management/utils/buttons.dart';
import 'package:water_distribution_management/utils/colors.dart';

class QuestionsQueries extends StatelessWidget {
  const QuestionsQueries({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('استعلامات'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'قم بادخال رقم هويتك ورقم الطلب للاستعلام عن طلبك',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'رقم الهوية',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'رقم الطلب',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          const QPrimaryButton(label: "استعلام")
        ],
      ),
    );
  }
}
