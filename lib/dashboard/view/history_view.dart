import 'package:flutter/cupertino.dart';
import 'package:pv_forecast/components/history_labels.dart';
import 'package:pv_forecast/components/history_linear_chart.dart';
import 'package:pv_forecast/components/weekly_bar_chart.dart';

enum ChartType { daily, weekly }

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  ChartType _selectedChart = ChartType.daily;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          const SizedBox(height: 16),
          CupertinoSlidingSegmentedControl<ChartType>(
            backgroundColor: CupertinoColors.systemGrey2,
            thumbColor: CupertinoColors.activeBlue,
            groupValue: _selectedChart,
            onValueChanged: (ChartType? value) {
              if (value != null) {
                setState(() {
                  _selectedChart = value;
                });
              }
            },
            children: {
              ChartType.daily: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                child: const Text(
                  'Daily',
                  style: TextStyle(fontSize: 16), // Larger font size
                ),
              ),
              ChartType.weekly: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                child: const Text(
                  'Weekly',
                  style: TextStyle(fontSize: 16), // Larger font size
                ),
              ),
            },
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _selectedChart == ChartType.daily
                ? const Column(
                    children: [
                      Text("Today's History"),
                      SizedBox(height: 8),
                      HistoryLinearChart(),
                      HistoryLabels(),
                    ],
                  )
                : const Column(
                    children: [
                      Text("Week History"),
                      SizedBox(height: 8),
                      WeeklyBarChart(),
                      HistoryLabels(),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
