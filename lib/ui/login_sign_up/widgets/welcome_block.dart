import 'package:flutter/material.dart';

class WelcomeBlock extends StatelessWidget {
  const WelcomeBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const Text(
                  'مرحبا بك في ..',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                )),
            Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  'تطبيق توزيع المياه الذكي',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.8), fontSize: 24),
                )),
          ],
        ));
  }
}
