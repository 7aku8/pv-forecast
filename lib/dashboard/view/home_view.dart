import 'package:flutter/cupertino.dart';
import 'package:pv_forecast/components/alert.dart';
import 'package:pv_forecast/components/efficiency.dart';
import 'package:pv_forecast/components/energy_output.dart';
import 'package:pv_forecast/components/insights.dart';
import 'package:pv_forecast/components/main_chart.dart';
import 'package:pv_forecast/components/tiles.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SizedBox(height: 16),
        EnergyOutput(),
        SizedBox(height: 32),
        Tiles(),
        SizedBox(height: 8),
        MainChart(),
        SizedBox(height: 8),
        Efficiency(),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Insights()],
        ),
        SizedBox(height: 24),
        Alert(),
        SizedBox(height: 16),
      ],
    );
  }
}
