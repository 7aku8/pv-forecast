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

          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: _renderAlarm(alerts[index]),
            );
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

  Color _getBgColor(Severity severity) {
    switch (severity) {
      case Severity.info:
        return Colors.white!;
      case Severity.warning:
        return Colors.orange[50]!;
      case Severity.error:
        return Colors.red[50]!;
    }
  }

  Color _getBorderColor(Severity severity) {
    switch (severity) {
      case Severity.info:
        return Colors.grey[200]!;
      case Severity.warning:
        return Colors.orange[100]!;
      case Severity.error:
        return Colors.red[100]!;
    }
  }

  Widget _renderAlarm(Alert alert) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: _getBgColor(alert.severity),
          border: Border.all(
            color: _getBorderColor(alert.severity),
          ),
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
                  Transform.translate(
                    offset: const Offset(8, -8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Colors.grey.shade200,
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        _getIcon(alert.severity),
                        color: Colors.grey.shade300,
                        size: 24,
                      ),
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
