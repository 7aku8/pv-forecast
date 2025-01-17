import 'package:flutter/material.dart';

class ForecastTopBar extends StatelessWidget {
  const ForecastTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 24,
          child: Icon(Icons.notifications, color: Colors.black87),
        ),
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
          backgroundImage: AssetImage('assets/images/user_avatar.png'),
          radius: 24,
        ),
      ],
    );
  }
}
