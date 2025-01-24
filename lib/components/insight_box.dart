import 'package:flutter/material.dart';

class InsightBox extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
  final String insight;

  const InsightBox({
    super.key,
    required this.value,
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    required this.insight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: backgroundColor,
        border: backgroundColor == Colors.white
            ? Border.all(color: Colors.grey.shade200)
            : null,
      ),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              backgroundColor: Colors.black87,
              child: Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  insight.toUpperCase(),
                  style: TextStyle(
                    color: textColor.withOpacity(0.7),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: TextStyle(
                    color: textColor.withOpacity(0.7),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
