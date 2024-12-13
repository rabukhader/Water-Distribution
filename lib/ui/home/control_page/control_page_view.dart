import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_distribution_management/ui/home/control_page/control_page_view_model.dart';
import 'package:water_distribution_management/ui/home/widgets/identification_block.dart';

class ControlPageView extends StatefulWidget {
  const ControlPageView({super.key});

  @override
  State<ControlPageView> createState() => _ControlPageViewState();
}

class _ControlPageViewState extends State<ControlPageView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ControlPageViewModel(),
      builder: (context, snapshot) {
        ControlPageViewModel provider = context.watch();

        return const Column(
          children: [
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16.0),
            //   child: IdentificationBlock(),
            // ),
          ],
        );
      },
    );
  }
}
