import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: kWhiteColor),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container( // Here 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage(kLogo),
                      height: 95,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 12),
                      color: kGrayColor,
                      width: 2,
                      height: MediaQuery.of(context).size.height * 0.11,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "بلدية جنين",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 18,
                                height: 1,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "مصلحة المياه",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 34,
                                height: 1,
                                fontWeight: FontWeight.w700),
                          ), 
                          Text(
                            "التحكم الاكتروني",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 26,
                                height: 1,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onSplashCompleted() async {
    
print('rasheed');
  }
}
