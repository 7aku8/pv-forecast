import 'package:flutter/material.dart';
import 'package:pv_forecast/components/bottom_nav.dart';
import 'package:pv_forecast/components/efficiency.dart';
import 'package:pv_forecast/components/energy_output.dart';
import 'package:pv_forecast/components/main_chart.dart';
import 'package:pv_forecast/components/tiles.dart';
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
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const TopBar(),
      body: ListView(
        children: const [
          SizedBox(height: 16),
          EnergyOutput(),
          SizedBox(height: 32),
          Tiles(),
          SizedBox(height: 8),
          MainChart(),
          SizedBox(height: 8),
          Efficiency(),
        ],
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
