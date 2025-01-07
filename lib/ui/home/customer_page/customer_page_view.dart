import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:water_distribution_management/model/user.dart';
import 'package:water_distribution_management/services/auth_store.dart';
import 'package:water_distribution_management/services/firebase_auth_service.dart';
import 'package:water_distribution_management/ui/complaints_suggestions/complaints_suggestions_view.dart';
import 'package:water_distribution_management/ui/home/customer_page/customer_page_view_model.dart';
import 'package:water_distribution_management/ui/home/model/home_page_buttons.dart';
import 'package:water_distribution_management/ui/home/widgets/identification_block.dart';
import 'package:water_distribution_management/ui/home/widgets/registration_status.dart';
import 'package:water_distribution_management/ui/questions_queries/questions_queries.dart';
import 'package:water_distribution_management/ui/splash_screen/splash_screen.dart';
import 'package:water_distribution_management/ui/statistics_and_reports/statistics_and_reports_view.dart';
import 'package:water_distribution_management/ui/water_distribution_table_screen/water_distribution_table_view.dart';
import 'package:water_distribution_management/utils/buttons.dart';

class CustomerPageView extends StatefulWidget {
  const CustomerPageView({super.key});

  @override
  State<CustomerPageView> createState() => _CustomerPageViewState();
}

class _CustomerPageViewState extends State<CustomerPageView> {
  @override
  Widget build(BuildContext context) {
    List<HomePageButtons> buttons = [
      HomePageButtons(
          title: "جدول توزيع المياه",
          icon: const Icon(Icons.calendar_month),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const WaterDistributionTableView()))),
      HomePageButtons(
          title: "تقارير و احصائيات",
          icon: const Icon(Icons.add_chart),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const StatisticsReportsView()))),
      HomePageButtons(
          title: "الاستعلامات",
          icon: const Icon(Icons.info),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const QuestionsQueries()))),
      HomePageButtons(
          title: "الشكاوي و الاقتراحات",
          icon: const Icon(Icons.message),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ComplaintsSuggestionsView()))),
    ];

    return ChangeNotifierProvider(
      create: (context) => CustomerPageViewModel(
          authService: GetIt.I<FirebaseAuthService>(),
          authStore: GetIt.I<AuthStore>()),
      builder: (context, snapshot) {
        CustomerPageViewModel provider = context.watch();

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: IdentificationBlock(
                fullName: provider.user?.fullname ?? "غير متوفر",
                userNumber:
                    (provider.user?.email ?? "").split('@').first.trim(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RegistrationStatusWidget(
              status: provider.user?.registrationStatus ??
                  RegistrationStatus.stopped,
            ),
            const SizedBox(
              height: 20,
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
                          onPressed: () => e.onTap.call(),
                          toRight: true,
                          minSize: 40,
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(
              height: 60,
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: QPrimaryButton.icon(
                      label: "تقديم طلب جديد",
                      icon: const Icon(Icons.add),
                      onPressed: () => print('add'),
                      toRight: true,
                      minSize: 40,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
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
