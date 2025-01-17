import 'package:flutter/cupertino.dart';
import 'package:pv_forecast/components/history_labels.dart';
import 'package:pv_forecast/components/history_linear_chart.dart';
import 'package:pv_forecast/components/weekly_bar_chart.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("Today's History"),
        SizedBox(height: 8),
        HistoryLinearChart(),
        HistoryLabels(),
        SizedBox(height: 32),
        Text("Week History"),
        WeeklyBarChart()
      ],
    );
  }
}
