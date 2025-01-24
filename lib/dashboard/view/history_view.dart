import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pv_forecast/components/history_labels.dart';
import 'package:pv_forecast/components/history_linear_chart.dart';
import 'package:pv_forecast/components/monthly_bar_chart.dart'; // Import the new MonthlyBarChart
import 'package:pv_forecast/components/weekly_bar_chart.dart';
import 'package:pv_forecast/components/insight_box.dart';

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
    return Column(
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
        Expanded(
          child: ListView(
            children: [
              const SizedBox(height: 12),
              _buildSelectedChartWidget(),
              const SizedBox(height: 96),
            ],
          ),
        ),
      ],
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
        SizedBox(height: 24),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: InsightBox(
                      value: "60 kWh",
                      label: "Total Produced Today",
                      insight: "10% more than yesterday",
                      icon: Icons.arrow_upward_rounded,
                      backgroundColor: Colors.orangeAccent,
                      textColor: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: InsightBox(
                      value: "40 kWh",
                      label: "Total Consumed Today",
                      insight: "2% less than yesterday",
                      icon: Icons.arrow_downward_rounded,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: InsightBox(
                value: "95.32 PLN",
                label: "Savings today",
                insight: "10 PLN more than yesterday",
                icon: Icons.arrow_upward_rounded,
                backgroundColor: Colors.black12,
                textColor: Colors.black,
              ),
            ),
          ],
        ),
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
        SizedBox(height: 24),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: InsightBox(
                      value: "300 kWh",
                      label: "Total Produced this week",
                      insight: "5% more than last week",
                      icon: Icons.arrow_upward_rounded,
                      backgroundColor: Colors.orangeAccent,
                      textColor: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: InsightBox(
                      value: "220 kWh",
                      label: "Total Consumed this week",
                      insight: "2% less than last week",
                      icon: Icons.arrow_downward_rounded,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: InsightBox(
                value: "832.21 PLN",
                label: "Savings this week",
                insight: "10 PLN more than yesterday",
                icon: Icons.arrow_upward_rounded,
                backgroundColor: Colors.black12,
                textColor: Colors.black,
              ),
            )
          ],
        )
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
        SizedBox(height: 24),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: InsightBox(
                      value: "14,4 MWh",
                      label: "Total Produced this year",
                      insight: "3% less than last year",
                      icon: Icons.arrow_downward_rounded,
                      backgroundColor: Colors.orangeAccent,
                      textColor: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: InsightBox(
                      value: "10,4 MWh",
                      label: "Total Consumed this year",
                      insight: "3% less than last year",
                      icon: Icons.arrow_downward_rounded,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: InsightBox(
                value: "5,232 PLN",
                label: "Savings this year",
                insight: "300 PLN more than yesterday",
                icon: Icons.arrow_upward_rounded,
                backgroundColor: Colors.black12,
                textColor: Colors.black,
              ),
            )
          ],
        )
      ],
    );
  }
}