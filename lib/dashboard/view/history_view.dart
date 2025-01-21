import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
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
        SizedBox(height: 24),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: _DataBox(
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
                    child: _DataBox(
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
              child: _DataBox(
                value: "95.32 PLN",
                label: "Savings today",
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
                    child: _DataBox(
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
                    child: _DataBox(
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
              child: _DataBox(
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
                    child: _DataBox(
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
                    child: _DataBox(
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
              child: _DataBox(
                value: "15,232 PLN",
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

class _DataBox extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
  final String insight;

  const _DataBox({
    super.key,
    required this.value,
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    required this.insight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: backgroundColor,
        border: backgroundColor == Colors.white
            ? Border.all(color: Colors.grey.shade200)
            : null,
      ),
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black87,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            value,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 4),
                        ],
                      ),
                      Text(
                        insight.toUpperCase(),
                        style: TextStyle(
                          color: textColor.withOpacity(0.7),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        label,
                        style: TextStyle(
                          color: textColor.withOpacity(0.7),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
