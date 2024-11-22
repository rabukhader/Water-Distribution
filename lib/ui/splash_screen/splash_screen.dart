import 'package:flutter/material.dart';
import 'package:water_distribution_management/ui/home/home_screen.dart';
import 'package:water_distribution_management/ui/login_sign_up/login_signup_screen.dart';
import 'package:water_distribution_management/ui/widgets/logo_block.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool moveLogoBlock = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        if (2 / 2 == 1) {
          setState(() {
            moveLogoBlock = true;
          });
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginSignUpScreen()),
                (context) => false);
          });
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const HomeScreen()),
              (context) => false);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1200),
            top: moveLogoBlock
                ? MediaQuery.of(context).size.height * 0.1
                : MediaQuery.of(context).size.height / 2 - 80,
            left: MediaQuery.of(context).size.width / 2 - 120,
            child: const LogoBlock(),
          ),
        ],
      ),
    );
  }
}
