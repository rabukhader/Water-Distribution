import 'package:flutter/material.dart';
import 'package:water_distribution_management/model/user.dart';

class RegistrationStatusWidget extends StatelessWidget {
  final RegistrationStatus status;
  const RegistrationStatusWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const Text(
                  'حالة الاشتراك : ',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                )),
            Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.6,
                child: Row(
                  children: [
                    Container(
                      width: 30, // Diameter of the circle
                      height: 30,
                      decoration: BoxDecoration(
                        color: getRegistrationStatusColor(
                            status), // Color based on status
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                        width: 10), // Space between the circle and the text
                    Text(
                      getRegistrationStatusDescription(status),
                      style: TextStyle(
                          color: getRegistrationStatusColor(status),
                          fontSize: 18),
                    )
                  ],
                )),
          ],
        ));
  }
}
