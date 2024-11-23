import 'package:flutter/material.dart';
import 'package:water_distribution_management/ui/home/widgets/identification_block.dart';
import 'package:water_distribution_management/ui/home/widgets/registration_status.dart';
import 'package:water_distribution_management/ui/widgets/logo_block.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            children: [
              LogoBlock(
                isMinimized: true,
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: IdentificationBlock(),
              ),
              RegistrationStatus(),
              
            ],
          ),
        ),
      ),
    );
  }
}
