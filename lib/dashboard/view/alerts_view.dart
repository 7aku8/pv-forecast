import 'package:flutter/material.dart';
import 'package:pv_forecast/components/@_mock/alerts.dart';

class AlertsView extends StatefulWidget {
  const AlertsView({super.key});

  @override
  State<AlertsView> createState() => _HomeViewState();
}

enum Severity {
  info,
  warning,
  error,
}

class Alert {
  const Alert(this.severity, this.message, this.time);

  final Severity severity;
  final Widget message;
  final String time;
}

class _HomeViewState extends State<AlertsView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.separated(
              itemCount: alerts.length + 1,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                if (index == alerts.length) {
                  return const SizedBox(height: 64);
                }

                return _renderAlarm(alerts[index]);
              },
            ),
    );
  }

  IconData _getIcon(Severity severity) {
    switch (severity) {
      case Severity.info:
        return Icons.info;
      case Severity.warning:
        return Icons.warning;
      case Severity.error:
        return Icons.error_outline;
    }
  }

  Widget _renderAlarm(Alert alert) {
    if (alert.severity == Severity.info) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200),
        ),
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _getName(alert.severity),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const Spacer(),
                  Text(alert.time),
                  const SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Colors.grey.shade200,
                      ),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.power,
                      color: Colors.grey.shade300,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                    child: alert.message,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: alert.severity == Severity.warning
            ? Colors.orange[100]
            : Colors.red[200],
      ),
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _getName(alert.severity),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(),
                Text(alert.time),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.black87,
                  child: Icon(
                    _getIcon(alert.severity),
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
          // const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [Expanded(child: alert.message)],
            ),
          ),
        ],
      ),
    );
  }

  String _getName(Severity severity) {
    switch (severity) {
      case Severity.info:
        return 'Info';
      case Severity.warning:
        return 'Warning';
      case Severity.error:
        return 'Error';
    }
  }
}
