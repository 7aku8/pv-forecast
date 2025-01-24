import 'package:flutter/material.dart';
import 'package:pv_forecast/components/insight_box.dart';

class Tiles extends StatelessWidget {
  const Tiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8), // Outer padding for the grid
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: InsightBox(
                  value: "120 kWh",
                  label: "Today's Production",
                  insight: "Steady output",
                  icon: Icons.power_outlined,
                  backgroundColor: const Color(0xFF81D4FA), // Light Cyan
                  textColor: Colors.black87, // Darker for better readability
                ),
              ),
              const SizedBox(width: 12), // Space between tiles
              Expanded(
                child: InsightBox(
                  value: "Sunny, 25°C",
                  label: "Weather Now",
                  insight: "Clear skies expected",
                  icon: Icons.wb_sunny_outlined,
                  backgroundColor: const Color(0xFFFFCC80), // Light Orange
                  textColor: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12), // Space between rows
          Row(
            children: [
              Expanded(
                child: InsightBox(
                  value: "95%",
                  label: "System's Efficiency",
                  insight: "Expected: 92%",
                  icon: Icons.trending_up,
                  backgroundColor: const Color(0xFFB2DFDB), // Light Teal
                  textColor: const Color(0xFF00796B), // Dark Teal
                ),
              ),
              const SizedBox(width: 12), // Space between tiles
              Expanded(
                child: InsightBox(
                  value: "850 W/m²",
                  label: "Solar Index",
                  insight: "High",
                  icon: Icons.solar_power_outlined,
                  backgroundColor: const Color(0xFFD1C4E9), // Light Lavender
                  textColor: const Color(0xFF512DA8), // Deep Purple
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
