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
        itemCount: alerts.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
        color:
            alert.severity == Severity.warning ? Colors.orange[100] : Colors.red[200],
      ),
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
          // const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: alert.message,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
