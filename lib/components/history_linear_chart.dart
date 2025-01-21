import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pv_forecast/utils/colors.dart';

class HistoryLinearChart extends StatefulWidget {
  const HistoryLinearChart({super.key});

  @override
  State<HistoryLinearChart> createState() => _HistoryLinearChartState();
}

class _HistoryLinearChartState extends State<HistoryLinearChart> {
  List<Color> producedGradientColors = [
    Colors.orangeAccent.shade100,
    Colors.orangeAccent,
  ];

  List<Color> consumedGradientColors = [
    Colors.black38,
    Colors.black87,
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Consistent padding
      child: AspectRatio(
        aspectRatio: 1.5, // Adjusted for a better layout
        child: Stack(
          children: <Widget>[
            LineChart(
              showAvg ? avgData() : mainData(),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 10, // Updated to match WeeklyBarChart
    );

    String text;
    switch (value.toInt()) {
      case 0:
        text = '00:00';
        break;
      case 3:
        text = '03:00';
        break;
      case 6:
        text = '06:00';
        break;
      case 9:
        text = '09:00';
        break;
      case 12:
        text = '12:00';
        break;
      case 15:
        text = '15:00';
        break;
      default:
        text = '';
    }

    return SideTitleWidget(
      space: 6, // Consistent spacing
      meta: meta,
      child: Text(text, style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 10, // Updated to match WeeklyBarChart
    );

    String text;
    switch (value.toInt()) {
      case 0:
        text = '0 kW';
        break;
      case 5:
        text = '5 kW';
        break;
      case 10:
        text = '10 kW';
        break;
      case 15:
        text = '15 kW';
        break;
      case 20:
        text = '20 kW';
        break;
      case 25:
        text = '25 kW';
        break;
      default:
        text = '';
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(
        rightTitles: const AxisTitles(),
        topTitles: const AxisTitles(),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 20,
            interval: 3,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 5, // Match the kW labels
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 40,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          left: BorderSide(color: Colors.black, width: 1),
          bottom: BorderSide(color: Colors.black, width: 1),
        ),
      ),
      minX: 0,
      maxX: 15,
      minY: 0, // Adjusted to match data range
      maxY: 25, // Adjusted to match data range
      lineBarsData: [
        // Produced Line
        LineChartBarData(
          spots: const [
            FlSpot(0.0, 0.0),
            FlSpot(0.25, 0.33),
            FlSpot(0.51, 0.66),
            FlSpot(0.76, 0.98),
            FlSpot(1.02, 0.28),
            FlSpot(1.27, 0.58),
            FlSpot(1.53, 0.85),
            FlSpot(1.78, 0.1),
            FlSpot(2.03, 0.33),
            FlSpot(2.29, 0.53),
            FlSpot(2.54, 0.69),
            FlSpot(2.8, 0.82),
            FlSpot(3.05, 0.91),
            FlSpot(3.31, 0.96),
            FlSpot(3.56, 0.96),
            FlSpot(3.81, 0.91),
            FlSpot(4.07, 0.81),
            FlSpot(4.32, 0.66),
            FlSpot(4.58, 0.46),
            FlSpot(4.83, 0.19),
            FlSpot(5.08, 0.87),
            FlSpot(5.34, 0.48),
            FlSpot(5.59, 1.23),
            FlSpot(5.85, 1.52),
            FlSpot(6.1, 2.94),
            FlSpot(6.36, 3.29),
            FlSpot(6.61, 4.57),
            FlSpot(6.86, 5.78),
            FlSpot(7.12, 6.92),
            FlSpot(7.37, 7.49),
            FlSpot(7.63, 8.29),
            FlSpot(7.88, 8.92),
            FlSpot(8.14, 9.78),
            FlSpot(8.39, 9.57),
            FlSpot(8.64, 9.29),
            FlSpot(8.9, 9.94),
            FlSpot(9.15, 9.52),
            FlSpot(9.41, 10.03),
            FlSpot(9.66, 10.48),
            FlSpot(9.92, 10.87),
            FlSpot(10.17, 10.19),
            FlSpot(10.42, 13.46),
            FlSpot(10.68, 14.66),
            FlSpot(10.93, 14.81),
            FlSpot(11.19, 14.91),
            FlSpot(11.44, 17.96),
            FlSpot(11.69, 18.96),
            FlSpot(11.95, 18.91),
            FlSpot(12.2, 20.82),
            FlSpot(12.46, 21.69),
            FlSpot(12.71, 22.53),
            FlSpot(12.97, 21.33),
            FlSpot(13.22, 21.1),
            FlSpot(13.47, 21.85),
            FlSpot(13.73, 21.58),
            FlSpot(13.98, 22.28),
            FlSpot(14.24, 20.98),
            FlSpot(14.49, 18.66),
            FlSpot(14.75, 18.33),
            FlSpot(15.0, 17.0),
          ],
          isCurved: true,
          gradient: LinearGradient(colors: producedGradientColors),
          barWidth: 4, // Thicker line width
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: producedGradientColors
                  .map((color) => color.withOpacity(0.2))
                  .toList(),
            ),
          ),
        ),
        // Consumed Line
        LineChartBarData(
          spots: const [
            FlSpot(0.0, 1.1),
            FlSpot(0.25, 1.2),
            FlSpot(0.51, 1.05),
            FlSpot(0.76, 1.1),
            FlSpot(1.02, 1.1),
            FlSpot(1.27, 1.2),
            FlSpot(1.53, 1.3),
            FlSpot(1.78, 1.4),
            FlSpot(2.03, 1.01),
            FlSpot(2.29, 1.02),
            FlSpot(2.54, 1.03),
            FlSpot(2.8, 1),
            FlSpot(3.05, 1),
            FlSpot(3.31, 1),
            FlSpot(3.56, 1),
            FlSpot(3.81, 1),
            FlSpot(4.07, 1.05),
            FlSpot(4.32, 1.05),
            FlSpot(4.58, 1.01),
            FlSpot(4.83, 1.2),
            FlSpot(5.08, 5.87),
            FlSpot(5.34, 5.48),
            FlSpot(5.59, 7.23),
            FlSpot(5.85, 7.52),
            FlSpot(6.1, 7.94),
            FlSpot(6.36, 8.29),
            FlSpot(6.61, 8.57),
            FlSpot(6.86, 8.78),
            FlSpot(7.12, 8.92),
            FlSpot(7.37, 10.49),
            FlSpot(7.63, 10.29),
            FlSpot(7.88, 10.92),
            FlSpot(8.14, 10.78),
            FlSpot(8.39, 10.57),
            FlSpot(8.64, 10.29),
            FlSpot(8.9, 10.94),
            FlSpot(9.15, 10.52),
            FlSpot(9.41, 10.03),
            FlSpot(9.66, 10.48),
            FlSpot(9.92, 10.87),
            FlSpot(10.17, 10.19),
            FlSpot(10.42, 10.46),
            FlSpot(10.68, 10.66),
            FlSpot(10.93, 10.81),
            FlSpot(11.19, 10.91),
            FlSpot(11.44, 10.96),
            FlSpot(11.69, 10.96),
            FlSpot(11.95, 10.91),
            FlSpot(12.2, 11.82),
            FlSpot(12.46, 9.69),
            FlSpot(12.71, 8.53),
            FlSpot(12.97, 10.33),
            FlSpot(13.22, 10.1),
            FlSpot(13.47, 10.85),
            FlSpot(13.73, 10.58),
            FlSpot(13.98, 10.28),
            FlSpot(14.24, 10.98),
            FlSpot(14.49, 10.66),
            FlSpot(14.75, 10.33),
            FlSpot(15.0, 12.0),
          ],
          isCurved: true,
          gradient: LinearGradient(colors: consumedGradientColors),
          barWidth: 4, // Thicker line width
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: consumedGradientColors
                  .map((color) => color.withOpacity(0.2))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    // Average data logic remains the same
    return LineChartData();
  }
}
