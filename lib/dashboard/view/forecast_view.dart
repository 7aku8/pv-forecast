import 'package:flutter/material.dart';
import 'package:pv_forecast/components/prediction_chart.dart';

class ForecastView extends StatefulWidget {
  const ForecastView({super.key});

  @override
  State<ForecastView> createState() => _HomeViewState();
}

class _HomeViewState extends State<ForecastView> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Today's predictions", style: TextStyle(fontSize: 20)),
            PredictionChart(),
          ],
        ),
      ),
    );
  }
}
