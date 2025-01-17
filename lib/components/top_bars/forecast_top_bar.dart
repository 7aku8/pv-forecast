import 'package:flutter/material.dart';

class ForecastTopBar extends StatelessWidget {
  const ForecastTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.notifications, color: Colors.grey),
        SizedBox(width: 16),
        Text(
          'Forecast',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Spacer(),
        CircleAvatar(
          backgroundImage: AssetImage('assets/user_avatar.png'),
          // Replace with actual image
          radius: 16,
        ),
      ],
    ),
    );
  }
}
