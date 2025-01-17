import 'package:flutter/material.dart';
import 'package:pv_forecast/components/top_bar.dart';
import 'package:pv_forecast/utils/colors.dart';

class LiveDataPage extends StatefulWidget {
  const LiveDataPage({super.key});

  @override
  State<LiveDataPage> createState() => _LiveDataPageState();
}

class _LiveDataPageState extends State<LiveDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const TopBar(),
      body: ListView(
        children: const [
          Text(
            'Dupa',
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
