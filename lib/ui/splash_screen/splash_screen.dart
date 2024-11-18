import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:water_distribution_management/utils/cache_picture.dart';
import 'package:water_distribution_management/utils/colors.dart';
import 'package:water_distribution_management/utils/icons.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1500), () async {
      if (mounted) {
        await _onSplashCompleted();
      }
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheSvgPicture(kLogoIcon);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [kPrimaryColor, kLightOrangeColor])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                kLogoIcon,
                height: 350,
              ),
              const Text(
                "Basma",
                style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 44,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onSplashCompleted() async {
    
    // User? user = await GetIt.I<AuthStore>().getUser();
    // if (user != null) {
    //   Navigator.pushAndRemoveUntil(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => HomePage(
    //                 userType: user.type,
    //               )),
    //       (route) => false);
    // } else {
    //   Navigator.pushAndRemoveUntil(
    //       context,
    //       MaterialPageRoute(
    //           builder: (c) => const LoginSignUpPage(isLogIn: true)),
    //       (route) => false);
    // }
  }
}
