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
            maxY: 30, // Adjust based on the maximum kW value
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
    final producedValues = [12.0, 12.5, 17.3, 19.0, 23.0, 24.5, 23.8, 25.0, 24.9, 23.0, 19.0, 12.0];
    final consumedValues = [20.2, 17.95, 19.57, 21.1, 22.0, 21.55, 21.02, 22.5, 22.41, 20.7, 19.8, 18.9];

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
