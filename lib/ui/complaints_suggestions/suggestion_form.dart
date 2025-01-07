import 'package:flutter/material.dart';
import 'package:water_distribution_management/utils/buttons.dart';
import 'package:water_distribution_management/utils/colors.dart';

class SuggestionForm extends StatefulWidget {
  const SuggestionForm({super.key});

  @override
  State<SuggestionForm> createState() => _SuggestionFormState();
}

class _SuggestionFormState extends State<SuggestionForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اقتراحاتكم'),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Icon(
                Icons.chat,
                size: 80,
              ),
              const SizedBox(height: 20),
              const Text(
                'مرحبا بكم في بلدية جنين ، يسعدنا استقبال آرائكم '
                'واقتراحاتكم للارتقاء بالخدمات',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'الموضوع',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'اسم المقترح (اختياري)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'رقم الهاتف / الموبايل (اختياري)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'نص الاقتراح',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              QPrimaryButton(
                label: "ارسال",
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
