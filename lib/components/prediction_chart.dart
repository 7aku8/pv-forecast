import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pv_forecast/utils/colors.dart';

class PredictionChart extends StatelessWidget {
  const PredictionChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.2,
      child: BarChart(
        BarChartData(
          maxY: 7,
          // Adjust based on the maximum kW value
          barGroups: _buildBarGroups(),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: bottomTitles,
                reservedSize: 22,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: leftTitles,
              ),
            ),
            rightTitles: const AxisTitles(),
            topTitles: const AxisTitles(),
          ),
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          barTouchData: BarTouchData(enabled: false),
        ),
      ),
    );
  }

  Color _colorByProduced(double produced) {
    return Color.lerp(Colors.blueAccent, Colors.redAccent, produced / 7) ??
        contentColorBlue;
  }

  List<BarChartGroupData> _buildBarGroups() {
    // generate list of kwh generated per hour in 1 day interval, so 24 values, there should be a spike in value aroung moon
    final producedValues = [
      0.1,
      0.12,
      0.53,
      0.82,
      1.52,
      1.79,
      2.43,
      2.31,
      2.56,
      3.67,
      4.56,
      5.67,
      3.33,
      2.33,
      2.42,
      2.33,
      2.01,
      1.21,
      1.23,
      1.21,
      0.67,
      0.56,
      0.45,
      0.34,
    ];

    return List.generate(24, (index) {
      return BarChartGroupData(
        x: index,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            toY: producedValues[index],
            color: _colorByProduced(producedValues[index]),
            width: 8,
          ),
        ],
      );
    });
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    if (value % 2 == 0) {
      return Container();
    }

    // double to hours eg, 12:00
    return SideTitleWidget(
      meta: meta,
      child: Text(
        value.toStringAsFixed(0),
        style: const TextStyle(fontSize: 12),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    if (value == meta.max) {
      return Container();
    }
    const style = TextStyle(
      fontSize: 10,
    );
    return SideTitleWidget(
      meta: meta,
      child: Text(
        '${meta.formattedValue} kW',
        style: style,
      ),
    );
  }
}
