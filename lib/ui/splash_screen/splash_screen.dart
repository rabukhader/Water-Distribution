import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:water_distribution_management/model/user.dart';
import 'package:water_distribution_management/services/auth_store.dart';
import 'package:water_distribution_management/services/firestore_service.dart';
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
    Future.delayed(const Duration(seconds: 3), () async {
      if (mounted) {
        User? user = await GetIt.I<AuthStore>().getUser();
        if (user == null) {
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
          if (user.email.contains('customer')) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomeScreen(
                          userType: UserType.customer,
                        )));
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomeScreen(
                          userType: UserType.control,
                        )));
          }
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
            duration: const Duration(milliseconds: 1600),
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
