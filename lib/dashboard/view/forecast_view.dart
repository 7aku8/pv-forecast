import 'package:flutter/cupertino.dart';

class ForecastView extends StatefulWidget {
  const ForecastView({super.key});

  @override
  State<ForecastView> createState() => _HomeViewState();
}

class _HomeViewState extends State<ForecastView> {
  @override
  Widget build(BuildContext context) {
    return const Text('forecast');
  }
}
