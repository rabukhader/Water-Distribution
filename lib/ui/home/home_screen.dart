import 'package:flutter/material.dart';
import 'package:water_distribution_management/model/user.dart';
import 'package:water_distribution_management/ui/home/control_page/control_page_view.dart';
import 'package:water_distribution_management/ui/home/customer_page/customer_page_view.dart';
import 'package:water_distribution_management/ui/widgets/logo_block.dart';

class HomeScreen extends StatelessWidget {
    final UserType userType;

  const HomeScreen({super.key, required this.userType});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            children: [
              const LogoBlock(
                isMinimized: true,
              ),
              const SizedBox(
                height: 30,
              ),
              userType == UserType.customer ? const CustomerPageView() : const ControlPageView(),
            ],
          ),
        ),
      ),
    );
  }
}
