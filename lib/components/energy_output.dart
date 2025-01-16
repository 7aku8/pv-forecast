import 'package:flutter/material.dart';

class EnergyOutput extends StatelessWidget {
  const EnergyOutput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'CURRENT ENERGY OUTPUT',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          '25 kW',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w600,
            fontSize: 62,
          ),
        ),
        const Text(
          'System healthy',
          style: TextStyle(
            color: Colors.green,
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -17),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
            ),
            child: SizedBox.fromSize(
              size: const Size(60, 18),
            ),
          ),
        ),
        const Text(
          'Last updated: 2 min ago',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
