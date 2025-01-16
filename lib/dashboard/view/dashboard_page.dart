import 'package:flutter/material.dart';
import 'package:pv_forecast/components/bottom_nav.dart';
import 'package:pv_forecast/components/energy_output.dart';
import 'package:pv_forecast/components/main_chart.dart';
import 'package:pv_forecast/components/top_bar.dart';
import 'package:pv_forecast/utils/colors.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      appBar: TopBar(),
      body: Column(
        children: [
          EnergyOutput(),
          MainChart(),
        ],
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
