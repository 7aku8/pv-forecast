import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pv_forecast/utils/colors.dart';

class MonthlyBarChart extends StatelessWidget {
  const MonthlyBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 1.5,
        child: BarChart(
          BarChartData(
            maxY: 1500, // Adjust based on the maximum kW value
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
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
            barTouchData: BarTouchData(enabled: false),
          ),
        ),
      ),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Jan';
        break;
      case 1:
        text = 'Feb';
        break;
      case 2:
        text = 'Mar';
        break;
      case 3:
        text = 'Apr';
        break;
      case 4:
        text = 'May';
        break;
      case 5:
        text = 'Jun';
        break;
      case 6:
        text = 'Jul';
        break;
      case 7:
        text = 'Aug';
        break;
      case 8:
        text = 'Sep';
        break;
      case 9:
        text = 'Oct';
        break;
      case 10:
        text = 'Nov';
        break;
      case 11:
        text = 'Dec';
        break;
      default:
        text = '';
    }
    return SideTitleWidget(
      meta: meta,
      child: Text(text, style: style),
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
        "${meta.formattedValue} kW",
        style: style,
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups() {
    final producedValues = [900.0, 950.5, 1100.3, 1150.0, 1100.0, 1200.5, 1300.8, 1120.0, 1000.9, 1100.0, 900.0, 800.0];
    final consumedValues = [880.2, 900.95, 720.57, 900.1, 750.0, 800.55, 850.02, 700.5, 750.41, 732.7, 712.8, 900.9];

    return List.generate(12, (index) {
      return BarChartGroupData(
        x: index,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            toY: producedValues[index],
            color: Colors.orangeAccent,
            width: 8,
          ),
          BarChartRodData(
            toY: consumedValues[index],
            color: Colors.black87,
            width: 8,
          ),
        ],
      );
    });
  }
}
