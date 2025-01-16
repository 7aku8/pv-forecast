import 'package:flutter/material.dart';
import 'package:pv_forecast/components/bottom_nav.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PV Forecast')),
      body: const Center(child: Text('dupa')),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
