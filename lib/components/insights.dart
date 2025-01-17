import 'package:flutter/material.dart';

class Insights extends StatelessWidget {
  const Insights({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Mini Insights',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 6),
        Text(
          "This Week's Total Energy Output: 1200 kWh",
          style: TextStyle(fontSize: 16),
        ),
        Text(
          "On track to meet this month's target",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 6),
        Text(
          'Keep panels clean and free of debris',
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
