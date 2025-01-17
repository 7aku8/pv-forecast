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
    contentColorCyan,
    contentColorBlue,
  ];

  List<Color> consumedGradientColors = [
    Colors.redAccent,
    Colors.orangeAccent,
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: LineChart(
              showAvg ? avgData() : mainData(),
            ),
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: SizedBox(
            width: 60,
            height: 34,
            child: TextButton(
              onPressed: () {
                setState(() {
                  showAvg = !showAvg;
                });
              },
              child: Text(
                'avg',
                style: TextStyle(
                  fontSize: 12,
                  color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );

    String text;
    switch (value.toInt()) {
      case 0:
        text = '00';
        break;
      case 3:
        text = '03';
        break;
      case 6:
        text = '06';
        break;
      case 9:
        text = '09';
        break;
      case 12:
        text = '12';
        break;
      case 15:
        text = '15';
        break;
      default:
        text = '';
    }

    return SideTitleWidget(
      space: 6,
      meta: meta,
      child: Text(text, style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );

    String text;
    switch (value.toInt()) {
      case 0:
        text = '0 kW';
        break;
      case 1:
        text = '5 kW';
        break;
      case 2:
        text = '10 kW';
        break;
      case 3:
        text = '15 kW';
        break;
      case 4:
        text = '20 kW';
        break;
      case 5:
        text = '25 kW';
        break;
      default:
        text = '';
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) => const FlLine(
          color: Color(0xffe7e8ec),
          strokeWidth: 1,
        ),
        getDrawingVerticalLine: (value) => const FlLine(
          color: Color(0xffe7e8ec),
          strokeWidth: 1,
        ),
      ),
      titlesData: FlTitlesData(
        rightTitles: const AxisTitles(),
        topTitles: const AxisTitles(),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            interval: 3,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 40,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 15,
      minY: 0,
      maxY: 5,
      lineBarsData: [
        // Produced Line
        LineChartBarData(
          spots: const [
            FlSpot(0, 0.5),
            FlSpot(3, 1.2),
            FlSpot(6, 2.0),
            FlSpot(9, 3.5),
            FlSpot(12, 4.0),
            FlSpot(15, 3.0),
          ],
          isCurved: true,
          gradient: LinearGradient(colors: producedGradientColors),
          barWidth: 4,
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
            FlSpot(0, 0.2),
            FlSpot(3, 0.8),
            FlSpot(6, 1.5),
            FlSpot(9, 2.0),
            FlSpot(12, 2.5),
            FlSpot(15, 2.8),
          ],
          isCurved: true,
          gradient: LinearGradient(colors: consumedGradientColors),
          barWidth: 4,
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
    // Average data logic can remain the same
    return LineChartData();
  }
}
