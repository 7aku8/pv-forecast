import 'package:flutter/material.dart';
import 'package:pv_forecast/utils/colors.dart';

class HistoryLabels extends StatelessWidget {
  const HistoryLabels({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          _buildExpandedLabel(
            color: contentColorCyan,
            label: 'Produced',
            icon: Icons.flash_on, // Example icon for Produced
          ),
          const SizedBox(width: 16),
          _buildExpandedLabel(
            color: Colors.redAccent,
            label: 'Consumed',
            icon: Icons.power, // Example icon for Consumed
          ),
        ],
      ),
    );
  }

  Widget _buildExpandedLabel({
    required Color color,
    required String label,
    required IconData icon,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: color, // Set the background color
          borderRadius: BorderRadius.circular(4.0), // Rounded corners
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white, // Icon color for contrast
              size: 16,
            ),
            const SizedBox(width: 8), // Spacing between icon and text
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white, // Text color for contrast
              ),
            ),
          ],
        ),
      ),
    );
  }
}
