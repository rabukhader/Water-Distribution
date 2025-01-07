import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_distribution_management/ui/water_distribution_table_screen/water_distribution_table_view_model.dart';
import 'package:water_distribution_management/utils/colors.dart';

class WaterDistributionTableView extends StatefulWidget {
  const WaterDistributionTableView({super.key});

  @override
  State<WaterDistributionTableView> createState() =>
      _WaterDistributionTableViewState();
}

class _WaterDistributionTableViewState
    extends State<WaterDistributionTableView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text("جدول توزيع المياه"),
          centerTitle: true,
        ),
        body: ChangeNotifierProvider(
            create: (context) => WaterDistributionTableViewModel(),
            builder: (context, snapshot) {
              WaterDistributionTableViewModel provider = context.watch();

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: provider.cityData
                        .map(
                          (city) => Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            padding: const EdgeInsets.all(8.0),
                            width: double
                                .infinity, // Ensures the box takes full width
                            decoration: BoxDecoration(
                              color: city.hasWater
                                  ? Colors.green.shade100
                                  : Colors.red.shade100,
                              border: Border.all(
                                color:
                                    city.hasWater ? Colors.green : Colors.red,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Centers the content vertically
                              crossAxisAlignment: CrossAxisAlignment
                                  .center, // Centers the content horizontally
                              children: [
                                Text(
                                  city.cityName,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(
                                    height: 8), // Spacing between text and icon
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      city.hasWater
                                          ? "جاري الضخ"
                                          : "الضخ متوقف",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      city.hasWater
                                          ? Icons.check_circle
                                          : Icons.cancel,
                                      color: city.hasWater
                                          ? Colors.green
                                          : Colors.red,
                                      size: 24,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              );
            }));
  }
}
