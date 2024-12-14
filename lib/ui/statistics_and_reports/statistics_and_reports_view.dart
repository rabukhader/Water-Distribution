import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:water_distribution_management/services/auth_store.dart';
import 'package:water_distribution_management/ui/home/widgets/identification_block.dart';
import 'package:water_distribution_management/ui/statistics_and_reports/statistics_and_reports_view_model.dart';
import 'package:water_distribution_management/ui/widgets/logo_block.dart';
import 'package:water_distribution_management/utils/buttons.dart';
import 'package:water_distribution_management/utils/colors.dart';

class StatisticsReportsView extends StatefulWidget {
  const StatisticsReportsView({super.key});

  @override
  State<StatisticsReportsView> createState() => _StatisticsReportsViewState();
}

class _StatisticsReportsViewState extends State<StatisticsReportsView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          StatisticsReportsViewModel(authStore: GetIt.I<AuthStore>()),
      builder: (context, snapshot) {
        StatisticsReportsViewModel provider = context.watch();
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
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Centered Text
                      const Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(right: 12.0),
                          child: Text(
                            "تقارير و احصائيات",
                            style:
                                TextStyle(fontSize: 24, color: kPrimaryColor),
                          ),
                        ),
                      ),
                      // Button near the top right with margin
                      Positioned(
                        top: 1, // Adjust the vertical position
                        right: 10, // Adjust the horizontal position
                        child: QPrimaryButton.icon(
                          label: "للخلف",
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 22,
                          ),
                          onPressed: () => Navigator.pop(context),
                          toRight: true,
                          minSize: 10,
                          color: kPrimaryColor,
                          distanceToIcon: 10,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.55,
                      child: const ChartsBlock())
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ChartsBlock extends StatefulWidget {
  const ChartsBlock({super.key});

  @override
  State<ChartsBlock> createState() => _ChartsBlockState();
}

class _ChartsBlockState extends State<ChartsBlock>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  final Map<String, List<BarChartGroupData>> yearData = {
    "2024": _generateSampleData(),
    "2023": _generateSampleData(),
    "2022": _generateSampleData(),
    "2021": _generateSampleData(),
    "2020": _generateSampleData(),
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Year tabs
        TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.blue,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.blue,
          indicator: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          tabs: const [
            Tab(text: '2024'),
            Tab(text: '2023'),
            Tab(text: '2022'),
            Tab(text: '2021'),
            Tab(text: '2020'),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: yearData.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: BarChart(
                  BarChartData(
                    barGroups: entry.value,
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) => Text(
                            getMonthName(value.toInt()),
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  static List<BarChartGroupData> _generateSampleData() {
    return List.generate(12, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
              toY: (8 + index * 0.5) + (index % 2 == 0 ? 2 : -1),
              color: Colors.blue,
              width: 16),
        ],
      );
    });
  }

  String getMonthName(int index) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[index % 12];
  }
}
