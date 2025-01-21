import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pv_forecast/utils/colors.dart';

class WeeklyBarChart extends StatelessWidget {
  const WeeklyBarChart({super.key});

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
              // leftTitles: AxisTitles(
              //   sideTitles: SideTitles(
              //     showTitles: true,
              //     reservedSize: 40,
              //     getTitlesWidget: (value, meta) {
              //       return Text(
              //         '${value.toInt()} kW',
              //         style: const TextStyle(
              //           color: Colors.white,
              //           fontSize: 12,
              //           fontWeight: FontWeight.w400,
              //         ),
              //       );
              //     },
              //   ),
              // ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: bottomTitles,
                  reservedSize: 20,
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
        text = 'Mon';
        break;
      case 1:
        text = 'Tue';
        break;
      case 2:
        text = 'Wed';
        break;
      case 3:
        text = 'Thu';
        break;
      case 4:
        text = 'Fri';
        break;
      case 5:
        text = 'Sat';
        break;
      case 6:
        text = 'Sun';
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
    final producedValues = [20.0, 19.0, 19.0, 18.0, 22.0, 21.0, 23.0];
    final consumedValues = [20.5, 19.0, 20.8, 21.8, 22.0, 8.6, 7.0];

    return List.generate(7, (index) {
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
