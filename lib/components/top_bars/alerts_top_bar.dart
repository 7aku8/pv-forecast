import 'package:flutter/material.dart';

class AlertsTopBar extends StatelessWidget {
  const AlertsTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Alerts',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.settings_outlined),
          onPressed: () {},
        ),
      ],
    );
  }
}
