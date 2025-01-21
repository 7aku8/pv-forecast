import 'package:flutter/material.dart';
import 'package:pv_forecast/dashboard/view/alerts_view.dart';

final alerts = [
  Alert(
    Severity.info,
    RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Today\'s Production\n',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          TextSpan(
            text: '120 kWh',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
        ],
      ),
    ),
    '12:12',
  ),
  Alert(
    Severity.warning,
    RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Panel 3 output is below expected levels\n',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          TextSpan(
            text: 'Check the system for issues',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
    '12:55',
  ),
  Alert(
    Severity.error,
    RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Panel 3 output is below expected levels\n',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          TextSpan(
            text: 'Check the system for issues',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
    '13:12',
  ),
  Alert(
    Severity.info,
    RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Today\'s Production\n',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          TextSpan(
            text: '120 kWh',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
        ],
      ),
    ),
    '13:55',
  ),
  Alert(
    Severity.warning,
    RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Panel 3 output is below expected levels\n',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          TextSpan(
            text: 'Check the system for issues',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
    '14:12',
  ),
  Alert(
    Severity.error,
    RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Panel 3 output is below expected levels\n',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          TextSpan(
            text: 'Check the system for issues',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
    '14:55',
  ),
];
