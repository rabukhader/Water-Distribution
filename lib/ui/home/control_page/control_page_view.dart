import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:water_distribution_management/services/auth_store.dart';
import 'package:water_distribution_management/services/firebase_auth_service.dart';
import 'package:water_distribution_management/ui/home/control_page/control_page_view_model.dart';
import 'package:water_distribution_management/ui/home/model/home_page_buttons.dart';
import 'package:water_distribution_management/ui/home/widgets/identification_block.dart';
import 'package:water_distribution_management/ui/splash_screen/splash_screen.dart';
import 'package:water_distribution_management/utils/buttons.dart';

class ControlPageView extends StatefulWidget {
  const ControlPageView({super.key});

  @override
  State<ControlPageView> createState() => _ControlPageViewState();
}

class _ControlPageViewState extends State<ControlPageView> {
  @override
  Widget build(BuildContext context) {
    List<HomePageButtons> buttons = [
      HomePageButtons(
          title: "لوحة التحكم",
          icon: const Icon(Icons.computer),
          onTap: () => print('onTap1')),
      HomePageButtons(
          title: "جدول توزيع المياه",
          icon: const Icon(Icons.calendar_today),
          onTap: () => print('onTap2')),
      HomePageButtons(
          title: "تقارير و احصائيات",
          icon: const Icon(Icons.bar_chart),
          onTap: () => print('onTap3')),
      HomePageButtons(
          title: "اللجنة و التنظيم",
          icon: const Icon(Icons.people),
          onTap: () => print('onTap4')),
    ];
    return ChangeNotifierProvider(
      create: (context) => ControlPageViewModel(
          authService: GetIt.I<FirebaseAuthService>(),
          authStore: GetIt.I<AuthStore>()),
      builder: (context, snapshot) {
        ControlPageViewModel provider = context.watch();

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: IdentificationBlock(
                fullName: provider.user?.fullname ?? "غير معروف",
                isControl: true,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            ...buttons.map((e) => Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 6.0, horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: QPrimaryButton.icon(
                          label: e.title,
                          icon: e.icon,
                          onPressed: () => e.onTap,
                          toRight: true,
                          minSize: 40,
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
            ),
            Container(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () async {
                      await provider.logOut();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SplashScreen()),
                          (route) => false);
                    },
                    child: const Row(
                      children: [
                        Text('تسجيل الخروج'),
                        SizedBox(
                          width: 6,
                        ),
                        Icon(Icons.logout),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
