import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pv_forecast/components/history_labels.dart';
import 'package:pv_forecast/components/history_linear_chart.dart';
import 'package:pv_forecast/components/weekly_bar_chart.dart';
import 'package:pv_forecast/components/monthly_bar_chart.dart'; // Import the new MonthlyBarChart

enum ChartType { daily, weekly, monthly }

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
          // Wrap the CupertinoSlidingSegmentedControl in ClipRRect
          ClipRRect(
            borderRadius: BorderRadius.circular(20), // Add custom border radius
            child: CupertinoSlidingSegmentedControl<ChartType>(
              backgroundColor: CupertinoColors.extraLightBackgroundGray,
              thumbColor: Colors.pink.shade100,
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  child: Text(
                    'Daily',
                    style: TextStyle(
                      fontSize: 16,
                      color: _selectedChart == ChartType.daily
                          ? Colors.pink
                          : CupertinoColors.inactiveGray,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ChartType.weekly: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  child: Text(
                    'Weekly',
                    style: TextStyle(
                      fontSize: 16,
                      color: _selectedChart == ChartType.weekly
                          ? Colors.pink
                          : CupertinoColors.inactiveGray,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ChartType.monthly: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  child: Text(
                    'Monthly',
                    style: TextStyle(
                      fontSize: 16,
                      color: _selectedChart == ChartType.monthly
                          ? Colors.pink
                          : CupertinoColors.inactiveGray,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              },
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _selectedChart == ChartType.daily
                ? const Column(
                    children: [
                      HistoryLinearChart(),
                      HistoryLabels(),
                    ],
                  )
                : _selectedChart == ChartType.weekly
                    ? const Column(
                        children: [
                          WeeklyBarChart(),
                          HistoryLabels(),
                        ],
                      )
                    : const Column(
                        children: [
                          MonthlyBarChart(),
                          HistoryLabels(),
                        ],
                      ),
          ),
        ],
      ),
    );
  }
}
