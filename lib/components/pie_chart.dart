import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MainPieChart extends StatefulWidget {
  const MainPieChart({super.key});

  @override
  State<StatefulWidget> createState() => MainPieChartState();
}

class MainPieChartState extends State<MainPieChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.4,
      child: Row(
        children: <Widget>[
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 3, // Slight spacing between sections
                  centerSpaceRadius: 80,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;

      // Define the section styles
      if (i.isEven) {
        // Orange sections with varying shades
        Color sectionColor;
        switch (i) {
          case 0:
            sectionColor = Colors.orange; // Standard orange
          case 2:
            sectionColor = Colors.orange.shade700; // Darker orange
          default:
            sectionColor = Colors.orange.shade400; // Lighter orange
        }
        return PieChartSectionData(
          color: sectionColor,
          value: i == 0 ? 40 : 15,
          title: '${i == 0 ? 40 : 15}%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white, // White text on orange
          ),
          // Border radius effect with slight spacing to achieve rounded edges
          borderSide: BorderSide(
            color: Colors.grey.shade300, // Light grey border
          ),
        );
      } else {
        // White sections with light grey border
        return PieChartSectionData(
          color: Colors.white,
          value: i == 1 ? 30 : 15,
          title: '${i == 1 ? 30 : 15}%',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.orange, // Orange text on white
          ),
          borderSide: BorderSide(
            color: Colors.grey.shade300, // Light grey border
            width: 1, // Thinner border
          ),
        );
      }
    });
  }
}
