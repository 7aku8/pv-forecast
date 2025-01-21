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
          CupertinoSlidingSegmentedControl<ChartType>(
            backgroundColor: CupertinoColors.extraLightBackgroundGray,
            thumbColor: Colors.orangeAccent,
            groupValue: _selectedChart,
            onValueChanged: (ChartType? value) {
              if (value != null) {
                setState(() {
                  _selectedChart = value;
                });
              }
            },
            children: {
              ChartType.daily:
                  _buildSegment('Daily', _selectedChart == ChartType.daily),
              ChartType.weekly:
                  _buildSegment('Weekly', _selectedChart == ChartType.weekly),
              ChartType.monthly:
                  _buildSegment('Monthly', _selectedChart == ChartType.monthly),
            },
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _buildSelectedChartWidget(),
          ),
        ],
      ),
    );
  }

  Widget _buildSegment(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          color: isSelected ? Colors.black87 : CupertinoColors.inactiveGray,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSelectedChartWidget() {
    switch (_selectedChart) {
      case ChartType.daily:
        return const DailyChartWidget();
      case ChartType.weekly:
        return const WeeklyChartWidget();
      case ChartType.monthly:
        return const MonthlyChartWidget();
    }
  }
}

class DailyChartWidget extends StatelessWidget {
  const DailyChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HistoryLinearChart(),
        HistoryLabels(),
      ],
    );
  }
}

class WeeklyChartWidget extends StatelessWidget {
  const WeeklyChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        WeeklyBarChart(),
        HistoryLabels(),
      ],
    );
  }
}

class MonthlyChartWidget extends StatelessWidget {
  const MonthlyChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MonthlyBarChart(),
        HistoryLabels(),
      ],
    );
  }
}
