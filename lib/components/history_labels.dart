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
            color: Colors.orangeAccent,
            label: 'Produced',
            icon: Icons.flash_on,
            textColor: Colors.black, // Example text color
          ),
          const SizedBox(width: 16),
          _buildExpandedLabel(
            color: Colors.black87,
            label: 'Consumed',
            icon: Icons.power,
            textColor: Colors.white, // Default text color
          ),
        ],
      ),
    );
  }

  Widget _buildExpandedLabel({
    required Color color,
    required String label,
    required IconData icon,
    Color textColor = Colors.white, // Default to white
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
              color: textColor, // Dynamic icon color
              size: 16,
            ),
            const SizedBox(width: 8), // Spacing between icon and text
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: textColor, // Dynamic text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
