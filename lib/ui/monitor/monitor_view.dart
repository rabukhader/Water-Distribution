import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:water_distribution_management/services/auth_store.dart';
import 'package:water_distribution_management/ui/home/widgets/identification_block.dart';
import 'package:water_distribution_management/ui/monitor/confirm_monitoring_choices_sheet.dart';
import 'package:water_distribution_management/ui/monitor/monitor_view_model.dart';
import 'package:water_distribution_management/ui/widgets/logo_block.dart';
import 'package:water_distribution_management/ui/widgets/page_sub_title_with_back_button.dart';
import 'package:water_distribution_management/utils/buttons.dart';

class MonitorView extends StatelessWidget {
  const MonitorView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MonitorViewModel(authStore: GetIt.I<AuthStore>()),
      builder: (context, snapshot) {
        MonitorViewModel provider = context.watch();
        return Scaffold(
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
                  const PageSubTitleWithBackButton(
                    subTitle: "لوحة التحكم",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.55,
                      child: const SwitchListBlock())
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SwitchListBlock extends StatefulWidget {
  const SwitchListBlock({super.key});

  @override
  State<SwitchListBlock> createState() => _SwitchListBlockState();
}

class _SwitchListBlockState extends State<SwitchListBlock> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Switch(
                value: Provider.of<MonitorViewModel>(context).isAutomated,
                activeColor: Colors.green,
                onChanged: (value) {
                  Provider.of<MonitorViewModel>(context, listen: false)
                      .setAutomation = value;
                },
              ),
              const Text(
                "التحكم الآلي",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Consumer<MonitorViewModel>(
                builder: (context, monitorViewModel, child) {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: monitorViewModel.cities.length,
                    itemBuilder: (context, index) {
                      final city = monitorViewModel.cities[index];
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              city.cityName,
                              style: const TextStyle(fontSize: 16),
                            ),
                            trailing: Switch(
                              value: city.openValve,
                              activeColor: Colors.green,
                              onChanged: monitorViewModel.isAutomated
                                  ? null // Disable the switch when automation is on
                                  : (value) {
                                      setState(() {
                                        city.openValve = value;
                                      });
                                    },
                            ),
                          ),
                          if (index < monitorViewModel.cities.length - 1)
                            const Divider(
                              color: Colors.grey,
                              height: 1,
                              indent: 16,
                              endIndent: 16,
                            ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: QPrimaryButton.icon(
                  onPressed: () async {
                    bool confirmed = await ConfirmMonitoringCoicesSheet.show(
                        context: context);
                    print(confirmed);
                    if (confirmed) {
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(Icons.check),
                  label: "تطبيق",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
